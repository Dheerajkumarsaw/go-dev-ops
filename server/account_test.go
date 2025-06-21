package server

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/Dheerajkumarsaw/go-dev-ops/db"
	mockdb "github.com/Dheerajkumarsaw/go-dev-ops/db/mock"
	"github.com/Dheerajkumarsaw/go-dev-ops/utils"
	"github.com/golang/mock/gomock"
	"github.com/stretchr/testify/require"
)

func TestGetAccount(t *testing.T) {
	account := randomAccount()

	testCases := []struct {
		name          string
		accountId     int64
		buildStubs    func(store *mockdb.MockStore)
		checkResponse func(t *testing.T, recorder *httptest.ResponseRecorder)
	}{
		{
			name:      "OK",
			accountId: account.ID,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().GetAccountById(gomock.Any(), gomock.Eq(account.ID)).Times(1).
					Return(account, nil)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				requireBodyMatch(t, recorder.Body, account)
				require.Equal(t, http.StatusOK, recorder.Code)
			},
		},
		{
			name:      "NotFound",
			accountId: account.ID,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().GetAccountById(gomock.Any(), gomock.Eq(account.ID)).Times(1).
					Return(db.Account{}, sql.ErrNoRows)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusNotFound, recorder.Code)
			},
		},
		{
			name:      "InternalServerError",
			accountId: account.ID,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().GetAccountById(gomock.Any(), gomock.Eq(account.ID)).Times(1).
					Return(db.Account{}, sql.ErrConnDone)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusInternalServerError, recorder.Code)
			},
		},
		{
			name:      "InvalidID",
			accountId: 0,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().GetAccountById(gomock.Any(), gomock.Any()).Times(0)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]
		t.Run(tc.name, func(t *testing.T) {
			ctrl := gomock.NewController(t)
			defer ctrl.Finish()

			store := mockdb.NewMockStore(ctrl)
			// build stubs before test
			tc.buildStubs(store)

			server := NewServer(store)
			recorder := httptest.NewRecorder()

			url := fmt.Sprintf("/account/%d", tc.accountId)
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(t, recorder)
		})
	}

}

func randomAccount() db.Account {
	return db.Account{
		ID:       utils.RandomInt(90, 150),
		Owner:    utils.RandomOwner(),
		Currency: utils.RandomCurrency(),
		Balance:  utils.RandomMoney(),
	}
}

func requireBodyMatch(t *testing.T, body *bytes.Buffer, account db.Account) {
	data, err := io.ReadAll(body)
	require.NoError(t, err)

	var gotAccount db.Account
	err = json.Unmarshal(data, &gotAccount)
	require.NoError(t, err)
	require.Equal(t, account, gotAccount)
}

func TestCreateAccount(t *testing.T) {
	account := randomAccount()

	testCases := []struct {
		name          string
		account       db.Account
		buildStubs    func(store *mockdb.MockStore)
		responseCheck func(t *testing.T, recorder *httptest.ResponseRecorder)
	}{
		{
			name:    "Create Account",
			account: account,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().CreateAccount(gomock.Any(), gomock.Eq(db.CreateAccountParams{
					Owner:    account.Owner,
					Currency: account.Currency,
				})).Times(1).
					Return(account, nil)
			},
			responseCheck: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				requireBodyMatch(t, recorder.Body, account)
				require.Equal(t, http.StatusOK, recorder.Code)
			},
		},
		{
			name:    "Internal Server Error",
			account: account,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().CreateAccount(gomock.Any(), gomock.Eq(db.CreateAccountParams{
					Owner:    account.Owner,
					Currency: account.Currency,
				})).Times(1).
					Return(account, sql.ErrConnDone)
			},
			responseCheck: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusInternalServerError, recorder.Code)
			},
		},
		{
			name:    "Invalid Body",
			account: db.Account{},
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().CreateAccount(gomock.Any(), gomock.Any()).Times(0)
			},
			responseCheck: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				require.Equal(t, http.StatusBadRequest, recorder.Code)
			},
		},
	}

	for i := range testCases {
		tc := testCases[i]

		ctrl := gomock.NewController(t)
		defer ctrl.Finish()

		t.Run(tc.name, func(t *testing.T) {
			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server := NewServer(store)
			recorder := httptest.NewRecorder()

			url := "/accounts"
			requestBody, err := json.Marshal(createAccountRequest{
				Owner:    tc.account.Owner,
				Currency: tc.account.Currency,
			})
			require.NoError(t, err)

			request, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(requestBody))
			require.NoError(t, err)
			request.Header.Set("Content-Type", "application/json")

			server.router.ServeHTTP(recorder, request)
			tc.responseCheck(t, recorder)
		})
	}

}

type TestCase struct {
	name          string
	account       db.Account
	buildStubs    func(store *mockdb.MockStore)
	responseCheck func(t *testing.T, recorder *httptest.ResponseRecorder)
}

type GetTestCase struct {
	name          string
	accountId     int64
	buildStubs    func(store *mockdb.MockStore)
	checkResponse func(t *testing.T, recorder *httptest.ResponseRecorder)
}

func TestListAccount(t *testing.T) {

	var testCases []TestCase
	var getTestCases []GetTestCase

	for range 5 {
		account := randomAccount()
		testCases = append(testCases, TestCase{
			name:    "Create Account",
			account: account,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().CreateAccount(gomock.Any(), gomock.Eq(db.CreateAccountParams{
					Owner:    account.Owner,
					Currency: account.Currency,
				})).Times(1).
					Return(account, nil)
			},
			responseCheck: func(t *testing.T, recorder *httptest.ResponseRecorder) {

				requireBodyMatch(t, recorder.Body, account)
				require.Equal(t, http.StatusOK, recorder.Code)
			},
		})
		getTestCases = append(getTestCases, GetTestCase{
			name:      "OK",
			accountId: account.ID,
			buildStubs: func(store *mockdb.MockStore) {
				store.EXPECT().GetAccountById(gomock.Any(), gomock.Eq(account.ID)).Times(1).
					Return(account, nil)
			},
			checkResponse: func(t *testing.T, recorder *httptest.ResponseRecorder) {
				requireBodyMatch(t, recorder.Body, account)
				require.Equal(t, http.StatusOK, recorder.Code)
			},
		})
	}

	for _, tc := range testCases {
		ctrl := gomock.NewController(t)
		defer ctrl.Finish()

		t.Run(tc.name, func(t *testing.T) {
			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server := NewServer(store)
			recorder := httptest.NewRecorder()
			url := "/accounts"
			requestBody, err := json.Marshal(createAccountRequest{
				Owner:    tc.account.Owner,
				Currency: tc.account.Currency,
			})
			require.NoError(t, err)

			request, err := http.NewRequest(http.MethodPost, url, bytes.NewReader(requestBody))
			require.NoError(t, err)
			request.Header.Set("Content-Type", "application/json")

			server.router.ServeHTTP(recorder, request)
			tc.responseCheck(t, recorder)
		})
	}

	for _, tc := range getTestCases {
		ctrl := gomock.NewController(t)
		defer ctrl.Finish()

		t.Run(tc.name, func(t *testing.T) {
			store := mockdb.NewMockStore(ctrl)
			tc.buildStubs(store)

			server := NewServer(store)
			recorder := httptest.NewRecorder()

			url := fmt.Sprintf("/account/%d", tc.accountId)
			request, err := http.NewRequest(http.MethodGet, url, nil)
			require.NoError(t, err)

			server.router.ServeHTTP(recorder, request)
			tc.checkResponse(t, recorder)
		})
	}

	t.Run("List Accounts", func(t *testing.T) {
		ctrl := gomock.NewController(t)
		defer ctrl.Finish()

		store := mockdb.NewMockStore(ctrl)
		server := NewServer(store)
		recorder := httptest.NewRecorder()

		url := "/list-account?page_id=1&page_limit=10"

		store.EXPECT().GetAllAccounts(gomock.Any(), gomock.Any()).
			Times(1).
			Return([]db.Account{}, nil)

		request, err := http.NewRequest(http.MethodGet, url, nil)
		require.NoError(t, err)

		server.router.ServeHTTP(recorder, request)
		require.Equal(t, http.StatusOK, recorder.Code)
	})
}


// write other test cases as well
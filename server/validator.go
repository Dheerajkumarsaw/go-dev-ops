package server

import (
	"github.com/Dheerajkumarsaw/go-dev-ops/utils"
	"github.com/go-playground/validator/v10"
 )

var validCurrency validator.Func = func(fieldLevel validator.FieldLevel) bool {
	if currency, ok := fieldLevel.Field().Interface().(string); ok {
		return utils.IsSupportedCurrency(currency)
	}
	return false
}

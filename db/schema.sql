SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: access_request_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.access_request_status AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED',
    'CANCELLED'
);


--
-- Name: access_request_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.access_request_type AS ENUM (
    'CLUB_MEMBER',
    'GROUP_MEMBER',
    'GROUP_INVITATION'
);


--
-- Name: app_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.app_status AS ENUM (
    'ACTIVE',
    'SERVER_DOWN'
);


--
-- Name: badge_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.badge_entity_type AS ENUM (
    'USER',
    'CLUB',
    'EVENT',
    'GROUP'
);


--
-- Name: booking_payment_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.booking_payment_status AS ENUM (
    'NONE',
    'PENDING',
    'COMPLETED',
    'REFUND',
    'FAILED'
);


--
-- Name: booking_source; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.booking_source AS ENUM (
    'APP',
    'WEBSITE',
    'WHATSAPP'
);


--
-- Name: booking_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.booking_status AS ENUM (
    'REGISTERED',
    'DEREGISTERED',
    'WAITLISTED',
    'OPEN_FOR_REPLACEMENT',
    'ATTENDED',
    'NOT_ATTENDED',
    'INITIATED'
);


--
-- Name: booking_timeline_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.booking_timeline_status AS ENUM (
    'WAITING',
    'ATTENDED',
    'REGISTERED',
    'OPEN_FOR_REPLACEMENT',
    'DEREGISTERED',
    'PAYMENT_FAILED',
    'PAYMENT_DONE',
    'EXEMPTED',
    'REPLACED',
    'REJOINED',
    'NOT_ATTENDED',
    'REFUNDED',
    'ADDED_BY_LEADER'
);


--
-- Name: chat_message_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.chat_message_type AS ENUM (
    'TEXT',
    'IMAGE',
    'VIDEO',
    'FILE'
);


--
-- Name: chat_provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.chat_provider AS ENUM (
    'SENDBIRD',
    'LIKEMINDS'
);


--
-- Name: club_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.club_status AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


--
-- Name: coupon_discount_format; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.coupon_discount_format AS ENUM (
    'INSTANT',
    'CASHBACK'
);


--
-- Name: coupon_discount_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.coupon_discount_type AS ENUM (
    'FLAT',
    'PERCENT'
);


--
-- Name: coupon_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.coupon_type AS ENUM (
    'DISCOUNT',
    'REFERRAL'
);


--
-- Name: discount_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.discount_entity_type AS ENUM (
    'COUPON',
    'SUBSCRIPTION',
    'OFFER',
    'CAMPAIGN'
);


--
-- Name: event_group_entity; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_group_entity AS ENUM (
    'EVENT',
    'ANNOUNCEMENT'
);


--
-- Name: event_payment_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_payment_type AS ENUM (
    'FREE',
    'PAY_NOW',
    'PAY_LATER'
);


--
-- Name: event_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_state AS ENUM (
    'CREATED',
    'CANCELLED'
);


--
-- Name: friend_request_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.friend_request_status AS ENUM (
    'PENDING',
    'ACCEPTED',
    'REJECTED',
    'CANCELLED'
);


--
-- Name: group_chat_channel_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_chat_channel_type AS ENUM (
    'OPEN',
    'GROUP',
    'PRIVATE',
    'PUBLIC',
    'WHATSAPP'
);


--
-- Name: group_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_entity_type AS ENUM (
    'CLUB'
);


--
-- Name: group_member_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_member_role AS ENUM (
    'ADMIN',
    'MEMBER'
);


--
-- Name: group_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_type AS ENUM (
    'ADMIN',
    'MEMBER',
    'OTHER',
    'INNER_CIRCLE'
);


--
-- Name: invoice_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.invoice_type AS ENUM (
    'USER',
    'ADMIN',
    'VENUE'
);


--
-- Name: media_category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.media_category AS ENUM (
    'VIBE',
    'COVER',
    'PROFILE',
    'ICON',
    'THUMBNAIL',
    'MOMENT',
    'MOMENT_BOARD',
    'ICON_SMALL'
);


--
-- Name: media_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.media_entity_type AS ENUM (
    'CLUB',
    'EVENT',
    'USER',
    'GROUP',
    'MEDIA',
    'BADGE',
    'ANNOUNCEMENT',
    'APP_UPDATE'
);


--
-- Name: media_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.media_type AS ENUM (
    'IMAGE',
    'VIDEO',
    'TXT'
);


--
-- Name: operating_system; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.operating_system AS ENUM (
    'IOS',
    'ANDROID',
    'WINDOWS',
    'MACOS',
    'UNKNOW'
);


--
-- Name: os_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.os_type AS ENUM (
    'IOS',
    'ANDROID'
);


--
-- Name: payment_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.payment_state AS ENUM (
    'PENDING',
    'COMPLETED',
    'FAILED'
);


--
-- Name: plan_duration; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.plan_duration AS ENUM (
    'MONTHLY',
    'QUARTERLY',
    'HALF_YEARLY',
    'YEARLY',
    'INFINITE'
);


--
-- Name: plan_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.plan_entity_type AS ENUM (
    'CLUB',
    'VENUE',
    'MISFITS',
    'GROUP'
);


--
-- Name: plan_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.plan_status AS ENUM (
    'ACTIVE',
    'DISABLED',
    'INVALID',
    'DELETED'
);


--
-- Name: plan_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.plan_type AS ENUM (
    'FREE',
    'DISCOUNT',
    'FLAT',
    'CREDITS',
    'LEADER',
    'ALL_FREE'
);


--
-- Name: pricing_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pricing_type AS ENUM (
    'FIXED',
    'VARIABLE',
    'APPROX'
);


--
-- Name: prompt_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.prompt_mode AS ENUM (
    'USER',
    'ADMIN'
);


--
-- Name: prompt_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.prompt_type AS ENUM (
    'PAYMENT_PENDING',
    'BOOKING_CANCELLED',
    'BOOKING_REMINDER',
    'CLUB',
    'ATTENDANCE_PENDING',
    'APP_UPDATE',
    'REPLACEMENT_FOUND',
    'FIX_MEETUP_PRICE',
    'OTHER',
    'BOOKING_FEEDBACK',
    'REPLACEMENT_FOUND_REFUND',
    'CLUB_INFO',
    'CLUB_JOIN_WELCOME',
    'CLUB_JOIN_TOUR',
    'GROUP_INVITATION',
    'GROUP_REQUEST_APPROVAL',
    'BOOKING_FEEDBACK_AND_ATTENDANCE',
    'PAYMENT_AND_ATTENDANCE'
);


--
-- Name: push_notification_preferences; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.push_notification_preferences AS ENUM (
    'ALL',
    'MENTION_ONLY',
    'OFF'
);


--
-- Name: spot_refund_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.spot_refund_status AS ENUM (
    'REFUNDED',
    'EXEMPTED',
    'NONE'
);


--
-- Name: spot_user_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.spot_user_type AS ENUM (
    'USER',
    'GUEST'
);


--
-- Name: subscription_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.subscription_state AS ENUM (
    'INITIATED',
    'ACTIVE',
    'PURCHASED',
    'EXPIRED',
    'REMOVED',
    'CANCELLED'
);


--
-- Name: timeline_user_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.timeline_user_type AS ENUM (
    'USER',
    'ADMIN',
    'SYSTEM'
);


--
-- Name: transaction_created_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transaction_created_by AS ENUM (
    'ADMIN',
    'USER',
    'SYSTEM'
);


--
-- Name: transaction_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transaction_entity_type AS ENUM (
    'WALLET',
    'BOOKING',
    'SUBSCRIPTION',
    'TRANSACTION'
);


--
-- Name: transaction_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transaction_status AS ENUM (
    'INITIATED',
    'PENDING',
    'SUCCESSFUL',
    'FAILED',
    'EXEMPTED',
    'EXPIRED'
);


--
-- Name: user_connection_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_connection_type AS ENUM (
    'FRIEND',
    'BLOCK',
    'WHATSAPP'
);


--
-- Name: user_tracking_entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_tracking_entity_type AS ENUM (
    'MEDIA',
    'EVENT'
);


--
-- Name: user_tracking_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_tracking_type AS ENUM (
    'VIEWED',
    'LIKED'
);


--
-- Name: create_update_trigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.create_update_trigger() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  rec RECORD;
BEGIN
  FOR rec IN
    SELECT objid::regclass::text AS table_name
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag = 'CREATE TABLE'
  LOOP
    IF EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_name = rec.table_name
        AND column_name = 'updated_at'
        AND table_schema = 'public'
    ) THEN
      IF NOT EXISTS (
        SELECT 1
        FROM pg_trigger
        WHERE tgname = format('update_%I_updated_at', rec.table_name)
          AND tgrelid = rec.table_name::regclass
      ) THEN
        EXECUTE format('
          CREATE TRIGGER update_%I_updated_at
          BEFORE UPDATE ON %I
          FOR EACH ROW
          EXECUTE FUNCTION update_updated_at();
        ', rec.table_name, rec.table_name);
      END IF;
    END IF;
  END LOOP;
END
$$;


--
-- Name: generate_booking_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generate_booking_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  -- Check if a user_booking_id already exists for the same event_id and user_id
  SELECT booking_id INTO NEW.booking_id
  FROM booking
  WHERE event_id = NEW.event_id AND user_id = NEW.user_id
  LIMIT 1;

  -- If no booking_id exists, generate a new one using the sequence
  IF NEW.booking_id IS NULL THEN
    NEW.booking_id = nextval('booking_id_seq');
  END IF;

  RETURN NEW;
END;
$$;


--
-- Name: generate_invoice_number(public.invoice_type); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generate_invoice_number(new_invoice_type public.invoice_type) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix TEXT;
    seq_value BIGINT;
    seq_value_text TEXT;
    padding_length INT;
BEGIN
    IF new_invoice_type = 'USER' THEN
        prefix := 'CUSTSER';
    ELSIF new_invoice_type = 'VENUE' THEN
        prefix := 'VEN';
    ELSE
        prefix := 'LEA';
    END IF;

    UPDATE invoice_sequence
    SET last_used = last_used + 1
    WHERE invoice_type = new_invoice_type
    RETURNING last_used INTO seq_value;

    IF seq_value < 10000 THEN
        padding_length := 4;
    ELSIF seq_value < 100000 THEN
        padding_length := 6;
    ELSIF seq_value < 1000000 THEN
        padding_length := 8;
    ELSIF seq_value < 10000000 THEN
        padding_length := 10;
    ELSE
        padding_length := 12;
    END IF;

    seq_value_text := LPAD(seq_value::TEXT, padding_length, '0');

    RETURN prefix || to_char(CURRENT_DATE, 'YYYY') || seq_value_text;
END;
$$;


--
-- Name: generate_referral_code(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generate_referral_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    base_code TEXT;
    random_digits TEXT;
    new_code TEXT;
BEGIN
    LOOP
        base_code :=
            CHR(FLOOR(RANDOM() * 26 + 65)::INT) ||
            CHR(FLOOR(RANDOM() * 26 + 65)::INT) ||
            CHR(FLOOR(RANDOM() * 26 + 65)::INT);

        random_digits := LPAD((FLOOR(RANDOM() * 10000))::TEXT, 4, '0');

        new_code := base_code || random_digits;

        IF NOT EXISTS (
            SELECT 1 FROM users WHERE referral_code = new_code
        ) THEN
            EXIT;
        END IF;
    END LOOP;

    NEW.referral_code := new_code;
    RETURN NEW;
END;
$$;


--
-- Name: generate_ticket_id(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.generate_ticket_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  SELECT ticket_id INTO NEW.ticket_id
  FROM booking
  WHERE event_id = NEW.event_id
    AND user_id = NEW.user_id
    AND booking_status = 'REGISTERED'::booking_status
  LIMIT 1;

  IF NEW.ticket_id IS NULL THEN
    NEW.ticket_id = nextval('ticket_id_seq');
  END IF;

  RETURN NEW;
END;
$$;


--
-- Name: log_history(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.log_history() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  old_row JSONB;
  new_row JSONB;
  changed_fields JSONB;
  table_name TEXT;
  entity_id_value BIGINT;
BEGIN
  old_row := row_to_json(OLD)::JSONB;
  new_row := row_to_json(NEW)::JSONB;

  IF TG_OP = 'UPDATE' THEN
   changed_fields := (
    SELECT jsonb_object_agg(key, value)
    FROM (
      SELECT key, value
      FROM jsonb_each(old_row)
      WHERE key != 'updated_at'  -- Exclude 'updated_at' from old_row
      EXCEPT
      SELECT key, value
      FROM jsonb_each(new_row)
    ) diff
  );

    -- removing tracking of updated_at
    IF changed_fields = '{}' THEN
      RETURN NEW;
    END IF;

  ELSE
    changed_fields := NULL;  -- case for delete operation
  END IF;

  table_name := TG_TABLE_NAME;

  -- taking reference of old in delete and new in update
  IF TG_OP = 'UPDATE' THEN
    IF new_row ? 'pk' THEN
      entity_id_value := NEW.pk;
    ELSIF new_row ? 'id' THEN
      entity_id_value := NEW.id;
    ELSE
      RAISE EXCEPTION 'No primary key column found for table % on UPDATE', table_name;
    END IF;
  ELSIF TG_OP = 'DELETE' THEN
    IF old_row ? 'pk' THEN
      entity_id_value := OLD.pk;
    ELSIF old_row ? 'id' THEN
      entity_id_value := OLD.id;
    ELSE
      RAISE EXCEPTION 'No primary key column found for table % on DELETE', table_name;
    END IF;
  ELSE
    RAISE EXCEPTION 'Unsupported operation % for table %', TG_OP, table_name;
  END IF;

  IF changed_fields IS NOT NULL AND changed_fields <> '{}'::JSONB THEN
    BEGIN
      INSERT INTO data_history(entity_id, table_name, columns_changed, action, created_at)
      VALUES (entity_id_value, table_name, changed_fields, TG_OP::data_history_action_type, NOW());
    EXCEPTION
      WHEN others THEN
        RAISE EXCEPTION 'Error inserting into data_history: %', SQLERRM;
    END;
  END IF;

  RETURN NEW;
END;
$$;


--
-- Name: set_invoice_number(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.set_invoice_number() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.invoice_number := generate_invoice_number(NEW.invoice_type);
    RETURN NEW;
END;
$$;


--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_request (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_type public.access_request_type NOT NULL,
    entity_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status public.access_request_status DEFAULT 'PENDING'::public.access_request_status NOT NULL
);


--
-- Name: access_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.access_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: access_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.access_request_id_seq OWNED BY public.access_request.id;


--
-- Name: announcement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcement (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    club_id bigint,
    button_info jsonb,
    heading text NOT NULL,
    sub_heading text NOT NULL,
    valid_till timestamp with time zone NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_by bigint NOT NULL
);


--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcement_id_seq OWNED BY public.announcement.id;


--
-- Name: app_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_version (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    status public.app_status NOT NULL,
    version text NOT NULL,
    os public.os_type NOT NULL,
    tagline text NOT NULL,
    force_update boolean DEFAULT false NOT NULL,
    description text NOT NULL
);


--
-- Name: app_version_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_version_id_seq OWNED BY public.app_version.id;


--
-- Name: area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.area (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    city_id bigint NOT NULL,
    postal_code bigint
);


--
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_id_seq OWNED BY public.area.id;


--
-- Name: badge; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.badge (
    id bigint NOT NULL,
    name text NOT NULL,
    label text NOT NULL,
    description text NOT NULL,
    entity_type public.badge_entity_type NOT NULL,
    entity_id bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);


--
-- Name: badge_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.badge_id_seq OWNED BY public.badge.id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.booking (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    booking_id text,
    event_id bigint NOT NULL,
    user_id bigint NOT NULL,
    booking_status public.booking_status NOT NULL,
    booking_payment_status public.booking_payment_status NOT NULL,
    subscription_id bigint,
    amount integer NOT NULL,
    guest_count integer DEFAULT 0 NOT NULL,
    feedback_details jsonb DEFAULT '{}'::jsonb,
    has_opened_app_for_payment boolean DEFAULT false,
    is_regd_from_app boolean DEFAULT false NOT NULL,
    ticket_id bigint,
    source public.booking_source DEFAULT 'APP'::public.booking_source NOT NULL
);


--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: booking_timeline; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.booking_timeline (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    booking_id bigint NOT NULL,
    booking_timeline_status public.booking_timeline_status NOT NULL,
    user_id bigint,
    user_type public.timeline_user_type NOT NULL,
    spot_booking_id bigint
);


--
-- Name: booking_timeline_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.booking_timeline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: booking_timeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.booking_timeline_id_seq OWNED BY public.booking_timeline.id;


--
-- Name: chat_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_message (
    id bigint NOT NULL,
    chat_name text NOT NULL,
    user_id bigint NOT NULL,
    content text NOT NULL,
    received_time timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    type public.chat_message_type NOT NULL,
    file_id bigint
);


--
-- Name: chat_message_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chat_message_id_seq OWNED BY public.chat_message.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    postal_code_start bigint,
    postal_code_end bigint,
    wa_link text
);


--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: club; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.club (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    activity text NOT NULL,
    name text NOT NULL,
    sub_title text NOT NULL,
    description text NOT NULL,
    created_by bigint NOT NULL,
    info jsonb,
    status public.club_status DEFAULT 'ACTIVE'::public.club_status NOT NULL,
    is_private boolean DEFAULT true NOT NULL,
    avg_rating double precision DEFAULT 0.0 NOT NULL,
    rating_count integer DEFAULT 0 NOT NULL
);


--
-- Name: club_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.club_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: club_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.club_pk_seq OWNED BY public.club.pk;


--
-- Name: club_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.club_schedules (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    club_id bigint NOT NULL,
    location_id bigint NOT NULL,
    schedule jsonb,
    created_by bigint NOT NULL,
    schedule_order integer NOT NULL
);


--
-- Name: club_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.club_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: club_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.club_schedules_id_seq OWNED BY public.club_schedules.id;


--
-- Name: club_user_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.club_user_details (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    club_id bigint NOT NULL,
    user_id bigint NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    reason_for_block text,
    is_blocked boolean DEFAULT false NOT NULL
);


--
-- Name: club_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.club_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: club_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.club_user_details_id_seq OWNED BY public.club_user_details.id;


--
-- Name: coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupon (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_valid boolean DEFAULT false NOT NULL,
    is_visible boolean DEFAULT false NOT NULL,
    coupon_code text NOT NULL,
    description text NOT NULL,
    tagline text NOT NULL,
    discount_value integer NOT NULL,
    max_amount integer,
    maximum_usage integer DEFAULT 1 NOT NULL,
    maximum_user_usage integer DEFAULT 1 NOT NULL,
    activity_info text[],
    club_info bigint[],
    event_info bigint[],
    user_info bigint[],
    created_by bigint NOT NULL,
    coupon_discount_type public.coupon_discount_type NOT NULL,
    coupon_type public.coupon_type NOT NULL,
    discount_format public.coupon_discount_format NOT NULL,
    terms_and_conditions text[] NOT NULL,
    issue_date timestamp with time zone NOT NULL,
    expiry_date timestamp with time zone NOT NULL
);


--
-- Name: coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- Name: discount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discount (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_id bigint NOT NULL,
    entity_type public.discount_entity_type NOT NULL,
    transaction_id bigint,
    amount integer NOT NULL,
    user_id bigint NOT NULL,
    is_removed boolean DEFAULT false,
    booking_id bigint
);


--
-- Name: discount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discount_id_seq OWNED BY public.discount.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    activity text NOT NULL,
    club_id bigint NOT NULL,
    location_id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    max_people integer NOT NULL,
    max_guest integer DEFAULT 0 NOT NULL,
    payment_type public.event_payment_type NOT NULL,
    ticket_price integer NOT NULL,
    is_liable_to_pay boolean NOT NULL,
    created_by bigint NOT NULL,
    latest_notification jsonb,
    cancellation_details jsonb,
    state public.event_state DEFAULT 'CREATED'::public.event_state NOT NULL,
    hosted_by bigint[],
    pricing_type public.pricing_type NOT NULL,
    variable_ticket_prices integer[],
    meetup_registration_start_time timestamp with time zone,
    is_default boolean DEFAULT false NOT NULL,
    is_festival boolean DEFAULT false,
    event_info jsonb DEFAULT '{}'::jsonb NOT NULL
);


--
-- Name: event_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_group (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    event_registration_start_time timestamp with time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    entity_type public.event_group_entity DEFAULT 'EVENT'::public.event_group_entity NOT NULL
);


--
-- Name: event_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_group_id_seq OWNED BY public.event_group.id;


--
-- Name: event_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_pk_seq OWNED BY public.event.pk;


--
-- Name: file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.file (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    file_name text NOT NULL,
    content_type text NOT NULL,
    s3_url text NOT NULL
);


--
-- Name: file_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.file_id_seq OWNED BY public.file.id;


--
-- Name: friend_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friend_requests (
    id bigint NOT NULL,
    requester_id bigint NOT NULL,
    recipient_id bigint NOT NULL,
    status public.friend_request_status DEFAULT 'PENDING'::public.friend_request_status NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);


--
-- Name: friend_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friend_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friend_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friend_requests_id_seq OWNED BY public.friend_requests.id;


--
-- Name: group_chat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_chat (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    group_id bigint,
    user_group_id bigint NOT NULL,
    chat_link text NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_by bigint NOT NULL,
    last_message text,
    last_message_timestamp timestamp with time zone,
    last_message_sender_name text,
    channel_type public.group_chat_channel_type DEFAULT 'GROUP'::public.group_chat_channel_type NOT NULL,
    chat_provider public.chat_provider,
    comms_chat_id text
);


--
-- Name: group_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_chat_id_seq OWNED BY public.group_chat.id;


--
-- Name: group_chat_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_chat_member (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    group_chat_id bigint NOT NULL,
    user_id bigint NOT NULL,
    push_preference public.push_notification_preferences DEFAULT 'ALL'::public.push_notification_preferences NOT NULL,
    last_notification_sent_at timestamp with time zone,
    last_active timestamp with time zone
);


--
-- Name: group_chat_member_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_chat_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_chat_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_chat_member_id_seq OWNED BY public.group_chat_member.id;


--
-- Name: group_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_member (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id bigint NOT NULL,
    user_group_id bigint NOT NULL,
    role public.group_member_role NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_removed boolean DEFAULT false NOT NULL,
    member_order integer DEFAULT '-1'::integer NOT NULL,
    reason_to_remove text
);


--
-- Name: group_member_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_member_id_seq OWNED BY public.group_member.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_type public.group_entity_type NOT NULL,
    entity_id bigint NOT NULL,
    group_type public.group_type NOT NULL,
    approval_info jsonb,
    is_private boolean DEFAULT false NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    user_group_id bigint NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    invoice_type public.invoice_type NOT NULL,
    user_id bigint NOT NULL,
    transaction_id bigint NOT NULL,
    invoice_number text NOT NULL,
    invoice_date timestamp with time zone NOT NULL,
    file_id bigint
);


--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.id;


--
-- Name: invoice_sequence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice_sequence (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    invoice_type public.invoice_type NOT NULL,
    last_used bigint DEFAULT 0 NOT NULL
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    image bigint NOT NULL,
    lat double precision,
    lng double precision,
    area_id bigint
);


--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_type public.media_entity_type NOT NULL,
    entity_id bigint NOT NULL,
    file_id bigint,
    category public.media_category NOT NULL,
    file_order integer NOT NULL,
    type public.media_type NOT NULL,
    meta_data jsonb,
    created_by bigint NOT NULL,
    CONSTRAINT check_file_id_null_only_for_text_moment CHECK ((((type = 'TXT'::public.media_type) AND (category = 'MOMENT'::public.media_category) AND (file_id IS NULL)) OR ((NOT ((type = 'TXT'::public.media_type) AND (category = 'MOMENT'::public.media_category))) AND (file_id IS NOT NULL))))
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: newusers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.newusers (
    id bigint NOT NULL,
    name text,
    age text
);


--
-- Name: newusers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.newusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: newusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.newusers_id_seq OWNED BY public.newusers.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    amount integer NOT NULL,
    state public.payment_state DEFAULT 'PENDING'::public.payment_state NOT NULL,
    third_party_details jsonb DEFAULT '{}'::jsonb
);


--
-- Name: payment_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_pk_seq OWNED BY public.payment.pk;


--
-- Name: plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    plan_type public.plan_type NOT NULL,
    entity_id integer NOT NULL,
    entity_type public.plan_entity_type NOT NULL,
    created_by integer,
    price integer NOT NULL,
    discount_value integer,
    duration public.plan_duration NOT NULL,
    open_group_allowed boolean DEFAULT false NOT NULL,
    plan_status public.plan_status DEFAULT 'ACTIVE'::public.plan_status NOT NULL,
    plan_benefits jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: plan_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plan_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plan_pk_seq OWNED BY public.plan.pk;


--
-- Name: prompt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id bigint NOT NULL,
    is_acknowledged boolean DEFAULT false NOT NULL,
    tagline text NOT NULL,
    description text NOT NULL,
    redirect_screen text NOT NULL,
    display_screen text NOT NULL,
    prompt_type public.prompt_type NOT NULL,
    entity_id bigint,
    priority integer NOT NULL,
    prompt_time timestamp with time zone DEFAULT now() NOT NULL,
    prompt_mode public.prompt_mode DEFAULT 'USER'::public.prompt_mode NOT NULL
);


--
-- Name: prompt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prompt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prompt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prompt_id_seq OWNED BY public.prompt.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(128) NOT NULL
);


--
-- Name: spot_booking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spot_booking (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    spot_status public.booking_status NOT NULL,
    spot_user_type public.spot_user_type NOT NULL,
    spot_refund_status public.spot_refund_status,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT spot_booking_not_waitlisted CHECK ((spot_status <> 'WAITLISTED'::public.booking_status))
);


--
-- Name: spot_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spot_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spot_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spot_booking_id_seq OWNED BY public.spot_booking.id;


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscription (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    plan_id bigint NOT NULL,
    user_id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    state public.subscription_state NOT NULL,
    plan_info jsonb NOT NULL
);


--
-- Name: subscription_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscription_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscription_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscription_pk_seq OWNED BY public.subscription.pk;


--
-- Name: tempusers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tempusers (
    id bigint NOT NULL,
    name text,
    email character varying(90),
    phone character varying(10) NOT NULL,
    city text NOT NULL,
    state text,
    dist text,
    pincode text NOT NULL,
    age text NOT NULL
);


--
-- Name: tempusers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tempusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tempusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tempusers_id_seq OWNED BY public.tempusers.id;


--
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaction (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    transaction_id text,
    entity_type public.transaction_entity_type NOT NULL,
    entity_id bigint NOT NULL,
    user_id bigint NOT NULL,
    amount integer NOT NULL,
    payment_id bigint,
    created_by public.transaction_created_by NOT NULL,
    transaction_info jsonb,
    transaction_status public.transaction_status NOT NULL,
    tax_amount integer,
    final_amount integer NOT NULL
);


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: user_badge_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_badge_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    badge_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);


--
-- Name: user_badge_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_badge_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_badge_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_badge_details_id_seq OWNED BY public.user_badge_details.id;


--
-- Name: user_connections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_connections (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    connection_id bigint NOT NULL,
    type public.user_connection_type NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);


--
-- Name: user_connections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_connections_id_seq OWNED BY public.user_connections.id;


--
-- Name: user_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_group (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_by bigint NOT NULL
);


--
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_group_id_seq OWNED BY public.user_group.id;


--
-- Name: user_tracking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_tracking (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id bigint NOT NULL,
    entity_id bigint NOT NULL,
    entity_type public.user_tracking_entity_type NOT NULL,
    tracking_type public.user_tracking_type DEFAULT 'VIEWED'::public.user_tracking_type NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    CONSTRAINT check_is_deleted_liked CHECK (((is_deleted = false) OR ((is_deleted = true) AND (tracking_type = 'LIKED'::public.user_tracking_type))))
);


--
-- Name: user_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_tracking_id_seq OWNED BY public.user_tracking.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    pk bigint NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    first_name text NOT NULL,
    last_name text,
    phone text NOT NULL,
    email text,
    additional_info jsonb,
    is_blocked boolean DEFAULT false NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    user_interests jsonb,
    os public.operating_system,
    app_version text,
    refresh_token text,
    bio text,
    temp_file boolean DEFAULT false NOT NULL,
    referral_code text NOT NULL
);


--
-- Name: users_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_pk_seq OWNED BY public.users.pk;


--
-- Name: access_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_request ALTER COLUMN id SET DEFAULT nextval('public.access_request_id_seq'::regclass);


--
-- Name: announcement id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement ALTER COLUMN id SET DEFAULT nextval('public.announcement_id_seq'::regclass);


--
-- Name: app_version id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_version ALTER COLUMN id SET DEFAULT nextval('public.app_version_id_seq'::regclass);


--
-- Name: area id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area ALTER COLUMN id SET DEFAULT nextval('public.area_id_seq'::regclass);


--
-- Name: badge id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badge ALTER COLUMN id SET DEFAULT nextval('public.badge_id_seq'::regclass);


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: booking_timeline id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking_timeline ALTER COLUMN id SET DEFAULT nextval('public.booking_timeline_id_seq'::regclass);


--
-- Name: chat_message id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_message ALTER COLUMN id SET DEFAULT nextval('public.chat_message_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: club pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club ALTER COLUMN pk SET DEFAULT nextval('public.club_pk_seq'::regclass);


--
-- Name: club_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules ALTER COLUMN id SET DEFAULT nextval('public.club_schedules_id_seq'::regclass);


--
-- Name: club_user_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_user_details ALTER COLUMN id SET DEFAULT nextval('public.club_user_details_id_seq'::regclass);


--
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- Name: discount id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discount ALTER COLUMN id SET DEFAULT nextval('public.discount_id_seq'::regclass);


--
-- Name: event pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event ALTER COLUMN pk SET DEFAULT nextval('public.event_pk_seq'::regclass);


--
-- Name: event_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_group ALTER COLUMN id SET DEFAULT nextval('public.event_group_id_seq'::regclass);


--
-- Name: file id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file ALTER COLUMN id SET DEFAULT nextval('public.file_id_seq'::regclass);


--
-- Name: friend_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friend_requests ALTER COLUMN id SET DEFAULT nextval('public.friend_requests_id_seq'::regclass);


--
-- Name: group_chat id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat ALTER COLUMN id SET DEFAULT nextval('public.group_chat_id_seq'::regclass);


--
-- Name: group_chat_member id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat_member ALTER COLUMN id SET DEFAULT nextval('public.group_chat_member_id_seq'::regclass);


--
-- Name: group_member id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_member ALTER COLUMN id SET DEFAULT nextval('public.group_member_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: invoice id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice ALTER COLUMN id SET DEFAULT nextval('public.invoice_id_seq'::regclass);


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: newusers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.newusers ALTER COLUMN id SET DEFAULT nextval('public.newusers_id_seq'::regclass);


--
-- Name: payment pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment ALTER COLUMN pk SET DEFAULT nextval('public.payment_pk_seq'::regclass);


--
-- Name: plan pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan ALTER COLUMN pk SET DEFAULT nextval('public.plan_pk_seq'::regclass);


--
-- Name: prompt id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt ALTER COLUMN id SET DEFAULT nextval('public.prompt_id_seq'::regclass);


--
-- Name: spot_booking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spot_booking ALTER COLUMN id SET DEFAULT nextval('public.spot_booking_id_seq'::regclass);


--
-- Name: subscription pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription ALTER COLUMN pk SET DEFAULT nextval('public.subscription_pk_seq'::regclass);


--
-- Name: tempusers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempusers ALTER COLUMN id SET DEFAULT nextval('public.tempusers_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: user_badge_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_badge_details ALTER COLUMN id SET DEFAULT nextval('public.user_badge_details_id_seq'::regclass);


--
-- Name: user_connections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_connections ALTER COLUMN id SET DEFAULT nextval('public.user_connections_id_seq'::regclass);


--
-- Name: user_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_group ALTER COLUMN id SET DEFAULT nextval('public.user_group_id_seq'::regclass);


--
-- Name: user_tracking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tracking ALTER COLUMN id SET DEFAULT nextval('public.user_tracking_id_seq'::regclass);


--
-- Name: users pk; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN pk SET DEFAULT nextval('public.users_pk_seq'::regclass);


--
-- Name: access_request access_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_pkey PRIMARY KEY (id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: app_version app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_version
    ADD CONSTRAINT app_version_pkey PRIMARY KEY (id);


--
-- Name: area area_name_city_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_name_city_id_key UNIQUE (name, city_id);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: badge badge_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badge
    ADD CONSTRAINT badge_pkey PRIMARY KEY (id);


--
-- Name: booking booking_booking_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_booking_id_key UNIQUE (booking_id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: booking_timeline booking_timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking_timeline
    ADD CONSTRAINT booking_timeline_pkey PRIMARY KEY (id);


--
-- Name: chat_message chat_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: club club_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_id_key UNIQUE (id);


--
-- Name: club club_name_activity_created_by_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_name_activity_created_by_key UNIQUE (name, activity, created_by);


--
-- Name: club club_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_pkey PRIMARY KEY (pk);


--
-- Name: club_schedules club_schedules_club_id_location_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules
    ADD CONSTRAINT club_schedules_club_id_location_id_key UNIQUE (club_id, location_id);


--
-- Name: club_schedules club_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules
    ADD CONSTRAINT club_schedules_pkey PRIMARY KEY (id);


--
-- Name: club_user_details club_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_user_details
    ADD CONSTRAINT club_user_details_pkey PRIMARY KEY (id);


--
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- Name: discount discount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (id);


--
-- Name: event_group event_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_group
    ADD CONSTRAINT event_group_pkey PRIMARY KEY (id);


--
-- Name: event event_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_id_key UNIQUE (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (pk);


--
-- Name: file file_file_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_file_name_key UNIQUE (file_name);


--
-- Name: file file_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_pkey PRIMARY KEY (id);


--
-- Name: file file_s3_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_s3_url_key UNIQUE (s3_url);


--
-- Name: friend_requests friend_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_pkey PRIMARY KEY (id);


--
-- Name: group_chat_member group_chat_member_group_chat_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat_member
    ADD CONSTRAINT group_chat_member_group_chat_id_user_id_key UNIQUE (group_chat_id, user_id);


--
-- Name: group_chat_member group_chat_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat_member
    ADD CONSTRAINT group_chat_member_pkey PRIMARY KEY (id);


--
-- Name: group_chat group_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat
    ADD CONSTRAINT group_chat_pkey PRIMARY KEY (id);


--
-- Name: group_member group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT group_member_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: invoice invoice_invoice_number_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_invoice_number_transaction_id_key UNIQUE (invoice_number, transaction_id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: newusers newusers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.newusers
    ADD CONSTRAINT newusers_pkey PRIMARY KEY (id);


--
-- Name: payment payment_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_key UNIQUE (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (pk);


--
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (pk);


--
-- Name: prompt prompt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt
    ADD CONSTRAINT prompt_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: spot_booking spot_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spot_booking
    ADD CONSTRAINT spot_booking_pkey PRIMARY KEY (id);


--
-- Name: subscription subscription_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_id_key UNIQUE (id);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (pk);


--
-- Name: tempusers tempusers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tempusers
    ADD CONSTRAINT tempusers_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: user_badge_details user_badge_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_badge_details
    ADD CONSTRAINT user_badge_details_pkey PRIMARY KEY (id);


--
-- Name: user_connections user_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_connections
    ADD CONSTRAINT user_connections_pkey PRIMARY KEY (id);


--
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- Name: user_tracking user_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tracking
    ADD CONSTRAINT user_tracking_pkey PRIMARY KEY (id);


--
-- Name: users users_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_key UNIQUE (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (pk);


--
-- Name: users users_unique_referral_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique_referral_code UNIQUE (referral_code);


--
-- Name: access_request_entity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX access_request_entity ON public.access_request USING btree (entity_type, entity_id, user_id) WHERE (status = ANY (ARRAY['PENDING'::public.access_request_status, 'APPROVED'::public.access_request_status]));


--
-- Name: club_user_details_club_id_user_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX club_user_details_club_id_user_id_key ON public.club_user_details USING btree (club_id, user_id) WHERE (is_deleted = false);


--
-- Name: group_member_user_group_id_user_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX group_member_user_group_id_user_id_key ON public.group_member USING btree (user_group_id, user_id) WHERE ((is_deleted = false) AND (is_removed = false));


--
-- Name: idx_booking_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_booking_event_id ON public.booking USING btree (event_id);


--
-- Name: idx_booking_status_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_booking_status_created_at ON public.booking USING btree (booking_status, created_at) WHERE (booking_status = ANY (ARRAY['REGISTERED'::public.booking_status, 'NOT_ATTENDED'::public.booking_status, 'ATTENDED'::public.booking_status, 'OPEN_FOR_REPLACEMENT'::public.booking_status, 'WAITLISTED'::public.booking_status]));


--
-- Name: idx_club_user_details_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_club_user_details_status ON public.club_user_details USING btree (is_deleted, is_blocked) WHERE ((is_deleted = false) AND (is_blocked = false));


--
-- Name: idx_event_club_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_club_time ON public.event USING btree (club_id, start_time, end_time) WHERE (state = 'CREATED'::public.event_state);


--
-- Name: idx_event_group_entity_id_user_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_event_group_entity_id_user_group_id ON public.event_group USING btree (entity_id, entity_type, user_group_id) WHERE (is_deleted = false);


--
-- Name: idx_event_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_location_id ON public.event USING btree (location_id);


--
-- Name: idx_group_member_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_group_member_user_id ON public.group_member USING btree (user_id) WHERE ((is_deleted = false) AND (is_removed = false));


--
-- Name: idx_groups_entity_type_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_groups_entity_type_deleted ON public.groups USING btree (entity_type, entity_id) WHERE (is_deleted = false);


--
-- Name: idx_media_entity_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_media_entity_category ON public.media USING btree (entity_id, entity_type, category);


--
-- Name: idx_spot_booking_booking_id_spot_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_spot_booking_booking_id_spot_status ON public.spot_booking USING btree (booking_id, spot_status) WHERE (spot_status = ANY (ARRAY['REGISTERED'::public.booking_status, 'OPEN_FOR_REPLACEMENT'::public.booking_status, 'WAITLISTED'::public.booking_status, 'ATTENDED'::public.booking_status, 'NOT_ATTENDED'::public.booking_status]));


--
-- Name: idx_transaction_entity_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_transaction_entity_created ON public.transaction USING btree (entity_id, entity_type, created_at DESC);


--
-- Name: idx_unique_group_chat_link; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_group_chat_link ON public.group_chat USING btree (chat_link) WHERE (is_deleted = false);


--
-- Name: idx_unique_non_deleted_badge; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_non_deleted_badge ON public.badge USING btree (name, entity_type, entity_id) WHERE (is_deleted = false);


--
-- Name: idx_unique_non_deleted_connection; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_non_deleted_connection ON public.user_connections USING btree (user_id, connection_id, type) WHERE (is_deleted = false);


--
-- Name: idx_unique_non_deleted_user_badge_details; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_non_deleted_user_badge_details ON public.user_badge_details USING btree (user_id, badge_id) WHERE (is_deleted = false);


--
-- Name: idx_unique_pending_friend_requests; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_pending_friend_requests ON public.friend_requests USING btree (requester_id, recipient_id) WHERE (status = 'PENDING'::public.friend_request_status);


--
-- Name: idx_unique_user_entity; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_unique_user_entity ON public.user_tracking USING btree (user_id, entity_type, entity_id, tracking_type) WHERE (is_deleted = false);


--
-- Name: idx_user_tracking_entity_type_id_tracking_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_tracking_entity_type_id_tracking_type ON public.user_tracking USING btree (entity_type, entity_id, tracking_type) WHERE (is_deleted = false);


--
-- Name: spot_booking_unique_booking_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX spot_booking_unique_booking_user ON public.spot_booking USING btree (booking_id) WHERE (spot_user_type = 'USER'::public.spot_user_type);


--
-- Name: user_prompt_type_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX user_prompt_type_key ON public.prompt USING btree (user_id, prompt_type, entity_id);


--
-- Name: users_phone_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_phone_key ON public.users USING btree (phone) WHERE (is_deleted = false);


--
-- Name: booking generate_ticket_id_on_booking_creation; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER generate_ticket_id_on_booking_creation BEFORE INSERT ON public.booking FOR EACH ROW EXECUTE FUNCTION public.generate_ticket_id();


--
-- Name: invoice set_invoice_number_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_invoice_number_trigger BEFORE INSERT ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.set_invoice_number();


--
-- Name: users set_referral_code_before_insert; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_referral_code_before_insert BEFORE INSERT ON public.users FOR EACH ROW WHEN ((new.referral_code IS NULL)) EXECUTE FUNCTION public.generate_referral_code();


--
-- Name: club track_clubs_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER track_clubs_changes AFTER DELETE OR UPDATE ON public.club FOR EACH ROW EXECUTE FUNCTION public.log_history();


--
-- Name: location track_location_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER track_location_changes AFTER DELETE OR UPDATE ON public.location FOR EACH ROW EXECUTE FUNCTION public.log_history();


--
-- Name: access_request update_access_request_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_access_request_updated_at BEFORE UPDATE ON public.access_request FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: area update_area_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_area_updated_at BEFORE UPDATE ON public.area FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: booking_timeline update_booking_timeline_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_booking_timeline_updated_at BEFORE UPDATE ON public.booking_timeline FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: booking update_booking_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_booking_updated_at BEFORE UPDATE ON public.booking FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: city update_city_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_city_updated_at BEFORE UPDATE ON public.city FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: club_schedules update_club_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_club_schedules_updated_at BEFORE UPDATE ON public.club_schedules FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: club update_club_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_club_updated_at BEFORE UPDATE ON public.club FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: club_user_details update_club_user_details_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_club_user_details_updated_at BEFORE UPDATE ON public.club_user_details FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: discount update_discount_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_discount_updated_at BEFORE UPDATE ON public.discount FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: event_group update_event_group_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_event_group_updated_at BEFORE UPDATE ON public.event_group FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: event update_event_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_event_updated_at BEFORE UPDATE ON public.event FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: file update_file_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_file_updated_at BEFORE UPDATE ON public.file FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: group_chat_member update_group_chat_member_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_group_chat_member_updated_at BEFORE UPDATE ON public.group_chat_member FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: group_chat update_group_chat_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_group_chat_updated_at BEFORE UPDATE ON public.group_chat FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: group_member update_group_member_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_group_member_updated_at BEFORE UPDATE ON public.group_member FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: groups update_groups_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_groups_updated_at BEFORE UPDATE ON public.groups FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: location update_location_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_location_updated_at BEFORE UPDATE ON public.location FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: media update_media_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_media_updated_at BEFORE UPDATE ON public.media FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: payment update_payment_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_payment_updated_at BEFORE UPDATE ON public.payment FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: plan update_plan_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_plan_updated_at BEFORE UPDATE ON public.plan FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: prompt update_prompt_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_prompt_updated_at BEFORE UPDATE ON public.prompt FOR EACH STATEMENT EXECUTE FUNCTION public.update_updated_at();


--
-- Name: subscription update_subscription_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_subscription_updated_at BEFORE UPDATE ON public.subscription FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: transaction update_transaction_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_transaction_updated_at BEFORE UPDATE ON public.transaction FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: user_group update_user_group_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_user_group_updated_at BEFORE UPDATE ON public.user_group FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: users update_users_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: access_request access_request_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: announcement announcement_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.club(pk);


--
-- Name: announcement announcement_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: area area_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- Name: booking booking_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(pk);


--
-- Name: booking booking_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscription(pk);


--
-- Name: booking_timeline booking_timeline_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking_timeline
    ADD CONSTRAINT booking_timeline_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: booking_timeline booking_timeline_spot_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking_timeline
    ADD CONSTRAINT booking_timeline_spot_booking_id_fkey FOREIGN KEY (spot_booking_id) REFERENCES public.spot_booking(id);


--
-- Name: booking_timeline booking_timeline_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking_timeline
    ADD CONSTRAINT booking_timeline_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: booking booking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: chat_message chat_message_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.file(id);


--
-- Name: chat_message chat_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: club club_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: club_schedules club_schedules_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules
    ADD CONSTRAINT club_schedules_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.club(pk);


--
-- Name: club_schedules club_schedules_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules
    ADD CONSTRAINT club_schedules_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: club_schedules club_schedules_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_schedules
    ADD CONSTRAINT club_schedules_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: club_user_details club_user_details_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_user_details
    ADD CONSTRAINT club_user_details_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.club(pk);


--
-- Name: club_user_details club_user_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club_user_details
    ADD CONSTRAINT club_user_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: coupon coupon_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: discount discount_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: discount discount_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- Name: discount discount_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: event event_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.club(pk);


--
-- Name: event event_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: event_group event_group_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_group
    ADD CONSTRAINT event_group_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: event event_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: friend_requests friend_requests_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users(pk);


--
-- Name: friend_requests friend_requests_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friend_requests
    ADD CONSTRAINT friend_requests_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public.users(pk);


--
-- Name: group_chat group_chat_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat
    ADD CONSTRAINT group_chat_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: group_chat group_chat_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat
    ADD CONSTRAINT group_chat_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: group_chat_member group_chat_member_group_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat_member
    ADD CONSTRAINT group_chat_member_group_chat_id_fkey FOREIGN KEY (group_chat_id) REFERENCES public.group_chat(id);


--
-- Name: group_chat_member group_chat_member_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat_member
    ADD CONSTRAINT group_chat_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: group_chat group_chat_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_chat
    ADD CONSTRAINT group_chat_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: group_member group_member_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT group_member_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: group_member group_member_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT group_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: groups groups_user_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_user_group_id_fkey FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: invoice invoice_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.file(id);


--
-- Name: invoice invoice_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- Name: invoice invoice_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: location location_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- Name: location location_image_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_image_fkey FOREIGN KEY (image) REFERENCES public.file(id);


--
-- Name: media media_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: media media_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.file(id);


--
-- Name: prompt prompt_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt
    ADD CONSTRAINT prompt_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: spot_booking spot_booking_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spot_booking
    ADD CONSTRAINT spot_booking_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: subscription subscription_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plan(pk);


--
-- Name: subscription subscription_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: transaction transaction_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(pk);


--
-- Name: transaction transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: user_badge_details user_badge_details_badge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_badge_details
    ADD CONSTRAINT user_badge_details_badge_id_fkey FOREIGN KEY (badge_id) REFERENCES public.badge(id);


--
-- Name: user_badge_details user_badge_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_badge_details
    ADD CONSTRAINT user_badge_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: user_connections user_connections_connection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_connections
    ADD CONSTRAINT user_connections_connection_id_fkey FOREIGN KEY (connection_id) REFERENCES public.users(pk);


--
-- Name: user_connections user_connections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_connections
    ADD CONSTRAINT user_connections_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- Name: user_group user_group_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(pk);


--
-- Name: user_tracking user_tracking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_tracking
    ADD CONSTRAINT user_tracking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(pk);


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO public.schema_migrations (version) VALUES
    ('20240916083606'),
    ('20240916084311'),
    ('20240916114749'),
    ('20240916114856'),
    ('20240916115518'),
    ('20240916115709'),
    ('20240916120327'),
    ('20240917070121'),
    ('20240917070549'),
    ('20240917071557'),
    ('20240917101416'),
    ('20240919132242'),
    ('20240919132406'),
    ('20241018094401'),
    ('20241024091126'),
    ('20241105121739'),
    ('20241106065120'),
    ('20241120110712'),
    ('20241120111111'),
    ('20241121084314'),
    ('20241121085024'),
    ('20241125101122'),
    ('20241129115844'),
    ('20241205065307'),
    ('20241212075143'),
    ('20241213095517'),
    ('20241220065258'),
    ('20241227112753'),
    ('20250106084548'),
    ('20250109092252'),
    ('20250109124903'),
    ('20250110073549'),
    ('20250116160735'),
    ('20250117152815'),
    ('20250120054400'),
    ('20250121092612'),
    ('20250121120358'),
    ('20250121120955'),
    ('20250121121555'),
    ('20250121205831'),
    ('20250130152136'),
    ('20250130152237'),
    ('20250204080313'),
    ('20250205091320'),
    ('20250205091347'),
    ('20250206193721'),
    ('20250206212056'),
    ('20250206212456'),
    ('20250212103701'),
    ('20250217142436'),
    ('20250218041807'),
    ('20250218044017'),
    ('20250218145216'),
    ('20250220054044'),
    ('20250220061849'),
    ('20250221121948'),
    ('20250222222529'),
    ('20250227104834'),
    ('20250227110235'),
    ('20250227110452'),
    ('20250227210732'),
    ('20250303152011'),
    ('20250310092140'),
    ('20250316044314'),
    ('20250317064454'),
    ('20250325104620'),
    ('20250328025019'),
    ('20250331215309'),
    ('20250401065506'),
    ('20250404034406'),
    ('20250404051409'),
    ('20250409121942'),
    ('20250409122858'),
    ('20250415145852'),
    ('20250423172115'),
    ('20250423195610'),
    ('20250424094526'),
    ('20250513044038'),
    ('20250513044223'),
    ('20250513044422'),
    ('20250513044707'),
    ('20250513045346'),
    ('20250513051139'),
    ('20250513052146'),
    ('20250514051431'),
    ('20250514123216'),
    ('20250515090921'),
    ('20250516042239'),
    ('20250516192717'),
    ('20250520195348'),
    ('20250521141407'),
    ('20250523101538'),
    ('20250523101539'),
    ('20250527101431'),
    ('20250530073505'),
    ('20250602154234'),
    ('20250604080643'),
    ('20250604105438'),
    ('20250607072302'),
    ('20250610084945'),
    ('20250611121619'),
    ('20250612104414'),
    ('20250613192139'),
    ('20250621154523');

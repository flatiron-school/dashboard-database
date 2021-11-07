CREATE OR REPLACE FUNCTION create_myuser(theUsername text, thePassword text)
RETURNS void AS
$BODY$
BEGIN
  IF NOT EXISTS (
    SELECT FROM pg_catalog.pg_user
    WHERE usename = theUsername) THEN
    BEGIN
      EXECUTE format(
        'CREATE USER %I WITH ENCRYPTED PASSWORD %L',
        theUsername,
        thePassword
      );

      RAISE NOTICE 'user ''%'' created', theUsername;
    EXCEPTION WHEN DUPLICATE_OBJECT THEN
      RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
    END;
  END IF;
END
$BODY$
LANGUAGE 'plpgsql';

SELECT create_myuser(:vUsername, :vPassword);


DROP FUNCTION IF EXISTS bully_detect(c text);

CREATE OR REPLACE FUNCTION bully_detect(c text) RETURNS TABLE (
  community_name VARCHAR,
  bullied_user INT[]
)
AS $$
DECLARE
 us int[];
 bu int[];
 rec record;
BEGIN
  SELECT users INTO us FROM communities WHERE name = c;
  FOR rec in (SELECT name FROM communities WHERE array_length(users, 1) = array_length(us, 1) + 1 AND users @> us) LOOP
    SELECT array_agg(e) INTO bu
      FROM (SELECT UNNEST(users) FROM communities WHERE name = rec.name
           EXCEPT
            SELECT UNNEST(us)) AS DT(e);
    community_name := rec.name;
    bullied_user := bu;
    RETURN NEXT;
  END LOOP;
END;
$$
LANGUAGE 'plpgsql';

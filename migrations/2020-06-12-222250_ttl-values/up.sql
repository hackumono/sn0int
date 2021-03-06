PRAGMA foreign_keys=off;

CREATE TABLE _ttls_new (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    family VARCHAR NOT NULL,
    key INTEGER NOT NULL,
    value VARCHAR NOT NULL,
    expire DATETIME NOT NULL,
    CONSTRAINT ttl_unique UNIQUE (family, key)
);

INSERT INTO _ttls_new (id, family, key, value, expire)
    SELECT id, family, key, "unknown", expire
    FROM ttls;

DROP TABLE ttls;
ALTER TABLE _ttls_new RENAME TO ttls;

PRAGMA foreign_keys=on;

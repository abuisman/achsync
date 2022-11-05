# Achsync

Modestly named after myself. A docker image to one-way sync a table from one postgres database to the other.

A very simple alternative to Meltano and Airbyte to sync one posgres database to another.

I host this docker image on Render.com in the form of a "cron job".

# Usage

## Backfills for specific table

Backfills are only useful for tables where you append data. The script first checks what that highest ID in the target database is and then fetches the records since that ID from the source database and sends them over.

Use these environment variables to configure the script.

**FROM_URL**: The postgres url that you will sync from. Example: `postgres://user:password@host.example.com/database_name`

**TO_URL**: The postgres url that you will sync to. Example: `postgres://user:password@host.example.com/database_name`

**TABLE**: The table you want tot sync

Just run the docker image with these variables, backfills are the default.

## Full-sync

**DESTRUCTIVE** sync of all data from the source database to the target database.

Use the following environment variables to configure the run:

**FROM_URL**: The postgres url that you will sync from. Example: `postgres://user:password@host.example.com/database_name`

**TO_URL**: The postgres url that you will sync to. Example: `postgres://user:password@host.example.com/database_name`

**EXTRA_DUMP_FLAGS**: Useful to only dump or not dump certain tables or any other flags for `pg_dump`. For example: `--exclude-table=orders --exclude-table=users`

**EXTRA_RESTORE_FLAGS**: A way to add flags to the `pg_restore` call. Such as: `--data-only`.

Change the command for the docker image to `/bin/full_sync.sh`.


# Why?

Why not log-based replication? Because some providers, Heroku for instance, don't support that.

Why not Meltano? It was too slow, to a point where jobs would never finish.

Why not Airbyte? Hard to self-host and overkill for this specific usecase.

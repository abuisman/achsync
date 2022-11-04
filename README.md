# Achsync

Modestly named after myself. A docker image to one-way sync a table from one postgres database to the other.

# Usage

Achsync is configured through environment variables:

**FROM_URL**: The postgres url that you will sync from. Example: `postgres://user:password@host.example.com/database_name`
**TO_URL**: The postgres url that you will sync to. Example: `postgres://user:password@host.example.com/database_name`
**

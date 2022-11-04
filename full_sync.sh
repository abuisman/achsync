#!/bin/bash

pg_dump $FROM_URL -Fc --no-acl --no-owner --verbose $EXTRA_DUMP_FLAGS | pg_restore -d "$TO_URL" --clean --if-exists --verbose

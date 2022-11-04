max_id=$(psql "$TO_URL" -c "COPY(SELECT max(id) FROM $TABLE) TO STDOUT")
max_id_in_from=$(psql "$FROM_URL" -c "COPY(SELECT max(id) FROM $TABLE) TO STDOUT")

echo "Maximum id for table $TABLE in to is: $max_id"
echo "Maximum id for table $TABLE in from is: $max_id_in_from"

psql $FROM_URL -c "COPY (SELECT * FROM "public"."$TABLE" WHERE id > $max_id) TO STDOUT" | psql $TO_URL -c "COPY "$TABLE" FROM STDIN"

echo "Done!"

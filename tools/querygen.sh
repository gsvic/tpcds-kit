#!/bin/bash

TEMPLATE_DIR="../query_templates"  # Update with actual path
OUTPUT_DIR="./out"         # Directory to store .sql files
DIALECT="netezza"                        # Change this as per your target SQL dialect

rm -rf out
mkdir out

# List of queries to generate (assuming 99 queries in TPC-DS)
for i in {1..99}; do
  QUERY_TEMPLATE="query${i}.tpl"
  OUTPUT_FILE="query${i}.sql"

  # Generate SQL query file from the template
  ./dsqgen -DIRECTORY $TEMPLATE_DIR -TEMPLATE $TEMPLATE_DIR/$QUERY_TEMPLATE -DIALECT netezza -OUTPUT $OUTPUT_DIR -VERBOSE Y -QUALIFY Y

  mv $OUTPUT_DIR/query_0.sql $OUTPUT_DIR/$OUTPUT_FILE

  echo "Generated $OUTPUT_FILE"
done
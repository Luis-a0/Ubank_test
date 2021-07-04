import csv
import psycopg2
conn = psycopg2.connect("host=localhost dbname=DBNAME user=USER password=PASSWORD")
cur = conn.cursor()
with open('data/test_rules.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader) # Skip the header row.
    for row in reader:
        cur.execute(
        "INSERT INTO rules VALUES ('{}', '{}', '{}', '{}', '{}', '{}')".format(row[0], row[1], row[2], row[3], row[4], row[5])
    )
conn.commit()
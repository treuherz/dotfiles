dest=$1
timestamp=$(date -u +%Y%m%dT%H%M%SZ)
prev_time=$(ls -F $1 | grep -P '^\d{8}T\d{6}Z/$' | sed 's/\///' | tail -n1)

rsync -azhvCF --partial --stats --log-file="$1/logs/$timestamp.log" --dry-run --progress --link-dest="$1/$prev_time" ~/ "$1/$timestamp"

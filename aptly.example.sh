#!/bin/bash
opt=
[ ! -t 0 ] || opt=-t
exec docker run --rm -i $opt -v aptly_local:/repo lazyfrosch/aptly aptly "$@"

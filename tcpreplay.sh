#!/bin/bash

/usr/bin/inotifywait -m --format '%f' -e close_write /pcap/ | while read FILE
do
	tcpreplay -t -i $MONITOR /pcap/$FILE;
	rm -fr /pcap/$FILE;
done;

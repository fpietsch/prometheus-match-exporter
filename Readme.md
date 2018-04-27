**Match_Exporter for Prometheus**

This Exporter search for Words in Files, if found the specific metric will be 1 else 0.

Usage:
Before Starting the exporter, write a Config.txt like: 

MetricName PathToFile MatchWord 

...
Example  Config: See Config.txt File


Usage as Service:

Edit the .service File, and put in the right Path of match_exporter.py File

Move .service File to /etc/systemd/system/

systemctl daemon-reload

systemctl enable match_exporter.service

systemctl start match_exporter.service

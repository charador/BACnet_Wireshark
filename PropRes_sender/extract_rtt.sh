#!/bin/bash
# run with bash + filename
# extract from combined.pcap the timestamp and deltatime of non-periodic services used to construct 1 min bin time sequence

#WHOIS: all
tshark -r 2challenges_lin_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 2linear_rcv_deltatime.txt

tshark -r 2challenges_qua_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 2qua_rcv_deltatime.txt

tshark -r 3challenges_lin_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 3linear_rcv_deltatime.txt

tshark -r 3challenges_qua_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 3qua_rcv_deltatime.txt

tshark -r 5challenges_lin_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 5linear_rcv_deltatime.txt

tshark -r 5challenges_qua_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 5qua_rcv_deltatime.txt

tshark -r 10challenges_lin_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 10linear_rcv_deltatime.txt

tshark -r 10challenges_qua_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 10qua_rcv_deltatime.txt

tshark -r 1challenges_qua_write_sender.pcapng -Y '(((bacapp.type == 2) && (bacapp.confirmed_service == 15)) ) || (bacapp.type == 0) && (bacapp.confirmed_service == 15)' -w - | tshark -r - -t e -T text -T fields -e frame.cap_len -e frame.time_delta > 1qua_rcv_deltatime.txt
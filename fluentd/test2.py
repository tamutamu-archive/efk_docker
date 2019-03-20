# -*- coding: utf-8 -*-
from pprint import pprint
from scapy.all import *

def packet_callback(packet):
    pprint(packet.show)

sniff(prn=packet_callback)


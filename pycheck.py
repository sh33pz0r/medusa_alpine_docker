import urllib2
import socket
import sys

def check_url(url, timeout=5):
    try:
        return urllib2.urlopen(url,timeout=timeout).getcode() == 200
    except urllib2.URLError as e:
        return False
    except socket.timeout as e:
        return False

if check_url(url="http://localhost:8081"):
    sys.exit(0)
else:
    sys.exit(1)
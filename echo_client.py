# Franchesca Pena
#
# A client that sends and recieves http requests and responses.
# Based off of Professor Manfredi's echo client template.
#
# Usage:
#   python3 echo_client.py
#

import socket
import sys

class EchoClient():
    
        def __init__(self, server_host, server_port,request):
                self.start(server_host, server_port,request)
    
        def start(self, server_host, server_port,request):
		
		# Try to connect to web proxy
                try:
                    server_sock = socket.socket(
                            socket.AF_INET, socket.SOCK_STREAM)
                    server_sock.connect((server_host, server_port))
                except OSError as e:
                    print ('Unable to connect to socket: ', e)
                    if server_sock:
                        server_sock.close()
                    sys.exit(1)

                # Send request string to proxy over socket
                bin_msg = request.encode('utf-8')
                print('encoded msg is: ',bin_msg)
                server_sock.sendall(bin_msg)

                # Get response data from proxy and print it
                str_resp=''
                while True:
                        bin_resp = server_sock.recv(4096)
                        str_resp+=bin_resp.decode('utf-8')
                        if not bin_resp:
                                break
                print ('Proxy received from web:', str_resp)

                # Close server socket
                server_sock.close()
                
##input two strings, path and host, function returns an http request of type string
def build_request(path, host):
        request=('GET '+path+' HTTP/1.1\r\n'+'Host:'+host+'\r\nConnection: close\r\n\r\n')
        return request
	
def main():

    # Echo server socket parameters
    server_host = 'localhost'
    server_port = 50008

    # Parse command line parameters if any
    if len(sys.argv) > 1:
        server_host = sys.argv[1]
        server_port = int(sys.argv[2])

    #Introduction
    print('''Hello! Welcome to my proxy web server. To visit a webpage/send an http GET request please do the following:
          You will be asked for a host name of your page. Ex: www.mit.edu
          You will then be asked for a path name. Ex: /aboutmit/
          If you do not have a path then please enter /. 
          You should recieve a response. To send another request simply run echo_client.py again''')
    ###create request object
    host=input('What is the host?')
    path=input('What is the path?')
    req=build_request(path,host)
                
    # Create EchoClient object
    client = EchoClient(server_host, server_port,req)

if __name__ == '__main__':
    main()

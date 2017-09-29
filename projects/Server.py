# Franchesca Pena 
# 
# A multi-threaded web proxy that receives http requests, connects to the internet
# and echos back the response it received to the client. Based off Professor
# Manfredi's code for a simple echo server.
#

import socket
import sys
import threading

class WebProxy():
    #cache to store URLs. 
    global cache
    cache={}
    
    #add takes a url and response and adds them as a key value pair
    #to cache
    def add(url,response):
        cache.update({url:response})

    #in_Cache takes in a http request and returns a boolen, whether URL
    #already exist in cache or not.
    def in_Cache(url):
        if url in cache:
            return True
        else:
            return False
     # new_Resquest takes in strings: path, host, and date and returns an updated
     # http request with an If-Modified-Since line
    def new_Request(path, host, date):
        newrequest=('GET '+path+' HTTP/1.1\r\n'+'Host:'+host+'\r\n'+'Connection: close\r\nIf-Modified-Since:'+date+'\r\n\r\n')
        return newrequest

class Server():

    def __init__(self, server_host, server_port):

        self.server_host = server_host
        self.server_port = server_port
        self.server_backlog = 1
        self.start()

    def start(self):

        # Initialize server socket on which to listen for connections
        try:
            server_sock = socket.socket(
                    socket.AF_INET, socket.SOCK_STREAM)
            server_sock.bind((self.server_host, self.server_port))
            server_sock.listen(self.server_backlog)
        except OSError as e:
            print ('Unable to open socket: ', e)
            if server_sock:
                server_sock.close()
            sys.exit(1)

        # Wait for client connection
        while True:

            # Client has connected
            [client_conn, client_addr] = server_sock.accept()
            print ('Client has connected with address: ', client_addr)

            # Create thread to serve client
            thread = threading.Thread(
                    target = self.serve_content,
                    args = (client_conn, client_addr))
            thread.start()

    def serve_content(self, client_conn, client_addr):

        #build_request takes in two strings path and host and builds am http get request
        #function is mostly use to restructure web browser requests
        def build_request(path, host):
            request=('GET '+path+' HTTP/1.1\r\n'+'Host:'+host+'\r\nConnection: close\r\n\r\n')
            return request

        print ('Serving content to client with address', client_addr)

        # Receive data from client
        bin_data = client_conn.recv(4096)
        print('Recieved bindata is: ', bin_data)
        ## Dcode data from client
        bin_data=bin_data.decode('utf-8')

        # if web browser sent request...
        if 'GET http://' in bin_data:
            ## Parse bindata for host
            startint=bin_data.find('Host: www.')
            y=bin_data[startint:]
            start=y.find('www.')
            end=y.find('\r\n')
            host=y[start:end]
            print('host is ',host)

            url0='http://'+host
            print('url0 is ',url0)
            ## Fix request for web browsers
            if url0 in bin_data:
                bin_data=bin_data.replace(url0,'',1)
                print('NEW REQUEST IS ',bin_data)

            ## Parse bindata for path
            pathstart=bin_data.find('/')
            pathend=bin_data.find('HTTP')
            path=bin_data[pathstart:pathend]
            # Build url from host and path
            url=host+path
        #else, request is well formed, find path and host and url
        else:
            startint=bin_data.find('/')
            endint=bin_data.find('HTTP')
            path=bin_data[startint:endint]
            start=bin_data.find('www')
            end=bin_data.find('\r\nConnection')
            host=bin_data[start:end]
            url=host+path
            
        ###connect to web using port 80
        try:
            web_sock = socket.socket(
                    socket.AF_INET, socket.SOCK_STREAM)
            web_sock.connect((host, 80))
        except OSError as e:
            print ('Unable to connect to socket: ', e)
            if web_sock:
                web_sock.close()
            sys.exit(1)
            
        ###if url is not in cache, send request, unmodified
        if WebProxy.in_Cache(url) != True:
            ### encode data again before sending
            bin_data=bin_data.encode('utf-8')
            ##send bin_data, http request
            web_sock.sendall(bin_data)
            # Get http response data from webserver
            http_resp=''
            while True:
                web_resp = web_sock.recv(4096)
                http_resp+=web_resp.decode('utf-8')
                if not web_resp:
                    break
            ## Print response
            print ('Proxy received', http_resp)
            ### Update cache
            WebProxy.add(url,http_resp)
            ### Encode response and echo back to client
            web_resp=http_resp.encode('utf-8')
            client_conn.sendall(web_resp)
        ###else modify request
        else:
            print('URL IS IN CACHE')
            #find in cache
            response=cache[url]
            print('response is',response)
            ### extract last-modified date
            datestart=((response.find('Last-Modified:'))+15)
            dateend=((response.find('GMT'))+3)
            date=response[datestart:dateend]
            ### new request w/ if-modified since: 
            newrequest=WebProxy.new_Request(path,host,date)
            print('NEW REQUEST IS:',newrequest)
            ##encode request
            newrequest=newrequest.encode('utf-8')
            ## send request
            web_sock.sendall(newrequest)
            # Get http response data from webserver
            http_resp=''
            while True:
                web_resp = web_sock.recv(4096)
                http_resp+=web_resp.decode('utf-8')
                if not web_resp:
                    break
            print ('Proxy received', http_resp)
            ## Update cache
            WebProxy.add(url, http_resp)
            if '304 Not Modified' in http_resp:
            ### Echo back saved http resposne to client
                print('304 DETECTED')
                client_conn.sendall(response.encode('utf-8'))
            ## Else send back received response
            else:
                client_conn.sendall(http_resp.encode('utf-8'))

        # Close webserver socket
        web_sock.close()

        # Close connection to client
        client_conn.close()

def main():

    # Echo server socket parameters
    server_host = 'localhost'
    server_port = 50008

    # Parse command line parameters if any
    if len(sys.argv) > 1:
        server_host = sys.argv[1]
        server_port = int(sys.argv[2])

    # Create EchoServer object
    server = Server(server_host, server_port)

if __name__ == '__main__':
    main()

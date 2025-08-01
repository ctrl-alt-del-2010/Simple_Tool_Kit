import socket
import ssl
import threading
import time

open_ports = []
lock = threading.Lock()


ssl_ports = [443, 8443, 9443, 4443, 10443]

def get_ssl_info(ip, port):
    try:
        context = ssl.create_default_context()
        with socket.create_connection((ip, port), timeout=1) as sock:
            with context.wrap_socket(sock, server_hostname=ip) as ssock:
                cert = ssock.getpeercert()
                subject = dict(x[0] for x in cert['subject'])
                issued_to = subject.get('commonName', '')
                issuer = dict(x[0] for x in cert['issuer']).get('commonName', '')
                print(f"    🔒 SSL Info → Issued to: {issued_to}, Issuer: {issuer}")
    except Exception as e:
        print(f"    ⚠️  Couldn't get SSL info: {e}")

def scan_port(ip, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(0.3)
        result = sock.connect_ex((ip, port))
        if result == 0:
            with lock:
                print(f"[+] Port {port} is open")
                open_ports.append(port)
                if port in ssl_ports:
                    get_ssl_info(ip, port)
        sock.close()
    except:
        pass


target = input("Target domain or IP address: ").strip()


try:
    ip = socket.gethostbyname(target)
    print(f"Resolved {target} to {ip}")
except socket.gaierror:
    print("[-] Could not resolve the domain.")
    exit()


try:
    start_port = int(input("Start port [default 1]: ") or 1)
    end_port = int(input("End port [default 65535]: ") or 65535)
except ValueError:
    print("Invalid port number.")
    exit()

print(f"\nScanning ports {start_port} to {end_port} on {ip}...\n")
start_time = time.time()

threads = []
for port in range(start_port, end_port + 1):
    t = threading.Thread(target=scan_port, args=(ip, port))
    threads.append(t)
    t.start()

for t in threads:
    t.join()

duration = time.time() - start_time
print(f"\nScan completed in {duration:.2f} seconds.")
if open_ports:
    print(f"Open ports on {target} ({ip}): {open_ports}")
else:
    print("No open ports found.")

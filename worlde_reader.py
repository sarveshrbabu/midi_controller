import re
import socket
import subprocess
import time
import UDP_IP, UDP_PORT from UDP_utils

# Create a UDP socket
udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

def send_udp_message(message):
    udp_message = message.encode('utf-8')
    udp_socket.sendto(udp_message, (UDP_IP, UDP_PORT))

while True:
    try:
        # Start the aseqdump command
        aseqdump_process = subprocess.Popen(["aseqdump", "-p", "WORLDE easy control"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        for line in aseqdump_process.stdout:
            # Match MIDI control change messages
            match = re.match(r'\s*(\d+:\d+)\s+Control change\s+(\d+), controller (\d+), value (\d+)', line)
            if match:
                midi_port, channel, controller, value = match.groups()
                # Prepare the message to send over UDP
                message = f"MIDI Port: {midi_port}, Channel: {channel}, Controller: {controller}, Value: {value}"
                #testing purposes comment this out when you're testing this  
                print(message)
                send_udp_message(message)
    except subprocess.CalledProcessError:
        pass
        #print("MIDI device not connected. Waiting...")
    finally:
        if aseqdump_process:
            aseqdump_process.kill()

# Close the UDP socket
udp_socket.close()


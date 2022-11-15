#! /usr/bin/env python

protocol_srting = "@protocol"
protocolNames = []
fileData = ""

with open('ApiDefinitions.cs') as f:
    protocolNames = [line for line in f.readlines() if protocol_srting in line]
    
with open('ApiDefinitions.cs') as f:
    fileData = f.read()

for line in protocolNames:
    line.strip()
    protocolName = line[line.find(protocol_srting) + len(protocol_srting) + 1:]
    interfaceName = "I" + line[line.find(protocol_srting) + len(protocol_srting) + 1:]
    print("replace for: " + interfaceName)
    fileData = fileData.replace(interfaceName, protocolName)

with open('ApiDefinitions.cs', "w") as f:
    f.write(fileData)

print("Done!")
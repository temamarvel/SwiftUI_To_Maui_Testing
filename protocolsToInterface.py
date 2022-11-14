#! /usr/bin/env python

protocol_srting = "@protocol"
protocolNames = []
fileData = ""

with open('ApiDefinitions.cs') as f:
    protocolNames = [line for line in f.readlines() if "// @protocol " in line]
    
with open('ApiDefinitions.cs') as f:
    fileData = f.read()

for line in protocolNames:
    line.strip()
    interfaceName = line[line.find(protocol_srting) + len(protocol_srting) + 1:]
    print("replace for: I" + interfaceName)
    fileData = fileData.replace("I" + interfaceName, interfaceName)

with open('ApiDefinitions.cs', "w") as f:
    f.write(fileData)

print("Done!")
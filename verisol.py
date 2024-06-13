import os
import shutil
import sys
import subprocess
import argparse
import random
import time
import re



model = None
tokenizer = None
#lora_param = "sallywww/invariants_ranking"
lora_param = 'sallywww/CoT_llama'

cmd_list = ["wget -q http://ftp.de.debian.org/debian/pool/main/i/icu/libicu63_63.1-6+deb10u3_amd64.deb",
						"wget -q http://ftp.de.debian.org/debian/pool/main/libu/liburcu/liburcu6_0.12.2-1_amd64.deb",
						"wget -q http://mirrors.kernel.org/ubuntu/pool/main/u/ust/liblttng-ust-ctl4_2.11.0-1_amd64.deb",
						"wget -q http://ftp.us.debian.org/debian/pool/main/u/usbutils/usbutils_010-3_amd64.deb",
						"sudo dpkg -i ./libicu63_63.1-6+deb10u3_amd64.deb",
						"sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF",  
						"wget -q https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1", 
						"wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list", 
						"sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list", 
						"sudo apt update", 
						"sudo apt-get install libicu63", 
						"wget -q https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1",
						"wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list", 
						"sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list",
						"sudo apt update",
						"sudo apt-get install libicu63",
						"sudo dpkg -i ./liblttng-ust0_2.11.0-1_amd64.deb",
						"sudo dpkg -i ./libssl1.1_1.1.1f-1ubuntu2_amd64.deb",
						"sudo dpkg -i ./liblttng-ust-ctl4_2.11.0-1_amd64.deb",
						"sudo dpkg -i ./liburcu6_0.12.2-1_amd64.deb",
						"sudo dpkg -i ./usbutils_010-3_amd64.deb",
						"sudo apt-get install aspnetcore-runtime-2.2 -Y",
						"sudo apt-get install dotnet-sdk-2.2",
						"git clone https://github.com/microsoft/verisol.git",           
						"cd verisol/Sources",
						"dotnet build ./verisol/Sources"]

#command for building python wrapper around C# for VeriSol 
def runcmd(cmd, verbose=False, *args, **kwargs):

	process = subprocess.Popen(
				cmd,
				stdout = subprocess.PIPE,
				stderr = subprocess.PIPE,
				shell = True
		)
	std_out, std_err = process.communicate()
	if verbose:      
		print(std_out.strip(), std_err)

def runcmd_out(cmd, verbose=False, *args, **kwargs):

	process = subprocess.Popen(
		cmd,
		stdout = subprocess.PIPE,
		stderr = subprocess.PIPE,
		text = True,
		shell = True
	)
	std_out, std_err = process.communicate()
	print(std_out)
	print(std_err)
	if verbose:      
		print(std_out.strip(), std_err)
	return std_out, std_err 
	
def iteratecmd(cmd_list):
	for i in cmd_list: 
		runcmd(i)

def test_timeout_largeparameter(file):
	start_time = time.time()
	runcmd(f"dotnet ./verisol/bin/Debug/VeriSol.dll {file} Test /contractInfer /recursionBound:1000000 /k:100000000 /inlineDepth:100000000", verbose=True)
	end_time = time.time()
	duration = end_time - start_time 
	return duration

def test_timeout_defaultparameter(file):
	start_time = time.time()
	runcmd(f"dotnet ./verisol/bin/Debug/VeriSol.dll {file} Test /contractInfer", verbose=True)
	end_time = time.time()
	duration = end_time - start_time 
	return duration

def runtest(folder):
	for root, _, files in os.walk(folder):
		for filename in files:
			time = 0
			filepath = os.path.join(root, filename)
			if "timeout1" in filename: 
				time = test_timeout_defaultparameter(filename)
				print(f'verification time for {filename} is {time}') 
	    
if __name__ == "__main__":
	print("installing SmartInv verifier...")
	#iteratecmd(cmd_list)
	folder = "./"
	runtest(folder)
	#file = "./timeout1.sol"
	#time = test_timeout(file)
	#print(f"the verification runtime on testfile {file} without incremental strtegy is {time}\n")
	#file2 = "./timeout1_variant.sol"
	#time2 = test_timeout(file2)
	#print(f"the verification runtime on testfile {file2} without incremental strtegy is {time2}\n")
	#file3 = "./timeout1_variant2.sol"
	#time3 = test_timeout(file3)
	#print(f"the verification runtime on testfile {file3} without incremental strtegy is {time3}\n")
	#file4 = "./timeout1_variant3.sol"
	#time4 = test_timeout(file4)
	#print(f"the verification runtime on testfile {file4} without incremental strtegy or non-linear constraints is {time4}\n")
	#file5 = "./timeout1_variant4.sol"
	#time5 = test_timeout(file5)
	#print(f"the verification runtime on testfile {file5} with only non-linear constraints is {time5}\n")
	#file6 = "./timeout1_variant5.sol"
	#time6 = test_timeout(file6)
	#print(f"the verification runtime on testfile {file6} with only non-linear constraints is {time6}\n")
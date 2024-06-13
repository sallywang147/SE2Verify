import os
import time 
import subprocess
'''
import xlrd
import numpy
import pandas as pd
'''



def timeCheck(filename, filepath):
    if os.path.exists(filepath):
        cmdline = [f"solc {filename}"]
        start = time.time()
        subprocess.run(
            cmdline,   
            shell=True,  
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            universal_newlines=True,
        )
        end = time.time()
        duration = end - start
        print(filename)
        print('takes {:0.2f}s'.format(duration))
        print("=======================================================\n")
        return filename, duration 
 
def culpritCheck(folder):    
    for root, _, files in os.walk(folder):
        for filename in files:
            culprit_conretize_time = 0
            culprit_time = 0 
            filepath = os.path.join(root, filename)
            if "culprit" in filename and "concretize" not in filename: 
                _, culprit_time = timeCheck(filename, filepath)
            if "culprit" in filename and "concretize" in filename: 
                _, culprit_conretize_time = timeCheck(filename, filepath)
            speedup = culprit_time - culprit_conretize_time
            print(f'Connretization speedup for {filename} is {speedup}')
                                
   
def timeoutCheck(folder):    
    for root, _, files in os.walk(folder):
        for filename in files:
            time = 0
            filepath = os.path.join(root, filename)
            if "timeout1" in filename: 
                _, time = timeCheck(filename, filepath)
                print(f'verification time for {filename} is {time}')  

def invCheck(folder):    
    for root, _, files in os.walk(folder):
        for filename in files:
            time = 0
            filepath = os.path.join(root, filename)
            if "inv" in filename: 
                _, time = timeCheck(filename, filepath)
                print(f'verification time for {filename} is {time}')                            
             
def main():
    invCheck("../inc_benchmarks")
        
if __name__ == "__main__":
    main()

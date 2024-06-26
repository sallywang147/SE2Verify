import os
import openai
from openai import OpenAI



def gpt_infer(prompt):
	client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
	chat_completion = client.chat.completions.create(
			messages=[
					{
					"role": "user",
					"content": f"{prompt}",
					}
			],
			model="gpt-4o",
	)
	return chat_completion.choices[0].message.content

def prompt_gen(file):   
        print(file)
        prompt = f"""
	Please identify possible verification proof failure points in the following code: {file}. The common proof failure points 
        are loops and reecursion. 
	Please output verification proof failure points, why you think they cause verification proof failure, and the fixes for the failures. 
	"""
        out =  gpt_infer(prompt)
        outFile = open(f"rust.rawoutput.txt", "w+")
        outFile.write(out)
        print(out)

testFile = open("/home/sallyjunsongwang/SE2Verify/rust_benchmarks/simple.rs", "r")
prompt_gen(testFile.read())
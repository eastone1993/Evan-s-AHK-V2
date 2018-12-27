import string
import os
import subprocess

# Caesar/Shift cipher
def caesar(plaintext, shift):
   alphabet = string.printable
   shifted_alphabet = alphabet[shift:] + alphabet[:shift]
   table = str.maketrans(alphabet, shifted_alphabet)
   return plaintext.translate(table)

def get_key(text):
	x = 1
	k = ['a','e','i','o','u','A','E','I','O','U']
	h = text 
	for entry in h:
		if entry in k:
			x = x+1
	return x 

commonLibrary = list('|ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz .,/<>?1234567890!@$%^&*"#()[]{}+=-')
CLIrev = {y:commonLibrary.index(y) for y in commonLibrary}
'''
f = open('InterCom.txt','r')
text = f.read()
f.close()
'''
text = os.environ.get('INTERCOM')

key = text[len(text)-1]
keyVal = CLIrev[key]*(-1)
dtext = text[:-1]

decypher = caesar(dtext, keyVal)

os.environ['INTERCOM'] = decypher
subprocess.call(["C:\Program Files\AutoHotkey\AutoHotkey.exe", "CypherGUI.ahk"])

'''
k = open('InterCom.txt', 'w')
k.write(decypher)
k.close()
'''



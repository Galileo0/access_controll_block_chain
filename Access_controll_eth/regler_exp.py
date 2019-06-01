import re

# ['Ismaile', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']
# ['Ahmed Zakria', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']
# ['Maged Muhamed', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']
#globals

names=[]
nums=[]
codes=[]
addresses=[]
times=[]
hashh=[]

name = []
phone = []
rf = []
qr_code_ex = []
token = []
resdent_account = []
email = []

def handel_string(string):
    global names; global nums; global codes; global addresses; global times; global hashh
    res = re.findall(r"'([A-Za-z\s]*)'(,|\s)*'([0-9]*)'(,|\s)*'([0-9A-F]*)'(,|\s)*'([A-Za-z0-9\s]*)'(,|\s)*'([0-9\-\s\:\.]*)'(,|\s)*'([0-9a-zA-Z]*)'",string)
    for (name,t,num,t,code,t,add,t,time,t,sh) in res:
        names.append(name)
        nums.append(num)
        codes.append(code)
        addresses.append(add)
        times.append(time)
        hashh.append(sh)


def handel_string2(string):
    global name; global phone; global rf; global qr_code_ex; global token; global resdent_account;global email
    res = re.findall(r"'([A-Za-z\s]*)'(,|\s)*'([0-9]*)'(,|\s)*'([0-9A-F]*)'(,|\s)*'([0-9]*)'(,|\s)*'([0-9a-z]*)'(,|\s)*'([0-9a-zA-Z]*)'(,|\s)*'([0-9a-zA-Z]*)'",string)
    for (name,t,num,t,code,t,add,t,time,t,sh,t,sb) in res:
        name.append(name)
        phone.append(num)
        rf.append(code)
        qr_code_ex.append(add)
        token.append(time)
        resdent_account.append(sh)
        email.append(sb)


handel_string("['Ismaile', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']")
handel_string("['Ahmed Zakria', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']")
handel_string("['Maged Muhamed', '0155223179', '731B862E', 'street 33', '2019-04-08 18:03:38.769812', '0xfF3956EcD80F3aBd1D46e6F88C4c664A059AeC01']")

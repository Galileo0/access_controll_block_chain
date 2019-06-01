private_key = b"\xb2\\}\xb3\x1f\xee\xd9\x12''\xbf\t9\xdcv\x9a\x96VK-\xe4\xc4rm\x03[6\xec\xf1\xe5\xb3d

0x08631dbb0aafe510b731d6ac83fcedac77d714172fd6e77cd991255275ff8896
pp = web3.eth.account.privateKeyToAccount(private_key)
pp.address
pp.privateKey

https://cryptography.io/en/latest/hazmat/primitives/asymmetric/rsa/

from OpenSSL import crypto
k = crypto.PKey()
k.generate_key(crypto.TYPE_RSA, 4096)
print crypto.dump_privatekey(crypto.FILETYPE_PEM, k)
print crypto.dump_privatekey(crypto.FILETYPE_PEM, k)
print crypto.dump_publickey(crypto.FILETYPE_PEM, k)






import random
bits = random.getrandbits(256)
bits_hex = hex(bits)

import secrets
bits = secrets.randbits(256)

bits_hex = hex(bits)
private_key = bits_hex[2:]

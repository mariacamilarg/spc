import numpy as np
import matplotlib.pyplot as plt

muestreo = [32,33,35,30,30,34,32,31,33,35,32,31,33,32,27,35,33,24,36,35,32,33,
            29,36,32,33,32,34,33,37,35,34,33,30,34,31,34,33,32,35,32,36,34,30,
            33,31,36,34,31,31,34,36,35]
muestreo = np.array(muestreo)

p = np.mean(muestreo)
s = np.std(muestreo)
m = np.median(muestreo)

print(p,s,m)
print(np.min(muestreo), np.max(muestreo))

plt.Figure()
plt.hist(muestreo, bins=15, alpha=0.7, color='c')
plt.axvline(30, color='r')
plt.axvline(38, color='r')
plt.axvline(p, label='Promedio', color='b')
plt.axvline(p+s, label='Especificación', linestyle='--', color='b')
plt.axvline(p-s, linestyle='--', color='b')
plt.axvline(m, label='Mediana', color='g')
plt.legend()
plt.savefig('1.png', bbox_inches='tight')

from youtube import get_text
from translate import get_tarjima

url = 'aSMEcAmcPDc'

matn1 = get_tarjima(get_text(url))
print(matn1)
fayl = open("kdab11.txt", 'w')
fayl.write('')
# fayl.close()

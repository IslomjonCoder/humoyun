from googletrans import Translator
from youtube import get_text

# def get_tarjima(matn):
#     translator = Translator()
#     tarjima = translator.translate(matn,dest='uz').text
#
#     return tarjima

if __name__ == '__main__':
    matn = get_text('https://youtu.be/-VDXBHLU8q4')
    print(len(matn))
    tarjima = Translator().translate(matn,dest='uz')
    print(tarjima.text)
from googletrans import Translator

def get_tarjima(matn):
    translator = Translator()
    tarjima =  translator.translate(matn,dest='uz').text

    return tarjima

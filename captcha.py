import random
import string

def generate_captcha():
    # Генерируем случайные символы
    captcha_text = ''.join(random.choices(string.ascii_letters + string.digits, k=4))
    return captcha_text
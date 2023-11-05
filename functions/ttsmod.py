'''
README:
Use any TTS module to make text into speech, maybe with quality selector (Low, Med, High).
Return an (wav) audio file path.
'''
import os

def speech(text: str, quality: str):
    filename = "test.wav"
    fileloc = os.path.join(os.getcwd(), filename)
    return fileloc
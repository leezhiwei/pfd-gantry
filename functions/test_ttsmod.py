from ttsmod import *
import speech_recognition
import pytest

def test_speak():
    r = speech_recognition.Recognizer()
    text = "Hello Name you are currently late you are supposed to start work at 9:15 a.m."
    wavfile = speech(text, "high")
    with speech_recognition.AudioFile(wavfile) as source:
        audio = r.record(source)
    try:
        identify = r.recognize_google(audio)
        assert identify == text.lower()
    except Exception as e:
        pytest.fail(e)
    
    
"""
README:
Use any TTS module to make text into speech, maybe with quality selector (Low, Med, High).
making it a set quality. (high)
Return an (wav) audio file path.
pip install pydub
pip install python-ffmpeg
if it doesnt work try restarting (LOL)
"""
import os
from gtts import gTTS
from pydub import AudioSegment


def speech(text: str):
    filename = "test.wav"
    fileloc = os.path.join(os.getcwd(), filename)

    spokenText = text
    language = "en"
    myobj = gTTS(text=spokenText, lang=language, slow=False)

    tempfileloc = os.path.join(os.getcwd(), "file.mp3")

    myobj.save(tempfileloc)

    # audio_file = os.path.dirname(__file__) + '\\file.mp3'

    src = tempfileloc
    dst = fileloc

    sound = AudioSegment.from_mp3(src)
    fileloc = sound.export(dst, format="wav")

    # os.remove("file.mp3")

    return fileloc

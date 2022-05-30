from youtube_transcript_api import YouTubeTranscriptApi
from youtube_transcript_api import Transcript


def get_text(url):
    transcript = YouTubeTranscriptApi.get_transcript(url)
    text = ''
    for i in transcript:
        text += i['text'].replace('\n', ' ') + ' '
    return text

from youtube_transcript_api import YouTubeTranscriptApi



def get_text(url):
    url = url.split('/')[-1]
    transcript = YouTubeTranscriptApi.get_transcript(url)
    text = ''
    for i in transcript:
        text += i['text'].replace('\n', ' ') + ' '

    return text

if __name__ == '__main__':
    get_text('https://youtu.be/LK4b_Lwg5no')
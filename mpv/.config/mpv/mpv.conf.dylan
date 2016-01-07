# Dylan's mpv config

# Video Settings
vo=opengl-hq:scale=ewa_lanczossharp:cscale=ewa_lanczossoft:scale-antiring=0.8:cscale-antiring=0.9

video-sync=display-resample
hwdec=no

# Audio Settings
audio-channels=2
softvol=yes
softvol-max=200

# Other Settings
keepaspect-window
keep-open
ytdl=yes
osc=no

# Subtitles
no-embeddedfonts
ass-force-style=FontName=Panefresco 800wt,Default.Bold=0
ass-style-override=force
ass-force-style=Kerning=yes
ass-scale-with-window=yes
sub-scale-with-window=no
sub-use-margins=no
sub-text-border-color="#FF141E25"
sub-text-border-size=2
sub-text-color="#FFFFFFFF"
sub-text-bold=no
sub-text-font="Roboto"
sub-text-font-size=50
sub-text-shadow-color="#FF141E25"
sub-text-shadow-offset=2
sub-text-blur=0
sub-codepage=utf8:cp1250

# Default sub lang
# slang=pl
# slang=eng,en
# alang=jpn,jp,eng,en

[extension.webm]
loop-file=yes

[extension.gifv]
loop-file=yes

[extension.gif]
loop-file=inf

# convert-to-emoji

## Initial Notes

### Motivation:

I like writing things in the base markdown and slack/discord style where you can grab the item directly from the code instead of searching for them from a direct emoji maker.

Problem is, half the time those items dont directly copy or show up as pure text even in .mdx files.

### Goal:

Create github action that converts any items that follow the format :descr: to an actual visual emoji version of the text.

### Limitations:

Dont want to use an extensive database here, so this will be limited by how many emojis there are out there that are easily grab-able (not grabbing all of emojipedia for ex).<br/>
Starting solely with the github specific ones and then adding more as time goes on.

:warning: This means though, that I do need to add a warning or error on the action that if it runs and finds something that could count as an emoji, but doesnt have it on record, it still notifies the user instead of erroring silently.

## Steps



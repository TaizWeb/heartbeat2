# Heartbeat 2
> Electric Boogaloo

This is a new version of [Heartbeat](https://youtu.be/Ym5ngGWsPkg?&t=90) with the intent to do things **right** this time. Notably, modularizing the entire thing and writing far more cleaner code in the process. This will definitely introduce breaking changes (did you notice I spelt "behavior" wrong [THE ENTIRE TIME](https://github.com/TaizWeb/heartbeat/blob/master/src/lib/heartbeat.lua#L132C1-L132C13)?) as many of the core functions will be rewritten in a more OOP-centric fashion.

## Motivation (such an aggravation)
I've been itching to make a smaller game instead of focusing on my major project. The major project's development caused us to rewrite a bunch of the original Heartbeat and even consider dumping it entirely and just copy/pasting whatever functionality we needed. Also, Heartbeat was made 4(!) years ago now, and I've grown quite a bit as a programmer since. As a result, I'd like to do things "right" this time and actually think the architecture through, and add some new features along the way. The initial release of Heartbeat was created by ripping out a bunch of code from an old game I made since I realized I'd practically written a game engine, so hopefully by putting the engine _first_ it'll be far easier to use for future projects.

## Timeline??
Nope! I'm still spending my spare-time on the big project, and we've had enough delays to rewrite it to use this instead of the old Heartbeat. This is purely a passion project to see if I can write a better engine than I did in 2020.

## Why Not Fix Old Heartbeat?
It would take far longer to fix it than it would to make an entirely new one. Also there's a few people actually using Heartbeat to make games and I don't want to ruffle any feathers. I could just make another branch but:
1. That would get messy with version control (who gets master?)
2. Since it's an entirely _new_ codebase, I see no reason to branch off the old Heartbeat
3. I thought making the official subtitle "Electric Boogaloo" was too funny to pass up

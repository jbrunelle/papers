LaTeX2e Template for iPRES Conference Proceedings!
--------------------------------------------------
Last modified: Feb 4, 2015 by K.W.

INTRO
=====
Welcome! In this package, you'll find all the files you need to get started with
the correct LaTeX layout for iPRES. This package was last modified for:

iPRES 2015

This package was put together in response to community requests for a
modified version of the "Strict Adherence to SIGS Style" LaTeX2e template that
matches the Word template typically used for iPRES.

BUILDING
========
Run in the following order:

latex ipresproc-sp.tex
bibtex ipresproc-sp
latex ipresproc-sp.tex
latex ipresproc-sp.tex

This should produce a .dvi file that you may then convert to .ps or .pdf.
A sample .pdf rendition of the template is included in this package so
you can see what it looks like.

Notes on LaTeX packages: This is basically the ACM SIGS template, but also expects
you to have the following packages installed:
- flushend (to balance final columns properly)
- hyperref (for hyperlinks)
- url (for url handling)
- breakurl (allow urls to be line-broken)

Most full tex distributions should already have these in place.

MAINTENANCE
===========
This package does not have a maintainer! If you, dear future reader, find a 
problem with the template or style file, or have a useful addition to make,
you should create a new .tar.gz file containing:

- At least the files in this directory
- Any modifications to the .cls file prefaced with "% Patched for iPRES"
- Any prose notes on changes at the bottom of this README under "Recent Changes"
- An updated "Last modified" line at the top

and submit it to the appropriate iPRES organizers for your particular year.

WHY WE DID THIS
===============
The ACM strict SIGS template doesn't *quite* match what iPRES has expected for
final proceedings in the past. The iPRES proceedings need a modified copyright
block, slightly different spacing, and a few other additions. In general, though,
it's essentially the SIGS strict template and style system.

RECENT CHANGES
==============
2/4/2015
- Added copyright block (global boilerplate)
- Added flushend, hyperref, url, breakurl packages
- Simplified tex file to match word template
- Fixed spacing between final text and footnotes



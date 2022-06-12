# Thesis-Makefile – Curated Makefile with best practices, conventions, and tips
# for writing LaTeX theses.
# 
# Latest version available at https://github.com/fnogatz/Thesis-Makefile
# 
# ------------------------------------------------------------------------------
# 
# MIT License
#
# Copyright (c) 2021 Falco Nogatz <fnogatz@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

SOURCES ?= content # set to path of LaTeX files
ENGLISH ?= american # or british


# Targets

all: test

test: writing latex

writing: writing.$(ENGLISH) writing.common-mistakes writing.consistency writing.use-commands

writing.consistency: # State things that you want to ensure to be consistent across the whole document
	# --- Consistent writing ---
	# Use `Unicode` with capital letter
	@! grep -R --include=*.tex ' unicode'
	# Use `MIT License` instead of `MIT license`
	@! grep -R --include=*.tex 'MIT license' $(SOURCES)
	# Use `Node.js` instead of `node.js`
	@! grep -R --include=*.tex 'node.js' $(SOURCES)
	# Use `cannot` instead of `can not`
	@! grep -Ri --include=*.tex 'can not' $(SOURCES)
	# Use `ll.~A--Z` instead of `l.~A--Z`
	@! grep -R --include=*.tex -E '[^l]l\.~[0-9]+\-\-[0-9]+' $(SOURCES)
	# Use tilde in `ll.~1--3`
	@! grep -R --include=*.tex -E '[^l]l\. [0-9]' $(SOURCES)
	@# ... add more on your own!

writing.british:
	# --- British English ---
	# Use `focusse[sd]` instead of `focuse[sd]`
	@! grep -Ri --include=*.tex 'focuse[sd]' $(SOURCES)
	# Use `modelled` instead of `modeled`
	@! grep -Ri --include=*.tex 'modeled' $(SOURCES)
	# Use `behaviour` instead of `behavior`
	@! grep -Ri --include=*.tex 'behavior' $(SOURCES)
	# Use `favour` instead of `favor`
	@! grep -Ri --include=*.tex 'favor' $(SOURCES)
	# Use `flavour` instead of `flavor`
	@! grep -Ri --include=*.tex 'flavor' $(SOURCES)
	# Use `honour` instead of `honor`
	@! grep -Ri --include=*.tex 'honor' $(SOURCES)
	# Use suffix `isation` instead of `ization`
	@! grep -Ri --include=*.tex 'ization' $(SOURCES)
	# Use `colour` instead of `color` (but allow command `\color` if set anywhere)
	@! grep -Ri --include=*.tex ' color' $(SOURCES)
	# Use `organised` etc. instead of `organized`
	@! grep -Ri --include=*.tex 'organiz[ae]' $(SOURCES)
	# Use `the other way round` instead of `the other way around`
	@! grep -Ri --include=*.tex 'the other way around' $(SOURCES)

writing.american:
	# --- American English ---
	# Use `focuse[sd]` instead of `focusse[sd]`
	@! grep -Ri --include=*.tex 'focusse[sd]' $(SOURCES)
	# Use `modeled` instead of `modelled`
	@! grep -Ri --include=*.tex 'modelled' $(SOURCES)
	# Use `behavior` instead of `behaviour`
	@! grep -Ri --include=*.tex 'behaviour' $(SOURCES)
	# Use `favor` instead of `favour`
	@! grep -Ri --include=*.tex 'favour' $(SOURCES)
	# Use `flavor` instead of `flavour`
	@! grep -Ri --include=*.tex 'flavour' $(SOURCES)
	# Use `honor` instead of `honour`
	@! grep -Ri --include=*.tex 'honour' $(SOURCES)
	# Use suffix `ization` instead of `isation`
	@! grep -Ri --include=*.tex 'isation' $(SOURCES)
	# Use `color` instead of `colour` (but allow command `\colour` if set anywhere)
	@! grep -Ri --include=*.tex ' colour' $(SOURCES)
	# Use `organized` etc. instead of `organised`
	@! grep -Ri --include=*.tex 'organis[ae]' $(SOURCES)
	# Use `the other way around` instead of `the other way round`
	@! grep -Ri --include=*.tex 'the other way round' $(SOURCES)

writing.common-mistakes:
	# --- Avoid common mistakes ---
	# Avoid duplicate words
	@! grep -Ri --include=*.tex -E '(\b[a-zA-Z]+) \1\b ' $(SOURCES)
	# Do not put punctuation mark after `\eg` etc.
	@! grep -Ri --include=*.tex -E '\\[Ee]g[\.,:]' $(SOURCES)
	@! grep -Ri --include=*.tex -E '\\[Ii]e[\.,:]' $(SOURCES)
	# Do not put tilde in front of `\cref`
	@! grep -Ri --include=*.tex '~\\cref' $(SOURCES)
	# Do not put blanks in front of or after tilde
	@! grep -Ri --include=*.tex '~ ' $(SOURCES)
	@! grep -Ri --include=*.tex ' ~' $(SOURCES)
	# Put tilde after `resp.`
	@! grep -Ri --include=*.tex ' resp. ' $(SOURCES)
	# Use `object-oriented` instead of `object oriented`
	@! grep -Ri --include=*.tex 'object oriented' $(SOURCES)
	# Use `readability` instead of `readibility`
	@! grep -Ri --include=*.tex 'readibility' $(SOURCES)
	# Use `web-based` instead of `web based` and `web--based`
	@! grep -Ri --include=*.tex -E 'web( |--)based' $(SOURCES)
	# Use `well-known` instead of `well known` and `well--known`
	@! grep -Ri --include=*.tex -E 'well( |--)known' $(SOURCES)
	# Use `interceptor` instead of `intercepter`
	@! grep -Ri --include=*.tex 'intercepter' $(SOURCES)
	# Use `a means` instead of `a mean`
	@! grep -Ri --include=*.tex -E ' (a|the) mean ' $(SOURCES)
	# Use `so-called` instead of `so called`
	@! grep -Ri --include=*.tex -E ' so ?called' $(SOURCES)
	# Use `can be built` instead of `can be build`
	@! grep -Ri --include=*.tex -E '(be|is|are) build ' $(SOURCES)

writing.use-commands: # when defining new commands make sure to use them on all occasions
	# Use `\ie` instead of `i.e.`
	# @! grep -Ri --include=*.tex 'i\.e\.' $(SOURCES)

latex:
	# --- Consistent LaTeX styling ---
	# Put `\item` on separate line
	@! grep -Ri --include=*.tex '\\item ' $(SOURCES)
	# Put `\footnote{%` and `\footnotetext{%` on separate line and use `%`
	@! grep -Ri --include=*.tex -E '\\footnote{([^%]|$$)' $(SOURCES)
	@! grep -Ri --include=*.tex -E '\\footnotetext{([^%]|$$)' $(SOURCES)
	# Use `\cref` instead of `\ref` (except `\ref{ftn:})` to explicitly reference a footnote
	@! grep -Ri --include=*.tex -P '\\ref{(?!ftn).' $(SOURCES)
	# Use `--,` instead of `--~,`
	@! grep -Ri --include=*.tex -E '\-\-[~ ],' $(SOURCES)
	# Use `$\mathcal{O}(...)$` instead of `O(...)` for big O notation (landau notation)
	@! grep -R --include=*.tex '$$.*O(' $(SOURCES)
	# Put all options of `\lstinputlisting` and `\lstlisting` in a single line
	@! grep -Ri --include=*.tex -E '\(cf)?lst(input)?listing\[$$' $(SOURCES)
	# All `\lstinputlisting` and `\lstlisting` should have option `language=` set
	@! (grep -Ri --include=*.tex -E '(\\(cf)?lst(input?)listing|\\begin\{lstlisting\})' $(SOURCES) | grep -iv 'language=')
	# Start each sentence on a separate line
	@! grep -R --include=*.tex -R -E '^[^%]*\. [A-Z]' $(SOURCES)
	# Avoid ` ~`
	@! grep -Ri --include=*.tex ' ~' $(SOURCES)
	# Avoid `~ `
	@! grep -Ri --include=*.tex '~ ' $(SOURCES)
	# Avoid trailing spaces
	@! grep -R --include=*.tex -E ' $$' $(SOURCES)
	# Avoid trailing tabs
	@! grep -R --include=*.tex -P '\t$$' $(SOURCES)
	# Use `~--` instead of ` --`
	@! grep -R --include=*.tex -E ' --[^>]' $(SOURCES)
	# Use tilde in beginning of sentence `A~...` to avoid line breaks in-between
	@! grep -R --include=*.tex -E '^A ' $(SOURCES)
	# Use tilde in `a~...` after comma and colon to avoid line breaks in-between
	@! grep -R --include=*.tex -E '[,:] a ' $(SOURCES)

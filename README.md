# Thesis Makefile

Curated Makefile with best practices, conventions, and tips for writing LaTeX theses. This is a single GNU Makefile that checks for common mistakes and enforces consistent source code. It only depends on standard Unix utilities that are likely to exist on any system. Just drop it in your source directory, change the settings in the Makefile's header, and run `make test`.

## Usage

To use this Makefile as a template in your own project, just place a copy in your project's root directory and modify the `SOURCES` setting in the Makefile's header. Then, the test can be called via `make test`.

Alternatively, it is possible to specify the location of the LaTeX source code files with the `SOURCES` environment variable:

```sh
make test SOURCES=/path/to/your/latex
```

The output reads as a recipe of what to pay attention to when writing your document. In case some rules fail, it states the corresponding lines as returned from `grep`.

Here's an example output that fails because of the duplicated `are` in the file `background.tex`:

```sh
make test SOURCES=/tmp/thesis ENGLISH=british
# --- British English ---
# Use `focusse[sd]` instead of `focuse[sd]`
# Use `modelled` instead of `modeled`
# Use `behaviour` instead of `behavior`
# Use `favour` instead of `favor`
# Use `flavour` instead of `flavor`
# Use `honour` instead of `honor`
# Use `colour` instead of `color` (but allow command `\color` if set anywhere)
# Use `organised` etc. instead of `organized`
# Use `the other way round` instead of `the other way around`
# --- Avoid common mistakes ---
# Do not put tilde in front of `\cref`
# Do not put blanks in front of or after tilde
# Avoid duplicate words
/tmp/thesis/background.tex:This chapter introduces some important terms and concepts which are are relevant to this thesis.
make: *** [Makefile:106: writing.common-mistakes] Error 1
```

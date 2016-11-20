# vim-tagbar-ctags-elm

Support for [Elm](http://elm-lang.org/) in [Vim Tagbar](https://majutsushi.github.io/tagbar/) with [Universal Ctags](https://ctags.io/) (doesn't work with Exuberant Ctags or any earlier stuff)

![elm-tagbar-ctags](img/elm-tagbar-ctags.png)		

## Features


- Universal Ctags options for Elm supporting:
  - [x] type definitions 

  - [x] type aliases

  - [x] functions

  - [x] nested functions

        **Note**: Uses the [scope tracking](http://docs.ctags.io/en/latest/optlib.html#scope-tracking-in-a-regex-parser) features of Universal Ctags, so won't work with Exuberant Ctags. IF you want to use Exuberant Ctags, you need [ctags-elm](https://github.com/kbsymanz/ctags-elm).

  - [x] ports 

  - [x] imports

- Vim Tagbar extension for these tag kinds.


## Install

It's a Pathogen-friendly Vim plugin. Install it with a package manager. 

## Bugs and limitations

* Only top level function definitions (with no white space before the function name) define scopes for nesting. E.g. in the screen shot above the `_` binding is defined in a let expression in one of the cases further down in the `updateField` function.

* Doesn't distinguish functions by airity. 

* can't  (yet) parse constructors in argument lists, hence this doesn't show up as a function:
      renderResult ( n, r ) = ...

* We don't set the modules as a scope, becase it's _hard_ to parse significant whitespace with regular expressions. We don't know when functions end (to pop the scope) so instead we _set_ the scope at each new top level function. If the module were a containing scope, the first top level function would clear it out.

## Relationship to other projects

This is an experimental project; when it's a bit more mature, and Universal Ctags a bit more common it will probably end up as one or more of the following: 

* an entry on the [Tagbar Wiki](https://github.com/majutsushi/tagbar/wiki)

* a Universal Ctags [optlib](http://docs.ctags.io/en/latest/optlib.html) 

* merged into [ctags-elm](https://github.com/kbsymanz/ctags-elm)

  Ctags-elm got me started (thanks Kurt!). It works with Exuberant Ctags, but doesn't support scoped tags.

- a pull request to [elm-vim](https://github.com/ElmCast/elm-vim) 

  Elm-vim already provides tagbar support for ctags-elm. In order for this project to live nicely alongside that we overwrite `g:tagbar_type_elm`. (There might be a more polite way of going about this?)

Thanks to the excellent [regular expressions 101](https://regex101.com/) for helping me figure out how to match and capture what I needed. And to the excellent work of Universal Ctags.
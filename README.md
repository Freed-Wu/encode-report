encode-report
=============

A backup of my homework.

Dependent
---------

1.  A LaTex distribution. Such as [texlive].
2.  A dot distribution. Such as [graphviz].
3.  [njustthesis].

Install
-------

``` {.zsh}
git clone git@github.com:Freed-Wu/encode-report
cd encode-report
dot -Tpdf fig/*.dot
latexmk -pvc main.tex
```

Q & A
-----

More question see [Issues].

If you don't wanna complie, you can download the complied paper from
[Release]

  [texlive]: https://github.com/TeX-Live/texlive-source
  [graphviz]: https://gitlab.com/graphviz/graphviz
  [njustthesis]: https://github.com/Freed-Wu/njustthesis
  [Issues]: https://github.com/Freed-Wu/encode-report/issues
  [Release]: https://github.com/Freed-Wu/encode-report/releases/

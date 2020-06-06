encode-report
=============

A backup of my homework.

内容：编程实现任一种无损编码方式。
1.  实现语言不限；
2.  读取 txt 文件中的英文字符；
3.  输出每个字符的编码；
4.  文件名：选课序号 + 姓名

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

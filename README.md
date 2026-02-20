# TUM PhD Dissertation Template
This is an **unofficial** LaTeX template for TUM PhD dissertation.
Considering that TUM graduation school only has a template for the title page, this template is basically a combination of a latex version of the official [docx title page template](https://collab.dvb.bayern/download/attachments/69917104/20240419_Titelblatt.docx) provided by TUM graduation school and a very nice [PhD dissertation template for University of Malta by Prof. Jean-Paul Ebejer](https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template)

# Usage
**ONLY** lulaTeX is supported for compilation due to the font requirements of the official TUM template.
## Whole Template
If you compile the template locally, you could simply use `latexmk -lualatex` in the directory of `dissertation_main` to compile the whole template. If you are using a LaTeX editor or online editor, make sure to set the compiler to LuaLaTeX. You may also need to set the default bibliography tool to `Biber` in your editor settings (Check the [README file of the original template](https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template/blob/main/README.md)).

## Title Page Alone
If you only want to use the title page template, you can simply copy the `title_page/de_standalone.tex` and fill in your information. You also need to copy the `images/tum.pdf` for the TUM logo. Then, you can compile the `de_standalone.tex` file using LuaLaTeX to generate the PDF of your dissertation title page.

# FAQ
## Compared to the original template, what are the main changes?

The template is based on [v2.8 version](https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template/tree/2a1612337f28fd79da3fa41256985c1f5db891f0) of the original template. Compared with the original template, we remove the font setting of `\setmonofont{Consolas}` to ensure that the template can be compiled without installing the `Consolas` font (usually only available on Windows). Meanwhile, we also change the main theme color to a dark version of TUM blue (from the title bar of TUM website). You can set your own color in `tum_phd.cls` by modifying the below line:
```latex
\definecolor{TUMBlue}{rgb}{0.027, 0.129, 0.251}   % TUM Logo Color
\colorlet{DissertationColor}{TUMBlue}  
```

## Where is the English title page template?
As far as we know, although an English title page template is available the graduation school website, it is not officially supported for submission. Therefore, we only provide the German title page template. If you want to use the English title page template, you can simply modify the `de_standalone.tex` file by changing the text to English and filling in your information. 
---
title: "Kolik plochy mají k dispozici obyvatelé obcí ČR"
author: "Marek Prokop"
date: "6 3 2021"
output: 
  html_document: 
    keep_md: yes
    df_print: paged
---



# Závisí počet obyvatel na rozloze obce?

Bylo by fajn, kdyby závisel -- hodně obyvatel by mělo k dispozici velkou plochu a málo obyvatel malou. Je tomu tak?

Podle tohoto grafu počet obyvatel s rozlohou obce stoupá, jenže to vypadá, že to hodně ovlivňuje pár obcí s největším počtem obyvatel.

![](report_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

Když odfiltruju obce nad 500 tisíc obyvatel (čili Prahu), vapdá to takhle:

![](report_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

Z toho je mj. vidět, že většina obcí má do 50 tisíc obyvatel a do 100 km² rozlohy. Tak to takhle vyfiltruju a dostanu:

![](report_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

Jo, to už je asi pro většinu obcí (ne nutně pro většinu obyvatel) realističtější obrázek.

# Hustota obyvatelstva v obcích

Kolik obyvatel připadá na jeden kilometr čtvereční nebo kolik plochy má k dispozce jeden obyvatel. To je ta zásadní otázka.

A odpověď nevypadá tak špatně. Ve většině obcí připadá na kilometr čtvereční maximálně 200 obyvatel a ve většině z té většiny dokonce jen maximálně 100 obyvatel.

![](report_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

# Top 10 poražených

Ve kterých obcích je nejvíc obyvatel na kilometr čtvereční? Jsou to tyhle:

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["nazev_obce"],"name":[1],"type":["chr"],"align":["left"]},{"label":["pocet_obyvatel"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["rozloha"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["hustota"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"Praha","2":"1324277","3":"496.255783","4":"2668.537"},{"1":"Havířov","2":"71200","3":"32.073004","4":"2219.936"},{"1":"Zastávka","2":"2573","3":"1.194105","4":"2154.752"},{"1":"Teplice","2":"49731","3":"23.782526","4":"2091.073"},{"1":"Kladno","2":"69337","3":"36.971055","4":"1875.440"},{"1":"Dobrá Voda u Českých Budějovic","2":"2662","3":"1.548119","4":"1719.506"},{"1":"České Budějovice","2":"94463","3":"55.723313","4":"1695.215"},{"1":"Chomutov","2":"48635","3":"29.261253","4":"1662.096"},{"1":"Brno","2":"381346","3":"230.229581","4":"1656.373"},{"1":"Mladá Boleslav","2":"44740","3":"28.912824","4":"1547.410"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

# Top 10 vítězů

A kde jsou na tom nejlépe a mají nejvíc místa na obyvatele? Šumava ftw!

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["nazev_obce"],"name":[1],"type":["chr"],"align":["left"]},{"label":["pocet_obyvatel"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["rozloha"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["hustota"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"Modrava","2":"78","3":"81.62060","4":"0.9556411"},{"1":"Prášily","2":"154","3":"112.31811","4":"1.3711057"},{"1":"Stožec","2":"205","3":"104.69638","4":"1.9580429"},{"1":"Horská Kvilda","2":"60","3":"29.85166","4":"2.0099383"},{"1":"Kryštofovy Hamry","2":"150","3":"68.44834","4":"2.1914338"},{"1":"Přebuz","2":"73","3":"29.76907","4":"2.4522095"},{"1":"Přední Výtoň","2":"219","3":"77.81487","4":"2.8143722"},{"1":"Pohorská Ves","2":"239","3":"81.26135","4":"2.9411275"},{"1":"Český Jiřetín","2":"99","3":"33.64247","4":"2.9427090"},{"1":"Kvilda","2":"139","3":"45.20961","4":"3.0745675"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


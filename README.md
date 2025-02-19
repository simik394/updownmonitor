

> [!vision] projekt s cílem 
> vozit se po ups a downs primárně u kryptoměn.

> [!naj] X
> jako investiční nástroj, 

> [!jej] ✅
> Efektivní alokaci odložených peněz.


# Featury:
- Identifikovat
	- období kdy se nevyplatí vstupovat do pozic. 
	- bear / Bull market? 
	- na vrcholu? 
	- v pohybu? 
	- před zásadní změnou? 
	- 
# Jak?
Základem je báze znalostí s jejíž pomocí budou zodpovídány výše uvedené otázky. Báze bude tvořena grafovou databází (Neo4j). Uloženy v ní budou historické segmenty chování vybraných párů (vývoje ceny, hloubky trhu, konkrétní obchody). Segmenty budou vytvořeny z historického chování na několika "úrovních" (podle doby kterou bude segment reprezentovat. tzn. nejnižší úroveň bude mít segmenty zahrnujíce nejvýše několik vteřin a nejvyšší segmenty klidně po několika týdnech). Vyšší úrovně přitom budou obsahovat pouze "zjednodušený" pohled na skutečný průběh, s jejich pomocí bude možné identifikovat segmenty nižších úrovní, které se vyskytují pouze během určité situace (kontextu). Aby byla taková identifikace a další možnosti umožněny, v bázi budou pomocí hran mezi jednotlivými vrcholy(segmenty) reprezentováno pořadí v jakém se ve skutečnosti vyskytly, díky tomu by mělo být možné odhalit typické či vyloženě opakující se sekvence nízkoúrovňových segmentů. Navíc v rámci cashování výsledků je možné pomočí hran zaznamenávat podobnosti mezi různými segmenty.
Taková báze nejen že sama o sobě umožní zodpovídat výše uvedené otázky, nýbrž rovněž umožní snadnou přípravu trénovacích i testovacích dat pro NN modely jenž jsou zamýšleny jako klíčový prvek pro predikování vývoje i pro samotné rozhodování o otevřených pozicích.
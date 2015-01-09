# Annotieren von Korpora
Ein Sprachkorpus ist eine Sammlung linguistischer Einheiten. Es existieren verschiedene Arten von Korpora. Beispiele sind Korpora bestehend aus Wörtern, Sätzen oder Dokumenten. Auch hier können noch weitere Unterscheidungen hinsichtlich der Textsorte getroffen werden. Um die Arbeit an Textkorpora zu erleichtern, ist es hilfreich, diese auf verschiedenen Ebenen zu segmentieren und zu annotieren. Es hat sich bewährt, Korpora in Sätze zu unterteilen und die Satzbestandteile bezüglich ihrer grammatikalischen Funktion zu annotieren.

In der vorliegenden Arbeit verwende ich hierfür POS-Tagging mit morphosyntaktischen Informationen. Als Sprachen habe ich Deutsch und Polnisch gewählt, da beide unterschiedlichen Sprachfamilien angehören und sich demnach grundsätzlich in Morphologie, Syntax und Grammatik unterscheiden. Darüber hinaus zeichnen sich beide Sprachen durch eine Vielzahl an Forschungsprojekten aus, sodass die Verfügbarkeit von Korpora, Modellen und Taggern sichergestellt ist.

Dieses Kapitel definiert allgemeine Begriffe und CLIR-Methoden für die Arbeit mit Korpora. Anschließend wird für beide Sprachen der aktuelle Forschungsstand untersucht und beschrieben, welche Tagger im Rahmen der Arbeit benutzt werden.

## Definitionen
### Token
Ein Token ist eine Namenseinheit, eine Abkürzung, ein Satzzeichen oder ein Wort, und zeichnet sich durch folgende Eigenschaften aus:

ID
  ~ Position des Wortes im Satz

Orthographische Wortform
  ~ Konjugierte/deklinierte Form eines Worts, wie sie im Satz vorkommt

Lemma
  ~ Grundform des Worts

Wortart (*engl.:* part of speech, *kurz:* POS)
  ~ Bsp.: Nomen, Verb, Adjektiv, etc.

Attribute
  ~ Grammatikalische Eigenschaften des Worts, wie Fall und Person. Repräsentiert durch eine Abbildung von Schlüsseln auf Werte.

### Tag
Das *morphosyntaktische Tag* eines Tokens setzt sich aus der Wortart und den Attributen zusammen. Das *POS-Tag* hingegen beinhaltet lediglich die Wortart.

### Tagset
Die Gesamtheit aller Tags bezeichnet man als *Tagset*. Aufgrund grammatikalischer Unterschiede werden für jede Sprache separate Tagsets definiert. Auch in Abhängigkeit von Korpora können unterschiedliche Tagsets verwendet werden.

Das Tagset hat zum Ziel, die möglichen Lesarten eines Satzes einzuschränken. Insbesondere, wenn die Bedeutung von Wörtern überladen ist, können die Tag-Informationen eine bessere Unterscheidung begünstigen. Im Kapitel [[Semantik von Adpositionen]] wird demonstriert, wie Attribute zur Disambiguierung verwendet werden können.

Im Deutschen kommt meistens das Stuttgart-Tübingen-Tagset (STTS) zum Einsatz.

@prz:wol:03ap zeigen, welche Herausforderungen beim Tagging von Attributen im Polnischen entstehen, und welche Eigenschaften ein Tagset erfüllen sollte. Im Polnischen wird das Tagset vom *IPI PAN*^[Institut der Grundlagen der Informatik der *PAN* (Polnische Akademie der Wissenschaften); *poln.:* Instytut Podstaw Informatyki PAN] oder eine Abwandlung von diesem verwendet [@prz:etal:11:ed].

### Tagging
Der Prozess des Taggings ist notwendig, da Wörter oft kontextuell mehrdeutig sind. Durch die Zuweisung von Tags werden bei der Weiterverarbeitung die potentiellen Interpretationen (Lesarten) signifikant eingeschränkt.

Man unterscheidet zwischen zwei Arten von Tagging: POS-Tagging und morphosyntaktischem Tagging. Während sich ersteres nur auf POS-Tags beschränkt, werden beim morphosyntaktischem Tagging ebenfalls Lemmata und morphosyntaktische Attribute abgeleitet. Für morphologisch reiche Sprachen lassen sich wertvolle Informationen aus den Attributen gewinnen. Gleichzeitig wird das Tagging erschwert, was sich durch eine geringere Präzision ausdrückt.

Morphosyntaktisches Tagging besteht aus zwei Phasen [@radziszewski12]:

1. **Morphologische Analyse:** eine Menge aller möglichen Tags für jedes Lexem ableiten
2. **Morphosyntaktische Disambiguierung:** für jedes Lexem ein Tag gemäß des aktuellen Kontexts wählen

Przepiórkowski behauptet, dass Tagger die besten Ergebnisse auf Plain-Text als Eingabe erzielen und solche Ansätze, in denen Tagger entweder Tokens oder Disambiguierungen als Eingabe akzeptieren, vermieden werden sollen. Darüber hinaus schlägt er folgende Bewertungsstrategien von Taggern vor:

1. Es soll *ten-fold cross-validation* für ein manuell annotiertes Korpus (Gold-Standard) durchgeführt werden. Das Korpus wird auf Basis von Paragraphen unterteilt, um kontextuelle Informationen zu berücksichtigen, welche sich über Satzgrenzen erstrecken.
2. Die *lower bound accuracy* ist ein Maß, um Abweichungen bei der Segmentierung zu bestrafen. Der Wert entspricht dem Anteil der Tokens im Gold-Standard, welche ein lexikalisch übereinstimmendes Segment und korrekte Tags haben.
3. Ein weiteres Maß zeigt den Einfluss von Segmentierungsfehlern auf die Qualität der Tags. Die *upper bound accuracy* $Acc_{upper}$ ist eine theoretische Obergrenze der Tagger-Performance, indem alle Tokens, die falsch segmentiert wurden, als korrekt gewertet werden. Analog wird dazu auch die *lower bound accuracy* $Acc_{lower}$ definiert.
4. Weiterhin sind *lower bound accuracy* und *upper bound accuracy* für Wörter zu evaluieren, die der morphologischen Analyse bekannt und unbekannt sind: $Acc_{lower}^K$ und $Acc_{lower}^U$.
5. $Acc_{dis}$ gibt Auskunft über die Korrektheit der Disambiguierung auf Token-Ebene.

Ebenso sei zu beachten, dass optionale Attribute in Tags zu allen Möglichkeiten aufgelöst werden müssen.

### Morphem
Ein Morphem ist die kleinste bedeutungstragende Einheit, aus denen Wörter konstruiert werden können, bspw. sind Präfixe (*de-, ent-, ab-, un-, vor-, un-*) und Suffixe (*-heit, -keit, -ung*) Morpheme.

### Kompositum
Ein Kompositum ist ein zusammengesetztes Wort (*engl.:* compound word). Ein Beispiel ist „Berufsbildungswerk“. Die Komponenten sind „Berufs“, „bildungs“ und „werk“. Im Deutschen kann ein Kompositum Nomina, Verben, Adjektive und Adverbien als Bestandteile haben.

Während sich Komposita im Deutschen größtenteils auf Nomina beziehen, sind sie im Polnischen bei Konjugationen von Verben und Deklinationen von Adjektiven geläufiger. Komposita kommen in den meisten Sprachen vor.

Wird die Definition weiter gefasst, würden auch Folgen von Nomina unter Komposita fallen, wie dies im Englischen oft der Fall ist (Bsp.: „academic department“).

Komposita erschweren maschinelle Übersetzung, bspw. in romanischen Sprachen werden Komposita durch Umschreibungen ausgedrückt. Das Wort „Schulfreund“ entspricht dem Französischen „ami d'école“. Wörtlich übersetzt bedeutet dies „Freund aus der Schule“. Hier wird ersichtlich, dass die erste Komponente des Kompositums eine Genetiv-Konstruktion impliziert. Da also Übersetzungen keine bijektiven Wortabbildungen darstellen, müssen Komposita in ihre Bestandteile zerlegt werden.

### Morphologische Analyse
Eine morphologische Analyse greift meistens auf ein Wörterbuch zurück, um Tags für bekannte Lexeme zu ermitteln. Darüber hinaus können Regeln zum Einsatz kommen, um auch bei OOV^[engl. *out-of-vocabulary*]-Lexemen mögliche Tags zu ermitteln.

@lieber2004morphology [S. 108ff] zeigt für die englische Sprache, dass Affixe in morphologischen Analysen zusätzliche kontextuelle Informationen liefern könnten. Beim Präfix „un-“ könnte dem Wort eine negative Polarität zugeordnet werden. Andere Präfixe wären „de-“ (entziehen) oder „-ise/ify“ (verursachen).

@saint2006syntax [S. 99] listet Adpositionen auf, welche aus kleineren Morphemen bestehen. Eine morphologische Analyse könnte diese in ihre Bestandteile aufbrechen. Beispiele sind: *hiernach, hierunter, darunter, darin, worin, wonach, miteinander, untereinander, zueinander, etc.*

Ähnliche Beobachtungen findet man auch bei @houtzagers2008dutch [S. 109] für das Präfix „prze-“ (*dt.:* durch) im Polnischen. Morphologische Analysen könnten bei slavischen Sprachen zur Klassifizierung von Aktionsarten verwendet werden.

Im Deutschen können Verbpräfixe agglutiniert werden:

(a) Er macht mit.
(b) Er hat mitgemacht.

Im zweiten Fall liefert das Präfix „mit“ eine komitative Bedeutung, die mit einer morphologischen Analyse bestimmt werden könnte. Ansonsten kann diese Information nur ermittelt werden, wenn das Präfix wie bei (a) getrennt vorkommt.

### Kompositazerlegung
Kompositazerlegung ist eine Form der morphologischen Analyse.

@stymne08 stellt einen Algorithmus mit verschiedenen Variationen vor, um Komposita zu zerlegen. Der Ansatz, welcher nur die vier häufigsten Suffixe (*-s, -n, -en, -nen*) evaluiert, erreicht eine Präzision von 96,3%.

Zmorge ist ein morphologischer Segmentierer für die deutsche Sprache [@SENNRICH14.116]. Er basiert auf handgeschriebenen Regeln, welche mit Informationen aus Wiktionary vervollständigt wurden. Die Segmentierung für das Lexem „Vermittlungsgespräche“ würde Zmorge wie folgt zurückgeben:

    Vermittlung<->s<#>gespräch<+NN><Neut><Nom><Pl>

Zmorge liefert lediglich für das gesamte Wort den Kasus, nicht jedoch für die einzelnen Bestandteile.

PoliMorf ist ein morphologisches Wörterbuch für Polnisch (siehe [[Morphologische Wörterbücher]]). Es speichert die Konstituenten agglutinierter Verbformen als getrennte Einträge. Die Konjugation „poszedłbym“ (*dt.:* ich würde gehen, *wörtl.:* gehen-würde-ich) erscheint im Wörterbuch unter drei getrennten Einträgen:

    poszedł pójść   praet:sg:m1.m2.m3:perf
    by      by      comp
    m       być     aglt:sg:pri:imperf:nwok

Der Grund ist, dass solche Konstituenten auch an anderen Stellen im Satz auftauchen können. Dies ist in manchen Fällen sogar notwendig:

(i) Trzymam kciuki, byś zdał egzamin.
(ii) Trzymam kciuki, zdałbyś egzamin. (*)

Für manche Lexeme gibt es mehrere Segmentierungen. Ein Beispiel ist „miałem“ (ich hatte). Die häufigste Variante ist, dass „miałem“ vom Verb „mieć“ (haben) abgeleitet und in die maskuline Vergangenheitsform gesetzt ist. Eine andere Option wäre, dass es vom Wort „miał“ (Staub) stammt. Die beiden möglichen Segmentierungen wären also:

    miał    mieć    praet:sg:m1.m2.m3:imperf
    em      być     aglt:sg:pri:imperf:wok

oder

    miałem  miał    subst:sg:inst:m3

## Textkorpora
### Deutsch
Für die deutsche Sprache haben sich drei Korpora etabliert: NEGRA, TIGER und TüBa-D/Z. Alle drei basieren auf Zeitungstexten.

Version 2 des NEGRA-Korpus enthält 355.096 Tokens (20.602 Sätze), welche mit POS-Tags, Lemmata und syntaktischen Strukturen annotiert wurden [@Brants:ea:99]. Es basiert auf dem STTS.

Das TIGER-Korpus (Version 2.2) besteht aus 900.000 Tokens (50.000 Sätzen) und das Annotierungsschema orientiert sich an dem des NEGRA-Korpus [@Brants02thetiger; @Brants02developmentsin].

Das Korpus TüBa-D/Z (Version 9) ist mit 1.569.916 Tokens und 85.358 Sätzen das derzeit größte Korpus für die deutsche Sprache. Die einzelnen Knoten enthalten mehr interne Strukturen als TIGER.

TüBa-D/Z hat gegenüber TIGER den Vorteil, dass Präpositionen mit dem Kasus annotiert sind [@clematide13].

SALSA (Version 2.0) ist ein Korpus, welches auf TIGER (Version 2.1) basiert und mit rollensemantischen bzw. Frame-semantischen Informationen versieht [@Burchardt06thesalsa]. Es enthält 20.000 annotierte Instanzen.

Die Lizenzbedingungen der genannten Korpora sind restriktiv und verbieten eine Weitergabe sowie Änderungen^[Siehe <http://www.ims.uni-stuttgart.de/forschung/ressourcen/korpora/TIGERCorpus/license/htmlicense.html> (Zugriff am 14. Dezember 2014)]. TüBa-D/Z wird nach Genehmigung  für Forschungszwecke verteilt^[Siehe <http://www.sfs.uni-tuebingen.de/en/ascl/resources/corpora/tueba-dz.html> (Zugriff am 14. Dezember 2014)].

### Polnisch
Für die polnische Sprache wurde das *IPI PAN*-Korpus (2006) geschaffen [@prz:etal:03a]. Es hat das Ziel, eine umfangreiche und repräsentative Textsammlung zu sein. Es besteht aus 250 Millionen Segmenten verschiedener Textsorten. Die Segmente sind morphosyntaktisch annotiert. Im Rahmen von IPI PAN wurde ebenfalls ein neues Tagset konstruiert.

Auf dieses Korpus baut NKJP^[Narodowy Korpus Języka Polskiego (Nationalkorpus der polnischen Sprache)] (2012) auf @prz:etal:11:ed. Ein „Unterkorpus“^[*poln.* podkorpus] bestehend aus einer Million Wörtern wurde händisch annotiert und ist unter den Bedingungen der GPLv3-Lizenz erhältlich.
 
### Mehrsprachige Korpora
Ein mehrsprachiges Korpus (*auch:* Parallelkorpus) besteht aus linguistischen Einheiten, für die ein sprachübergreifendes Alignment existiert. Dabei variiert die Granularität dieser Einheiten.

Die Gesamtheit aller Wikipedia-Sprachversionen kann als mehrsprachiges Korpus aufgegriffen werden. Die Granularität der Alignments findet hier auf Artikelebene statt. Die Alignments haben demnach Abweichungen in Form und Inhalt. Im Kontext von CLIR eignet sich Wikipedia daher für vielfältige semantische Analysen, bspw. um Inkonsistenzen aufzudecken oder um die Wissensbasis einer Suchmaschine zu komplementieren. Das Wikipedia-Korpus zeichnet sich durch interne Verlinkungen und durch den strukturierten Inhalt aus (Sektionen, Auflistungen).

Dem gegenüber stehen parallele Korpora, in denen die Alignment-Einheiten Sätze sind. Ein prominentes Beispiel ist das *Europarl*-Korpus [@koehn2005epc], welches auf den öffentlichen Verhandlungen des europäischen Parlaments basiert und für 21 Sprachen erhältlich ist. Die Sprachversionen wurden automatisch *aligned*. Version 7 (2012) enthält bis zu 60 Millionen Wörter pro Sprache.

Das *OPUS*-Projekt [@Tiedemann:RANLP5] ist eine Sammlung paralleler Korpora aus verschiedenen Quellen. Unter anderem finden sich hier mehrsprachige Anleitungen einiger Open-Source-Projekte wie OpenOffice.org, PHP, KDE4, GNOME und Ubuntu. Ebenso beinhaltet OPUS auch Untertitel von OpenSubtitles.org.

@wordfreqs vergleichen bestehende Häufigkeitsnormen, welche auf Büchern basieren, mit Newsgroups und Untertiteln. Ein Korpus basierend auf Untertiteln wurde als besserer Maßstab erkannt, um die Geläufigkeit von Wörtern zu bewerten.

In der vorliegenden Arbeit wird OpenSubtitles 2013 im TMX-Format mit Deutsch-Polnischem Alignment verwendet^[Erhältlich unter <http://opus.lingfil.uu.se/>]. Neben der Annahme, dass die Sätze eine Vielfalt an Situationen und Ausdrücken abdecken, zeichnen sich die Sätze durch ihre moderate Länge aus. OpenSubtitles könnte als gesprochenes Korpus gedeutet werden. Bei ersten Analysen hat sich gezeigt, dass einige Sätze jedoch OCR-Fehler aufweisen.

## Wörterbücher
Bei Wörterbüchern muss zwischen ein- und mehrsprachigen unterschieden werden. Einsprachige Wörterbücher, die bei der Sprachverarbeitung relevant sind, enthalten morphologische Informationen. Ein morphologisches Wörterbuch wird hier definiert als eine Abbildung von Lexemen auf Tupel bestehend aus Lemmata und morphosyntaktischen Tags. Mehrsprachige Wörterbücher könnten zu Korpora gezählt werden, bei denen ein Alignment auf Wortebene stattfindet.

### Morphologische Wörterbücher
Für die deutsche Sprache ist ein solches Wörterbuch nicht verfügbar, was darin begründet ist, dass es kein standardisiertes Tagset gibt, welches morphologische Informationen enkodiert. Einen Ansatz findet man jedoch bei @Schmid:2008:ECP:1599081.1599179. Ein solches morphologisches Wörtbuch kann zu Teilen auch aus bestehenden Korpora wie TIGER erzeugt werden.

@Perera:2005:SCL:1220575.1220655 stellt einen HMM-basierten Algorithmus vor, um ein morphologisches Wörterbuch anhand gefundener Lexemer abzuleiten. Perera verwendet vorab definierte Regeln, welche grammatikalische Kombinationen in Klassen einordnet. Von der ausgewählten Klasse ist abhängig, welche Suffixe gelöscht werden.

@janicki13 formuliert das Problem der Generierung eines morphologischen Wörterbuches als zwei getrennte Clustering-Probleme^[Eine Implementierung findet sich unter <http://github.com/kawu/lexeme-clustering/>]. Zunächst werden Wörter gemäß Ähnlichkeit der Lexeme gruppiert. Danach werden die morphologischen Formen abgeleitet. Für Deutsch ist die Präzision der Lexeme 87,8% und der morphologischen Formen 64,1%.

PoliMorf (0.6.7) ist ein morphologisches Wörterbuch für Polnisch [@wol:etal:12]. Es geht aus den zwei unabhängig entwickelten morphologischen Wörterbüchern Morfeusz SGJP und Morfologik hervor. PoliMorf benutzt das *IPI PAN*-Tagset.
 
Zur Erstellung von PoliMorf verwenden die Autoren die kollaborative Web-Plattform *Kuźnia*, welche Flexionsmuster kennt. Zudem gibt es zwei Arten von Klassifizierungen: Die Lexeme werden mit ihren Quellwörterbüchern annotiert und erhalten Tags wie *umgangssprachlich* oder *veraltet*. Da die Information über die Quelle erhalten bleibt, lassen sich so verschiedene Untermengen von PoliMorf je nach Textsorte oder Domäne verwenden, bspw. medizinische Begriffe.

Eine Anwendung morphologischer Wörterbücher wäre eine kontextuelle Rechtschreibprüfung, welche bei einem Rechtschreibfehler die Liste aller Korrekturmöglichkeiten auf Basis der bisherigen und folgenden Wörter einschränkt.

### Mehrsprachige Wörterbücher
Die Verlinkungen zwischen mehreren Sprachverisonen der Wikipedia könnten als mehrsprachiges Wörterbuch dienen. Dadurch stehen Übersetzungen vieler Fachbegriffe zur Verfügung. Die Überetzungen sind vornehmlich Nomina.

Dazu könnte Wiktionary als Quelle weiterer Übersetzungen verwendet werden. Die Übersetzungen müssten für die jeweilige Sprache aus den Artikeln über Pattern-Matching extrahiert werden.

Ein weiteres Wörterbuch, welches jedoch nicht unter freier Lizenz steht, aber offline nutzbar ist, wäre dict.cc. In der aktuellen Version deutsch-polnischen Fassung sind 13.668 Übersetzungen vorhanden^[Stand: Dezember 2014].

## Tagger
TnT ist ein statistischer POS-Tagger basierend auf Markov-Ketten zweiter Ordnung und dem Viterbi-Algorithmus [@Brants:2000:TSP:974147.974178]. Für NEGRA erreicht der Tagger eine Korrektheit von 96,7%. Der Tagger ist proprietär und nur auf Anfrage erhältlich.

Frei verfügbar ist der *Stanford Tagger*, welcher auch mit einem Modell für die deutsche Sprache, trainiert auf dem NEGRA-Korpus, mitgeliefert wird [@Rafferty:2008:PTG:1621401.1621407].

@rico13 stellen einen POS-Tagger vor, welcher auf *conditional random fields* (CRF) basiert. Ebenso greift der Tagger auf die Ergebnisse einer morphologischen Analyse durch Zmorge zurück (siehe [[Kompositazerlegung]]); für jedes Lexem wird die Liste aller möglichen POS-Tags in einem Feature enkodiert. Der vorgestellte Tagger benutzt die morphologischen Informationen lediglich zur Disambiguierung und kann diese nicht für Lexeme bestimmen.

@Schmid:2008:ECP:1599081.1599179 stellt einen morphologischen Tagger *RFTagger* für Deutsch und Tschechisch vor^[RFTagger ist erhältlich unter <http://www.cis.uni-muenchen.de/~schmid/tools/RFTagger/>]. Das Modell von RFTagger basiert auf HMM. Schmid entwirft ein eigenes Tagset auf Basis von TIGER. Mit Entscheidungsbäumen wird die Wahrscheinlichkeit für jedes Attribut berechnet. Danach werden Folgen von Attributen abgeleitet, welche als Features verwendet werden.

Schmid verwendet das TIGER-Korpus. Er löscht Sätze mit unvollständiger Annotation, reduziert die Anzahl der POS-Tags von 54 auf 23 und stellt alle restlichen Informationen durch Attribute dar. Ebenso wurden neue Attribute eingeführt; bestimmte/unbestimmte Artikel und die Unterscheidung zwischen Satzzeichen. Er verwendet ein Lexikon mit morphologischen Informationen. Bei Präpositionen wurden Fälle hinzugefügt. Bei mehrdeutigen Präpositionen, wird entweder der wahrscheinlichste Fall genommen oder ein künstlicher Fall konstruiert. Diese Entscheidung scheint arbiträr, da im TIGER-Korpus bereits die Tokens nach der Präposition Auskunft über den Fall geben. Laut @clematide13 sind 10% aller Tokens in TIGER Präpositionen, wodurch die Ungenauigkeit ins Gewicht fallen könnte.

@mueller2013 stellt einen morphologischen Tagger für Deutsch vor, welcher inkrementell die Ordnung des CRF erhöht. Der Ansatz erreicht für die deutsche Sprache die bisher besten Ergebnisse.

Es zeigt sich, dass das abgewandelte Tagset eine 0,6% höhere Präzision liefert und mit einem externen Lexikon noch zusätzlich 3,5%. Er vergleicht die Ergebnisse mit TnT und SVMTool, wobei SVMTool in allen Tests leicht besser abschneidet.
 
@clematide13 untersucht HMM, Entscheidungsbäumen und CRF, um den Kasus von Lexemen zu betimmen. Es werden verschiedene Konstellationen von POS und morphologischen Attributen, auch solche, welche den POS nicht enthalten, verglichen. Wie auch @rico13 beobachtet Clematide, dass sich bessere Ergebnisse erzielen lassen, wenn morphologische Informationen zu den Features gezählt werden. Das beste Ergebnis mit einer Präzision von 94,71% für TIGER und 94,75% für TüBa/D-Z erzielt der CRF-Ansatz mit den morphologischen Informationen Kasus, Numerus, und POS als Features. In allen Vergleichen erreicht das TüBa/D-Z-Korpus einen höheren Wert als TIGER.

PANTERA ist eine Abwandlung des Brill-Taggers für Polnisch [@Acedanski:2010:MBT:1884371.1884376]. Der Tagger generiert Regeln, welche auf die Eingabe angewendet werden. POS, Fall und Person werden getrennt von den restlichen Kategorien disambiguiert.

WMBT implementiert eine Disambiguierung von morphologischen Tags basierend auf instanzenbasiertem Lernen [@radziszewski2011]. WMBT hat so viele Schichten wie es Attribute im Tagset gibt.

@waszczuk12 orientiert sich an den von Radziszewski erwähnten Bewertungsstrategien und zeigt, dass Concraft in allen $Acc$-Klassen bessere Ergebnisse als die konkurrierenden Tagger Pantera, WMBT, WCRFT erreicht. Waszczuk verwendet CRF mit Constraints, um mögliche Tags einzuschränken. Zudem wird die Gestalt eines Worts als Feature gespeichert.

@kob:14 vergleicht populäre Tagger und kombiniert mehrere Klassifizierer mit verschiedenen Voting-Strategien (PoliTa), um beim Tagging bessere Ergebnisse zu erzielen. PANTERA hat eine Korrektheit von 88,95%, WMBT 90,33%, WCRFT^[Siehe <http://nlp.pwr.wroc.pl/redmine/projects/wcrft/wiki>] [@wcrft] 90,76% und Concraft (2012) 91,07%. Durch Kombinieren von Klassifizierern erreicht Kobyliński in PoliTa eine Korrektheit von 92,05%.

NKJP hat ein Tagset mit ~4000 möglichen Tags, Browns Tagset für die englische Sprache hingegen nur ~200. Die besten englischen Tagger haben eine Korrektheit von 97%. Laut @Sniatowski:2011:CPM:2186472.2186504 kommen von den 4000 Tags nur 1000 in Korpora vor, was auch der Fall für die tschechische Sprache ist.

Als Trainingsdaten verwenden die genannten Tagger eine Teilmenge des Korpus NKJP. Dass polnische Tagger schlechtere Ergebnisse erzielen, ist darin begründet, dass zur Präzision auch die Korrektheit der Attributbestimmung gezählt werden (dies geschieht implizit, da die Attribute auch Teil der Tags sind).

Die derzeit besten morphosyntaktischen Tagger für Deutsch und Polnisch verwenden ähnliche Konzepte. Schmid kombiniert Entscheidungsbäume mit HMM, während Waszczuk und Müller auf Varianten von CRF aufsetzen. Es gilt zu untersuchen, ob die verschiedenen Ansätze kombiniert werden können.

## Realisierung
### Korpus
Als Trainingskorpus habe ich aufgrund der Zugänglichkeit TIGER gewählt. Für Polnisch kommt NKJP zum Einsatz, welches bereits als trainiertes Modell für Concraft erhältlich ist.

### Tagset
In der vorliegenden Arbeit kommen für Deutsch der STTS-Tagset und für Polnisch der NKJP-Tagset zum Einsatz. Beide Tagsets unterscheiden sich in ihrem Aufbau. Während bei NKJP die grammatikalischen Eigenschaften Teil des POS-Tags sind, beschränken sich bei STTS die POS-Tags lediglich auf die Wortform. Dennoch wurde das TIGER-Korpus mit grammatikalischen Attributen annotiert. Um also mit dem Aufbau der polnischen Tags konsistent zu sein, habe ich ein Tagset definiert, welches auf den aus TIGER erhältlichen Informationen basiert^[Siehe ``etc/tiger-tagset.cfg``] und mit Concraft kompatibel ist.

: Beispiel eines Satzes aus TIGER

|     **Wort**    |   **Lemma**   |         **Tag**          |
|-------------|-----------|----------------------|
| Als         | als       | appr                 |
| größte      | groß      | adja:sg:acc:fem:sup  |
| Schwäche    | Schwäche  | nn:sg:acc:fem        |
| des         | der       | art:sg:gen:masc      |
| Texaners    | Texaner   | nn:sg:gen:masc       |
| nennen      | nennen    | vvfin:pl:3:pres:ind  |
| die         | der       | art:pl:nom           |
| Befragten   | Befragter | nn:pl:nom            |
| seinen      | sein      | pposat:sg:acc:masc   |
| Mangel      | Mangel    | nn:sg:acc:masc       |
| an          | an        | appr                 |
| Erfahrung   | Erfahrung | nn:sg:dat:fem        |
| auf         | auf       | appr                 |
| dem         | der       | art:sg:dat:neut      |
| politischen | politisch | adja:sg:dat:neut:pos |
| Parkett     | Parkett   | nn:sg:dat:neut       |
| .           | .         | intpdot              |

Die einzigen Änderungen an der Benennung betreffen *intpint* (satzinternes Zeichen), *intpcom* (Komma) und *intpdot* (satzbeendende Interpunktuation), welche in STTS nicht als Zeichenkette definiert wurden und damit im weiteren Verlauf zu Problemen führen könnte. Ebenso werden in Übereinstimmung mit NKJP alle Bezeichner in Kleinbuchstaben notiert.

Der erste Teil eines Tags besteht immer aus der Wortform, während die restlichen Teile die Attribute darstellen und jeweils durch einen Doppelpunkt getrennt werden. Für jede Attributklasse wie Person wird eine Menge von möglichen Werten festgelegt. Diese Werte müssen unter den Klassen einzigartig sein, da in einem Tag nicht-spezifizierte Attribute wegzulassen sind (*nn:sg:masc* statt *nn:sg::masc*). Attribute werden als optional verstanden, wenn sie nicht spezifiziert wurden. Trotz dieser Eigenschaft werden solche Tagsets oft auch *positional* bezeichnet^[Siehe <http://hackage.haskell.org/package/tagset-positional/>].

TIGER unterscheidet zwischen Attributwerten, die noch fehlen und solchen, bei denen die Wortform keinen Wert annehmen kann. Zur Vereinfachung werden solche Werte zusammengefasst und im konstruierten Tag nicht spezifiziert.

: Beispiel eines polnischen Satzes (NKJP-Tagset)

|   **Wort**   |  **Lemma**   |       **Tag**       |
|----------|----------|-----------------|
| W        | w        | prep:loc:nwok   |
| końcu    | koniec   | subst:sg:loc:m3 |
| wrogowie | wróg     | subst:pl:nom:m1 |
| za       | za       | prep:acc        |
| to       | to       | subst:sg:acc:n  |
| zapłacą  | zapłacić | fin:pl:ter:perf |
| .        | .        | interp          |

Insgesamt wurden sieben Attribute und 55 Tags definiert. Das NKJP-Tagset enthält 13 Attribute und 35 Tags. In beiden Fällen ist jedoch zu beachten, dass Tags meist nur einen Teil der vorhandenen Attribute ausnutzt.

Dass NKJP mehr Attribute hat, ist dadurch begründet, dass vergleichbare Informationen in TIGER durch getrennte Tags repräsentiert werden. TIGER hat deutlich mehr Tags, da für verschiedene Arten von Pronomen (attribuierend, substituierend, reflexiv usw.) getrennte Tags existieren. Insgesamt sind die Tags in TIGER deutlich spezifizischer, was sich dadurch bemerkbar macht, dass ein Großteil der Tags verhältnismäßig wenig Repräsentanten hat.

### Tagger
In einem Fork habe ich Concraft entsprechend angepasst, dass eine externe morphologische Analyse verwendet werden kann^[Siehe <http://github.com/poliglot/concraft-de/>].

### Morphologische Analyse
Die morphologische Analyse verbindet sich mit dem TCP-Server von Zmorge. Danach werden die Tags aufbereitet und in Concrafts Plain-Text-Format zurückgegeben.

Die Regeln von Zmorge sind handgeschrieben, sodass es häufig zu falschen Segmentierungen kam. Es müssen in Zukunft andere Ansätze evaluiert werden, welche auf statistischen Modellen beruhen. Denkbar sind die in [[Morphologische Wörterbücher]] erwähnten Ansätze.

### Ergebnisse
Das selbsttrainierte Modell hatte eine geringe Präzision. Dies ist vermutlich wegen des komplizierten Tagsets und der hohen Fehlerquote von Zmorge geschuldet. Vorerst habe ich mich im Folgenden beim Tagging deutscher Sätze für RFTagger entschieden. Es wäre jedoch zu eruieren, ob Concraft bessere Ergebnisse mit einem abgewandelten Tagset erreichen könnte.

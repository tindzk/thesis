# Einheiten und deren Abbildung
Integraler Bestandteil von CLIR sind parallele Korpora, in denen mehrere Sprachversionen eines Satzes vorliegen. Die einzelnen Sprachversionen können sich im Grad ihrer Ähnlichkeit stark unterscheiden. Zum Zwecke der Informationsextrahierung aus solchen Korpora ist es also unabdingbar, dass die einzelnen Satzbestandteile aufeinander abgebildet werden. In diesem Kapitel definiere ich den Begriff der „semantischen Einheiten“, welche es erlauben, einen Satz hierarchisch zu annotieren und sprachübergreifend abzubilden.

## Linguistik
### Strukturen
Beim Erstellen einer Wissensbasis werden Sätze in eine andere Repräsentation übertragen. In der Linguistik haben sich vier Strukturtypen etabliert [@metzler]:

Determinationsstruktur (DT)
  ~ Bei der DT wird die Annahme getroffen, dass ein Satz eine Bezeichnung für einen Gegenstand nennt (Nomen im Nominativ). Desweiteren gibt es ein Prädikat (finites Verb). Unpersönliche Sätze müssen durch Nomen ergänzt werden. Laut @metzler: „Für jedes syntaktisch miteinander verknüpfte Paar $(x, y)$ syntaktischer Wörter gilt, dass das syntaktische Wort $y$ das syntaktische Wort $x$ näher bestimmt - oder: determiniert.“
Dependenzstruktur (DP)
  ~ Der Begründer der DP ist Lucien Tesnière (1893–1954). Eine DP unterliegt der Annahme, dass bei einem Paar $(x, y)$ $y$ von $x$ abhängig ist. Die zweite Annahme ist, dass ein finites Verb den Satzbau bestimmt. Relevant ist weiterhin der Begriff der *Valenz* [@sprachwissenschaft, S. 727]. Die Valenz ist eine Eigenschaft, welche spezifiziert, wie die syntaktische Umgebung eines Lexems vorstrukturiert ist und welche grammatikalischen Eigenschaften für die Ergänzungen des Lexems gelten müssen. Bezogen auf das finite Verb, besagt die Valenz, wie andere Lexeme in Abhängigkeit zu diesem stehen. DP wird durch einen Baum realisiert, in dem der Wurzelknoten das finite Verb ist. Diesen Knoten bezeichnet man auch als den *Regens*, während die Kinder die *Dependentien* sind. Für jedes Kind $y$ von $x$ muss gelten, dass $y$ von $x$ strukturell abhängig. Bäume, die aus Dependenzgrammatiken hervorgehen, sind Reed-Kellogg-Diagramme.
Nomen-Verb-Ringstruktur (NVR)
  ~ Die NVR kombiniert DT und DP. Hier wird davon ausgegangen, dass Nomen an Verben gebunden sind.
Konstituentenstruktur/Phrasenstrukturen
  ~ Ein Ausdruck wird bei diesen Strukturen in seine Konstituenten zerlegt. Ein Konstituent bezeichnet eine Gruppe von Wörtern eines Satzes gemäß ihrer grammatikalischen Funktion. Beispiele sind Phrasen wie Nominalphrasen (NP) oder Verbalphrasen (VP). Sie stellen abgeschlossene syntaktische Einheiten dar. Im Gegensatz zu DT, DP und NVR sind Verknüpfungen nicht auf Wortpaare beschränkt, sondern auch für Wortkomplexe definiert. Die entsprechende kontextfreie Grammatik wird als Phrasenstruktur- oder Konstituentenstrukturgrammatik bezeichnet [@chomsky1957]. Die abgeleiteten Bäume werden auch *constituency-based parse trees* genannt.

    ```tree
    ["S"
      ["NP" ["He"] ]
      ["VP"
        ["V" ["read"] ]
        ["NP"
          ["D" ["the"] ]
          ["N" ["book"] ]
        ]
        ["A" ["yesterday"] ]
      ]
    ]
    ```

### Syntaktische Funktionen
Syntaktische Funktionen sind Kategorien wie Subjekte, Objekte, Prädikate, Adverbiale oder Attribute.

### Semantische Rollen
Semantische Rollen^[*auch:* thematische Rollen, Theta-Rollen] basieren auf semantischen Einheiten. Sie verallgemeinern Eigenschaften zwischen dem Verb eines Satzes und seinen Attributen. Solche Rollen sind unter anderem Agens, Patiens, Ursache, Thema, Quelle, Ziel, Experiencer und Instrumental [@Baker97thematicroles].

### Semantic role labeling
*Semantic role labeling* (SRL) befasst sich damit, Argumente von Verben zu identifizieren und diesen Rollen zuzuweisen. Damit ist SRL verwandt mit Dependenzstrukturen. In beiden Konzepten wird angenommen, dass ein Satz durch das Verb regiert wird. In dem Satz „Peter verkauft Daniel das Buch.“ hat die Verbform „verkauft“ drei Argumente: „Peter“, „Daniel“ und „das Buch“.

Argumente bestehen aus mindestens einem Wort und werden mit ihrer semantischen Rolle annotiert:

> [Peter]~<span style="font-variant: small-caps">Agent</span>~ verkauft [Daniel]~<span style="font-variant: small-caps">Recipient</span>~ [das Buch]~<span style="font-variant: small-caps">Theme</span>~.

@Punyakanok:2008:ISP:1403157.1403162 stellt einen Algorithmus für SRL im Englischen vor. Der Algorithmus besteht aus drei Schritten:

1) **Pruning:** Anhand heuristischer Regeln werden Kandidaten für Argumente gefunden.
2) **Argumente identifizieren:** Anhand von Features wird bestimmt, ob sich ein Kandidat als Argument eignet.
3) **Argumente klassifizieren:** Mit ähnlichen Features wie aus Schritt 2 werden dann den identifizierten Kandidaten Rollen zugewiesen. Um weiterhin fehlerhafte Argumente zu eliminieren, existiert eine spezielle semantische Rolle „null“.
4) **Inferenz:** Hier werden linguistische und strukturelle Einschränkungen (*constraints*) betrachtet. Eine mögliche Einschränkung wäre bspw., dass sich Argumente nicht überlappen dürfen. Da die vorherigen Phasen unabhängig voneinander durchgeführt werden, sind Inkonsistenzen zu erwarten. Diese Phase soll dem entgegenwirken.

Darüber hinaus wird verglichen, ob sich die Genauigkeit des gesamten Prozesses unterscheidet, je nachdem, ob Full-Parsing^[Parsing mit Bäumen als Ergebnis] oder Shallow-Parsing^[Parsing mit POS-Tags als Ergebnis] zum Einsatz kommt. Sie beobachten, dass Full-Parsing insbesondere den Pruning-Schritt positiv beeinflusst. Die Autoren kombinieren in Schritt 4 getrennte Systeme, die mit unterschiedlichen Einschränkungen trainiert wurden. Damit lösen sie widersprüchliche Entscheidungen auf.

Das vorgestellte Verfahren erreicht auf einem der getesteten Korpora eine Präzision von 82,28%.

### Frame-Semantik
Ein Frame bezeichnet einen Prozess und weist diesem Lexeme und semantische Kategorien (Zeit, Zweck, Erklärung usw.), sogenannte *frame elements*, zu. Es handelt sich bei der Frame-Semantik um eine Ontologie; Frames können Beziehungen zu anderen Frames haben (zum Beispiel durch Vererbung). Die Frame-Semantik zeichnet sich dadurch aus, dass alle enthaltenen Informationen abgesehen von den Lexemen sprachunabhängig sind.

Die folgenden Beispiele aus @Burchardt06thesalsa veranschaulichen das Konzept:

(i) [Peter]~<span style="font-variant: small-caps">Agent</span>~ hit~<span style="font-variant: small-caps">Cause/Impact</span>~ [the ball]~<span style="font-variant: small-caps">Impactee</span>~.
(ii) [The ball]~<span style="font-variant: small-caps">Impactee</span>~ was hit~<span style="font-variant: small-caps">Cause/Impact</span>~.

In beiden Sätzen werden semantische Rollen identifiziert und den betreffenden Einheiten zugeordnet. Offensichtlich sind die Rollen von der Semantik abhängig, da sie trotz der Verwendung des Passivs in (ii) gleich zugeordnet werden.

Frame-Semantik ist jedoch eine *shallow semantic analysis*, da grammatikalische Kategorien wie Modalität, Negierung und kontextuelle Mehrdeutigkeiten ignoriert werden.

Das FrameNet-Projekt stellt ein Frame-semantisches Lexikon für die englische Sprache dar [@Baker:1998:BFP:980845.980860; @Boas2005:Theory2Practice]. Es enthält derzeit 10.000 Wortbedeutungen und 170.000 manuell annotierte Sätze.

FrameNet weist einem Frame eine Vielzahl von lexikalischen Einheiten zu. Dem gegenüber steht PropBank [@Palmer:2005:PBA:1122624.1122628]. Hier sind die Frames abhängig vom Verb. Zudem unterstützt es Negation.

@Burchardt06thesalsa beschreibt, wie Frames aus dem FrameNet-Projekt auf die deutsche Sprache übertragen wurden.

### IBMs Übersetzungsmodelle
Von IBM wurden eine Reihe von Übersetzungsmodellen entwickelt. Diese Modelle beruhen darauf, Abbildungen zwischen zwei Sprachversionen eines Satzes zu definieren. Sie sind statistische Modelle und approximieren über das EM^[Expectation-Maximization]-Verfahren die Wahrscheinlichkeit $P(t, s)$ für $s \in$ Quell-Tokens und $t \in$ Ziel-Tokens. Die IBM-Modelle erlauben keine Abbildungen von einem Token auf mehrere Tokens.

### Hierarchische satzbasierte Übersetzung
@Chiang:2007:HPT:1268656.1268659 definiert ein statistisches Übersetzungsmodell, welches auf hierarchischen Übersetzungen beruht. Das Modell wird auf Basis eines Parallelkorpus gelernt. Über CYK-Parsing werden hierarchische Regeln abgeleitet. Dieses Übersetzermodell liefert gegenüber IBM bessere Ergebnisse. Eine Variation, welche Gewichtung auf Basis von endlichten Transduktoren (FST) einführt, wird in @deGispert:2010:HPT:1950488.1950496 beschrieben.

## Semantische Einheiten
Inspiriert von den oben genannten Konzepten, führe ich im Rahmen dieser Arbeit „semantische Einheiten“ ein. Sie haben drei zentrale Eigenschaften:

a) Eine Einheit ist eine Folge benachbarter Tokens in einem morphosyntaktisch annotierten Satz.
b) Eine Einheit kann Untereinheiten (Kindern) haben.
c) Zwei Einheiten derselben Tiefe dürfen sich nicht überlappen.

Einheiten bilden also einen Baum, welcher als Parse-Baum aufgegriffen werden könnte. Dadurch, dass nicht nur Argumente von Verben Einheiten bilden, eignet sich dieser Ansatz für CLIR.

Die Motivation für Einheiten ist, dass sie durch die Gruppierung mehrerer Tokens einen größeren Raum an sprachlichen Konzepten umfassen. Unter anderem sind das Redewendungen, Namenskomplexe (Vor-/Nachname), Adressen, usw.

In der Mengenlehre entspricht eine semantische Einheit einer *Partition* der Tokens mit der Einschränkung, dass nur benachbarte Tokens zugelassen sind.

Sei $E$ die Menge aller Einheiten. Eine Einheit $e \in E$ ist eine Menge von benachbarten Positionen. Jeder Satz $S$ hat eine Wurzeleinheit $r = \{1, ..., |S|\} \in E$. $|S|$ bezeichnet die Anzahl der Tokens. Eine Kindeinheit $child(e)$ ist eine echte Teilmenge von $e$, wobei $e \in E$ gdw. $e \neq \emptyset$ und die maximale Distanz zwischen zwei Token-Positionen 1 beträgt: $\forall e_1 \in e : \exists e_2 \in e : |e_1 - e_2| = 1$. Es gilt somit $\bigcup_{e \in E} e = r$.

$parent(x)$ liefert die Elterneinheit von $x$ zurück. Eine gültige Einheit $e$ hat maximal $n=|parent(e)|-1$ Kindeinheiten mit $n > 0$. Im Worst-Case gibt es $|S|$ Ebenen mit jeweils nur einem Kind pro Ebene.

Für das obige Beispiel könnten folgende Einheiten erzeugt werden:

> [Peter] [verkauft] [Daniel] [das Buch] [.]

Analog zu SRL ist es sinnvoll, Argumente zu identifizieren und auch die dazugehörigen Adposition in die Einheiten mit einzuschließen. Darüber hinaus sollten auch aus Verben Einheiten geformt werden, sodass diese abgebildet werden können.

Die Klassifizierung kann ebenfalls auf tieferen Ebenen rekursiv wiederholt werden:

> [Peter] [verkauft] [Daniel] [das [Buch]] [.]

Der Einheitenkomplex wird visuell als Baum dargestellt:

```tree
["<Wurzel>"
    ["Peter"]
    ["verkauft"]
    ["Daniel"]
    ["das" ["Buch"]]
    ["."]
]
```

Abhängig davon, ob es sich um eine Lexikalisierung handelt, kann auf eine genauere Unterteilung verzichtet werden. So könne laut @lehmann1998 [S. 18] „in Beziehung auf“ als eine zusammenhängende Präposition aufgegriffen werden.

### Abhängigkeiten
Die hierarchische Darstellung als Einheiten strukturiert einen Satz in der gleichen Reihenfolge, wie seine Einheiten im Satz vorkommen. Dies kommt aber nicht für die Beziehungen zwischen Einheiten auf. In dem obigen Satz besteht eine implizite Beziehung zwischen dem Verb und seinen drei Argumenten:

\begin{dependency}[theme = simple]
   \begin{deptext}[column sep=1em]
      Peter \& verkauft \& Daniel \& das Buch \& . \\
   \end{deptext}
   \depedge{1}{2}{}
   \depedge{3}{2}{}
   \depedge{4}{2}{}
\end{dependency}

Diese Art der Annotierung orientiert sich an der Dependenzstruktur, bei welcher das Verb den Satz regiert.

Weiterhin sind Abhängigkeiten nützlich, um solche Situationen zu berücksichtigen, in denen zusammengehörende Informationen über mehrere Einheiten zerstreut sind, bspw. trennbare Verben, Zirkumpositionen oder die deutsche Satzklammer, bei der das Prädikat zwei Teile hat. Dieses Konzept der Zirkumposition taucht auch in anderen Sprachen auf, zum Beispiel bei der Verneinung im Französischen. Zwischen solchen Einheiten können also mit Dependenzen wieder eine Verbindung aufgebaut werden. Dependenzen können zwischen Einheiten beliebiger Tiefe definiert werden.

```tree
["<Wurzel>"
    ["Peter"]
    ["hat"]
    ["Daniel"]
    ["das" ["Buch"]]
    ["verkauft"]
    ["."]
]
```

\begin{dependency}[theme = simple]
   \begin{deptext}[column sep=1em]
      Peter \& hat \& Daniel \& das Buch \& verkauft \& . \\
   \end{deptext}
   \depedge{1}{5}{}
   \depedge{3}{5}{}
   \depedge{4}{5}{}
   \depedge{5}{2}{}
\end{dependency}

Abhängigkeiten dienen also der fehlenden semantischen Beziehungen, welche durch die Hierarchie nicht dargestellt werden können. Die Definition einer semantischen Einheit wird um eine optionale Referenz erweitert, welche auf eine andere Einheit verweist.

Eine Alternative wäre, beliebige Token-Folgen für Einheiten zuzulassen. Damit könnte der Bedarf für Abhängigkeiten eliminiert werden; die einzelnen Elemente der Menge wären damit Äquivalenzklassen. Gleichzeitig hätte dies zur Folge, dass Einheiten eines Satzes nicht mehr zwangsläufig eine Hierarchie bilden müssten. Ebenso steigt der Aufwand zum Finden von Einheiten deutlich und entspricht der Potenzmenge der Positionen. Diese Menge wächst jedoch exponentiell ($2^n$). Daher ist es nicht praktikabel, sie für längere Sätze zu berechnen. Es müsste also eine Approximierung gefunden werden. Weiterhin handelt es sich nicht um einen vollwertigen Ersatz für Einheiten, da sie keine hierarchische Ordnungsrelation definiert, die besagt, welches Token Kind von einem anderen ist.

### Abbildung
*Abbildung* wird als Übersetzung für das englischen Wort *alignment* verwendet. Ein direktes Pendant in der deutschen Sprache gibt es jedoch nicht. Andere mögliche Übersetzungen wären *Übereinstimmung* oder *Korrespondenz*.

Die Frage des Abbildens beschäftigt sich damit, wie sich die Tokens zweier inhaltsgleicher Sätze $S_1$ und $S_2$ in verschiedenen Sprachen $L_1$ und $L_2$ aufeinander abbilden lassen. Eine gültige Abbildung ist dann gegeben, wenn die Relationen semantische, lexikalische und grammatikalische Ähnlichkeiten zwischen Wörtern in $L_1$ und $L_2$ berücksichtigen.

Eine Erweiterung semantischer Einheiten ist die Möglichkeit des Abbildens derer. Wie eingangs erwähnt, sollen Abbildungen zwischen zwei Sprachversionen eines Satzes gefunden werden. Eine Möglichkeit wären tokenbasierte Abbildungen wie zum Beispiel in IBMs Übersetzungsmodellen. Da die Modelle in der Praxis nur bedingt geeignet sind, definiere ich Abbildungen zwischen Einheiten zweier Sprachversionen eines Satzes. Gegen Abbildungen einzelner Tokens spricht, dass sie keine beliebigen Lexikalisierungen berücksichtigen. Ein Beispiel ist „in Beziehung auf“, welches im Englischen durch das Token „regarding“ ausgedrückt werden könnte. Analog dazu sollte es möglich sein, ein Token auf mehrere Zieltokens abzubilden.

Gegeben sei eine Übersetzung mit folgenden Einheiten:

(a) [Peter] [hat] [Daniel] [das [Buch]] [verkauft] [.]
(b) [Peter] [sold] [the [book]] [to [Daniel]] [.]

In diesem Beispiel ist sichtbar, dass sich die Satzglieder in ihrer Reihenfolge unterscheiden können. In diesem Fall müssten „hat“ und „verkauft“ auf „sold“ abgebildet werden. Ebenso erfordert „to sell“ im Englischen für den Empfänger die Präposition „to“.

Hier handelt es sich um keine wörtliche Übersetzung. Die Einheit „[Daniel]“ entspricht im Zielsatz „[to ...]“. Sollte der Aufbau eines Satzes schwieriger sein und der Zielsatz keine genaue Übersetzung darstellen, besteht die Möglichkeit, nur so tief in der Hierarchie die Untereinheiten zu annotieren, wie es die lexikalisch-semantischen Beziehungen zulassen. Dies ist inbesondere notwendig, da bei Übersetzungen Einfügungen, Umsortierungen und Auslassungen häufig anzutreten sind.

Die Verwendungszwecke von abgebildeten Einheiten sind mannigfaltig, da sie pragmatische, lexikalische und grammatikalische Zusammenhänge zweier Sprachen widerspiegeln.

## Rahmen
Gemäß obiger Definition können drei Modellen unterschieden werden:

(a) Einheitenhierarchie
(b) Abhängigkeiten zwischen Einheiten
(c) Abbildungen auf Einheiten in einer anderen Sprachversion

Da der Rahmen meiner Bachelor-Arbeit auf CLIR liegt, widme ich mich in diesem Kapitel lediglich der Erstellung eines statistischen Klassifizierers für (c).

## Trainingsdaten
Die Trainingsdaten bestehen aus drei Korpora.

### Satzkorpus
Als Quelle für Übersetzungen habe ich mich für das OpenSubtitles-Korpus entschieden (siehe [[Mehrsprachige Korpora]]). Die Sätze sind Übersetzungen von Untertiteln aus Filmen.

Insgesamt enthält das Korpus 1,9 Millionen Übersetzungen, die sich aber stark in ihrer Qualität unterscheiden. Folglich musste eine Auswahl getroffen werden, welche den Standards einer Weiterverarbeitung genügen. Drei Kriterien müssen erfüllt werden:

a) Der Satz muss mindestens eine Adposition enthalten; diese Einschränkung wird im nächsten Kapitel relevant sein.
b) Der Satz darf nicht eine Länge von 12 Tokens überschreiten; der Annotierungsprozess ist zeitaufwändig, sodass kürzere Sätze zu präferieren sind.
c) Alle 150 Sätze werden übersprungen; da benachbarte Sätze der gleichen Filmquelle entstammen, soll so ein Bias aufseiten des Übersetzers verhindert werden.

Alle evaluierten Übersetzungen wurden manuell mit einem binären Flag versehen, welches aussagt, ob sich die jeweilige Übersetzung für weitere Verarbeitungsschritte eignet. Als Konvergenzkriterium wurde gewählt, dass jede Adposition durch mindestens 20 positive Übersetzungen abgedeckt ist. Die Regeln wurden in mehreren Iterationen der Annotierung restriktiver gestaltet und angepasst, sodass nicht alle Sätze in den Trainingsdaten von gleicher Qualität sind. In Einzelfällen wurden aber auch Umschreibungen oder Auslassungen zugelassen, um die Robustheit der Algorithmen sicherzustellen.

Die selektierten Sätze mit positivem Flag wurden dann mithilfe von RFTagger und Concraft morphosyntaktisch annotiert.

: Verteilung der Sätze

| **Kategorie** | **Anzahl** | **Anteil** |
|-|-|-|
| negativ | 261 | 54,26% |
| positiv | 220 | 46,74% |
| **Summe** | **481** | **100%** |

#### Anomalien
Beobachtete Anomalien können zu folgenden Kategorien zusammengefasst werden:

OCR-Fehler
  ~ In manchen Fällen wurden ähnlich aussehende Buchstaben falsch zugeordnet, was auf OCR-Fehler vermuten lässt. Der Buchstabe *l* wird oft mit *I* verwechselt (*SonnenbriIIe*, *woIIen*), während das polnische *ł* manchmal als *l* erkannt wird.
Rechtschreib- und Zeichensetzungsfehler
  ~ Beobachtet wurden übliche Fehler wie *sie/Sie*, *das/dass* und *ss/ß*
Falscher korrespondierender Satz
  ~ Da die Übersetzungen maschinell gefunden wurden, wurde in manchen Fällen der falsche Zielsatz ausgewählt, sodass keine inhaltliche Überdeckung zu beobachten war.
Umgangssprachliche Elisionen
  ~ In der deutschen Version gibt es häufig Vorkommen von Elisionen wie *geh'* statt *gehe*. Da Filme Alltagssprache abdecken sollen, haben sich die Übersetzer manchmal für Elisionen entschieden. Diese führen beim Tagging oft zu Problemen.
Zusätzliche Sätze
  ~ Eine Sprachversion kann zusätzliche Sätze enthalten, die in der anderen fehlen. Es ist zu vermuten, dass sich die Satztrennung (Chunking) an den relativen Anzeigezeiten in den Untertiteln orientiert.
Auslassungen/Einfügungen
  ~ Beim Übersetzen wurden zur Verkürzung Informationen weggelassen oder hinzugefügt.
Zerlegung von Komposita
  ~ Da Deutsch eine kompositareiche Sprache darstellt, müssen Nomina in den Übersetzungen aufgebrochen werden, wenn es kein direktes lexikalisches Pendant gibt.

    (a) Wart ihr Schulfreunde? \
        Byliście kumplami w szkole? (*dt.:* Wart ihr Freunde in der Schule?)

    (b) Meine Hauptquellen ... \
        Moje główne źródła ...

Groß- und Kleinschreibung
  ~ Folgendes Beispiel illustriert, dass je nach Übersetzer unterschiedliche Konventionen Anwendung finden.

     GENUINE Die Geschichte eines Vampirs \
     Genuine: Opowieść wampira

Satzbau
  ~ Der Satzbau ist oft unterschiedlich:

     Ich habe schon viel von Ihnen gehört. \
     Dużo o panu słyszałem. (*dt.:* Viel von Ihnen habe ich gehört.)

Paraphrasen
  ~ Beobachtete Umschreibungen sind zum Beispiel:

    Wir ziehen in den Krieg. \
    Zaczniemy wojnę. (*dt.:* Wir beginnen den Krieg.)

    Er ist völlig fertig. \
    On jest w depresji. (*dt.:* Er ist in Depressionen verfallen.)

    Es klingt nach was Größerem. \
    To coś większego. (*dt.:* Das ist etwas Größeres.)

    Ein Großteil der Übersetzungen sind Umschreibungen. Im Extremfall sind Sätze zwar pragmatisch ähnlich, aber semantisch vollkommen unterschiedlich:

    Glaubst du, Becky ist in Ordnung? \
    Co z Becky? (*dt.:* Was ist mit Becky?)

    Auf diese Distanz. \
    Dobry strzał. (*dt.:* Er hat gut geschossen.)

Von den beiden Sprachversionen $S_1$ und $S_2$ muss die eine nicht zwangsläufig eine direkte Übersetzung der anderen sein:

\begin{displaymath}
    \xymatrix{
        S_1 \ar[r] & S_2 }
\end{displaymath}

\begin{displaymath}
    \xymatrix{
        S_1 & S_2 \ar[l] }
\end{displaymath}

Es ist möglich, dass beide Sätze unabhängig von einem dritten Satz übersetzt wurden:

\begin{displaymath}
    \xymatrix{
            & S_3 \ar[dl] \ar[dr] &   \\
        S_1 &                     & S_2 }
\end{displaymath}

### Einheitenkorpus
Mithilfe einer grafischen Oberfläche wird ein paralleles deutsch-polnisches Einheitenkorpus erstellt. Es ist auf mehreren Ebenen annotiert und umfasst:

1. Hierarchische Unterteilung in Einheiten
2. Abbildung von Einheiten
3. Abhängigkeiten von Einheiten
4. Zuweisung einer Klasse

Die hierarchische Unterteilung bezieht sich sowohl auf die Quell- als auch auf die Zielsprache. Im Folgenden wird lediglich unidirektional mit dem Korpus gearbeitet, sodass die Schritte 2-4 für die Zielsprache nicht wiederholt wurden. Die grafische Oberfläche erlaubt es jedoch, Sätze in der Zielsprache entsprechend zu annotieren.

Schritt 4 wird im nächsten Kapitel erörtert.

#### Regeln
Um bei der Analyse eine höhere Qualität zu gewährleisten, sollten die Trainingsdaten konsistent annotiert werden. Hierfür wurden Regeln etabliert.

(a) Zeichensetzung hat bei Untertiteln keinen nennenswerten semantischen Mehrwert, sodass für diese keine Einheiten erzeugt werden.
(b) In manchen Fällen ist eine paraphrasale Abbildung möglich. Man sollte versuchen, semantisch und grammatikalisch abzubilden, nicht nur lexikalisch. Zum Beispiel, wenn die übersetzte Einheit ein lexikalisch unterschiedliches Verb enthält, dieses aber die gleiche Person enkodiert, dann handelt es sich um eine gültige Abbildung.
(c) Es können mehrere Zieleinheiten potentielle Abbildungen sein. In solchen Fällen sollte die allgemeinste Einheit aus der Zielversion verwendet werden. Bei der Zieleinheit muss sichergestellt werden, dass die abhängende Einheit entsprechend gesetzt ist. Beim Ableiten eines Modells könnten Abhängigkeiten in der Zielsprache berücksichtigt werden.

### Bilinguales Lemma-Korpus
Das bilinguale Lemma-Korpus wurde parallel zum Einheitenkorpus erzeugt. Da nur ein Bruchteil von Lemma-Abbildungen im Wörterbuch dict.cc vorkamen, wurde ein internes Korpus mit allgemeingültigen Lemma-Zuweisungen erstellt. Um den Aufwand zu minimieren, kommt ein Script zum Einsatz, welches mögliche Kandidaten für Lemma-Einträge auf Basis abgebildeter Einheiten generiert. Es wurden auch händisch alternative Übersetzungen ergänzt.

Aktuell enthält das Korpus 700 Einträge.

## Grafische Oberfläche
![Annotierung eines Satzes](images/ui.png)

Die beiden Bäume bezeichnen jeweils den Satz in der Quell- und Zielsprache. Die blaue Markierung deutet auf eine satzinterne Segmentierung hin. Hat dieses Segment einen semantischen Mehrwert, kann es mit einem Doppelklick in eine Einheit expandiert werden. Entsprechend ist dies in dem Beispiel für alle Tokens geschehen mit Ausnahme des Punkts. Um Platz einzusparen, sind die Auswahlboxen unbeschriftet. Von rechts nach links beschreiben sie: (1) abgebildete Einheit, (2) Elterneinheit und (3) semantische Klasse.

Ebenso wurde eine einfache Fehlerdiagnose implementiert, welche alle Sätze nach häufigen Annotierungsfehlern durchsucht. Während der Entwicklung haben sich die Anforderungen zum Aufbau der Trainingsdaten mehrmals geändert. Da keine Überprüfung durch externe Personen stattgefunden hat, konnten so Fehler in älteren Datensätzen entdeckt werden.

Die grafische Oberfläche ist in Scala.js umgesetzt und verwendet das reaktive Web-Framework Widok^[Siehe <http://widok.github.io/>]. Der Code wird nach JavaScript transkompiliert und läuft als native Anwendung mithilfe von node-webkit^[Siehe <http://github.com/rogerwang/node-webkit/>]. Als CSS-Framework kommt Bootstrap 3 zum Einsatz^[Siehe <http://getbootstrap.com/>].

Da die Trainingsdaten in ihrem Umfang begrenzt sind, werden sie als XML-Datei gespeichert und können zu jederzeit komplett im Speicher vorgehalten werden. Bei größeren Datenmengen wäre ein Umbau in eine Server-Client-Lösung denkbar, sodass die Daten direkt in einer Datenbank gespeichert werden.

## Modell für Abbildungen
Es wird ein statistischer Klassifizierer mit den zuvor erstellten Trainingsdaten erzeugt. Zur Vereinfachung des Problems wird davon ausgegangen, dass für die beiden Sprachversionen des Satzes bereits eine vollständige Hierarchie mit Einheiten vorliegt. Das ursprüngliche Problem wird damit reduziert auf ein „sub-tree alignment“. $S$ bzw. $T$ bezeichnen dann die Mengen aller Einheiten des Quellsatzes und Zielsatzes. Es gilt herauszufinden, welche Tupel $(e_1, e_2)$ mit $e_1 \in S$ und $e_2 \in T$ gültige Abbildungen darstellen.

Dazu wird ein Modell mit einer binärer Klasse trainiert. Jede Abbildung aus den Trainingsdaten erhält ein positives Label. Allen anderen $(e_1, e_2)$ wird ein negatives Label zugewiesen (mögliche Kandidaten). Offensichtlich erhält der Klassifizierer so deutlich mehr negative Instanzen als positive. Dieser Weg kann unter Umständen problematisch sein, da sich widersprechende Instanzen entstehen können.

Es wurden Features ausgewählt, welche die lexikalische und grammatikalische Struktur jeder Einheit erfassen, um möglichst gute Kandidaten zu approximieren:

offsetRatio
  ~ Verhältnis der Positionen der ersten Tokens in den beiden Einheiten

    Unter der Annahme, dass die beiden Sätze gleich lang sind
lengthRatio
  ~ Verhältnis der Längen der beiden Einheiten
posSimilarity
  ~ Anteil der gleichen normalisierten POS-Tags

    Unter der Annahme, dass die Wörter in der Übersetzung die gleiche Wortart haben
orthSimilarity
  ~ Anteil der orthographisch gleichen Tokens
lemmaSimilarity
  ~ Anteil der gleichen Lemmas

    Der Beweggrund für dieses Feature ist, dass polnische Namen auch der Deklination unterliegen. Zum Beispiel „Dziękuję Gabrielowi.“ (*dt.:* Ich danke Gabriel.) würde bei orthSimilarity nicht als Übereinstimmung zählen
dictCorrespondences
  ~ Anteil der Einträge im Lemma-Korpus^[komplementiert mit den Einträgen von dict.cc] für alle Token-Kombinationen
sourceChildren
  ~ Anzahl der Kinder in der Quelleinheit
targetChildren
  ~ Anzahl der Kinder in der Zieleinheit
childrenRatio
  ~ Verhältnis von sourceChildren zu targetChildren
depthDiff
  ~ Differenz zwischen der Tiefe beider Einheiten

    Ziel ist, dass Einheiten, die in der Umgebung liegen, zu präferieren sind
depthRatio
  ~ Verhältnis der Tiefen beider Einheiten

## Ergebnisse
### Korpus
Die Daten beziehen sich auf die deutsche Sprachversion.

| **Kategorie** | **Wert**   |
|-----------|--------|
| Anz. Sätze  | 220 |
| Anz. Sätze mit Abbildung(en) | 220 |
| Anz. Einheiten | 2892 |
| Anz. Tokens (Deutsch) | 2220 |
| Anz. Tokens (Polnisch) | 1911 |
| Anz. Abgebildete Einheiten | 1187 |
| Anz. Abhängigkeiten | 196 |
| Max. Tiefe | 5 |
| Max. Kinder/Einheit | 7 |
| Max. Tokens/Einheit | 33 |

### Klassifizierung
Mithilfe der Machine-Learning-Bibliothek Weka 3 wurde ein Modell trainiert^[Siehe <http://www.cs.waikato.ac.nz/ml/weka/>]:

: Korrelation zwischen den Features und der Klasse

| **Feature**         | **Anteil** |
|---------------------|------------|
| childrenRatio       | 0,25462    |
| dictCorrespondences | 0,20784    |
| depthDiff           | 0,19325    |
| posSimilarity       | 0,18537    |
| sourceChildren      | 0,15533    |
| targetChildren      | 0,14271    |
| offsetRatio         | 0,04685    |
| lengthRatio         | 0,02428    |
| depthRatio          | 0,00678    |
| orthSimilarity      | 0,00437    |
| lemmaSimilarity     | 0,00242    |

Offensichtlich sind die Features mit struktureller Ähnlichkeit die stärksten, gefolgt von lexikalischer und grammatikalischer. Ein trainiertes Bayessches Netz hat folgende Eigenschaften^[Die genauen Ergebnisse und Konfiguration findet sich in ``results/``]:

: Performance des Gesamtmodells

| **Klassifizierung** | **Instanzen** | **Anteil**  |
|---------------------|---------------|-------------|
| richtig             | 31650         | 95,7234%    |
| falsch              | 1414          | 4,2766%     |

: Performance der Klassen

| **Klasse**  | **Genauigkeit** | **Sensitivität** |
|---------|-------------|--------------|
| negativ | 99,4%       | 96,1%        |
| positiv | 45%       | 85,3%        |

: Konfusionsmatrix

| **Klasse**  | **negativ** | **positiv**  |
|---------|---------|----------|
| negativ | 30638   | 1239     |
| positiv | 175     | 1012      |

Die Gesamt-Performance des Modells ist vielversprechend. Jedoch ist die relevante Genauigkeit, die der richtigen Klassen, äußerst gering (45%).

## Verbesserungen
Übersetzungen in den Trainingsdaten, welche nicht von hoher Qualität sind, sollten entsprechend markiert werden. Die Modelle könnten so auf einem Unterkorpus trainiert werden, um zu evaluieren, inwiefern schlechte Übersetzungen die Qualität beeinflussen.

### Rückrichtung
Aufgrund der zeitaufwändigen Erstellung der Trainingsdaten wurden lediglich Einheiten in der Richtung von Deutsch nach Polnisch untersucht. Zum Vergleich sollten die Trainingsdaten auch für die Rückrichtung annotiert werden.

### Lemma-Korpus
Das Lemma-Korpus könnte in Anlehnung an PoliMorf erweitert werden, sodass die einzelnen Einträge morphologische Tags erhalten. Ebenso sollten Affixe aufgenommen werden, die häufig als Morphem auftauchen.

### Einheiten-Hierarchie
Derzeit wird die Einheiten-Hierarchie als gegeben vorausgesetzt. Damit auch arbiträre Sätze verarbeiten werden können, sollte ein zu  @Chiang:2007:HPT:1268656.1268659 verwandtes Verfahren implementiert werden. Eine andere Option wäre die Reduktion auf das Segmentierungsproblem^[*engl.* disjoint-set data structure] mit selbst-definierten *constraints*, welche die Nichtüberlappbarkeit von Einheiten und die Eltern-Kind-Beziehung forcieren.

### Lemmas als Einheiten
@DIMA14.329 zeigt, dass Komposita im Deutschen interne Beziehungen aufweisen, welche denen von Präpositionen entsprechen. Wird ein Lemma, das die Segmentierungen widerspiegelt, durch eine Einheit repräsentiert, so könnten die Segmente entsprechend semantisch annotiert werden. Darüber hinaus würde dies die Qualität der Alignments steigern.

(a) Wer pflanzte dieses Ding dem Abgeordneten Albert ins **Hotelzimmer**?
(b) I najważniejsze, jak na Boga, znalazło się w **pokoju** kongresmana. \
    Und das wichtigste ist, wie um Himmels Willen, es seinen Weg in das **Zimmer** des Abgeordneten gefunden hat. (eigentliche Übersetzung)

Mit „Hotelzimmer“ als Einheit, könnte „-zimmer“ nun auf „pokoju“ abgebildet werden.

(a) Wart ihr *Schulfreunde*?
(b) Byliście *kumplami w szkole*?

Bei einem morphologischen Ansatz würde für jedes Token eine Einheit gebildet werden. Die morphologischen Segmente wären Unterteilungen dieser. Den einzelnen Affixen und Morphemen könnten semantische Klassen zugeordnet werden. Beispiel:

(a) Przegadał~<span style="font-variant: small-caps">Temporal/Perdurativity</span>~ cały wieczór.
(b) Er hat den ganzen Abend durchgeredet.

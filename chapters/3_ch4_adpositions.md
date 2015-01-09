# Semantik von Adpositionen
Folgendes Beispiel zeigt die Präposition „in“, mit zwei Abbildungen „w“ und „do“ im Polnischen:

> (a) [*In* den Klöstern im Mittelalter] [eskalierte die Furcht vor dem Teufel] [*in* eine fast hoffnungslose Verzweiflung]. \
> (b) [*W* średniowiecznych klasztorach], [obawa przed diabłem nasilał się] [*do* niemal beznadziejnej rozpaczy].

Die Adposition *in* kann eine Bewegungsrichtung („in die Schule gehen“) oder eine statische Position („in der Schule sein“) angeben. Sie kann aber auch auf eine zeitliche Relation hindeuten („in einer Stunde“). Unter anderem bestimmt der Kasus die Bedeutung einer Adposition. Die grammatikalischen Eigenschaften allein sind nicht dafür ausreichend, um die semantische Funktion korrekt vorherzusagen. In diesem Kapitel betrachte ich das Problem der Polysemie von Adpositionen deshalb im Kontext von CLIR. Es gilt dabei herauszufinden, ob durch Hinzunahme einer zweiten Sprache Adpositionen besser disambiguiert werden können.

## Linguistik
Zu der Gruppe der Adpositionen gehören Präpositionen, Postpositionen und Zirkumpositionen. Adpositionen und grammatikalische Fälle haben denselben Zweck. Arnold M. Zwicky beschreibt das „Prinzip der funktionalen Äquivalenz“ in [@brentari1992joy S. 370] wie folgt: „Everything you can do with adpositions you can do with case inflections, and vice versa.“

Zwischen Adpositionen und Fallflektierungen werden Überlappungen gefunden. Adpositionen werden als getrennte Wörter verstanden, Fallflektierungen hingegen der Morphologie zugeordnet. Linguisten vermuten, dass es sich bei den Affixen ursprünglich um kurze Wörter (vermutlich Klitika) gehandelt hat [@haspelmath09, S. 2].

In indoeuropäischen Sprachen wird eine generelle Tendenz beobachtet, dass Fälle in ihrer Entwicklung aufgelöst und durch Adpositionen ersetzt wurden [@hewson2006case, S. 21]. Eine weitere Folge war die Entwicklung eines Artikelsystems, wie bei Bulgarisch und Mazedonisch. Ungarisch hat neun Fälle, um genaue räumliche Relationen auszudrücken [@haspelmath09, S. 9f]. Dieses Konzept findet sich auch in anderen finno-ugrischen Sprachen.

In der deutschen Sprache haben sich vier Fälle erhalten: Nominativ, Genetiv, Dativ und Akkusativ. Im Polnischen sind es neben diesen Fällen noch Instrumental, Lokativ und Vokativ. In beiden Sprachen kommen Adpositionen zum Einsatz, welche den Fall regieren. Die Semantik der meisten Adpositionen ist überladen, was dazu folgt, dass sie in Abhängigkeit von der Bedeutung unterschiedliche Präferenzen für Fälle haben [@Mehl:1996:PUP:646566.696255]. Es wird in solchen Fällen auch von *casally modulated prepositions* gesprochen [@wiki:casmodprep].

Weiterhin könnten Adpositionen als transitive Adverbien aufgegriffen werden, indem sie Verben, Adjektive oder andere Adverbien qualifizieren [@aubrey10]. Bestimmte Adpositionen können aber auch von transitiven Verben erfordert werden. In Fällen wie *auf etw. antworten* oder *über jdn. schreiben* deuten die Adpositionen auf Argumente der Verben hin. Solche Argumente werden als Präpositionalphrasen bezeichnet (PP). Im Englischen und Deutschen sind Präposition-Nomen-Konstruktionen (PNK)^[*auch:* determinerless PPs] als Spezialform von PP geläufig. Bei PNK handelt es sich häufig um Lexikalisierungen wie *etw. auf Trab bringen*, was erklären könnte, weshalb sie generell weniger Lesarten als andere PP haben.

Dass Adpositionen als Adverb fungieren, bestätigt auch @saint2006syntax [S. 92] am Beispiel von *mit*: „Schröder [...] hat die deutsche Dependance *mit* aufgebaut“. Allerdings unterscheidet sich die Häufigkeitsverteilung von *mit* von Adverbien und ähnelt der von Adverbialpartikeln *hin* und *her*. Vergleichbar ist auch, dass *mit* nicht direkt an das Verb im Satz gebunden ist: „[...] geht man dazu über. Subunternehmer *mit* an Bord zu nehmen“. Zirkumpositionen erlauben das Umschließen von Wörtern durch eine Präposition und eine Postposition: „Messungen können *aus einer Datenbank heraus* parametriert werden“. Postpositionen können wie auch Präpositionen alleine auftreten: „Das größte Potential für die Branche steckt *seiner Ansicht nach* in der Verknüpfung von Firmen“. Offensichtlich können Adpositionen auch aus mehreren zusammengesetzten Wörtern bestehen.

@mueller2011 stellen ein baumbasiertes Annotierungsschema vor, welches sie für 22 deutsche Präpositionen untersucht haben. Dabei unterscheiden sie zwischen PP mit Artikeln, und PNK. Sie beschreiben 27 Kategorien möglicher Bedeutungen auf oberster Ebene. Hier wird unter anderem unterteilt in die Klassen „räumlich“ und „zeitlich“. Für diese Kategorien geben sie auch Entscheidungsbäume an. Mit dem Feature „governed“ markieren sie solche PP, bei denen die Präposition vom lexikalischen Kopf regiert wird. Sie haben beobachtet, dass in manchen Fällen mehrere Bedeutungen eintreten können, sodass ihr Schema auch die Zuweisung mehrerer Kategorien erlaubt:

> Feuer nach~<span style="font-variant: small-caps">temporal/conditional-causal</span>~ Blitzschlag.

@zora99580 evaluiert Features, um die Semantik deutscher Präpositionen zu bestimmen. Für *mit* erreichen sie in der besten Konstellation eine Korrektheit von 51%, für *auf* 81,3%. Sie schlagen die Verwendung von GermaNet vor, sodass verwandte Wörter vom Modell berücksichtigt werden könnten. Ebenso könne ein bilinguales Wörterbuch Informationen über die Valenz von Wörtern liefern. So enthalte dict.cc eine direkte Zuweisung von „auf jdn. warten“ zu „to wait for sb.“.

@kiss-EtAl:2010:POSTERS verwenden logistische Regression, um semantische Features zu bestimmen, welche PNK begünstigen. Für die Präposition *ohne* erreicht das trainierte Modell eine Korrektheit von 87,6% und für *unter* 0,937%.

@lieber2004morphology [S. 105f] beschreibt, die Dimensionalität von PP in Abhängigkeit der Präposition am Beispiel von Englisch. Anhand des Satzes „The insect flew to/onto/into the milk.“ werden verschiedene räumliche Bedeutungen realisiert:

* **Linie:** along
* **Punkte:** at, to
* **Flächen:** on, onto
* **Volumen:** in, into

Eine weitere Eigenschaft ist der „implizite Blickpunkt“ von Adpositionen. Sei $P_s$ ein Ausgangspunkt und $P_t$ ein Zielpunkt sowie einer Laufbahn $T$ zwischen den beiden Punkten, so können Adpositionen eine Position auf $T$ bezeichnen sowie eine Bewegungsrichtung: *from*, *off*, *of* und *out*.

Manche Adpositionen implizieren einen drei-dimensionalen Raum mit einer vertikalen und horizontalen Achse (*up*, *down*, *above* und *below*). Dies erlaubt die Umsetzung relativer Positionen wie *in front of* und *behind*.

Es wird auch unterschieden, ob $P_t$ angestrebt (*toward*, *behind*) oder erreicht (*at*, *to*) wird. Eine Erweiterung wäre, dass keine genaue Angabe hierüber getroffen wird, sondern wie bei *along* der Fokus auf $T$ liegt. Weiterhin besteht die Möglichkeit, das Modell auszuweiten, um auch Klassifizierungen wie *between* abzudecken.

Im Deutschen wird $P_s$ zum Beispiel über *ab* und *von* adressiert, $P_t$ über *bis* und *nach*.

In Anlehnung an Lieber definiert @griesshaber1999 unter anderem folgende vier Objektklassen:

| **Objektklasse** | **Beispiel** | **statisch** | **direktiv** | **ursprungsbestimmt** |
|--------------|----------|----------|----------|-------------------|
| Fläche       | Wiese    | auf      | auf      | von               |
| Raum         | Haus     | in       | in       | aus               |
| Punkt        | $\emptyset$         |$\emptyset$          | nach     | von               |
| Person       | Hans     | bei      | zu       | von               |

Ein Verb kann sowohl trennbar als auch untrennbar sein, und abhängig hiervon kann es eine Bedeutungsänderung zur Folge haben [@dodd2006working]:

(a) Peter *umfuhr* das Verkehrsschild.
(b) Peter *fuhr* das Verkehrsschild *um*.

Auch wenn der Wortstamm der selbe ist (*umfahren*), wird werden die beiden Varianten unterschiedlich betont: (a) 'umfahren, (b) um'fahren.

## Trainingsdaten
Ich habe mich auf folgende deutsche Adpositionen beschränkt:

> an, auf, in, mit, nach, um, zu, über

Die Adpositionen haben eine hohe Anzahl an Vorkommen in dem verwendeten parallelen Korpus. Alle diese Präpositionen tauchen potentiell in Verbindung mit Verben, Adjektiven und Nomina auf. Eine weitere Eigenschaft ist, dass sie direkte lexikalische Äquivalente in der polnischen Sprache haben. Allerdings sei darauf hinzuweisen, dass nicht jede Adposition auch bei identischer Übersetzung zwangsläufig durch eine Adposition im Polnischen ausgedrückt werden muss. Der Instrumentalfall erfordert die Präposition *z* (mit), wenn eine komitative Bedeutung ausgedrückt werden soll:

(1) Idę do sklepu *z siostrą*~<span style="font-variant: small-caps">Instr</span>~. (komitative Bedeutung) \
    Ich gehe *mit meiner Schwester*~<span style="font-variant: small-caps">Dat</span>~ ins Geschäft.
(2) Jadę *autobusem*~<span style="font-variant: small-caps">Instr</span>~. \
    Ich fahre *mit dem Bus*~<span style="font-variant: small-caps">Dat</span>~.

Es werden zwei strukturell ähnliche Dativ-Konstruktionen (*mit etw.*) auf unterschiedliche Arten repräsentiert.

Im Korpus sind Adpositionen unidirektional annotiert. Folglich wird nur untersucht, ob die Hinzunahme der polnischen Sprachversionen ein besseres Modell zur Folge haben. Ein Satz kann mehrere Adpositionen abdecken. Sie verteilen sich wie folgt im Trainingskorpus:

| **Adposition**  | **Anz. Einheiten** |
|-------------|-----------|
| zu|18|
| um|18|
| mit|18|
| nach|19|
| auf|20|
| über|20|
| an|33|
| in|43|
| **Summe**       | **189**       |

Damit Informationen aus dem Korpus zuverlässig extrahiert werden können, muss die Annotierung konsistent durchgeführt werden. Folgende Einschränkungen wurden getroffen:

Präpositionsphrasen müssen einer Einheit entsprechen. Diese Einheit wird weiter unterteilt. Eine Untereinheit ist die Präposition selber. Ist diese ein Argument von einem Verb, muss es auf dieses verweisen. Analog dazu müssen die internen Abhängigkeiten aller anderen Kinder der PP-Einheit gesetzt sein. Entscheidend ist auch, dass die korrespondierende Einheit in der anderen Sprachversion für alle PP-Kinder gesetzt wurden. Abschließend wird dem ersten Kind der PP-Einheit, welches immer die Präposition darstellt (zusammengesetzte Präpositionen werden nicht betrachtet), eine semantische Klasse zugeordnet.

Eine Adposition muss nicht zwangsläufig auch auf eine Adposition abgebildet werden. Es gibt Fälle, in denen ein deutsches Verb eine PP erfordert, im Polnischen jedoch nicht. In solchen Fällen kann die Abbildung leer bleiben und lediglich das Argument abgebildet werden. Ebenso kann unter Umständen auch auf ein Verb abgebildet werden. Die folgende Tabelle gibt an, wie deutschen Adpositionen abgebildet wurden:

| **Deutsch**     | **Polnisch**                  |
|-------------|---------------------------|
| an          | do, na, nad, przed, przez, przy, w |
| auf         |  do, na, w, z                    |
| in          |  do, na, w, za                |
| mit         |  do, od, z                    |
| nach        | do, na, o, po, w, według, za      |
| um          | by, o, około              |
| zu          | aby, by, do, z, za                 |
| über        | na, nad, o, po, ponad, z         |

Zur Verkürzung werden in der Auflistung nur Abbildungen auf Adpositionen, Klitika, Partikel und Konjunktionen berücksichtigt. Wie zu sehen, findet keine bijektive Abbildung statt. Die Präposition *na* (*auf*) wird von mehreren deutschen Präpositionen abgebildet. Es zeigt sich auch, dass im Korpus Adpositionen nicht anhand ihres POS-Tags identifiziert werden, sondern an ihrer Form. *um* muss nicht zwangsläufig eine Adposition sein (Bsp.: *um ... zu*). Daher taucht auch das polnische Pendant *by* auf. Die Tabelle lässt vermuten, dass die Disambiguierung mancher Präpositionen anhand der polnischen Einheit durchaus eine höhere Genauigkeit liefern kann. Zum Beispiel wird *um* durch *około* (*ungefähr*) übersetzt, welches weniger Bedeutungen hat als *um*. Ein anderes Beispiel ist *nach*. Es wird mit *po* übersetzt, was vornehmlich temporal verwendet wird: *po siedemnastej* (*nach 17 Uhr*) bzw. *po pracy* (*nach der Arbeit*).

Neben der lexikalischen Dichotomie könnte auch ein anderer korrespondierender Kasus entscheidend sein:

| **Deutsch**       | **Polnisch**                                                    |
|---------------|-------------------------------------------------------------|
| Nominativ    | Akkusativ, $\varnothing$                                               |
| Genitiv | Instrumental |
| Dativ        | Akkusativ, Genitiv, Instrumental, Lokativ, $\varnothing$ |
| Akkusativ    | Akkusative, Genitiv, Instrumental, Lokativ, $\varnothing$               |
| $\varnothing$ | Akkusativ, Genitiv, Lokativ, Nominativ, $\varnothing$ |

$\varnothing$ bezeichnet das Fehlen eines Falls. Bis auf Vokativ und Dativ wir auf alle polnischen Fälle abgebildet. Insbesondere der deutsche Nominativ und Genetiv könnte eine Verbesserung erhalten.

## Klassifizierungen
Es gibt leider kein Referenzschema zur Annotierung von Adpositionen. In Ahnlehnung an @Mehl:1996:PUP:646566.696255, @duden95 [S. 318 ff], @schroeder87 [S. 39ff] und @mueller2011 benutze ich eine Reihe semantischer Klassen, die hierarchisch gegliedert sind.

### Lokativ
locative
  ~ räumliche Position

locative:static
  ~ Kennzeichnung einer festen räumlichen Position oder Lage (ruhend)

locative:static:inessive
  ~ Position *in* einem Objekt
   - Es gibt ein Maß *in den Dingen*.

locative:static:adessive
  ~ direkter Kontakt mit einem Objekt (*an*, *auf*)
   - Er sitzt *bei seinen Freunden*.
   - Er wohnte *in der Nähe des Bahnhofs*.
   - Und sie hat ihn *am Handgelenk* gepackt.

locative:static:relative
  ~ relative Position zu einem Objekt
   - über, unter, neben

locative:directional
  ~ Position mit Bewegungsrichtung

locative:directional:allative
  ~ Bewegung in Richtung des Objekts
   - *nach Hause* gehen; *in das Haus* bringen
   - Ich hätte *auf Sie* schießen können.
   - Eine Hexe kam *in seine Zelle*, um ihn zu verführen.
   - Der Zug fährt *nach Berlin*.
   - Kommen Sie bitte *in mein Büro*.
   - Ernst fotografiert *mit dem Licht* [@mueller2011].

locative:directional:ablative
  ~ exogene, vom Objekt entfernende Bewegung
   - Er ist *aus Rom* abgereist.
   - Der Ball fliegt *aus dem Fenster*.
   - Der Zug kommt *aus Berlin*.
   - Ernst fotografiert *gegen das Licht* [@mueller2011].

locative:directional:passage
  ~ Bewegung entlang einer Strecke
   - *über die Brücke* gehen
   - *entlang der Brücke* gehen
   - *durch den Tunnel* gehen

locative:directional:local
  ~ lokale Bewegung, in permanenter Relation zu einem Objekt
   - *über der Brücke* kreisen

locative:directional:local:circular
  ~ zirkuläre Bewegung *um* ein Objekt
   - *um 90 Grad* drehen

### Präsenz
Präsenz drückt das Fehlen oder Vorhandensein/Vorkommen einer Sache aus.

instrumental
  ~ Eine Aktivität wird mithilfe eines Objekts ausgeführt (*Womit?*)
   - Er begießt die Blumen *mit der Gießkanne*.

comitative
  ~ Zugehörigkeit, Begleitung (*Mit wem?*)
   - Er ist *in Begleitung seiner Frau*.
   - Sie spielt *mit ihrer Freundin*.

ornative
  ~ Ein Objekt hat eine Eigenschaft oder wird mit etwas ausgestattet (*Womit?*)
   - Er ist ein Mann *mit Humor*.
   - Er begießt die Blumen *mit Wasser*.
   - *Mit ihm* tritt Hoffnung in den Raum.

absessiv
  ~ Fehlen einer Sache
   - ohne, außer, mit Ausnahme von

participation
  ~ Mitwirken, Teilnahme
   - Er nimmt *am Spiel* teil.
   - Er hilft bei den Vorbereitungen *mit*.
   - Schröder [...] hat die deutsche Dependance *mit* aufgebaut.

Die Adposition *mit* erlaubt die Realisierung drei zentraler Bedeutungen, welche folglich durch getrennte Klassen repräsentiert werden:

* Instrumental
* Ornativ
* Komitativ

@dodd2006working motiviert diese Unterteilung mit zwei Sätzen:

(1) Er begießt die Blumen *mit der Gießkanne*. (Instrumental)
(2) Er begießt die Blumen *mit Wasser*. (Ornativ)

Auch wenn sie sich in der Form lediglich durch den Artikel unterscheiden, bezeichnen sie unterschiedliche Konzepte. Ansonsten könnten die beiden Sätze zu einer Parataxe verschmolzen werden: „Er begießt die Blumen mit der Gießkanne und mit Wasser.“ (*)

\

Darüber hinaus kann *mit* Begleitung ausdrücken:

(3) Er geht *mit seiner Frau*. (Komitativ)

### Numerisch
quantifying
  ~ Quantifizieren; Angabe einer Zahl
   - Er hat seine Gegner *mit 100 Soldaten* besiegt.

quantifying:relational
  ~ Zahl in Relation setzen
   - *Über 100 Soldaten* kämpften für ihn.

quantifying:distributive
  ~ Anteil, Verteilung
   - Die Provision fällt *pro verkauftem Artikel* an.
   - *Je drei nicht kollineare Punkte* sind paarweise verschieden.

### Referenz
referential
  ~ ein Objekt wird referenziert

referential:source
  ~ Ein Objekt wird als Ausgangspunkt betrachtet
   - Ich habe *von Ihnen* gehört.

referential:target
  ~ Ein Objekt wird als Zielpunkt betrachtet
   - *auf jdn.* treffen
   - *auf jdn.* stolz sein
   - Hinweis *auf etw.*

### Komparation
superlative:attributive
  ~ wertende, attributive Steigerungsform
   - Er ist *am besten*.
   - *Am wichtigsten* ist: [...].

superlative:propositive
  ~ Vorschlag, Intention
   - *Am besten* hören wir auf.

excessive
  ~ komparative, exzessive Klassifizierung
   - Er ist *zu groß*.

### Sonstige
topical
  ~ thematische, inhaltliche Referenz (*Über? Worüber? Wofür?*)
   - sich *für etw.* schämen
   - *über die Brücke* reden
   - sich *an etw.* erinnern

prefix
  ~ Wenn ein Verb trennbar ist, kann das Präfix als Postposition im Satz auftauchen.
   - Wartet er nicht darauf, sie in Besitz *zu* nehmen?
   - Sieh' dir das *an*. (ansehen)
   - Hören Sie mich *an*. (anhören)

process
  ~ Handlung
   - Ich bin *am Kochen*.

process:onset
  ~ Anfang einer Handlung
   - Ich beginne morgen *mit dem Training*.

modal
  ~ Art und Weise, Mittel (*Wie?*)
   - Sie sprechen *auf Deutsch*.
   - Er geht *in Stiefeln*.
   - Er war *in Schwierigkeiten*.

causal
  ~ Grund, Anlass, Zweck (*Warum? Wodurch?*)
   - Dein Handeln ist *durch Hass* motiviert.
   - dank, zwecks, um

consecutive
  ~ Auswirkung, Folge
   - Was geschieht wirklich *mit Ihnen*?

temporal
  ~ durative/punktuelle Zeitangabe; Uhrzeit, Datum, Dauer, Zeitraum, Zeitrelation (*Wann? Wie lange? Bis wann?*)
   - *über Ostern* wegfahren
   - *In jener Zeit* ging ein Gebot von Kaiser Augustus aus.
   - *In zwei Tagen* fahren sie in den Urlaub.
   - *Am 5. Januar* hat er Geburtstag.

conditional
  ~ Bedingung
   - Wir verlassen *bei schönem Wetter* das Haus.

concessive
  ~ Zugeständnis, Entgegenkommen
   - *Trotz des schönen Wetters* verlassen wir nicht das Haus.

adversative
  ~ Widerspruch
   - *(an-)statt, (ent-)gegen, wider*

comparative
  ~ Als wer/was?
   - Die Sonne ist um ein Vielfaches größer als die Erde.

attributive
  ~ Zuweisung von Eigenschaften bzw. Attributen
   - Catilina besaß „große Geistes- und Körperkraft“.

mirative
  ~ unerwartetes, überraschendes Ereignis; Ausdruck des Unvorbereiteten
   - *auf jdn.* treffen/stoßen
   - *auf etw.* kommen

volitive
  ~ Hoffnung, Wunsch, Angst
   - *Auf Wiedersehen*.

Ein Großteil der hier beschriebenen Klassifizierungen orientieren sich an adverbialen Bestimmungen.

Gemäß @spencer2012clitics [S. 179f] zähle ich *zu* in der Verbindung mit einem Infintiv zu den Präfixen, auch wenn es im STTS als Partikel interpretiert wird^[Laut Spencer: While the English 'to' particle seems to behave like an independent syntactic terminal the German *zu* is clearly a prefix in all its uses. [...] Unlike English 'to', *zu* can never be split from its host verb.].

Zur genaueren temporalen Klassifzierung könnten die Bäume aus @mueller2011 zur Vervollständigung übertragen werden. Eine Trennung, die gemacht werden sollte, ist, ob es sich um ein punktuelles Ereignis handelt oder um einen Zeitraum (durativ).

## Korpusanalyse
Die folgende Tabelle zeigt an, welche Adpositionen in Abhängigkeit der Klasse von den jeweiligen Sprachen belegt werden:

| **Klasse** | **Deutsch** | **Polnisch** |
|--------|---------|----------|
| attributive | auf | z |
| causal | in, mit, um | by, w, z |
| comitative | mit | do, z |
| consecutive | mit | z |
| excessive | zu | za |
| instrumental | an, mit, über | przez |
| locative:directional:allative | an, auf, in, nach, zu | do, na, w, z |
| locative:directional:local | in | w |
| locative:directional:local:circular | um | o |
| locative:directional:passage | über | na, po |
| locative:static:adessive | an, auf | do, na, nad, przed, przy |
| locative:static:inessive | an, auf, in | do, na, w |
| locative:static:relative | in, über | na, nad, w |
| modal | an, in, mit | na, przy, w |
| prefix | an, auf, um, zu | aby, by |
| process | an, mit |  |
| process:onset | mit | od |
| quantifying:relational | um, über | około, ponad |
| referential | nach, um, über | o, z |
| referential:target | an, auf, in, nach, um | do, na, w, za |
| superlative:attributive | an |  |
| temporal | an, in, nach, um | do, o, po, w, za |
| topical | nach, über | o, według, z |
| volitive | auf | do |

### Schwierigkeiten
Beim Annotieren wurde das obige Tagset kontinuierlich erweitert und Unterschiede zwischen Klassen verfeinert. Es hat sich als problematisch erwiesen, dass einer Einheit nur ein Tag zugewiesen werden kann. In den folgenden Fällen gibt es je nach Lesart kein eindeutiges Tag. Einige solcher Sätze führe ich hier auf:

- **Satz 32:** „Sobald wir daran vorbei sind, greifen wir den Hügel *an*.“ \
  *Möglichkeiten:* prefix oder referential:target
- **Satz 51:** „Dein Vater hat mir gesagt, dass du mich *zu dem Gefallenen* bringen kannst.“ \
  *Möglichkeiten:* **(a)** locative:directional:allative, **(b)** locative:direktional:Passage oder **(c)** referential:target \
  Je nachdem, ob der Fokus **(a)** das Erreichen des Ziels, **(b)** das Hinführen oder **(c)** das statische Ziel (*der Gefallene*) ist
- **Satz 70:** „Die Mitglieder sind *in drei Kategorien* eingeteilt: Könige, Herolde und Pursuivants.“ \
  Die Wahl fiel auf modal, wobei eine andere Klasse den Sinn besser treffen könnte.
- **Satz 71:** „Ich hätte *auf Sie* schießen können.“ \
  *Möglichkeiten:* **(a)** locative:directional:allative oder **(b)** referential:target \
  *Interpretation:* **(a)** Treffen des Ziels; **(b)** Bewegungsrichtung des Schießens
- **Satz 72:** „Es ist *in der Ferne* hinter mir.“ \
  Das Nomen *Ferne* lässt eine relative Position (locative:static:relative) vermuten. Eine andere Interpretierung wäre, die Ferne als statische Position zu interpretieren (locative:static:inessive).
- **Satz 85:** „Wir werden bestimmt *auf Klingonen* treffen.“ \
  *Möglichkeiten:* referential:target oder mirative \
  Die Präposition *auf* löst bei manchen Bewegungsverben einen Effekt des Unerwarteten aus; andere Beispiele neben *treffen* sind *kommen* und *stoßen*.
- **Satz 90:** „Aber *am wichtigsten* ist [...]“ \
  *Möglichkeiten:* superlative:attributive und modal
- **Satz 103:** „*In diesem Fall* [...] würde ich dich gerne heiraten.“ \
  causal wirkt am passendsten.
- **Satz 115:** „[Ich werde] mich gleich *an diesen IQ-Verstärker* setzen.“ \
  Die Konnotation von *an* ist einerseits der Beginn der Arbeit (process:onset), das physische Sitzen *an* dem Verstärker (locative:static:adessive), oder, dass sich die Person lediglich damit beschäftigt (referential:target).
- **Satz 136**: „Was geschieht wirklich *mit Ihnen*?“ \
  Aufgrund des Verbs *geschehen* lässt sich eine Änderung (und im übertragenen Sinne eine Folge -- consecutive) aufseiten des Gesprächspartners vernehmen.
- **Satz 165:** „Sag ihr, ich kümmere mich *um* sie.“ \
  Die Klassifizierung als referential:target wirkt sehr allgemein.
- **Satz 168:** „Werden Sie *nach dem Krieg* wieder zurückkehren nach Amerika?“ \
  Hier wurde temporal zugewiesen, wobei die PP eher eine Relation zu einem Ereignis (*Kriegsende*) aufbaut.
- **Satz 170:** „Wir ließen ein SOS *über Yos Sender* ab.“ \
  modal oder instrumental
- **Satz 192:** „Hier kommt niemand ran, ohne *über* was zu stolpern.“ \
  *über etw. stolpern* ist entweder mirative oder locative:static:relative. Letzteres wirkt wahrscheinlicher.
- **Satz 206:** „Da fühlt man diese Nervosität. Da *am Telefon*.“ \
  *Am Telefon* wird in der polnischen Fassung mit *przez telefon* (*über das Telefon*) übersetzt, was modal oder instrumental impliziert.
- **Satz 211:** „Weil ich zuviel *über die Wahrheit* weiß.“ \
  topical oder referential

Eventuell könnten Inklusionsbeziehungen einige der Mehrdeutigkeiten reduzieren. Derzeit werden die Klassen als getrennt gewertet. Tatsächlich ist dies nicht für alle Klassen gewährleistet; instrumental könnte als Konkretisierung von modal gesehen werden. Die Klasse prefix hat keinen semantischen Mehrwert und sollte zugunsten genauerer Klassifizierungen aufgelöst werden.

## Modell
Für das Modell werden automatisch alle Einheiten untersucht, denen eine Klassifizierung zugeordnet wurde. Es werden aber nur solche Einheiten gefiltert, bei denen die Adposition einer der oben genannten entspricht. Für alle anderen ist nicht sichergestellt, dass es ausreichend Instanzen gibt.

Mithilfe von Pattern-Matching werden die POS-Tags in eine Klassenhierarchie übertragen, welche möglichst genau die Spezifitäten der beiden Sprachen berücksichtigt. Auch, wenn derzeit nur POS und Kasus extrahiert werden, so wäre eine Erweiterung auf andere morphologische Informationen wie Polarität, Person, Anzahl etc. problemlos möglich. Um das Modell einfacher zu halten, wird hierauf vorerst verzichtet.

### Deutsch
Für Deutsch wurden folgende Features definiert:

deLemma
  ~ Lemma der Adposition
dePOS
  ~ POS der Adposition
deArgumentPOS
  ~ POS des Arguments
deArgumentCase
  ~ Kasus des Arguments
deDependencyLemma
  ~ Lemma der abhängigen Einheit
deDependencyPOS
  ~ POS der abhängigen Einheit

### Polnisch
Wegen der unidirektionalen Annotationen sind für das Polnische weniger Features verfügbar:

plLemma
  ~ Lemma der Adposition
plPOS
  ~ POS der Adposition
plCase
  ~ Kasus der Adposition
plArgumentPOS
  ~ POS des Arguments

Dass im Polnischen der Kasus der Adposition verwendet wird, während im Deutschen der Kasus vom Argument, liegt daran, dass RFTagger nicht den Kasus für Adpositionen bestimmt. Diese Information lässt sich aber aus dem Argument extrahieren.

### Auswertung
Es wurden drei Modelle mit Weka trainiert: (1) <span style="font-variant: small-caps">adpositions-de</span>, (2) <span style="font-variant: small-caps">adpositions-pl</span> und (3) <span style="font-variant: small-caps">adpositions-de-pl</span>. Ich verwende jeweils Cross-Validation mit 10 Faltungen. Zunächst die Korrelations-Rankings der einzelnen Modelle:

: Korrelation der Features von <span style="font-variant: small-caps">adpositions-de</span>

| **Feature**           | **Anteil**    |
|-------------------|------------|
| dePOS             | 0,2517     |
| deArgumentCase    | 0,1753     |
| deLemma           | 0,1351     |
| deArgumentPOS     | 0,1217     |
| deDependencyPOS   | 0,0723     |
| deDependencyLemma | 0,0625       |

: Korrelation der Features von <span style="font-variant: small-caps">adpositions-pl</span>

| **Feature**           | **Anteil**    |
|-------------------|------------|
| plCase            | 0,157      |
| plPOS             | 0,149      |
| plArgumentPOS     | 0,1184     |
| plLemma           | 0,0865     |

: Korrelation der Features von <span style="font-variant: small-caps">adpositions-de</span>

| **Feature**           | **Anteil**    |
|-------------------|------------|
| dePOS             | 0,2517     |
| deArgumentCase    | 0,1753     |
| plCase            | 0,157      |
| plPOS             | 0,149      |
| deLemma           | 0,1351     |
| deArgumentPOS     | 0,1217     |
| plArgumentPOS     | 0,1184     |
| plLemma           | 0,0865     |
| deDependencyPOS   | 0,0723     |
| deDependencyLemma | 0,0625     |

Es ist zu sehen, dass auch nach Kombinieren weiterhin die deutschen Features ausschlaggebend sind. Allerdings zeigen insbesondere der polnische Kasus und das POS-Tag einen entscheidenden Mehrwert. Beide Features haben sogar eine stärkere Korrelation als manche deutsche Features.

Da alle Features nominal sind, bieten sich Entscheidungsbäume an. In manuellen Tests lieferte LMT die besten Ergebnisse [@Landwehr2005; @Sumner2005]:

: Präzision aller Modelle im Vergleich

| **Modell** | **LMT** |
|--------|-----|-----|
| <span style="font-variant: small-caps">adpositions-de</span> | 53,43% |
| <span style="font-variant: small-caps">adpositions-pl</span> | 47,09% |
| <span style="font-variant: small-caps">adpositions-de-pl</span> | 62,43% |

Die Parameter, die Aufbrechung der Präzision für alle Klassen sowie die Konfusions-Matrizen für die trainierten Modelle finden sich im Ordner ``results/``.

Die Ergebnisse zeigen, dass die Ausnutzung von Redundanzen durch eine zweite Sprache deutlich bessere Klassifizierer zur Folge haben kann.

## Ausblick
Um die Qualität des Klassifizierers weiter zu verbessern, findet sich potential aufseiten der Annotierung und beim Extrahieren der Features.

Oben wurden einige Schwierigkeiten beim Annotieren erwähnt. Dass einer Einheit nur eine semantische Klasse zugeordnet werden kann, hat sich als limitierend erwiesen. Wie bei @mueller2011 sollten also mehrere semantische Klassen möglich sein.

Eine weitere Optimierung von @mueller2011 könnte eine strikte Trennung von PP und PNK haben. Bei ausreichend vielen Trainingsdaten könnten dann zwei getrennte Modelle trainiert und kombiniert werden (*ensemble learning*).

Beim Annotieren sollten lexikalisierte Adpositionen bestehend aus mehr als nur einem Token berücksichtigt werden. Zirkumpositionen sollten gezielt betrachtet werden, da für diese zusätzliche Features hinzugefügt werden können. Die Einführung eines Flags, um welche Art von Adposition (Prä-, Post-, Zirkum- oder Ambiposition) es sich handelt, könnte auch einen Unterschied machen.

Da nach @griesshaber1999 bestimmte Präpositionen Objektklassen motivieren, gilt dies genauer zu untersuchen. Das Tagset könnte entsprechend erweitert werden.

Das aktuelle Korpus ist klein und umfasst nur einen Bruchteil der möglichen Bedeutungen der Präpositionen. Für repräsentativere Ergebnisse müsste es auch auf andere Textsorten ausgeweitet werden. Kontrahierte Präpositionen sollten ebenfalls Teil der Untersuchungen sein.

Ferner könnte jede Übersetzung mit einem Flag über ihre Allgemeingültigkeit annotiert werden. Dann könnten die Informationen aus den Übersetzungen automatisch zurück in das Lemma-Korpus fließen und ein deutsch-polnisches Wörterbuch, welches vollständig mit Beispielen versehen ist, wäre mit folgenden Informationen generierbar:

1) Morphologische Informationen
2) Valenz: PP-Informationen
3) Lexikalisierungen
4) Satzbeispiele

In Anlehnung an @zora99580 könnte dict.cc dazu dienen, fehlende Informationen zu Argumenten zu finden. Ebenso sollte die Trennbarkeit von Verben festgehalten werden. Weitere Informationen können von OpenThesaurus.de, Wiktionary.org, DobrySłownik.pl bezogen werden. Da Synonyme ähnliche Konzepte bezeichnen, sollte evaluiert werden, inwiefern sich Objektklassen über solche Korpora bestimmen lassen.

Bei der Feature-Extrahierung könnte die Verwendung eines bilingualen, morphologischen Lemma-Korpus mit PP-Informationen wertvoll sein.

@zora99580 erwähnt darüber hinaus die Einführung eines lexikalischen Netzwerks. Da die definierten Klassen einen starken semantischen Bezug haben, könnten Hinweise auf die Wortbedeutung hilfreich sein. Solche sind sowohl für Deutsch als auch für Polnisch erhältlich [@Hamp97germanet; @HENRICH10.264; @plwordnet2].

Die polnischen Übersetzungen sollten auch vollständig annotiert und die Ergebnisse für die Rückrichtung ausgewertet werden. Hier sei zu prüfen, ob die semantischen Klassen, wie sie für die deutsche Sprachversion gesetzt wurden, auch im gleichen Umfang für die polnische gelten und inwiefern die Klassifikationen unter- bzw. oberspezifizierend sind.

Aktuell werden nur Adpositionen annotiert. Da jeder Einheit eine Klasse zugewiesen werden kann, könnten die Annotierungsmuster auf andere Bereiche ausgeweitet werden. Nicht jede Adposition wird zwangsläufig auf eine Adposition abgebildet. Möglich sind auch Abbildungen auf Verben. Bei Verben findet das Konzept der Aktionsarten Anwendung. Verben könnten also in der Zielsprache annotiert werden. @houtzagers2008dutch [S. 109] greift das Prinzip der Perdurativität auf. So ist das Präfix *prze-* (*dt.:* durch) im Polnischen ein Indikator für eine temporale Bedeutung. Eine Möglichkeit wäre also das separate Betrachten von Verbpräfixen. Im Deutschen findet dies derzeit nur statt, wenn das Präfix im Satz getrennt vorkommt.

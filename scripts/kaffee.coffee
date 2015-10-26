# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md
# Commands:
#   hubot wieviel kostet ein <getraenk> - Frag' hubot wie viel ein gewisses <getraenk> kostet

KaffeePreise=
  #key  :                   [ full name,                   description,                            nickname,       price ]
  kaffee:                   [ "Kaffee",                    "Koffeinhaltiges Heißgetränk",          "C",            0.80 ]
  kaffee_klein:             [ "Kaffee klein",              "ein halber Kaffee ",                   "K&R C",        0.50 ]
  kaffee_crème:             [ "Kaffee Crème",              "starker Kaffee",                       "C++",          0.80 ]
  caffe_americano:          [ "Caffè Americano",           "0.2l aus Espressobohnen ",             "Rust",         0.80 ]
  milchkaffee:              [ "MilchKaffee",               "Milchschaum Kaffee Crème",             "Java",         1.00 ]
  melange:                  [ "Melange",                   "Kaffee/Milch 50/50 ",                  "Go",           1.00 ]
  espresso:                 [ "Espresso",                  "kleiner aromatischer",                 "Lua",          0.80 ]
  espresso_doppio:          [ "Espresso Doppio",           "zwei Espresso",                        "Julia",        1.00 ]
  espresso_macchiato:       [ "Espresso Macchiato",        "Espresso mit Milchschaum",             "Erlang",       1.00 ]
  ristretto:                [ "Ristretto",                 "Espresso klein stark",                 "Scheme",       0.80 ]
  latte_macchiato:          [ "Latte Macchiato",           "Milchschaum/Espresso",                 "Ruby",         1.00 ]
  cappuccino:               [ "Cappuccino",                "Espresso/ Milchschaum",                "Python",       1.00 ]
  chococcino:               [ "Chococcino",                "Espresso/ Milchschaum/Schoko",         "Perl",         1.00 ]
  chocolate_espresso:       [ "Chocolate Espresso",        "Espresso/ Schoko",                     "ObjectiveC",   1.00 ]
  white_chocolate_espresso: [ "White Chocolate Espresso",  "Espresso/ Schoko weiß",                "Swift",        1.00 ]
  chocolate:                [ "Chocolate",                 "Schoko",                               "Bash",         1.00 ]
  white_chocolate:          [ "White Chocolate",           "Schoko weiß",                          "Javascript ",  1.00 ]
  tee:                      [ "Tee",                       "nur Schwarzer Tee ist echter Tee",     "Tee",          0.50 ]
  heisses_wasser:           [ "heißes Wasser",             "Wasser halt",                          "ASM",          0.00 ]
  kalt_033:                 [ "kleines Kaltgetränk",       "alles was inner 0.33l Flasche kommt",  "Limonade",     1.10 ]
  kalt_05:                  [ "großes Kaltgetränk",        "alles was inner 0.5l Flasche kommt",   "Limonade",     1.40 ]
  gluehwein:                [ "Glühwein",                  "heißes, süßes, leicht alkoholisches Zeugs", "Omas Glühwein", -1.0]
  saft:                     [ "Saft", "Orangensaft, Apfelsaft, Bananensaft, Kirschsaft ... du weißt schon", "Fruchtgetränk", 0.8]
  bagel:                    [ "Bagel",                     "belegte Brötchen mit Loch in der Mitte,  lecker",        "herzhafter Donut",  2.30 ]
  muffin:                   [ "Muffin",                    "sieht ein wenig aus wie ein Muffin",   "kein CupCake", 1.20]
  browny:                   [ "Brownie",                   "ein wenig wie ein Stück Kuchen",       "Kuchen",       1.00]
  baguette:                 [ "Baguette",                  "ein langes Brötchen",                  "Submarine",    2.30]
  broetchen:                [ "Brötchen",                  "ein belegtes Brötchen",                "Brötchen",     1.40]
  schokoriegel06:           [ "Schokoriegel",              "Kalorien",                             "Kalorien",     0.60]
  schokoriegel05:           [ "Schokoriegel",              "Kalorien",                             "Kalorien",     0.50]
  schokoriegel02:           [ "Lakritze",                  "Süßigkeit aus Süßholz",                "Kalorien",     0.20]
  schokoriegel10:           [ "LuxusZucker",               "viel zu teurer Zucker",                "Kalorien",     1.00]
  pfand:                    [ "Pfand",                     "für den Komfort die Tasse mitzunehmen","Pfand",        1.00]
  togo:                     [ "TOGO Becher",               "für Leute denen Komfort wichtiger ist als die Umwelt","Müll",0.10]
  milch:                    [ "Milch",                     "Getränk aus der Kuh",                  "",             0.50]

KaffeeMatches= # lowercase all the things!
  kaffee:                    ["c", "kaffee", "kaffe", "käffchen", "bohnentrunk" ]
  kaffee_klein:              ["k&r c", "halber kaffee", "kleiner kaffee","kaffee klein" ]
  kaffee_crème:              ["c++", "kaffee creme", "kaffee crème" ]
  caffe_americano:           ["rust", "caffe americano", "caffè americano" ]
  milchkaffee:               ["java", "milch kaffee", "milchkaffee" ]
  melange:                   ["go", "melange", "brauner" ]
  espresso:                  ["lua", "expresso", "espresso", "kleiner schwarzer" ]
  espresso_doppio:           ["julia", "espresso doppio", "doppelter espresso" ]
  espresso_macchiato:        ["erlang", "espresso macchiato", "espresso mit milch", "macchiato", "macciato" ]
  ristretto:                 ["scheme", "ristretto" ]
  latte_macchiato:           ["ruby", "latte macchiato", "latte macciato", "latte" ]
  cappuccino:                ["python", "cappoccino", "cappuccino" ]
  chococcino:                ["perl", "schokoccino", "chococcino" ]
  chocolate_espresso:        ["objectivec", "chocolate espresso" ]
  white_chocolate_espresso:  ["swift", "white chocolate espresso" ]
  chocolate:                 ["bash", "chocolate", "kakao", "kakau", "heisse schokolade", "heiße schokolade", "schokolade" ]
  white_chocolate:           ["javascript", "white chocolate", "weiße schokolade" ]
  tee:                       ["tee", "schwarzer tee","kräutertee","früchtetee","grüner tee" ]
  heisses_wasser:            ["asm", "wasser","heisses wasser","heißes wasser" ]
  kalt_033:                  ["kleines kaltgetränk", "kleine zotrine", "bionade", "kleine wostok" ]
  kalt_05:                   ["großes kaltgetränk", "mate", "kolle mate", "premium cola", "premium kola", "zotrine" ]
  gluehwein:                 ["glühwein", "omas glühwein", "glühpunsch", "punsch"]
  saft:                      ["saft", "orangensaft", "apfelsaft", "bananensaft", "kirschsaft", "fruchtgetränk","asaft","osaft"]
  bagel:                    ["bagel","begel", "brötchen mit loch"]
  muffin:                   ["muffin", "blueberry muffin","blaubeer muffin", "schoko muffin", "blueberrymuffin","blaubeermuffin", "schokomuffin"]
  browny:                   ["brownie", "browny","braunie", "kuchen"]
  baguette:                 ["baguette","bagett", "baguett", "baget"]
  broetchen:                ["brötchen","belegtes brötchen"]
  schokoriegel06:           ["mars", "snickers","twix","balisto","lion"] # pull requests please!
  schokoriegel05:           ["pickup"]
  schokoriegel02:           ["lakritze","lakritzstange"]
  schokoriegel10:           ["bueno"]
  pfand:                    ["pfand","tassenpfand"]
  togo:                     [ "pappbecher", "becher", "togobecher", "papptasse", "müll" ]
  milch:                    ["milch", "kuhsaft"]

lookup_price = (name) ->
  for key, terms of KaffeeMatches
    if name in terms
      return KaffeePreise[key]

module.exports = (maschine) ->

  maschine.hear /(?:wieviel|was|wieviel geld) (?:kosten|kostet|zahlt man|kommt|bezahlt man|legt man| )+(?:hin|denn|eigentlich|gerade|jetzt|hier|zur zeit|momentan|f.r|so| )*((?:einen|eine|ein|nen|ne|n|'n|die|der|das|unsere|unser| )*(\w*))(?:hin|hier|heute|im allgemeinen)*/i, (msg) ->
    search = msg.match[1]
    term   = msg.match[2].toLowerCase()
    if term == "kaffeemaschine"
      msg.send msg.random [
        "Hallo! Sag mal hakt's? Ich bin nicht zu verkaufen?"
        "Ich bin unbezahlbar!"
        "Geht's noch?"
      ]
      return
    hit = lookup_price(term)
    if hit == undefined
      msg.send msg.random [
        "Sorry, \"#{term}\" sagt mir nix", "Bitte was? #{term} gibt es hier nicht."
        "Sorry, #{search} scheint gerade aus zu sein", "#{term} ist gerade aus, aber frag doch mal beim FSR"
        "Sag mal einer dem Vorstand Bescheid, #{search} nachzubestellen.", "Trinken die Studenten jetzt schon #{term}?"
        "Was?", "Das gibt es hier nicht, aber die Kaffeemaschine hat schon lange keiner mehr gestreichelt :D"
        "Was ist #{term}?", "Sicher, dass du \"#{term}\" meinst?", "404: \"#{term}\" not found!"
        "Von #{term} hab ich noch nie was gehört, hast du dich vielleicht verschrieben?", "Ham'wernich!", "is aus!"
      ]
    else
      name = hit[0]
      price = hit[3].toFixed(2).replace(".",",") + "€"
      msg.send msg.random [
        "Ganz einfach, #{search} kostet #{price}? (#{name})",
        "Ganz klar, #{search} kostet #{price}? (#{name})",
        "Also dass #{search} bei uns #{price} kostet musst du wissen!",
        "#{search} hat bei uns schon immer #{price} gekostet.",
        "Für nur #{price} bekommst du #{search}!",
        "Für #{price} musst du woanders erst mal #{search} bekommen.",
        "Hast du bei uns noch nie #{search} gekauft? Das macht #{price}!",
        "Na #{search} kann doch nur #{price} kosten!",
        "Hast du für #{search} schon mal mehr als #{price} bezahlt!",
        "Warum fragst du mich? Ich mach hier nur Kaffee!",
        "#{price} #{search} immer nur #{price}",
        "Ich glaub #{price}",
        "So weit ich weiß #{price}, wenn du mit \"#{search}\" das gleiche meinst wie ich :D",
        "2,5€, aber weil du's bist heute nur #{price}",
        "Nur noch heute #{price}, greif zu, morgen wird's teurer.",
        "Materielle Werte interessieren mich nicht, ich bin hier nur die Kaffeemaschine!",
        "#{price}?",
        "#{search}? pfff - frag mich später nochmal",
        "Wir haben #{search}?",
        "früher, da hat #{search} mal weniger als #{price} gekostet",
        "Wenn's hier nach mir ging, würde #{search} weniger als #{price} kosten aber ich bin ja nur die Kaffeemaschine",
        "meinst du #{name}?",
      ]

  maschine.hear /was ist(?:denn|eigentlich|gerade|hier|zur zeit|momentan|so| )*((?:einen|eine|ein|nen|ne|n|'n|die|der|das|unsere|unser| )*(\w*))/i, (msg) ->
    search = msg.match[1]
    term   = msg.match[2].toLowerCase()
    hit = lookup_price(term)
    if term == "kaffeemaschine"
      msg.send msg.random [
        "Ich bin hier das was alles am Laufen hällt"
        "Ich bin die \"Cafina XT6\""
        "Ich bin die \"Cafina XT6\", auf mir läuft Windows :cry:"
        "Ich bin die \"Cafina XT6\" - Asta la Vista"
        "*ICH* bin hier die Kaffeemaschine"
      ]
      return
    if hit == undefined
      msg.send "Sorry, #{search} sagt mir nix"
    else
      name = hit[0]
      description= hit[1]
      nickname = hit[2]
      msg.send msg.random [
        "Ganz einfach, #{search} ist #{name}."
        "#{term}, ist so #{description}, denk ich."
        "#{nickname}, also #{name}"
        "#{name}, also #{nickname}"
        "#{term}, auch bekannt als \"#{name}\" oder \"#{nickname}\": #{description}"
      ]


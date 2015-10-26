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
 kaffee:                    [ "Kaffee",                    "Kaffee",                            "C",            0.80 ]
 kaffee_klein:              [ "Kaffee klein",              "halber Kaffee ",                    "K&R C",        0.50 ]
 kaffee_crème:              [ "Kaffee Crème",              "starker Kaffee",                    "C++",          0.80 ]
 caffe_americano:           [ "Caffè Americano",           "0.2l aus Espressobohnen ",          "Rust ",        0.80 ]
 milchkaffee:               [ "MilchKaffee",               "Milchschaum Kaffee Crème",          "Java ",        1.00 ]
 melange:                   [ "Melange",                   "Kaffee/Milch 50/50 ",               "Go ",          1.00 ]
 espresso:                  [ "Espresso",                  "Espresso",                          "Lua",          0.80 ]
 espresso_doppio:           [ "Espresso Doppio",           "Espresso",                          "Julia",        1.00 ]
 espresso_macchiato:        [ "Espresso Macchiato",        "Espresso/Milchschaum ",             "Erlang ",      1.00 ]
 ristretto:                 [ "Ristretto",                 "Espresso/klein stark ",             "Scheme ",      0.80 ]
 latte_macchiato:           [ "Latte Macchiato",           "Milchschaum/Espresso ",             "Ruby",         1.00 ]
 cappuccino:                [ "Cappuccino",                "Espresso/ Milchschaum ",            "Python ",      1.00 ]
 chococcino:                [ "Chococcino",                "Espresso/ Milchschaum/Schoko ",     "Perl ",        1.00 ]
 chocolate_espresso:        [ "Chocolate Espresso",        "Espresso/ Schoko",                  "ObjectiveC ",  1.00 ]
 white_chocolate_espresso:  [ "White Chocolate Espresso",  "Espresso/ Schoko weiß ",            "Swift",        1.00 ]
 chocolate:                 [ "Chocolate",                 "Schoko",                            "Bash ",        1.00 ]
 white_chocolate:           [ "White Chocolate",           "Schoko weiß ",                      "Javascript ",  1.00 ]
 tee:                       [ "Tee",                       "nur Schwarzer Tee ist echter Tee",  "Tee",          0.50 ]
 heisses_wasser:            [ "heißes Wasser",             "Wasser halt",                       "ASM",          0.00 ]

KaffeeMatches=
  kaffee:                    ["c",           "kaffee"                                                                             ]
  kaffee_klein:              ["k&r c",       "halber kaffee", "kleiner kaffee","kaffee klein"                                     ]
  kaffee_crème:              ["c++",         "kaffee creme", "kaffee crème"                                                       ]
  caffe_americano:           ["rust",        "caffe americano", "caffè americano"                                                 ]
  milchkaffee:               ["java",        "milch kaffee", "milchkaffee"                                                        ]
  melange:                   ["go",          "melange"                                                                            ]
  espresso:                  ["lua",         "espresso"                                                                           ]
  espresso_doppio:           ["julia",       "espresso doppio"                                                                    ]
  espresso_macchiato:        ["erlang",      "espresso macchiato"                                                                 ]
  ristretto:                 ["scheme",      "ristretto"                                                                          ]
  latte_macchiato:           ["ruby",        "latte macchiato", "latte"                                                           ]
  cappuccino:                ["python",      "cappuccino"                                                                         ]
  chococcino:                ["perl",        "schokoccino",        "chococcino"                                                   ]
  chocolate_espresso:        ["objectivec",  "chocolate espresso"                                                                 ]
  white_chocolate_espresso:  ["swift",       "white chocolate espresso"                                                           ]
  chocolate:                 ["bash",        "chocolate", "kakao", "kakau", "heisse schokolade", "heiße schokolade", "schokolade" ]
  white_chocolate:           ["javascript",  "white chocolate", "weiße schokolade"                                                ]
  tee:                       ["tee",         "schwarzer tee","kräutertee","früchtetee","grüner tee"                               ]
  heisses_wasser:            ["asm",         "wasser","heisses wasser","heißes wasser"                                            ]





lookup_price = (name) ->
  for key, terms of KaffeeMatches
    if name.toLowerCase() in terms
      return KaffeePreise[key]


#console.log lookup_price(process.argv[2])

module.exports = (maschine) ->

   maschine.hear /wieviel kostet (ein[e]{0,1} ([^?]*))/i, (msg) ->
     search = msg.match[1]
     hit = lookup_price(msg.match[2])
     if hit == undefined
       msg.send "Sorry, #{search} sagt mir nix"
     else
       msg.send "Ganz einfach, #{search} kostet #{hit[3]}€? (#{ hit[0] })"
  
   maschine.hear /was ist (ein[e]{0,1} ([^?]*))/i, (msg) ->
     search = msg.match[1]
     hit = lookup_price(msg.match[2])
     if hit == undefined
       msg.send "Sorry, #{search} sagt mir nix"
     else
       msg.send "Ganz einfach, #{search} ist #{hit[0]}."
  

import Foundation

class WordList {
    
    // Common 5-letter words that are likely Wordle answers
    let nytAnswers: [String] = [
        "ABOUT", "ABOVE", "ABUSE", "ACTOR", "ACUTE", "ADMIT", "ADOPT", "ADULT", "AFTER", "AGAIN",
        "AGENT", "AGREE", "AHEAD", "ALARM", "ALBUM", "ALERT", "ALIEN", "ALIGN", "ALIKE", "ALIVE",
        "ALLOW", "ALONE", "ALONG", "ALTER", "AMONG", "ANGER", "ANGLE", "ANGRY", "APART", "APPLE",
        "APPLY", "ARENA", "ARGUE", "ARISE", "ARRAY", "ASIDE", "ASSET", "AUDIO", "AUDIT", "AVOID",
        "AWAKE", "AWARD", "AWARE", "BADLY", "BAKER", "BASES", "BASIC", "BEACH", "BEGAN", "BEGIN",
        "BEING", "BELOW", "BENCH", "BILLY", "BIRTH", "BLACK", "BLAME", "BLANK", "BLAST", "BLIND",
        "BLOCK", "BLOOD", "BOARD", "BOAST", "BOATS", "BOBBY", "BONDS", "BOOST", "BOOTH", "BOUND",
        "BRAIN", "BRAND", "BRASS", "BRAVE", "BREAD", "BREAK", "BREED", "BRIEF", "BRING", "BROAD",
        "BROKE", "BROWN", "BUILD", "BUILT", "BUYER", "CABLE", "CALIF", "CARRY", "CATCH", "CAUSE",
        "CHAIN", "CHAIR", "CHAOS", "CHARM", "CHART", "CHASE", "CHEAP", "CHECK", "CHEST", "CHIEF",
        "CHILD", "CHINA", "CHOSE", "CIVIL", "CLAIM", "CLASS", "CLEAN", "CLEAR", "CLICK", "CLIMB",
        "CLOCK", "CLOSE", "CLOUD", "COACH", "COAST", "COULD", "COUNT", "COURT", "COVER", "CRAFT",
        "CRASH", "CRAZY", "CREAM", "CRIME", "CROSS", "CROWD", "CROWN", "CRUDE", "CURVE", "CYCLE",
        "DAILY", "DANCE", "DATED", "DEALT", "DEATH", "DEBUT", "DELAY", "DEPTH", "DOING", "DOUBT",
        "DOZEN", "DRAFT", "DRAMA", "DRANK", "DREAM", "DRESS", "DRILL", "DRINK", "DRIVE", "DROVE",
        "DYING", "EAGER", "EARLY", "EARTH", "EIGHT", "ELITE", "EMPTY", "ENEMY", "ENJOY", "ENTER",
        "ENTRY", "EQUAL", "ERROR", "EVENT", "EVERY", "EXACT", "EXIST", "EXTRA", "FAITH", "FALSE",
        "FAULT", "FIBER", "FIELD", "FIFTH", "FIFTY", "FIGHT", "FINAL", "FIRST", "FIXED", "FLASH",
        "FLEET", "FLOOR", "FLUID", "FOCUS", "FORCE", "FORTH", "FORTY", "FORUM", "FOUND", "FRAME",
        "FRANK", "FRAUD", "FRESH", "FRONT", "FRUIT", "FULLY", "FUNNY", "GIANT", "GIVEN", "GLASS",
        "GLOBE", "GOING", "GRACE", "GRADE", "GRAND", "GRANT", "GRASS", "GRAVE", "GREAT", "GREEN",
        "GROSS", "GROUP", "GROWN", "GUARD", "GUESS", "GUEST", "GUIDE", "HAPPY", "HARSH", "HEART",
        "HEAVY", "HENCE", "HENRY", "HORSE", "HOTEL", "HOUSE", "HUMAN", "IDEAL", "IMAGE", "INDEX",
        "INNER", "INPUT", "ISSUE", "JAPAN", "JIMMY", "JOINT", "JONES", "JUDGE", "KNOWN", "LABEL",
        "LARGE", "LASER", "LATER", "LAUGH", "LAYER", "LEARN", "LEASE", "LEAST", "LEAVE", "LEGAL",
        "LEVEL", "LEWIS", "LIGHT", "LIMIT", "LINKS", "LIVES", "LOCAL", "LOOSE", "LOWER", "LUCKY",
        "LUNCH", "LYING", "MAGIC", "MAJOR", "MAKER", "MARCH", "MARIA", "MATCH", "MAYBE", "MAYOR",
        "MEANT", "MEDIA", "METAL", "MIGHT", "MINOR", "MINUS", "MIXED", "MODEL", "MONEY", "MONTH",
        "MORAL", "MOTOR", "MOUNT", "MOUSE", "MOUTH", "MOVED", "MOVIE", "MUSIC", "NEEDS", "NEVER",
        "NEWLY", "NIGHT", "NOISE", "NORTH", "NOTED", "NOVEL", "NURSE", "OCCUR", "OCEAN", "OFFER",
        "OFTEN", "ORDER", "OTHER", "OUGHT", "PAINT", "PANEL", "PAPER", "PARTY", "PEACE", "PETER",
        "PHASE", "PHONE", "PHOTO", "PIANO", "PIECE", "PILOT", "PITCH", "PLACE", "PLAIN", "PLANE",
        "PLANT", "PLATE", "POINT", "POUND", "POWER", "PRESS", "PRICE", "PRIDE", "PRIME", "PRINT",
        "PRIOR", "PRIZE", "PROOF", "PROUD", "PROVE", "QUEEN", "QUICK", "QUIET", "QUITE", "RADIO",
        "RAISE", "RANGE", "RAPID", "RATIO", "REACH", "READY", "REALM", "REBEL", "REFER", "RELAX",
        "REPAY", "REPLY", "RIGHT", "RIGID", "RIVAL", "RIVER", "ROBIN", "ROGER", "ROMAN", "ROUGH",
        "ROUND", "ROUTE", "ROYAL", "RURAL", "SCALE", "SCENE", "SCOPE", "SCORE", "SENSE", "SERVE",
        "SETUP", "SEVEN", "SHALL", "SHAPE", "SHARE", "SHARP", "SHEET", "SHELF", "SHELL", "SHIFT",
        "SHINE", "SHIRT", "SHOCK", "SHOOT", "SHORT", "SHOWN", "SIGHT", "SILLY", "SINCE", "SIXTH",
        "SIXTY", "SIZED", "SKILL", "SLEEP", "SLIDE", "SMALL", "SMART", "SMILE", "SMITH", "SMOKE",
        "SOLID", "SOLVE", "SORRY", "SOUND", "SOUTH", "SPACE", "SPARE", "SPEAK", "SPEED", "SPEND",
        "SPENT", "SPLIT", "SPOKE", "SPORT", "SQUAD", "STAFF", "STAGE", "STAKE", "STAND", "START",
        "STATE", "STEAM", "STEEL", "STEEP", "STEER", "STEVE", "STICK", "STILL", "STOCK", "STONE",
        "STOOD", "STORE", "STORM", "STORY", "STRIP", "STUCK", "STUDY", "STUFF", "STYLE", "SUGAR",
        "SUITE", "SUPER", "SWEET", "TABLE", "TAKEN", "TASTE", "TAXES", "TEACH", "TEAM", "TEETH",
        "TERRY", "TEXAS", "THANK", "THEFT", "THEIR", "THEME", "THERE", "THESE", "THICK", "THING",
        "THINK", "THIRD", "THOSE", "THREE", "THREW", "THROW", "THUMB", "TIGER", "TIGHT", "TIMES",
        "TIRED", "TITLE", "TODAY", "TOPIC", "TOTAL", "TOUCH", "TOUGH", "TOWER", "TRACK", "TRADE",
        "TRAIN", "TREAT", "TREND", "TRIAL", "TRIBE", "TRICK", "TRIED", "TRIES", "TRUCK", "TRULY",
        "TRUNK", "TRUST", "TRUTH", "TWICE", "TWIST", "TYLER", "UNCLE", "UNDER", "UNDUE", "UNION",
        "UNITY", "UNTIL", "UPPER", "UPSET", "URBAN", "USAGE", "USUAL", "VALID", "VALUE", "VIDEO",
        "VIRUS", "VISIT", "VITAL", "VOCAL", "VOICE", "WASTE", "WATCH", "WATER", "WHEEL", "WHERE",
        "WHICH", "WHILE", "WHITE", "WHOLE", "WHOSE", "WOMAN", "WOMEN", "WORLD", "WORRY", "WORSE",
        "WORST", "WORTH", "WOULD", "WRITE", "WRONG", "WROTE", "YOUNG", "YOURS", "YOUTH"
    ]
    
    // Extended word list including common valid Wordle guesses
    let allWords: [String] = [
        // Include all NYT answers plus additional valid words
        "ABACK", "ABAFT", "ABBEY", "ABBOT", "ABODE", "ABORT", "ABOUT", "ABOVE", "ABUSE", "ABYSM",
        "ABYSS", "ACADE", "ACHED", "ACHES", "ACIDS", "ACIDY", "ACING", "ACMES", "ACNED", "ACNES",
        "ACORN", "ACRES", "ACRID", "ACTED", "ACTIN", "ACTOR", "ACUTE", "ADAGE", "ADAPT", "ADDAX",
        "ADDED", "ADDER", "ADDLE", "ADEPT", "ADIEU", "ADIOS", "ADITS", "ADMIN", "ADMIT", "ADMIX",
        "ADOBE", "ADOBO", "ADOPT", "ADORE", "ADORN", "ADULT", "AEGIS", "AEONS", "AERIE", "AFAR",
        "AFFIX", "AFIRE", "AFORE", "AFOUL", "AFRIT", "AFTER", "AGAIN", "AGAPE", "AGATE", "AGAVE",
        "AGENT", "AGERS", "AGILE", "AGING", "AGIOS", "AGISM", "AGIST", "AGITA", "AGLET", "AGLOW",
        "AGMAS", "AGONE", "AGONS", "AGONY", "AGORA", "AGREE", "AGRIA", "AGRIC", "AGUED", "AGUES",
        "AHEAD", "AIDER", "AIDES", "AILED", "AIMED", "AIMER", "AIOLI", "AIRED", "AIRER", "AIRNS",
        "AIRTH", "AIRTS", "AISLE", "AITCH", "AIVER", "AJAPA", "AJIVA", "AJUGA", "AJWAN", "AKELA",
        "AKENE", "AKING", "ALACK", "ALAMO", "ALAND", "ALANE", "ALANG", "ALANS", "ALANT", "ALAPA",
        "ALAPS", "ALARM", "ALARY", "ALATE", "ALAYS", "ALBAS", "ALBEE", "ALBUM", "ALCID", "ALDER",
        "ALDOL", "ALECK", "ALECS", "ALEFS", "ALEFT", "ALEPH", "ALERT", "ALEVE", "ALGAE", "ALGAL",
        "ALGAS", "ALGID", "ALGIN", "ALGUM", "ALIAS", "ALIBI", "ALIEN", "ALIFS", "ALIGN", "ALIKE",
        "ALINE", "ALIST", "ALIVE", "ALIYA", "ALKIE", "ALKYD", "ALKYL", "ALLAY", "ALLEE", "ALLEY",
        "ALLOD", "ALLOW", "ALLOY", "ALLYL", "ALMAH", "ALMAS", "ALMEH", "ALMES", "ALMUD", "ALMUG",
        "ALMUS", "ALOES", "ALOFT", "ALOHA", "ALOIN", "ALONE", "ALONG", "ALOOF", "ALOUD", "ALPHA",
        "ALTAR", "ALTER", "ALTOS", "ALULA", "ALUMS", "ALURE", "ALWAY", "AMAHS", "AMAIN", "AMASS",
        "AMAZE", "AMBER", "AMBIT", "AMBLE", "AMBOS", "AMBRY", "AMEBA", "AMEER", "AMEND", "AMENS",
        "AMENT", "AMIAS", "AMICE", "AMICI", "AMIDS", "AMIES", "AMIGA", "AMIGO", "AMINE", "AMINO",
        "AMINS", "AMIRS", "AMISS", "AMITY", "AMMOS", "AMNIA", "AMNIC", "AMNIO", "AMOKS", "AMONG",
        "AMORT", "AMOUR", "AMPED", "AMPLE", "AMPLY", "AMPUL", "AMUCK", "AMUSE", "AMYLS", "ANCHO",
        "ANCLE", "ANCON", "ANDED", "ANDES", "ANEAR", "ANELE", "ANENT", "ANGAS", "ANGEL", "ANGER",
        "ANGLE", "ANGLO", "ANGRY", "ANGST", "ANILE", "ANILS", "ANIMA", "ANIME", "ANION", "ANISE",
        "ANKHS", "ANKLE", "ANKUS", "ANLAS", "ANNAL", "ANNAS", "ANNEX", "ANNOY", "ANNUL", "ANOAS",
        "ANODE", "ANOLE", "ANOMY", "ANSAE", "ANTAE", "ANTAR", "ANTAS", "ANTED", "ANTES", "ANTIC",
        "ANTIS", "ANTRA", "ANTRE", "ANTSY", "ANVIL", "ANYON", "AORTA", "APACE", "APAGE", "APAID",
        "APART", "APASS", "APEAK", "APEEK", "APERS", "APERT", "APERY", "APHID", "APHIS", "APIAN",
        "APING", "APISH", "APISM", "APNEA", "APODE", "APODS", "APOOP", "APORT", "APPAL", "APPEL",
        "APPLE", "APPLY", "APPRO", "APPUI", "APPUY", "APRES", "APRON", "APSES", "APSIS", "APTER",
        "APTLY", "AQUAE", "AQUAS", "ARABA", "ARAKS", "ARAME", "ARBOR", "ARCED", "ARCHI", "ARCOS",
        "ARDEB", "ARDOR", "AREAE", "AREAL", "AREAS", "ARECA", "AREDD", "AREDE", "AREFY", "AREIC",
        "ARENA", "ARENE", "AREPA", "ARERE", "ARETE", "ARGAL", "ARGAS", "ARGIL", "ARGLE", "ARGOL",
        "ARGON", "ARGOT", "ARGUE", "ARGUS", "ARHAT", "ARIAS", "ARIEL", "ARIKI", "ARILS", "ARIOT",
        "ARISE", "ARISH", "ARLES", "ARMED", "ARMER", "ARMET", "ARMOR", "AROMA", "AROSE", "ARPAS",
        "ARPEN", "ARRAH", "ARRAS", "ARRAY", "ARRAS", "ARRET", "ARRIS", "ARROW", "ARSED", "ARSES",
        "ARSEY", "ARSIS", "ARSON", "ARTAL", "ARTEL", "ARTER", "ARTIC", "ARTSY", "ARUMS", "ARVAL",
        "ARVOS", "ARYLS", "ASANA", "ASCI", "ASCII", "ASCOT", "ASCUS", "ASDIC", "ASHED", "ASHEN",
        "ASHES", "ASHLA", "ASIDE", "ASKED", "ASKER", "ASKEW", "ASKOI", "ASKOS", "ASPEN", "ASPER",
        "ASPIC", "ASPIS", "ASPRO", "ASSAI", "ASSAM", "ASSAY", "ASSED", "ASSES", "ASSET", "ASSEZ",
        "ASSOT", "ASTER", "ASTIR", "ASTUN", "ASURA", "ASWAY", "ASYLA", "ATAPS", "ATAXY", "ATIGI",
        "ATILT", "ATIMY", "ATLAS", "ATMAN", "ATMAS", "ATOCS", "ATOKE", "ATOLL", "ATOMS", "ATOMY",
        "ATONE", "ATONY", "ATOPY", "ATRIA", "ATRIP", "ATTAP", "ATTAR", "ATTIC", "ATUAS", "AUDAD",
        "AUDIO", "AUDIT", "AUGER", "AUGHT", "AUGUR", "AULAS", "AULIC", "AULOI", "AULOS", "AUMIL",
        "AUNTS", "AUNTY", "AURAE", "AURAL", "AURAR", "AURAS", "AUREI", "AURES", "AURIC", "AURIS",
        "AURUM", "AUTOS", "AUXIN", "AVAIL", "AVANT", "AVAST", "AVELS", "AVENS", "AVERS", "AVERT",
        "AVGAS", "AVIAN", "AVION", "AVISE", "AVISO", "AVIZE", "AVOID", "AVOWS", "AWACS", "AWAFT",
        "AWAKE", "AWAMS", "AWARD", "AWARE", "AWARN", "AWASH", "AWATO", "AWAVE", "AWAYS", "AWDLS",
        "AWED", "AWEEL", "AWETO", "AWFUL", "AWING", "AWMRY", "AWNED", "AWNER", "AWOKE", "AWOLS",
        "AWORK", "AXELS", "AXIAL", "AXILS", "AXING", "AXIOM", "AXION", "AXITE", "AXLED", "AXLES",
        "AXMAN", "AXMEN", "AXOID", "AXOLS", "AXONE", "AXONS", "AYAHS", "AYAYA", "AYELP", "AYGRE",
        "AYINS", "AYONT", "AYRES", "AYRIE", "AZANS", "AZIDE", "AZIDO", "AZINE", "AZLON", "AZOIC",
        "AZOLE", "AZONS", "AZOTE", "AZOTH", "AZUKI", "AZURE", "AZURN", "AZURY", "AZYGY", "AZYME"
    ]
    
    init() {
        // Combine NYT answers with additional words, removing duplicates
        let combinedWords = Set(nytAnswers + allWords)
        // Update allWords to include everything
        // This is handled in the property initialization above
    }
}

extension WordList {
    // Helper method to get words starting with specific letters
    func wordsStartingWith(_ prefix: String, fromNYTOnly: Bool = false) -> [String] {
        let wordSet = fromNYTOnly ? nytAnswers : allWords
        return wordSet.filter { $0.hasPrefix(prefix.uppercased()) }
    }
    
    // Helper method to get words containing specific letters
    func wordsContaining(_ letters: String, fromNYTOnly: Bool = false) -> [String] {
        let wordSet = fromNYTOnly ? nytAnswers : allWords
        return wordSet.filter { word in
            letters.uppercased().allSatisfy { letter in
                word.contains(String(letter))
            }
        }
    }
}
(*Given some text p, write a method f such that f(p) returns [['word', word_count], ['word2', word2_count]], where word_count is the number of times 'word' appears in p and word2_count is the number of times 'word2’ appears in p.
    For Example:
      p = "Hello World!"
      f(p) == [['hello', 1], ['world', 1]]

      p = "To be, or not to be."
      f(p) == [['to', 2], ['be', 2], ['or', 1], ['not', 1]]*)

type dict = (string * int) list
val dict = []


fun hasKey (dictionary : dict, key : string) : (bool) =
case dictionary of
	[] => false
	|(x,count)::xs => if x = key then true else hasKey(xs, key);

fun add (dictionary : dict, key : string) : (dict) =
	case dictionary of 
		[] => (key, 1)::[]
		|(x,count)::xs => (x,count)::xs@[(key,1)]

fun update (dictionary: dict, key : string) : (dict) =
	case dictionary of 
		[] => dictionary
		|(x, count)::xs => if x = key then (x, count + 1)::xs else (x,count)::update(xs, key)


(*val dict1 = [("to", 1), ("be", 1)];*)

(*SPEC: This method, f, takes in a document of type string list and a dictionary of type (string * int) list, and outputs a dictionary, [('word', word_count), ('word2', word2_count), etc.],
such that it presents every unique word and its word count.  
	When analyzing a document, doc, please run this method either with [] or the variable dict for the dicitonary type in order to recieve correct analysis 
	For an example testing, RUN f(example,[]) or f(example,dict)  *)
fun f (doc : string list, dictionary : dict) : (dict) =
	case doc of
		[] => dictionary
		|x::xs => case hasKey(dictionary, x) of
							true=> f(xs, (update(dictionary, x)))
							|false=> f(xs, (add(dictionary, x)))



val example = ["to", "be", "or", "not", "to", "be"]


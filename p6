<html>
  <head>
  <style>
    #header {
    background-color:black;
    color:rgb(255,204,229);
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    width:100px;
    height:900px;
    float:left;
    padding:5px; 
}
#section {
    width:350px;
    float:left;
    padding:10px; 
}
#section2 {
    width:350px;
    float:left;
    padding:10px; 
    margin-left:70px;
}
#footer {
    background-color:black;
    color:rgb(255,204,229);
    clear:both;
    text-align:center;
    padding:5px; 
}
  </style>
  </head>

<body>
  <div id="header">
    <h1 style="text-align:center;"><font face="verdana">Project #100</font></h1>
    </div>
    
  <div id="nav">
    <a href="http://franchescapena.github.io/index.html">Home</a>
  </div>
    
<div id="section">
<h2>Google Coding Challenge</h2>
<p>Below is a coding challenge I received from Google Career Bytes.</p>
<img src="google_challenge.png" alt="terminal icon" style="width:500px;height:350px;">

<h2>My Approach</h2>
<p>I solved the challenge using Java. You can run my program with a string, sentence, and it will return the sentence with the correct spaces
in between the words.</p>
<h3>A breakdown of the code</h3>
<p>I start with three empty strings, test1 and test2 for testing substrings and finalString for the final output. First, I trace through the sentence, considering all the possible substrings for the first word. Next I test whether each substring is a word by checking if it is in the provided dictionary. Then comes a slight nuance. Next I check
if that word is a complete valid word or a smaller valid word within a larger valid word. Example: my code must not put a space after favor if the intended word is favorite. I do this by tracing through the remaining part of the sentence
(the part after the substring being tested), if i can trace through this remaining string and not find another valid word then we have the case of a smaller valid within a larger valid word. Finally I check if the word is the last word of 
the string. If all these conditions are met, I concat the substring plus " " to finalString. Once I have traced through the entire original sentence, I return finalString.
In order to test my method, I created, within the code, a List<String> with arbituuary English words.
Given that the method signature assumes we have a dictionary of all valid English words, I believe, if given that dictonary,
my code and approach would work for any sentence input.</p>

<h2>Some Helpful Links</h2>
<p><a href="http://introcs.cs.princeton.edu/java/15inout/mac-cmd.html">Java and the Mac OS X Terminal</a>
  <br><a href="http://github.com/0nn0/terminal-mac-cheatsheet">Terminal Commands</a></br>
</p>

</div>

<div id="section2">
<h2>Some Visuals</h2>
<p>Where to Find Terminal</p>
<img src="termicon.png" alt="terminal icon" style="width:500px;height:350px;">
<p>An Example of Terminal</p>
<img src="termex1.png" alt="terminal example" width="500" height="350">
</div>

<div id="footer">Contact Me: <a href="mailto:fpenaaa@gmail.com" target="_top">fpenaaa@gmail.com</a></div>

</body>
</html>

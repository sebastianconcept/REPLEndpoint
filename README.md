# REPLEndpoint
A Smalltalk RESTful endpoint that behaves like a REPL on a Pharo image

### What is REPL?
The acronym REPL stands for read-eval-print loop and basically provides a programmer with an Smalltalk interactive programming environment. You can evaluate any Smalltalk snippets with it.

This project makes any Pharo image to have its own REPL. This makes images where the graphical user interface is not available for any reason to be able to interact anyway. For example diagnose or monitor smalltalk resources in a production environment with issues that aren't easily detectable in development environments.
### Installation
From a Pharo workspace evaluate:
```Smalltalk
Metacello new
  baseline: 'REPLEndpoint';
  repository: 'github://sebastianconcept/REPLEndpoint:main';
  load.
```

### Usage
In a workspace start the REPL endpoint with:

```Smalltalk
REPL startOn: 1853.
```

From your local terminal you can hit it with Smalltalk snippets in the plain text payload sending a POST request to `/repl`. For example:

```bash
curl -H "Content-Type: text/plain" --request POST 'http://localhost:1853/repl' --data '6+5'
```

Will return: `11`


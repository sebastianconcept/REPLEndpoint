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

_______

MIT License

Copyright (c) 2020 [Sebastian Sastre](http://sebastiansastre.co)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
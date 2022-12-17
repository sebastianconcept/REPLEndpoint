Smalltalk vm maxExternalSemaphoresSilently: 1024 * 16.
Deprecation showWarning: false.
Smalltalk at: #Compiler put: Smalltalk compiler.

Metacello new
  baseline: 'REPLEndpoint';
  repository: 'github://sebastianconcept/REPLEndpoint:main/src';
  load.

Smalltalk snapshot: true andQuit: true.
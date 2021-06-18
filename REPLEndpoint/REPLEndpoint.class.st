"
Receives the payload sent as POST in `/repl` and returns, as string, the answer of having evaluated it as a snippet.
"
Class {
	#name : #REPLEndpoint,
	#superclass : #ZnJSONRestCall,
	#category : #REPLEndpoint
}

{ #category : #accessing }
REPLEndpoint class >> pattern [
	^ #('repl')
]

{ #category : #public }
REPLEndpoint >> get [
	^ self jsonResponse: 'REPL uses POST to evaluate Smalltalk snippets in this Pharo image'
]

{ #category : #public }
REPLEndpoint >> post [
	| snippet |
	snippet := request entity string.
	^ self jsonResponse: (OpalCompiler new evaluate: snippet) asString
]

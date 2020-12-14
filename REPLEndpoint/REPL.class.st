"
Helper class used both as starting point and access service control
"
Class {
	#name : #REPL,
	#superclass : #Object,
	#classInstVars : [
		'server'
	],
	#category : #REPLEndpoint
}

{ #category : #accessing }
REPL class >> initializeServer [
	server := ZnServer on: 9099.
	server
		delegate:
			(ZnJSONRestServerDelegate new
				uriSpace: REPLRestUriSpace new;
				yourself).
	^ server
]

{ #category : #accessing }
REPL class >> server [
	^ server ifNil: [ self initializeServer ]
]

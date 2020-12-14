"
Helper class used both as starting point and access service control.

A REPL (say it, “REP-UL”) is an interactive way to talk to your computer. To a Pharo image in this case. To make this work, the computer does four things:

Read the user input (your Smalltalk snippets).
Evaluate your code (to work out what you mean).
Print any results (so you can see the computer’s response).
Loop back to step 1 (to continue the conversation).
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

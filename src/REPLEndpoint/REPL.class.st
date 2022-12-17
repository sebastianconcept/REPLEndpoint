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
		'port',
		'server'
	],
	#category : #REPLEndpoint
}

{ #category : #accessing }
REPL class >> envAt: aSymbol ifAbsent: aBlock [
	^ OSEnvironment current at: aSymbol asString ifAbsent: aBlock
]

{ #category : #initializing }
REPL class >> initializePort [
	^ port := self envAt: 'REPL_PORT' ifAbsent: [ 9099 ]
]

{ #category : #accessing }
REPL class >> port [
	^ port ifNil: [ self initializePort ]
]

{ #category : #accessing }
REPL class >> port: anInteger [
	port := anInteger
]

{ #category : #accessing }
REPL class >> server [
	^ server
]

{ #category : #accessing }
REPL class >> start [
	^ self startOn: self port
]

{ #category : #accessing }
REPL class >> startOn: aPort [
	server := ZnServer on: aPort.
	server
		delegate:
			(ZnJSONRestServerDelegate new
				uriSpace: REPLRestUriSpace new;
				yourself).
	^ server start
]

{ #category : #accessing }
REPL class >> stop [
	server ifNotNil: [ server stop ].
	server := nil
]

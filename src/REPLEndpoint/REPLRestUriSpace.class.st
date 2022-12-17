"
URI space handler to match the REPLEndpoint
"
Class {
	#name : #REPLRestUriSpace,
	#superclass : #ZnRestUriSpace,
	#category : #REPLEndpoint
}

{ #category : #public }
REPLRestUriSpace >> match: request [
	(REPLEndpoint match: request)
		ifNotNil: [ :variables | 
			^ REPLEndpoint new
				variables: variables;
				yourself ].
	^ nil
]

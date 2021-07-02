Class {
	#name : #BaselineOfREPLEndpoint,
	#superclass : #BaselineOf,
	#category : #BaselineOfREPLEndpoint
}

{ #category : #baselines }
BaselineOfREPLEndpoint >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self restServer: spec.
			spec
				package: #REPLEndpoint
				with: [ spec requires: #('REPLEndpoint') ] ]
]

{ #category : #baselines }
BaselineOfREPLEndpoint >> restServer: spec [
	spec
		baseline: 'ZincHTTPComponents'
		with: [ spec
				repository: 'github://svenvc/zinc:v3.0.1/repository';
				loads: #('REST') ]
]

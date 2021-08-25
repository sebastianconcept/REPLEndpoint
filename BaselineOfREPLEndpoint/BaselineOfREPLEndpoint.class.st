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
			self setUpPackages: spec ]
]

{ #category : #baselines }
BaselineOfREPLEndpoint >> restServer: spec [
	spec
		baseline: 'ZincHTTPComponents'
		with: [ spec
				repository: 'github://svenvc/zinc:v3.0.1/repository';
				loads: #('REST') ]
]

{ #category : #baselines }
BaselineOfREPLEndpoint >> setUpDependencies: spec [
	self restServer: spec
]

{ #category : #baselines }
BaselineOfREPLEndpoint >> setUpPackages: spec [
	spec
		package: 'REPLEndpoint'
		with: [ spec requires: 'ZincHTTPComponents' ]
]

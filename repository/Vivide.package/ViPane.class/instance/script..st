accessing - kernel
script: step
	
	"For the same script, just force re-evaluation."
	step = self script ifTrue: [^ self updateResults].

	"For a different script, tell the model and update the view."
	self flag: #metaScript.
	self layoutChanged.
			
	self model firstStep: step.
	self updateView.

	"Make all connected panes to fetch all results again, which does not happen through the view."
	self notifyChangedResults.

	"Remember this script."
	self recentScriptsAdd: step.

	"Tell everybody else."
	self flag: #deprecated.
	self scriptChanged: step.
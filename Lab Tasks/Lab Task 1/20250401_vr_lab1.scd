Quarks.install("https://gitlab.com/dxarts/classes/dx462sp25")

Quarks.uninstall("dx462sp25")

SCDoc.indexAllDocuments(true)

Quarks.installed

(10.do({ |increment|
	increment.postln;
})
)
/*
In folder Lab Task 1, create an .scd file (or project folder) as follows:

Choose one project from 461
Update the project to run in real-time
Use iteration to create note events
Use randomness for the synth parameters
Add a synthdef (reverb or something similar) that takes a buss as the source sound
Create a buss and route your iteration notes to the buss and read from the buss with your new synthdef
*/
SCDoc.indexAllDocuments(true);
// (

~server = Server.default;

~n_incr = 5;
~fn_incr = {arg i;
	~synth = CtkSynthDef('sinosc',
		{ |freq = 440|
			Out.ar(0, SinOsc.ar(freq))
	});

	// create and play a note
	~note = ~synth.note(duration: 5.0).play;
}
~n_incr.do(~fn_incr)


/*~server.waitForBoot({

    ~source = CtkSynthDef('source', { |out = 0, freq = 440, amp = 0.5, rate = 0.5|
        var env, src;
        env = EnvGen.kr(Env([0, 0, 1, 0, 0], [0.0, 0.01, rate.reciprocal, 0.0], [-3, 3], 3, 0), levelScale: amp);
        src = SinOsc.ar([freq, freq+1]);
        Out.ar(out, src * env)
    });

    ~reverb = CtkSynthDef('reverb', { |in, out = 0|
        var src;
        src = In.ar(in, 2); // stereo buss
        Out.ar(out, FreeVerb2.ar(src[0], src[1], 0.7, 0.7, 0.2))
    });

    ~server.sync;

    ~audioBuss = CtkAudio.play(2, server: ~server);

    ~reverbNote = ~reverb.note(addAction: 'tail').in_(~audioBuss).play;

    5.do{ |i|
        ~source.note
        .freq_(50.exprand(2000))
        .rate_(0.1.rrand(5.0))
        .amp_(0.05.rrand(0.1))
        .out_(~audioBuss).play;
    }
})*/
// )
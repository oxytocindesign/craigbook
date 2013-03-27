#!/usr/bin/perl
use LWP::Simple;
use HTML::Strip;
use String::Util 'trim';
use DBI;
use File::Copy;
use HTML::Entities;


foreach $url (
'http://auburn.craigslist.org/cpg/index.rss',
'http://birmingham.craigslist.org/cpg/index.rss',
'http://dothan.craigslist.org/cpg/index.rss',
'http://florence.craigslist.org/cpg/index.rss',
'http://gadsden.craigslist.org/cpg/index.rss',
'http://huntsville.craigslist.org/cpg/index.rss',
'http://mobile.craigslist.org/cpg/index.rss',
'http://montgomery.craigslist.org/cpg/index.rss',
'http://tuscaloosa.craigslist.org/cpg/index.rss',
'http://anchorage.craigslist.org/cpg/index.rss',
'http://fairbanks.craigslist.org/cpg/index.rss',
'http://kenai.craigslist.org/cpg/index.rss',
'http://southeast.craigslist.org/cpg/index.rss',
'http://flagstaff.craigslist.org/cpg/index.rss',
'http://mohave.craigslist.org/cpg/index.rss',
'http://phoenix.craigslist.org/cpg/index.rss',
'http://prescott.craigslist.org/cpg/index.rss',
'http://show.craigslist.org/cpg/index.rss',
'http://sierra.craigslist.org/cpg/index.rss',
'http://tucson.craigslist.org/cpg/index.rss',
'http://yuma.craigslist.org/cpg/index.rss',
'http://fayetteville.craigslist.org/cpg/index.rss',
'http://fort.craigslist.org/cpg/index.rss',
'http://jonesboro.craigslist.org/cpg/index.rss',
'http://little.craigslist.org/cpg/index.rss',
'http://texarkana.craigslist.org/cpg/index.rss',
'http://bakersfield.craigslist.org/cpg/index.rss',
'http://chico.craigslist.org/cpg/index.rss',
'http://fresno.craigslist.org/cpg/index.rss',
'http://gold.craigslist.org/cpg/index.rss',
'http://hanford.craigslist.org/cpg/index.rss',
'http://humboldt.craigslist.org/cpg/index.rss',
'http://imperial.craigslist.org/cpg/index.rss',
'http://inland.craigslist.org/cpg/index.rss',
'http://los.craigslist.org/cpg/index.rss',
'http://mendocino.craigslist.org/cpg/index.rss',
'http://merced.craigslist.org/cpg/index.rss',
'http://modesto.craigslist.org/cpg/index.rss',
'http://monterey.craigslist.org/cpg/index.rss',
'http://orange.craigslist.org/cpg/index.rss',
'http://palm.craigslist.org/cpg/index.rss',
'http://redding.craigslist.org/cpg/index.rss',
'http://sacramento.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://santa.craigslist.org/cpg/index.rss',
'http://santa.craigslist.org/cpg/index.rss',
'http://siskiyou.craigslist.org/cpg/index.rss',
'http://stockton.craigslist.org/cpg/index.rss',
'http://susanville.craigslist.org/cpg/index.rss',
'http://ventura.craigslist.org/cpg/index.rss',
'http://visalia.craigslist.org/cpg/index.rss',
'http://yuba.craigslist.org/cpg/index.rss',
'http://boulder.craigslist.org/cpg/index.rss',
'http://colorado.craigslist.org/cpg/index.rss',
'http://denver.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://fort.craigslist.org/cpg/index.rss',
'http://high.craigslist.org/cpg/index.rss',
'http://pueblo.craigslist.org/cpg/index.rss',
'http://western.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://hartford.craigslist.org/cpg/index.rss',
'http://new.craigslist.org/cpg/index.rss',
'http://northwest.craigslist.org/cpg/index.rss',
'http://delaware.craigslist.org/cpg/index.rss',
'http://washington.craigslist.org/cpg/index.rss',
'http://daytona.craigslist.org/cpg/index.rss',
'http://florida.craigslist.org/cpg/index.rss',
'http://fort.craigslist.org/cpg/index.rss',
'http://ft.craigslist.org/cpg/index.rss',
'http://gainesville.craigslist.org/cpg/index.rss',
'http://heartland.craigslist.org/cpg/index.rss',
'http://jacksonville.craigslist.org/cpg/index.rss',
'http://lakeland.craigslist.org/cpg/index.rss',
'http://north.craigslist.org/cpg/index.rss',
'http://ocala.craigslist.org/cpg/index.rss',
'http://okaloosa.craigslist.org/cpg/index.rss',
'http://orlando.craigslist.org/cpg/index.rss',
'http://panama.craigslist.org/cpg/index.rss',
'http://pensacola.craigslist.org/cpg/index.rss',
'http://sarasota.craigslist.org/cpg/index.rss',
'http://south.craigslist.org/cpg/index.rss',
'http://space.craigslist.org/cpg/index.rss',
'http://st.craigslist.org/cpg/index.rss',
'http://tallahassee.craigslist.org/cpg/index.rss',
'http://tampa.craigslist.org/cpg/index.rss',
'http://treasure.craigslist.org/cpg/index.rss',
'http://west.craigslist.org/cpg/index.rss',
'http://albany.craigslist.org/cpg/index.rss',
'http://athens.craigslist.org/cpg/index.rss',
'http://atlanta.craigslist.org/cpg/index.rss',
'http://augusta.craigslist.org/cpg/index.rss',
'http://brunswick.craigslist.org/cpg/index.rss',
'http://columbus.craigslist.org/cpg/index.rss',
'http://macon.craigslist.org/cpg/index.rss',
'http://northwest.craigslist.org/cpg/index.rss',
'http://savannah.craigslist.org/cpg/index.rss',
'http://statesboro.craigslist.org/cpg/index.rss',
'http://valdosta.craigslist.org/cpg/index.rss',
'http://hawaii.craigslist.org/cpg/index.rss',
'http://boise.craigslist.org/cpg/index.rss',
'http://east.craigslist.org/cpg/index.rss',
'http://lewiston.craigslist.org/cpg/index.rss',
'http://twin.craigslist.org/cpg/index.rss',
'http://bloomington.craigslist.org/cpg/index.rss',
'http://champaign.craigslist.org/cpg/index.rss',
'http://chicago.craigslist.org/cpg/index.rss',
'http://decatur.craigslist.org/cpg/index.rss',
'http://la.craigslist.org/cpg/index.rss',
'http://mattoon.craigslist.org/cpg/index.rss',
'http://peoria.craigslist.org/cpg/index.rss',
'http://rockford.craigslist.org/cpg/index.rss',
'http://southern.craigslist.org/cpg/index.rss',
'http://springfield.craigslist.org/cpg/index.rss',
'http://western.craigslist.org/cpg/index.rss',
'http://bloomington.craigslist.org/cpg/index.rss',
'http://evansville.craigslist.org/cpg/index.rss',
'http://fort.craigslist.org/cpg/index.rss',
'http://indianapolis.craigslist.org/cpg/index.rss',
'http://kokomo.craigslist.org/cpg/index.rss',
'http://lafayette.craigslist.org/cpg/index.rss',
'http://muncie.craigslist.org/cpg/index.rss',
'http://richmond.craigslist.org/cpg/index.rss',
'http://south.craigslist.org/cpg/index.rss',
'http://terre.craigslist.org/cpg/index.rss',
'http://ames.craigslist.org/cpg/index.rss',
'http://cedar.craigslist.org/cpg/index.rss',
'http://des.craigslist.org/cpg/index.rss',
'http://dubuque.craigslist.org/cpg/index.rss',
'http://fort.craigslist.org/cpg/index.rss',
'http://iowa.craigslist.org/cpg/index.rss',
'http://mason.craigslist.org/cpg/index.rss',
'http://quad.craigslist.org/cpg/index.rss',
'http://sioux.craigslist.org/cpg/index.rss',
'http://southeast.craigslist.org/cpg/index.rss',
'http://waterloo.craigslist.org/cpg/index.rss',
'http://lawrence.craigslist.org/cpg/index.rss',
'http://manhattan.craigslist.org/cpg/index.rss',
'http://northwest.craigslist.org/cpg/index.rss',
'http://salina.craigslist.org/cpg/index.rss',
'http://southeast.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://topeka.craigslist.org/cpg/index.rss',
'http://wichita.craigslist.org/cpg/index.rss',
'http://bowling.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://lexington.craigslist.org/cpg/index.rss',
'http://louisville.craigslist.org/cpg/index.rss',
'http://owensboro.craigslist.org/cpg/index.rss',
'http://western.craigslist.org/cpg/index.rss',
'http://baton.craigslist.org/cpg/index.rss',
'http://central.craigslist.org/cpg/index.rss',
'http://houma.craigslist.org/cpg/index.rss',
'http://lafayette.craigslist.org/cpg/index.rss',
'http://lake.craigslist.org/cpg/index.rss',
'http://monroe.craigslist.org/cpg/index.rss',
'http://new.craigslist.org/cpg/index.rss',
'http://shreveport.craigslist.org/cpg/index.rss',
'http://maine.craigslist.org/cpg/index.rss',
'http://annapolis.craigslist.org/cpg/index.rss',
'http://baltimore.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://frederick.craigslist.org/cpg/index.rss',
'http://southern.craigslist.org/cpg/index.rss',
'http://western.craigslist.org/cpg/index.rss',
'http://boston.craigslist.org/cpg/index.rss',
'http://cape.craigslist.org/cpg/index.rss',
'http://south.craigslist.org/cpg/index.rss',
'http://western.craigslist.org/cpg/index.rss',
'http://worcester.craigslist.org/cpg/index.rss',
'http://ann.craigslist.org/cpg/index.rss',
'http://battle.craigslist.org/cpg/index.rss',
'http://central.craigslist.org/cpg/index.rss',
'http://detroit.craigslist.org/cpg/index.rss',
'http://flint.craigslist.org/cpg/index.rss',
'http://grand.craigslist.org/cpg/index.rss',
'http://holland.craigslist.org/cpg/index.rss',
'http://jackson.craigslist.org/cpg/index.rss',
'http://kalamazoo.craigslist.org/cpg/index.rss',
'http://lansing.craigslist.org/cpg/index.rss',
'http://monroe.craigslist.org/cpg/index.rss',
'http://muskegon.craigslist.org/cpg/index.rss',
'http://northern.craigslist.org/cpg/index.rss',
'http://port.craigslist.org/cpg/index.rss',
'http://saginaw.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://the.craigslist.org/cpg/index.rss',
'http://upper.craigslist.org/cpg/index.rss',
'http://bemidji.craigslist.org/cpg/index.rss',
'http://brainerd.craigslist.org/cpg/index.rss',
'http://duluth.craigslist.org/cpg/index.rss',
'http://mankato.craigslist.org/cpg/index.rss',
'http://minneapolis.craigslist.org/cpg/index.rss',
'http://rochester.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://st.craigslist.org/cpg/index.rss',
'http://gulfport.craigslist.org/cpg/index.rss',
'http://hattiesburg.craigslist.org/cpg/index.rss',
'http://jackson.craigslist.org/cpg/index.rss',
'http://meridian.craigslist.org/cpg/index.rss',
'http://north.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://columbia.craigslist.org/cpg/index.rss',
'http://joplin.craigslist.org/cpg/index.rss',
'http://kansas.craigslist.org/cpg/index.rss',
'http://kirksville.craigslist.org/cpg/index.rss',
'http://lake.craigslist.org/cpg/index.rss',
'http://southeast.craigslist.org/cpg/index.rss',
'http://springfield.craigslist.org/cpg/index.rss',
'http://st.craigslist.org/cpg/index.rss',
'http://st.craigslist.org/cpg/index.rss',
'http://billings.craigslist.org/cpg/index.rss',
'http://bozeman.craigslist.org/cpg/index.rss',
'http://butte.craigslist.org/cpg/index.rss',
'http://great.craigslist.org/cpg/index.rss',
'http://helena.craigslist.org/cpg/index.rss',
'http://kalispell.craigslist.org/cpg/index.rss',
'http://missoula.craigslist.org/cpg/index.rss',
'http://montana.craigslist.org/cpg/index.rss',
'http://grand.craigslist.org/cpg/index.rss',
'http://lincoln.craigslist.org/cpg/index.rss',
'http://north.craigslist.org/cpg/index.rss',
'http://omaha.craigslist.org/cpg/index.rss',
'http://scottsbluff.craigslist.org/cpg/index.rss',
'http://elko.craigslist.org/cpg/index.rss',
'http://las.craigslist.org/cpg/index.rss',
'http://reno.craigslist.org/cpg/index.rss',
'http://new.craigslist.org/cpg/index.rss',
'http://central.craigslist.org/cpg/index.rss',
'http://jersey.craigslist.org/cpg/index.rss',
'http://north.craigslist.org/cpg/index.rss',
'http://south.craigslist.org/cpg/index.rss',
'http://albuquerque.craigslist.org/cpg/index.rss',
'http://clovis.craigslist.org/cpg/index.rss',
'http://farmington.craigslist.org/cpg/index.rss',
'http://las.craigslist.org/cpg/index.rss',
'http://roswell.craigslist.org/cpg/index.rss',
'http://santa.craigslist.org/cpg/index.rss',
'http://albany.craigslist.org/cpg/index.rss',
'http://binghamton.craigslist.org/cpg/index.rss',
'http://buffalo.craigslist.org/cpg/index.rss',
'http://catskills.craigslist.org/cpg/index.rss',
'http://chautauqua.craigslist.org/cpg/index.rss',
'http://elmira.craigslist.org/cpg/index.rss',
'http://finger.craigslist.org/cpg/index.rss',
'http://glens.craigslist.org/cpg/index.rss',
'http://hudson.craigslist.org/cpg/index.rss',
'http://ithaca.craigslist.org/cpg/index.rss',
'http://long.craigslist.org/cpg/index.rss',
'http://new.craigslist.org/cpg/index.rss',
'http://oneonta.craigslist.org/cpg/index.rss',
'http://plattsburgh.craigslist.org/cpg/index.rss',
'http://potsdam.craigslist.org/cpg/index.rss',
'http://rochester.craigslist.org/cpg/index.rss',
'http://syracuse.craigslist.org/cpg/index.rss',
'http://twin.craigslist.org/cpg/index.rss',
'http://utica.craigslist.org/cpg/index.rss',
'http://watertown.craigslist.org/cpg/index.rss',
'http://asheville.craigslist.org/cpg/index.rss',
'http://boone.craigslist.org/cpg/index.rss',
'http://charlotte.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://fayetteville.craigslist.org/cpg/index.rss',
'http://greensboro.craigslist.org/cpg/index.rss',
'http://hickory.craigslist.org/cpg/index.rss',
'http://jacksonville.craigslist.org/cpg/index.rss',
'http://outer.craigslist.org/cpg/index.rss',
'http://raleigh.craigslist.org/cpg/index.rss',
'http://wilmington.craigslist.org/cpg/index.rss',
'http://winston.craigslist.org/cpg/index.rss',
'http://bismarck.craigslist.org/cpg/index.rss',
'http://fargo.craigslist.org/cpg/index.rss',
'http://grand.craigslist.org/cpg/index.rss',
'http://north.craigslist.org/cpg/index.rss',
'http://akron.craigslist.org/cpg/index.rss',
'http://ashtabula.craigslist.org/cpg/index.rss',
'http://athens.craigslist.org/cpg/index.rss',
'http://chillicothe.craigslist.org/cpg/index.rss',
'http://cincinnati.craigslist.org/cpg/index.rss',
'http://cleveland.craigslist.org/cpg/index.rss',
'http://columbus.craigslist.org/cpg/index.rss',
'http://dayton.craigslist.org/cpg/index.rss',
'http://lima.craigslist.org/cpg/index.rss',
'http://mansfield.craigslist.org/cpg/index.rss',
'http://sandusky.craigslist.org/cpg/index.rss',
'http://toledo.craigslist.org/cpg/index.rss',
'http://tuscarawas.craigslist.org/cpg/index.rss',
'http://youngstown.craigslist.org/cpg/index.rss',
'http://zanesville.craigslist.org/cpg/index.rss',
'http://lawton.craigslist.org/cpg/index.rss',
'http://northwest.craigslist.org/cpg/index.rss',
'http://oklahoma.craigslist.org/cpg/index.rss',
'http://stillwater.craigslist.org/cpg/index.rss',
'http://tulsa.craigslist.org/cpg/index.rss',
'http://bend.craigslist.org/cpg/index.rss',
'http://corvallis.craigslist.org/cpg/index.rss',
'http://east.craigslist.org/cpg/index.rss',
'http://eugene.craigslist.org/cpg/index.rss',
'http://klamath.craigslist.org/cpg/index.rss',
'http://medford.craigslist.org/cpg/index.rss',
'http://oregon.craigslist.org/cpg/index.rss',
'http://portland.craigslist.org/cpg/index.rss',
'http://roseburg.craigslist.org/cpg/index.rss',
'http://salem.craigslist.org/cpg/index.rss',
'http://altoona.craigslist.org/cpg/index.rss',
'http://cumberland.craigslist.org/cpg/index.rss',
'http://erie.craigslist.org/cpg/index.rss',
'http://harrisburg.craigslist.org/cpg/index.rss',
'http://lancaster.craigslist.org/cpg/index.rss',
'http://lehigh.craigslist.org/cpg/index.rss',
'http://meadville.craigslist.org/cpg/index.rss',
'http://philadelphia.craigslist.org/cpg/index.rss',
'http://pittsburgh.craigslist.org/cpg/index.rss',
'http://poconos.craigslist.org/cpg/index.rss',
'http://reading.craigslist.org/cpg/index.rss',
'http://scranton.craigslist.org/cpg/index.rss',
'http://state.craigslist.org/cpg/index.rss',
'http://williamsport.craigslist.org/cpg/index.rss',
'http://york.craigslist.org/cpg/index.rss',
'http://rhode.craigslist.org/cpg/index.rss',
'http://charleston.craigslist.org/cpg/index.rss',
'http://columbia.craigslist.org/cpg/index.rss',
'http://florence.craigslist.org/cpg/index.rss',
'http://greenville.craigslist.org/cpg/index.rss',
'http://hilton.craigslist.org/cpg/index.rss',
'http://myrtle.craigslist.org/cpg/index.rss',
'http://northeast.craigslist.org/cpg/index.rss',
'http://pierre.craigslist.org/cpg/index.rss',
'http://rapid.craigslist.org/cpg/index.rss',
'http://sioux.craigslist.org/cpg/index.rss',
'http://south.craigslist.org/cpg/index.rss',
'http://chattanooga.craigslist.org/cpg/index.rss',
'http://clarksville.craigslist.org/cpg/index.rss',
'http://cookeville.craigslist.org/cpg/index.rss',
'http://jackson.craigslist.org/cpg/index.rss',
'http://knoxville.craigslist.org/cpg/index.rss',
'http://memphis.craigslist.org/cpg/index.rss',
'http://nashville.craigslist.org/cpg/index.rss',
'http://tri.craigslist.org/cpg/index.rss',
'http://abilene.craigslist.org/cpg/index.rss',
'http://amarillo.craigslist.org/cpg/index.rss',
'http://austin.craigslist.org/cpg/index.rss',
'http://beaumont.craigslist.org/cpg/index.rss',
'http://brownsville.craigslist.org/cpg/index.rss',
'http://college.craigslist.org/cpg/index.rss',
'http://corpus.craigslist.org/cpg/index.rss',
'http://dallas.craigslist.org/cpg/index.rss',
'http://deep.craigslist.org/cpg/index.rss',
'http://del.craigslist.org/cpg/index.rss',
'http://el.craigslist.org/cpg/index.rss',
'http://galveston.craigslist.org/cpg/index.rss',
'http://houston.craigslist.org/cpg/index.rss',
'http://killeen.craigslist.org/cpg/index.rss',
'http://laredo.craigslist.org/cpg/index.rss',
'http://lubbock.craigslist.org/cpg/index.rss',
'http://mcallen.craigslist.org/cpg/index.rss',
'http://odessa.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://san.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://texoma.craigslist.org/cpg/index.rss',
'http://tyler.craigslist.org/cpg/index.rss',
'http://victoria.craigslist.org/cpg/index.rss',
'http://waco.craigslist.org/cpg/index.rss',
'http://wichita.craigslist.org/cpg/index.rss',
'http://logan.craigslist.org/cpg/index.rss',
'http://ogden.craigslist.org/cpg/index.rss',
'http://provo.craigslist.org/cpg/index.rss',
'http://salt.craigslist.org/cpg/index.rss',
'http://st.craigslist.org/cpg/index.rss',
'http://vermont.craigslist.org/cpg/index.rss',
'http://charlottesville.craigslist.org/cpg/index.rss',
'http://danville.craigslist.org/cpg/index.rss',
'http://fredericksburg.craigslist.org/cpg/index.rss',
'http://hampton.craigslist.org/cpg/index.rss',
'http://harrisonburg.craigslist.org/cpg/index.rss',
'http://lynchburg.craigslist.org/cpg/index.rss',
'http://new.craigslist.org/cpg/index.rss',
'http://richmond.craigslist.org/cpg/index.rss',
'http://roanoke.craigslist.org/cpg/index.rss',
'http://southwest.craigslist.org/cpg/index.rss',
'http://winchester.craigslist.org/cpg/index.rss',
'http://bellingham.craigslist.org/cpg/index.rss',
'http://kennewick.craigslist.org/cpg/index.rss',
'http://moses.craigslist.org/cpg/index.rss',
'http://olympic.craigslist.org/cpg/index.rss',
'http://pullman.craigslist.org/cpg/index.rss',
'http://seattle.craigslist.org/cpg/index.rss',
'http://skagit.craigslist.org/cpg/index.rss',
'http://spokane.craigslist.org/cpg/index.rss',
'http://wenatchee.craigslist.org/cpg/index.rss',
'http://yakima.craigslist.org/cpg/index.rss',
'http://charleston.craigslist.org/cpg/index.rss',
'http://eastern.craigslist.org/cpg/index.rss',
'http://huntington.craigslist.org/cpg/index.rss',
'http://morgantown.craigslist.org/cpg/index.rss',
'http://northern.craigslist.org/cpg/index.rss',
'http://parkersburg.craigslist.org/cpg/index.rss',
'http://southern.craigslist.org/cpg/index.rss',
'http://west.craigslist.org/cpg/index.rss',
'http://appleton.craigslist.org/cpg/index.rss',
'http://eau.craigslist.org/cpg/index.rss',
'http://green.craigslist.org/cpg/index.rss',
'http://janesville.craigslist.org/cpg/index.rss',
'http://kenosha.craigslist.org/cpg/index.rss',
'http://la.craigslist.org/cpg/index.rss',
'http://madison.craigslist.org/cpg/index.rss',
'http://milwaukee.craigslist.org/cpg/index.rss',
'http://northern.craigslist.org/cpg/index.rss',
'http://sheboygan.craigslist.org/cpg/index.rss',
'http://wausau.craigslist.org/cpg/index.rss',
'http://wyoming.craigslist.org/cpg/index.rss',
'http://guam.craigslist.org/cpg/index.rss',
'http://puerto.craigslist.org/cpg/index.rss',
'http://U.craigslist.org/cpg/index.rss',
'http://calgary.craigslist.org/cpg/index.rss',
'http://edmonton.craigslist.org/cpg/index.rss',
'http://ft.craigslist.org/cpg/index.rss',
'http://lethbridge.craigslist.org/cpg/index.rss',
'http://medicine.craigslist.org/cpg/index.rss',
'http://peace.craigslist.org/cpg/index.rss',
'http://red.craigslist.org/cpg/index.rss',
'http://cariboo.craigslist.org/cpg/index.rss',
'http://comox.craigslist.org/cpg/index.rss',
'http://fraser.craigslist.org/cpg/index.rss',
'http://kamloops.craigslist.org/cpg/index.rss',
'http://kelowna.craigslist.org/cpg/index.rss',
'http://kootenays.craigslist.org/cpg/index.rss',
'http://nanaimo.craigslist.org/cpg/index.rss',
'http://prince.craigslist.org/cpg/index.rss',
'http://skeena.craigslist.org/cpg/index.rss',
'http://sunshine.craigslist.org/cpg/index.rss',
'http://vancouver.craigslist.org/cpg/index.rss',
'http://victoria.craigslist.org/cpg/index.rss',
'http://whistler.craigslist.org/cpg/index.rss'
) {

print "$url\n\n";
if ($url =~ /http\:\/\/(.*).craigslist/)
	{ $file = $1; }
print "$file\n\n";
getstore($url, "rss_feeds/$file");



}



my $db2 = DBI->connect("dbi:SQLite:dbname=temp/ads.db","","");





#set the dir to read from, get an array of it's contents and then change to that directory
$dir = "rss_feeds";
@towns = get_list_from_dir($dir);
chdir "rss_feeds" or die "can't change directory to rss_feeds: $!";






TOWN:
#loops through each rss file
for (@towns) {

	$city = $_;
	#change the file into a string
	$string = file_2_string($_);
	#count the number of rdf rss items
	$numberofitems = number_of_items($string);
	#count the number of actual items
	$numberofitemserrorcheck = number_of_items_check($string);
	
	#compare the two numbers, if they don't match, forget everything and skip to the next file	
	if ($numberofitems != $numberofitemserrorcheck) {
		warn "The count of rdf elements doesn't match the count of actual items in parse.pl!!! :$!";
		next TOWN;
	}
	#check if the number equals zero. If it does forget everything and skip to the next file
	if ($numberofitems == "0") {
		
		next TOWN;
	}
	
	#Get the array of items from the file. (at this point we've counted the items twice
	#and made sure we are balanced by comparing the two...
	#...numbers and making sure they are the same. We've also made sure there is at least one item)
	@chunks = get_chunks($string);





	#get the dates
	$mymonth = month_parsed();
	$yesterday = yesterday();
	$today = today();


$var = "0";

	LABEL:
	for (@chunks) {
		

		$email = undef;
		$link = undef;
		$title = undef;
		$description = undef;
		
		$day = undef;
		$month = undef;
		@newlines = undef;
		$nlref = undef;
		$countoflines = undef;
		$descriptioncode = undef;
		$titlecode = undef;
		
		@newlines = split /\n/, $_;
		shift @newlines;
		$nlref = \@newlines;	
		
		$countoflines = @newlines;
		#print "$countoflines\n";
		

		$day = get_day($nlref);
		$title = get_title($nlref);
		$month = get_month($nlref);
		$link = get_link($nlref);
	
		
		#processing for today's links
		
		if ($day == $today && $month == $mymonth) {
			$html = undef;
			if ($link =~ /(\d{10}.html)/) {
				$file = $1;
				if ($file eq "") {
					print "we fucked your mom";
					next LABEL;
					
					}
				

				$is_success = getstore($link, "/home/jack/Desktop/new_craigslist/webpages/$file");
				(open(MYFILE, "</home/jack/Desktop/new_craigslist/webpages/$file")) or die "wat the fuk";
				while (<MYFILE>) {
					$html .= $_;
					}
				close MYFILE;
					
				if ($html =~ /var displayEmail \= \"(.*)\"\;/) {
					$email = $1;
					if ($email eq "") { 
						#print "we fucked your mom";
						next LABEL; 
						}
					#print "Email is: $email\n";
					}

				if ($html =~ /\<section id\=\"postingbody\"\>(.*)START CLTAGS/s) {
					$description = $1;
					$description =~ s/\012//gi;
					$description =~ s/\011//gi;
					$description = trim($description);
					unless (length $description) { 
							#print "we fucked your mom";
							next LABEL;
							
						}	
					}
				($description, $junk) = split /\<\/section\>/, $description;
					


			

				my $hs = HTML::Strip->new();
				my $description = $hs->parse( $description );
					
				unless (length $description) { 
							#print "we fucked your mom";
							next LABEL;
							
						}
				if ($description =~ /^\s*$/) {
					#print "we fucked your mom";
					next LABEL; 
					}

				unless (length $email) { 
							#print "we fucked your mom";
							next LABEL;
							
						}
				#
				
				$link = trim($link);
				$title = trim($title);	
				$email = trim($email);
				$title =~ s/\///g;
				$title =~ s/\.//g;
				
				$descriptioncode = encode_entities($description, '\0-\377');
				$descriptioncode =~ s/\;//g;
				$substring = substr($descriptioncode, 0 , 500);
				$descriptioncode = $substring;				
				print "Encoded: $descriptioncode\n\n";
				$titlecode = encode_entities($title, '\0-\377');
				$titlecode =~ s/\;//g;
				print "Encoded: $descriptioncode\n\n";
				#

				$table = "today";



				
				$db2->do("CREATE TABLE IF NOT EXISTS $table (title TEXT PRIMARY KEY, email, link, description, descriptioncode, titlecode);") or warn ":$!";
				$st2 = $db2->prepare("insert into $table(title,email,link,description,descriptioncode,titlecode) values(?,?,?,?,?,?);") or warn ":$!";
				$st2->execute($title,$email,$link,$description,$descriptioncode,$titlecode) or warn ":$!";

				#print TODAY "CREATE TABLE $table (\n\ttitle\tTEXT PRIMARY KEY ,\n\temail\tTEXT ,\n\tlink\tTEXT ,\n\tdescription\tTEXT\n);";
				#print TODAY "INSERT INTO $table VALUES (\'$title\', \'$email\', \'$link\', \'$description\');";
				




					#print "$table\nTODAY:\nLink is: \"$link\"\nTitle is: \"$title\"\nEmail is: \"$email\"\nDescription is: \"$description\"\n\n";
				$var++;
				#print "success\n";
				}
			
			}			


		
	

		#processing for yesterday's links
		#print "day: \"$day\"\nyesterday: \"$yesterday\"\n\n";
		if ($day == $yesterday && $month == $mymonth) {
		
		$html = undef;
		if ($link =~ /(\d{10}.html)/) {
			$file = $1;
			if ($file eq "") {
				#print "we fucked your mom hunch";
				next LABEL;
			}
			#print "$link\n";
			#print "$title\n";
			getstore($link, "/home/jack/Desktop/new_craigslist/webpages/$file");
			(open(MYFILE, "</home/jack/Desktop/new_craigslist/webpages/$file")) or die "this is suicide";
			while (<MYFILE>) {
			$html .= $_;
			}
			close MYFILE;
			
			if ($html =~ /var displayEmail \= \"(.*)\"\;/) {
						$email = $1;
						if ($email eq "") { 
							#print "we fucked your mom";
							next LABEL; 
						}
						#print "Email is: $email\n";
					}
			if ($html =~ /\<section id\=\"postingbody\"\>(.*)START CLTAGS/s) {
						$description = $1;
						$description =~ s/\012//gi;
						$description =~ s/\011//gi;
						$description = trim($description);
						unless (length $description) { 
							#print "we fucked your mom";
							next LABEL;
							
						}
						
					}

					($description, $junk) = split /\<\/section\>/, $description;
					



					#CAN'T GET THE FUCKING BR OUT OF DESCRIPTIONS FUCK FUCK FUCK FUCK



					my $hs = HTML::Strip->new();
					my $description = $hs->parse( $description );
					

					unless (length $description) { 
							#print "we fucked your mom";
							next LABEL;
							
						}
				
						unless (length $email) { 
							#print "we fucked your mom";
							next LABEL;
							
						}
				
						$link = trim($link);
						$title = trim($title);	
						$email = trim($email);
					
						$title =~ s/\///g;
						$title =~ s/\.//g;
						
				$descriptioncode = encode_entities($description, '\0-\377');
				$descriptioncode =~ s/\;//g;
				$substring = substr($descriptioncode, 0 , 500);
				
				$descriptioncode = $substring;
				$countlength = length $descriptioncode;
				print "\n\nThe length of character escaped description is: $countlength\n\n";				
				print "Encoded: $descriptioncode\n\n";
				$titlecode = encode_entities($title, '\0-\377');
				$titlecode =~ s/\;//g;
				print "Encoded: $descriptioncode\n\n";


						$table = "yesterday";
						
						$db2->do("CREATE TABLE IF NOT EXISTS $table (title TEXT PRIMARY KEY, email, link, description, descriptioncode, titlecode);") or warn ":$!";
						$st2 = $db2->prepare("insert into $table(title,email,link,description,descriptioncode,titlecode) values(?,?,?,?,?,?);") or warn ":$!";
						$st2->execute($title,$email,$link,$description,$descriptioncode, $titlecode) or warn "$!";
						#print YESTERDAY "CREATE TABLE $table (\n\ttitle\tTEXT PRIMARY KEY ,\n\temail\tTEXT ,\n\tlink\tTEXT ,\n\tdescription\tTEXT\n);\n\n";
						#print YESTERDAY "INSERT INTO $table VALUES (\'$title\', \'$email\', \'$link\', \'$description\');";			
						
				


					#print "$table\nYESTERDAY:\nLink is: \"$link\"\nTitle is: \"$title\"\nEmail is: \"$email\"\nDescription is: \"$description\"\n\n"; 
						$var++;
						#print "success\n";
					
						
						

						
						
						
		}
		
	}

	#print goes here

	
}



}



move("/home/jack/Desktop/Craigbook/temp/ads.db","/home/jack/Desktop/Craigbook/ads.db");





sub get_day {
	my $ref = $nlref;

	$indicemonth5 = "@{$ref}[4]";
	$indicemonth6 = "@{$ref}[5]";
	$indicemonth7 = "@{$ref}[6]";
	$indicemonth8 = "@{$ref}[7]";
	$indicemonth9 = "@{$ref}[8]";
	$indicemonth10 = "@{$ref}[9]";
	$indicemonth11 = "@{$ref}[10]";
	$indicemonth12 = "@{$ref}[11]";
	$indicemonth13 = "@{$ref}[12]";
	$indicemonth14 = "@{$ref}[13]";
	
	if ($indicemonth5 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth6 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}
	
	if ($indicemonth7 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth8 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth9 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth10 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth11 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth12 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth13 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}

	if ($indicemonth14 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$sday = $2;
	}
	return $sday;
}

sub get_month {
	my $ref = $nlref;

	$indicemonth5 = "@{$ref}[4]";
	$indicemonth6 = "@{$ref}[5]";
	$indicemonth7 = "@{$ref}[6]";
	$indicemonth8 = "@{$ref}[7]";
	$indicemonth9 = "@{$ref}[8]";
	$indicemonth10 = "@{$ref}[9]";
	$indicemonth11 = "@{$ref}[10]";
	$indicemonth12 = "@{$ref}[11]";
	$indicemonth13 = "@{$ref}[12]";
	$indicemonth14 = "@{$ref}[13]";
	
	if ($indicemonth5 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth6 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}
	
	if ($indicemonth7 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth8 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth9 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth10 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth11 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth12 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth13 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}

	if ($indicemonth14 =~ /\<dc\:date\>(.*)\<\/dc\:date\>/) {
		$sday = $1;
		$sday =~ s/\d{4}\-//;
		$sday =~ s/T\d{2}\:\d{2}\:\d{2}\-\d{2}\:\d{2}//;
		$sday =~ m/(\d{2})-(\d{2})/;
		$smonth = $1;
	}
	return $smonth;
}


sub get_title {
	my $ref = $nlref;
	$indicetitle = "@{$ref}[1]";
	if ($indicetitle =~ /\<title\>(.*)\<\/title\>/) {
		$stitle = $1;
	}
	$stitle =~ s/\<\!\[CDATA\[//;
	$stitle =~ s/\]\]\>//;
	$stitle =~ s/\(.*\)//;
	$stitle =~ s/RE\://;
	$stitle =~ s/\&gt//;
	$stitle =~ s/\;//;
	
	return $stitle;
}

sub get_link {
	my $ref = $nlref;
	$indice_link = "@{$ref}[2]";
	if ($indice_link =~ /\<link\>(.*)\<\/link\>/) {
		$slink = $1;
	}
	
	return $slink;
}
	















sub get_list_from_dir {
	my ($dir) = @_;
	opendir DIR, $dir or die "can't open $dir for reading:$!";
	my @stuff = grep { $_ ne "." && $_ ne ".." } readdir(DIR);
	closedir DIR;
	return @stuff;
}

sub file_2_string {
	my $file = $_;
	$/ = undef;
	open(FILE, "$file") or die "Can't read file '$file' [$!]\n";  
	$document = <FILE>; 
	close (FILE);  
	return $document;
}

sub number_of_items {
	my $test = $string;	
	my @items = split /<items>/, $string;
	shift @items;
	
	
	(my $itemlinks, my $content) = split /\<\/rdf\:Seq\>/, $items[0];
	

	(my $junk, my $itemlinksg) = split /\<rdf\:Seq\>/, $itemlinks;

	
	$itemlinks = $itemlinksg;
	

	my @ads = split /\n/, $itemlinks;

	my @ads = grep { $_ ne /$^/ } @ads;
	my @ads = grep ($_ = /\w/, @ads);

	
	
	my $number = @ads;

return $number;
}


	
sub number_of_items_check {
	my $string = $string;
	my @items = split /<items>/, $string;
	shift @items;	
	(my $itemlinks, my $content) = split /\<\/rdf\:Seq\>/, $items[0];
	(my $itemlinks, my $content) = split /\<\/channel\>/, $content;
	@chunks = split /\<\/item\>/, $content;
	$junk = pop(@chunks);
	$numberofitemserrorcheck = @chunks;
	return $numberofitemserrorcheck;
}

sub get_chunks {
	my $string = $string;
	my @items = split /<items>/, $string;
	shift @items;	
	(my $itemlinks, my $content) = split /\<\/rdf\:Seq\>/, $items[0];
	(my $itemlinks, my $content) = split /\<\/channel\>/, $content;
	@chunks = split /\<\/item\>/, $content;
	$junk = pop(@chunks);
	$numberofitemserrorcheck = @chunks;
	return @chunks;
}


sub today {
	
	($second, $minute, $hour, $dayOfMonth, $thismonth, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
	 $today = "$dayOfMonth";
	 return $today;
}

sub yesterday {
	($second, $minute, $hour, $dayOfMonth, $thismonth, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
	 $yesterday = $dayOfMonth - 1;
	 return $yesterday;
}

sub month_parsed {
	(my $second, my $minute, my $hour, my $dayOfMonth, my $thismonth, my $yearOffset, my $dayOfWeek, my $dayOfYear, my $daylightSavings) = localtime();
	my $mymonth = $thismonth;
	$mymonth++;
	$mymonth = "0" . $mymonth;
	return $mymonth;
}



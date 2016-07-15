
module schere_oberseite ( ) {
translate([0,0,8.5])
    rotate([0,180,180])
        import("SChere_neu.STL", convexity=3);
    translate([117,-42,0])
    rotate([0,180,0])
    translate([0,-1,-8.5])
        import("SChere_neu.STL", convexity=3);
    translate([70.15,-8.23,1])  
        schraube();
    translate([46.84,-34.79,1])  
        schraube();
}
module schraube ( ) {
    difference() {
    cylinder(h = 11, r1 = 1.86, r2 = 1.86, center = true,$fn=50);
    cylinder(h = 12, r1 = 0.5, r2 = 0.5, center = true,$fn=50);
    translate([0,0,-7])
    cylinder(h = 5, r1 = 0.8, r2 = 0.8, center = true,$fn=50);
    translate([-4,-4.6,-6.2])
    rotate([0,0,45])
    cube([10,0.9,1]);   
}
}
module schere_unterseite ( ) {
rotate([0,0,-5])
translate([-45,-37,-8.3])
import("SChere_neu.STL", convexity=3);
rotate([0,180,-5])
translate([-150,8,8.3])
rotate([0,180,180])
import("SChere_neu.STL", convexity=3);  
}

module under ( ) {
    translate([-55,-45,0])
    cube([220,90,10]); 
}


module schere_all_oberseite () {
    difference() {
        schere_oberseite() ;
        under();
    };
}
module schere_all_unterseite () {
    difference() {
        schere_unterseite() ;
        under();
    };
}

module schere_hulle_oberseite () {
difference() {
translate([-45,-44,-5.8])
cube([207,45,6.2]); 
linear_extrude(height = 31, center = true, convexity = 10, twist = 0)
    offset(r = 1.5) {
projection(cut = true) 
translate([0,0,0.3])
schere_all_oberseite();
    }
}
}

module schere_hulle_unterseite () {
difference() {
translate([-14,-37,-5.8])
cube([130,35,6.2]); 
linear_extrude(height = 31, center = true, convexity = 10, twist = 0)
    offset(r = 1.5) {
projection(cut = true) 
translate([0,0,0.3])
schere_all_unterseite();
    }
}
}

module schere_mit_hulle_oberseite() {
scale([7,7,6]) {
schere_all_oberseite();
schere_hulle_oberseite ();
translate([10,-39,-0.5])
 cube([3,40,0.5]); 
translate([100,-44,-0.5])
 cube([3,40,0.5]); 
}
}

module schere_mit_hulle_unterseite() {
scale([7,7,6]) {
schere_all_unterseite();
schere_hulle_unterseite();
translate([50,-37,-0.5])
 cube([3,35,0.5]); 
translate([-14,-20,-0.5])
 cube([130,3,0.5]); 
}
}
module schere_test_mit_hulle_unterseite() {
    difference() {
        schere_mit_hulle_unterseite();
        
        translate([280,-300,-37])
            cube([1000,300,40]); 
    }
}
schere_mit_hulle_unterseite();
stamp="Printables";
size=30;
thickness=20;
font="Liberation Mono";
withborder=false;

RenderCard("J");

module Stamp(
    string="test", 
    size=10, 
    thickness=10,
    font="Liberation Mono") {   

        
        linear_extrude(height=thickness/2, convexity=4)     
            text(string,size=size,font=font,halign="top",valign="top");
        
        
        
}

module RenderCard(
    card="A",
    width=60,
    height=90,
    font="Liberation Mono") {
    
    stamp01_x = 0-width/2 + 5;
    stamp01_y = height/2 - 10;
        
    stamp02_x = width/2 - 15;
    stamp02_y = height/2 - 10;
        
    stamp03_x = 0-width/2 + 5;
    stamp03_y = height/2 - 10;
        
    stamp04_x = width/2 - 15;
    stamp04_y = height/2 - 10;
    
    import("card-base.stl", convexity=3);
    
    translate([stamp01_x, stamp01_y])
        Stamp(card);
        
    translate([stamp02_x, stamp02_y])
        Stamp(card);

    rotate([180,0,0]) {
        translate([stamp03_x, stamp03_y])
            Stamp(card);
    
        translate([stamp04_x, stamp04_y])
            Stamp(card);
    }
}

echo(version=version());

/*
    Project: Text2Stamp
    Description: Generates 3D stamps from text.
    Author: Erika Heidi <@erikaheidi>
    Date: May 2025
    License: GNU GPL v3
    Notes: This script uses OpenSCAD to create customizable 3D stamp models.
*/
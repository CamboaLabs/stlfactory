value="A";
type="diamonds"; // valid types: spades, diamonds, clubs, hearts
font="Liberation Mono";
width=60;
height=90;

stamp01_x = 0-width/2 + 5;
stamp01_y = height/2 - 10;
    
stamp02_x = width/2 - 15;
stamp02_y = height/2 - 10;
    
stamp03_x = 0-width/2 + 7;
stamp03_y = height/2 - 10;
    
stamp04_x = width/2 - 14;
stamp04_y = height/2 - 10;

RenderCard(card=value, font=font, type=type);


module RenderCard(
    card="A",
    width=60,
    height=90,
    font="Liberation Mono",
    type="spades") {
    
    difference() {
        import("card-base.stl", convexity=3);
        translate([0,0,5.5]) {
            scale([0.5,0.5,0.5])
                import("logo_printables.stl", convexity=3);
        }
        
        RenderCardValue(card);
        
        if(type=="diamonds") {
            RenderCardDecoration("♦"); 
        } else if(type=="hearts") {
            RenderCardDecoration("♥");
        } else if(type=="clubs") {
            RenderCardDecoration("♣"); 
        } else { 
            RenderCardDecoration("♠");
        }
    };    
}

module RenderCardValue(
    value="A") {
    
    Stamp(string=value, x=stamp01_x, y=stamp01_y, z=0.4);

    Stamp(string=value, x=stamp02_x, y=stamp02_y, z=0.4);

    rotate([180,0,0]) {
        mirror([1,0,0]) {
           Stamp(string=value, x=stamp03_x, y=stamp03_y, z=-5.5);
           Stamp(string=value, x=stamp04_x, y=stamp04_y, z=-5.5);
        }
    } 
}

module RenderCardDecoration(
    char="♠") {
        
    Stamp(string=char, x=stamp01_x, y=stamp01_y-15, z=0.4);
    Stamp(string=char, x=stamp02_x, y=stamp02_y-15, z=0.4);
        
    rotate([180,0,0]) {
        mirror([1,0,0]) {
            Stamp(string=char, x=stamp03_x, y=stamp03_y-15, z=-5.5);
            Stamp(string=char, x=stamp04_x, y=stamp04_y-15, z=-5.5);
        }
    }
}


module Stamp(
    string="A", 
    size=10, 
    thickness=10,
    font="Liberation Mono",
    align="top",
    x=0,
    y=0,
    z=0) {   

    translate([x, y, z]) {    
        linear_extrude(height=thickness/2, convexity=4 )    
            text(string,size=size,font=font,halign=align,valign=align);
    }
             
}

echo(version=version());

/*
    Project: StackableCards
    Description: Generates 3D playing cards.
    Author: Erika Heidi <@erikaheidi>
    Date: Jan 2026
    License: GNU GPL v3
    Notes: This script uses OpenSCAD to create customizable playing cards.
*/
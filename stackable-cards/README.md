# Stackable Cards
With this project you can generate a full deck of customized playing cards. The project has a few different components to it:

- `card-base.stl` : the original blank card originally designed on FreeCAD (source not included).
- `base.scad` : the OpenSCAD project that renders the card elements. This is parametric and can be customized to render a specific card, from a specific type (e.g: Ace of spades). It also allows you to specify a font from your system, if you don't want to use the default one.
- `cardgen` : the script that generates a single card from the command line. You can pass in parameters or run the script directly to be prompted for required parameters.
- `scripts/stack-gen.sh`: the script that generates the full deck using default settings.   


## Requirements
- a Shell
- OpenSCAD, but can also run via Docker.

## Usage

Build a single card:

```bash
cd stackable-cards
./cardgen --value "A" --type "spades" --output_dir .
```

You'll get output similar to this:

```bash
Generating Card 'A' of 'spades' with size 30
ECHO: version = [2021, 1, 0]
Geometries in cache: 17
Geometry cache size in bytes: 172600
CGAL Polyhedrons in cache: 8
CGAL cache size in bytes: 4748256
Total rendering time: 0:00:00.573
   Top level object is a 3D object:
   Simple:        yes
   Vertices:      936
   Halfedges:    2808
   Edges:        1404
   Halffacets:    966
   Facets:        483
   Volumes:         2
Card 'A' of 'spades' generated successfully as ./A-spades.stl.

```

Build the full deck:

```bash
./scripts/stack-gen.sh
```

This may take a minute to complete. It will output files to the "cards" directory.


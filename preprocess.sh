#!/bin/bash

SEQUENCES=(
    bear       boat              camel           cows         dog-agility     elephant  hockey          kite-walk    mallard-water    paragliding         rollerblade    soccerball  tennis
    blackswan  breakdance        car-roundabout  dance-jump   drift-chicane   flamingo  horsejump-high  libby        motocross-bumps  paragliding-launch  scooter-black  stroller    train
    bmx-bumps  breakdance-flare  car-shadow      dance-twirl  drift-straight  goat      horsejump-low   lucia        motocross-jump   parkour             scooter-gray   surf
    bmx-trees  bus               car-turn        dog          drift-turn      hike      kite-surf       mallard-fly  motorbike        rhino               soapbox        swing
)

for SEQUENCE in "${SEQUENCES[@]}"; do
    SRC="dataset/DAVIS/JPEGImages/480p/$SEQUENCE"
    DEST="dataset/DAVIS_processed/480p/$SEQUENCE/original"

    if [ ! -d "$SRC" ]; then
        echo "Skipping $SEQUENCE: source not found at $SRC"
        continue
    fi

    echo "Processing $SEQUENCE..."
    mkdir -p "$DEST"
    i=0
    for f in $(ls "$SRC"/*.jpg | sort); do
        cp "$f" "$DEST/$(printf '%04d' $i).png"
        i=$((i + 1))
    done
    echo "  Done: $i frames -> $DEST"
done

for SEQUENCE in "${SEQUENCES[@]}"; do
    SRC="dataset/DAVIS/JPEGImages/1080p/$SEQUENCE"
    DEST="dataset/DAVIS_processed/1080p/$SEQUENCE/original"

    if [ ! -d "$SRC" ]; then
        echo "Skipping $SEQUENCE: source not found at $SRC"
        continue
    fi

    echo "Processing $SEQUENCE..."
    mkdir -p "$DEST"
    i=0
    for f in $(ls "$SRC"/*.jpg | sort); do
        cp "$f" "$DEST/$(printf '%04d' $i).png"
        i=$((i + 1))
    done
    echo "  Done: $i frames -> $DEST"
done

echo "All sequences processed."

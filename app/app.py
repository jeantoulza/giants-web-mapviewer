import sys
sys.path.append("dpnet")
from giantslib.game.map import Map
from flask import Flask, request, abort, Response, render_template, redirect
import os
import random


MAPS_DIR = "maps/"


def get_maps():
    return [path for path in os.listdir(MAPS_DIR) if path.endswith(".gck")]


app = Flask(__name__)
maps = get_maps()


@app.route("/map/<path:mapfile>")
def get_map(mapfile):
    return render_template('view.html', mapfile=mapfile)


@app.route("/")
def get_home():
    return redirect("/random")


@app.route("/random")
def get_random():
    mapfile = random.choice(maps)
    return redirect(f"/map/{mapfile}")

@app.route("/colormap/<path:mapfile>")
def get_colormap(mapfile):
    try:
        maps.index(mapfile)
    except ValueError:
        abort(404)

    m = Map(MAPS_DIR + mapfile)
    return Response(m.get_colormap(), mimetype='image/png')


@app.route("/download/<path:mapfile>")
def download_map(mapfile):
    try:
        maps.index(mapfile)
    except ValueError:
        abort(404)
    m = open(MAPS_DIR+mapfile, "rb")
    r = Response(m.read(), mimetype='application_zip')
    m.close()
    return r

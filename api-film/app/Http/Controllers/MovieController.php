<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\Movie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MovieController extends Controller
{
    public function getMovie()
    {
        $data = Movie::with('casts')->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function getMovieById($movie_id)
    {
        $data = Movie::with('casts')->where('id', $movie_id)->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function newMovie()
    {
        $data = Movie::with('casts')->where('jenis', 'new')->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function upcomingMovie()
    {
        $data = Movie::with('casts')->where('jenis', 'upcoming')->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function genreMovie($genre)
    {
        $data = Movie::with('casts')->where('genre', $genre)->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function searchMovie($searchKeyword)
    {
        $data = Movie::with('casts')->where('judul', 'like', "%$searchKeyword%")->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }

    public function addFavorite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'uuid' => 'required',
            'movie_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $data = Favorite::create([
            'uuid' => $request->uuid,
            'movie_id' => $request->movie_id,
        ]);

        return response()->json([
            'data' => $data,
        ]);
    }

    public function checkFavorite($uuid, $movie_id)
    {
        $data = Favorite::where('uuid', $uuid)->where('movie_id', $movie_id)->get();
        if ($data->isEmpty()) {
            return response()->json([
                'response' => false
            ]);
        } else {
            return response()->json([
                'response' => true,
                'data' => $data
            ]);
        }
    }

    public function removeFavorite($uuid, $movie_id)
    {
        $data = Favorite::where('uuid', $uuid)->where('movie_id', $movie_id)->first();
        $data->delete();
    }

    public function getFavorite($uuid)
    {
        $data = Favorite::with('movie.casts')->where('uuid', $uuid)->get();

        return response()->json([
            'status' => true,
            'message' => 'List Movie',
            'data' => $data
        ]);
    }
}

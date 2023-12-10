<?php

use App\Http\Controllers\MovieController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('movie/getMovie', [MovieController::class, 'getMovie']);
Route::get('movie/getMovieById/{movie_id}', [MovieController::class, 'getMovieById']);
Route::get('movie/newMovie', [MovieController::class, 'newMovie']);
Route::get('movie/upcomingMovie', [MovieController::class, 'upcomingMovie']);
Route::get('movie/{searchKeyword}', [MovieController::class, 'searchMovie']);
Route::get('movie/genre/{searchKeyword}', [MovieController::class, 'genreMovie']);
Route::get('movie/favorite/{uuid}/{movie_id}', [MovieController::class, 'checkFavorite']);
Route::get('movie/favorite/{uuid}', [MovieController::class, 'getFavorite']);
Route::post('movie/addFavorite', [MovieController::class, 'addFavorite']);
Route::delete('movie/removeFavorite/{uuid}/{movie_id}', [MovieController::class, 'removeFavorite']);

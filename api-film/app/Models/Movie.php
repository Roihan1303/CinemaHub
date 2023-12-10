<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    use HasFactory;
    protected $table = 'movies';
    protected $fillable = [
        'judul',
        'genre',
        'nilai',
        'deskripsi',
        'jenis',
        'cover',
        'sampul',
        'trailer',
    ];

    public function casts()
    {
        return $this->hasMany(Cast::class);
    }

    public function favorites()
    {
        return $this->hasMany(Favorite::class);
    }
}

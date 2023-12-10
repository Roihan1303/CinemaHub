<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Favorite extends Model
{
    use HasFactory;
    protected $table = 'favorites';
    protected $fillable = [
        'uuid',
        'movie_id'
    ];

    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }
}

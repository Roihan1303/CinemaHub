<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cast extends Model
{
    use HasFactory;
    protected $table = 'casts';
    protected $fillable = [
        'movies_id',
        'name',
        'photo',
    ];

    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }
}

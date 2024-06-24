<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'phone',
        'email',
        'text',
        'user_id',
        'qrcode_id'
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // public function QrCodeLog()
    // {
    //     return $this->belongsTo(QrCodeLog::class);
    // }
}

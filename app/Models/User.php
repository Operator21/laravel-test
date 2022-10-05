<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasRoles;

    protected $table = "user";
    protected $primaryKey = "user_id";

    protected $fillable = [
        "email",
        "password",
        "password_token",
        "password_token_validity"
    ];

    protected $hidden = [
        "password",
        "password_token"
    ];

    const CREATED_AT = 'created';
    const UPDATED_AT = 'updated';
}

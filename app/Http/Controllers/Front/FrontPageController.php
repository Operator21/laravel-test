<?php

namespace App\Http\Controllers\Front;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FrontPageController extends Controller
{
    public function show() {
        return view("front.index");
    }
}

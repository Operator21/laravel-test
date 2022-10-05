<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Front\FrontPageController;
use App\Http\Controllers\Admin\RoleController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// ******************
// ** Front routes **
// ******************
// ! GET
Route::get("/", [FrontPageController::class, "show"])->name("home");


// ******************
// ** Admin routes **
// ******************
// ! GET
Route::middleware("auth")->group(function() {
	Route::get("/admin", [DashboardController::class, "show"]);
	Route::get("/admin/logout", [DashboardController::class, "logout"]);
});

Route::middleware("guest")->group(function() {
	Route::get("/admin/login", [DashboardController::class, "login"])
	->name("login");
	Route::get("/admin/register", [DashboardController::class, "register"]);
});

Route::get("admin/setlocale/{locale}", [DashboardController::class, "setlocale"]);


// ! POST
Route::middleware("guest")->group(function() {
	Route::post("/admin/login", [DashboardController::class, "authenticate"]);
	Route::post("/admin/register", [DashboardController::class, "create"]);
});

// ! PUT
Route::middleware("auth")->group(function() {
	Route::put("/admin/role/assign", [RoleController::class, "assign"]);
});

// ! DELETE
/*Route::middleware("auth")->group(function() {
	Route::delete("/admin/role/unassign/{role}", [RoleController::class, "unassign"]);
});*/
Route::group(["can: edit roles"], function() {
	Route::delete("/admin/role/unassign/{role}", [RoleController::class, "unassign"]);
});

<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;

class DashboardController extends Controller
{
    public $roles;

    public function __construct(){
        $this->roles = Role::all();
    }

    // display main dashboard when admin page is loaded
    public function show() {
        return view("admin.dashboard")->with([
            "roles" => $this->roles
        ]);
    }

    // display login page
    public function login() {
        return view("admin.login");
    }

    // display registration page
    public function register() {
        return view("admin.register");
    }

    // register new user
    public function create(Request $request) {
        $formFields = $request->validate([
            "email" => ["required", Rule::unique("user")],
            "password" => "required|confirmed"
        ]);
        $formFields["password"] = bcrypt($formFields["password"]);
        $user = User::create($formFields);
        $user->assignRole("user");

        return redirect("/admin/login")->with("message", "Registrace úspěšná");
    }

    // login user with given credentials
    public function authenticate(Request $request) {
        $formFields = $request->validate([
            "email" => "required",
            "password" => "required"
        ]);
        if(auth()->attempt($formFields)) {
            return redirect("/admin")->with("message", __());
        }
        return back()->withErrors("email", "Neplatné přihlašovací údaje");
    }

    // logout currently logged user
    public function logout() {
        auth()->logout();
        return redirect("/")->with("message", "Odhlášení úspěšné");
    }

    public function setlocale(Request $request) {
        $locale = $request->locale;
        if(in_array($locale, config("app.locales"))) {   
            session(["locale" => $locale], "cs");
            return back()->with("message", "Jazyk změněn");
        }
        return redirect("/admin")->with("message", "Neplatná operace");
    }
}

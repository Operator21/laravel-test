<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function assign(Request $request) {
        $roles = "";
        foreach(Role::all() as $role) {
            $roles .= $role->name . ",";
        }
        $roles = rtrim($roles, ",");
        $formFields = $request->validate([
            "role" => "required|not_in:0|in:$roles"
        ]);
        auth()->user()->assignRole($formFields["role"]);
        
        return redirect("/admin")->with("message", "Role přiřazena");
    }

    public function unassign($role) {
        if(!Role::where("name", $role)->exists())
            return back()->withErrors("roleErrors", "message");

        auth()->user()->removeRole($role);
        return redirect("/admin")->with("message", "Role odebrána");
    }
}

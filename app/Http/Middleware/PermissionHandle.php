<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Spatie\Permission\Exceptions\UnauthorizedException;

class PermissionHandle
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $permission = NULL, $guard = NULL)
    {
        $authGuard = app("auth")->guard($guard);

        if($authGuard->guest()) {
            throw UnauthorizedException::notLoggedIn();
        }

        if(!$permission) {
            $permission = $request->route()->getName();
            $permissions = [$permission];
        } else {
            if(is_array($permission))
                $permissions = $permission;
            else
                $permissions = explode("|", $permission);
        }

        foreach($permissions as $permission){
            if($authGuard->user()->can($permission))
                return $next($request);
        }

        throw UnauthorizedException::forPermissions($permissions);
    }
}

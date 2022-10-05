<ul class="grid bg-black w-full grid-cols-2 max-h-20">
	<h1 class="text-white p-6">IS.Kamiwaza</h1>
	<div class="inline-flex w-max mr-0 ml-auto">
		<select>
			@foreach (config("app.locales") as $locale)
				<option 
					@if (app()->getLocale() == $locale ) 
						selected
					@endif
					onclick="window.location.href='/admin/setlocale/{{$locale}}'"
					>{{$locale}}
				</option>
			@endforeach
		</select>
		@auth
			<x-admin.headerlink href="/admin">{{auth()->user()->email}}</x-admin.headerlink>
			<x-admin.headerlink href="/admin/settings">{{__("dashboard.settings")}}</x-admin.headerlink>
			<x-admin.headerlink href="/admin/logout">{{__("dashboard.logout")}}</x-admin.headerlink>
		@else
			<x-admin.headerlink href="/admin/login">{{__("dashboard.login")}}</x-admin.headerlink>
			<x-admin.headerlink href="/admin/register">{{__("dashboard.register")}}</x-admin.headerlink>
		@endauth
	</div>
	
</ul>
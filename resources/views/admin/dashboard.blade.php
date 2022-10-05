<x-admin.layout>
	<x-shared.container>
		<h1>Locale: {{app()->getLocale()}}</h1>
		<h1>Session: {{Session::get("locale")}}</h1>
	</x-shared.container>
	@if (auth()->user()->hasPermissionTo("edit roles"))
		<x-admin.permissionmanager :roles="$roles"/>
	@endif
	<x-shared.container>
		<h2 class="text-lg">{{__("dashboard.role-title")}}</h2>
		@foreach (auth()->user()->getRoleNames() as $role)
			<div class="grid grid-cols-2 p-2 m-1 bg-blue-100">
				<p>{{$role}}</p>
				@if (auth()->user()->hasPermissionTo("edit roles"))
					<form action="{{"/admin/role/unassign/$role"}}" method="POST">
						@csrf
						@method("DELETE")
						<button class="block w-max mr-0 ml-auto">X</butt>
					</form>
				@endif
			</div>
		@endforeach
	</x-shared.container>
</x-admin.layout>
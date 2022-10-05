@props([
	"roles" => ["none"]
])

<x-shared.container>
	<h2 class="text-lg">Přidat role</h2>
	<form method="POST" action="/admin/role/assign">
		@csrf
		@method("PUT")
		<select name="role">
			<option selected disabled>-- Vyberte roli --</option>
			@foreach ($roles as $role)
				<option value="{{$role->name}}">{{$role->name}}</option>
			@endforeach
		</select>
		@error("role")
			<x-shared.error>{{$message}}</x-shared.error>
		@enderror
		<input type="submit" value="Přiřadit">
	</form>
</x-shared.container>
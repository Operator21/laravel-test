@props([
	"confirmation" => "",
	"buttonText" => "Uložit"
])
<x-shared.formfield>
	<label for="email">Email</label>
	<input type="email" name="email" class="p-3 bg-slate-300 col-span-4" value="{{old("email")}}">
	@error("email")
		<x-shared.error>{{$message}}</x-shared.error>
	@enderror
</x-shared.formfield>

<x-shared.formfield>
	<label for="password">Heslo</label>
	<input type="password" name="password" class="p-3 bg-slate-300 col-span-4">
	@error("password")
		<x-shared.error>{{$message}}</x-shared.error>
	@enderror
</x-shared.formfield>

@if ($confirmation)
	<x-shared.formfield>
		<label for="password_confirmation">Heslo znovu</label>
		<input type="password" name="password_confirmation" class="p-3 bg-slate-300 col-span-4">
		@error("password_confirmation")
			<x-shared.error>{{$message}}</x-shared.error>
		@enderror
	</x-shared.formfield>
@endif

<x-shared.formfield>
	<input type="submit" value="{{$buttonText}}" class="p-3 bg-slate-300 col-span-5">
</x-shared.formfield>
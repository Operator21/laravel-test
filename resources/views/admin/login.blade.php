@php
	$text = __("dashboard.login")
@endphp
<x-admin.layout>
	<x-shared.container>
		<h1 class="text-2xl">{{$text}}</h1>
		<form method="POST" action="/admin/login" class="mt-5">
			@csrf
			<x-admin.userform :buttonText="$text"/>
		</form>
	</x-shared.container>
</x-admin.layout>
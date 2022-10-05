@php
	$text = __("dashboard.register")
@endphp
<x-admin.layout>
	<x-shared.container>
		<h1 class="text-2xl">{{$text}}</h1>
		<form method="POST" action="/admin/register" class="mt-5">
			@csrf
			<x-admin.userform confirmation="true" :buttonText="$text"/>
		</form>
	</x-shared.container>
</x-admin.layout>
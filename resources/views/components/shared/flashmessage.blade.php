@if(session()->has("message"))
	<div class="fixed top-0 left-1/2 transform -translate-x-1/2 bg-primary text-white px-48 py-3 mx-auto">
		<p>
			{{session("message")}}
		</p>
	</div>
@endif
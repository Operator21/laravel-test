@props([
	"href" => "#"
])

<li class="text-white w-full"><a href="{{$href}}" class="block p-6 text-center">{{$slot}}</a></li>
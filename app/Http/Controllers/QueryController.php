<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QueryController extends Controller
{
    function index(Request $request){
        $artists = DB::table('artists')->get();
        // $artists = DB::table('artists')->limit(2)->get();
        // $artists = DB::table('artists')->limit(2)->offset(3)->get();
        // $artists = DB::table('artists')->orderBy('id','desc')->get();
        // $artists = DB::table('artists')->orderBy('name','asc')->get();
        // $artists = DB::table('artists')->orderBy('name')->offset(2)->limit(2)->get(); //no ordering
        // $artists = DB::table('artists')->count();
        //select * from artists limit 2 offset 3 order by id desc

        // $artists = DB::table('artists')->select('name','id')->get();
        // $artists = DB::table('artists')->find(9);

        // $artists = DB::table('artists')->where('id','>=',4)->get();
        //select * from artists where name like 'M%';
        // $artists = DB::table('artists')->where('name','LIKE','m%')->where('name','LIKE','%n')->get();
        // return response()->json($artists);

        // $songs = DB::table('songs')->get();
        // $songs = DB::table('songs')->select('id','title','year')->get();
        // $songs = DB::table('songs')->select('id','title','year')->where('year','>','1986')->get();

        //join
        // $songs = DB::table('songs')
        //     ->join('artists','songs.artist_id','=','artists.id')
        //     ->select('songs.title','artists.name','songs.year')
        //     ->orderBy('songs.year')
        //     ->get();

        // $songs = DB::table('songs')
        //     ->join('artists','songs.artist_id','=','artists.id')
        //     ->select('songs.title','artists.name','songs.year')
        //     ->where('year','>','1984')
        //     ->orderBy('songs.year')
        //     ->orderBy('artists.name','desc')
        //     ->get();

        $songs = DB::table('songs')
            ->join('artists','songs.artist_id','=','artists.id')
            ->join('genres','songs.genre_id','=','genres.id')
            ->select('songs.title','genres.name as genre','artists.name as artist','songs.year')
            // ->whereIn('year',[1984,1986])
            ->whereBetween('year',[1984,1987])
            ->orderBy('songs.year')
            ->get();
        // $songs = DB::table('songs')->whereYear(1983)->get();

        return response()->json($songs);
    }

    function insert(Request $request){
        //insert an artist
        // $artist = DB::table('artists')->insert([
        //     'name' => 'Van Halen',
        // ]);

        // $artist = DB::table('artists')->insertGetId([
        //     'name' => 'Metallica',
        // ]);

        // $newArtist = DB::table('artists')->find($artist);

        // return response()->json($newArtist);

        //add two songs
        // $songs = DB::table('songs')->insert([
        //     [
        //         'title' => 'Jump',
        //         'artist_id' => 14,
        //         'genre_id' => 1,
        //         'year' => 1984,
        //         'price' => 1.00
        //     ],
        //     [
        //         'title' => 'Panama',
        //         'artist_id' => 14,
        //         'genre_id' => 1,
        //         'year' => 1984,
        //         'price' => 1.00
        //     ]
        // ]);
    }

    function delete(Request $request){
        // $artist = DB::table('artists')->where('id',9)->delete();
        // $artist = DB::table('artists')->where('id',13)->delete();
        $artist = DB::table('artists')->where('id','>',10)->delete();
        return response()->json($artist);

    }

    function update(Request $request){
        // $artist = DB::table('artists')->where('id',14)->update([
        //     'name' => 'The Rolling Stones',
        // ]);

        $updatedRows = DB::table('songs')->where('id',20)
            ->update([
                'title'=>'Public Dancer',
                'price'=>'2.00'
            ]);

        return response()->json($updatedRows);
    }
}

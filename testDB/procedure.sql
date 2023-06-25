insert into Playlist_tracks (playlist_id, tracks_id)
values
((select playlist.id from playlist where playlist.id = 4), (select tracks.id from tracks order by tracks.count_of_plays desc))

select tracks.id from tracks order by tracks.count_of_plays desc
select playlist.id from playlist where playlist.id = 4

create or replace procedure insertPopularTracks(count_plays int) as
$$
declare
tracks int[]:= array(select tracks.id from tracks order by tracks.count_of_plays desc);
i int := 0;
begin
  while i < count_plays loop
  insert into Playlist_tracks (playlist_id, tracks_id)
  values
  (4, tracks[i + 1]);
  i := i + 1;
  end loop;
end;
$$ language plpgsql;

call insertPopularTracks(10)

select playlist.id, playlist.name as name, tracks.count_of_plays, album.name as album, users.username, tracks.id, tracks.name as track, tracks.duration as duration, artist.name as artist from playlist, tracks, users, playlist_tracks, artist, album where playlist_tracks.tracks_id = tracks.id and playlist_tracks.playlist_id = playlist.id and tracks.artist_id = artist.id and album.artist_id = artist.id
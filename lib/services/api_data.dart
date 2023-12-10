import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Movie {
  Future<dynamic> getCategory(categoryy) async {
    final String category = categoryy;
    try {
      var response =
          // await Dio().get('http://10.90.32.92:8000/api/movie/genre/$category');
          await Dio()
              .get('http://192.168.18.13:8000/api/movie/genre/$category');
      if (response.statusCode == 200) {
        return response.data['data'] as List;
      }
    } catch (e) {
      print('error');
    }
  }

  Future<dynamic> getFavorites() async {
    String uuid = '';

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    try {
      var response = await Dio()
          // .get('http://10.90.32.250:8000/api/movie/favorite/$uuid/$movie_id');
          .get(
              'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/favorites.json');
      if (response.statusCode == 200) {
        List movieList = [];

        Map<String, dynamic> favoriteData = response.data;

        // Perulangan melalui kunci utama
        for (var key in favoriteData.keys) {
          if (favoriteData[key]['uuid'] == uuid) {
            var movieId = favoriteData[key]['movie_id'];
            try {
              var response = await Dio().get(
                // 'http://10.90.32.92:8000/api/movie/getMovieById/$movieId',
                'http://192.168.18.13:8000/api/movie/getMovieById/$movieId',
              );

              if (response.statusCode == 200) {
                movieList.add(response.data['data']);
              }
            } catch (e) {
              print(e);
            }
          }
        }
        return movieList;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> searchResult(searchKeyword) async {
    dynamic _searchResults = [];
    try {
      final response = await Dio().get(
        // 'http://10.90.32.92:8000/api/movie/getMovie',
        'http://192.168.18.13:8000/api/movie/getMovie',
        queryParameters: {'judul': searchKeyword},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        return _searchResults = responseData.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error
    }
  }

  Future<bool> checkFavorite(uuid, movie_id) async {
    bool isFavorite = false;
    try {
      var response = await Dio()
          // .get('http://10.90.32.250:8000/api/movie/favorite/$uuid/$movie_id');
          .get(
              'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/favorites.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> favoriteData = response.data;

        for (var key in favoriteData.keys) {
          if (favoriteData[key]['uuid'] == uuid &&
              favoriteData[key]['movie_id'] == movie_id) {
            isFavorite = true;
            break;
          }
        }
      }
    } catch (e) {
      print(e);
    }
    return isFavorite;
  }

  Future<bool> toggleFavorite(
      bool isFavorite, String uuid, String movie_id) async {
    final dio = Dio();

    if (isFavorite) {
      try {
        var response = await Dio().get(
            'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/favorites.json');
        if (response.statusCode == 200) {
          Map<String, dynamic> favoriteData = response.data;

          for (var key in favoriteData.keys) {
            if (favoriteData[key]['uuid'] == uuid &&
                favoriteData[key]['movie_id'] == movie_id) {
              try {
                final response = await dio.delete(
                  'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/favorites/$key.json',
                );

                if (response.statusCode == 200) {
                  isFavorite = false;
                  print('Data favorit berhasil dihapus');
                } else {
                  print('Gagal menghapus data favorit: ${response.statusCode}');
                }
              } catch (e) {
                print('Terjadi kesalahan saat mengirim permintaan: $e');
                return false;
              }
              break;
            }
          }
        }
      } catch (e) {
        print('Terjadi kesalahan saat mengirim permintaan: $e');
      }
    } else {
      try {
        final response = await dio.post(
          // 'http://10.90.32.250:8000/api/movie/addFavorite',
          'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/favorites.json',
          data: {
            'uuid': uuid,
            'movie_id': movie_id,
          },
        );

        if (response.statusCode == 200) {
          isFavorite = true;
          print('Data favorit berhasil ditambahkan');
        } else {
          print('Gagal menambahkan data favorit: ${response.statusCode}');
        }
      } catch (e) {
        print('Terjadi kesalahan saat mengirim permintaan: $e');
      }
    }
    return isFavorite;
  }

  Future<dynamic> getNewMovie() async {
    try {
      var response =
          // await Dio().get('http://10.90.32.92:8000/api/movie/newMovie');
          await Dio().get('http://192.168.18.13:8000/api/movie/newMovie');
      if (response.statusCode == 200) {
        return response.data['data'] as List;
      }
    } catch (e) {
      print('error');
    }
  }

  Future<dynamic> getUpComingMovie() async {
    try {
      var response =
          // await Dio().get('http://10.90.32.92:8000/api/movie/upcomingMovie');
          await Dio().get('http://192.168.18.13:8000/api/movie/upcomingMovie');
      if (response.statusCode == 200) {
        return response.data['data'] as List;
      }
    } catch (e) {
      print('error');
    }
  }
}

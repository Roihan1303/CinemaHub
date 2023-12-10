-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table db_api_film.casts
CREATE TABLE IF NOT EXISTS `casts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.casts: ~31 rows (approximately)
DELETE FROM `casts`;
INSERT INTO `casts` (`id`, `movie_id`, `name`, `photo`, `created_at`, `updated_at`) VALUES
	(1, '1', 'Jessica McNamee', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT7s54GK72ns1suYMU0GY81KpQ2y-MyfzKPyyJ9VXwQNvd8brJ5', '2023-10-31 16:35:41', '2023-10-31 16:35:42'),
	(2, '1', 'Lewis Tan', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRCcExBzm6rXE-f9hYr_TEdfS5he1FKIs2N3xGwt0ovCUN821Oy', '2023-10-31 16:35:56', '2023-10-31 16:35:57'),
	(3, '1', 'Joe Taslim', 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcTLMC4x8UVTiPgntyE-LD-JTcD3qkiAszJVK7HruHL_SjfcjK5InPFK8M_lQZKNBsPL', '2023-10-31 16:36:27', '2023-10-31 16:36:28'),
	(4, '1', 'Hiroyuki Sanada', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS7AN-PGsf8U719swCsHhTvph4xSjyKi5gRoMdPvH0h-H4wARbL', '2023-10-31 16:38:51', '2023-10-31 16:38:52'),
	(5, '1', 'Josh Lawson', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmMv0T4SOgQNvfC8Ix56EH6taeVJY6apegaFTqqW7S3IGnYxr5', '2023-10-31 16:39:06', '2023-10-31 16:39:07'),
	(6, '1', 'Max Huang', 'https://m.media-amazon.com/images/M/MV5BMmIwMzZlMzctOGI5Ni00MDZiLThjMjQtYzZkNWRlNDJmMzE1XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg', '2023-10-31 16:39:24', '2023-10-31 16:39:25'),
	(7, '2', 'Yasmin Napper', 'https://awsimages.detik.net.id/community/media/visual/2022/11/23/yasmin-napper_43.jpeg?w=600&q=90', '2023-11-01 10:28:13', '2023-11-01 10:28:13'),
	(8, '2', 'Cecep Arif Rahman', 'https://peliculas.fra1.digitaloceanspaces.com/actores/683/actor-cecep-arif-rahman-0.jpg', '2023-11-01 10:28:28', '2023-11-01 10:28:30'),
	(9, '2', 'Rizky Nazar', 'https://thumb.viva.co.id/media/frontend/tokoh/2018/01/19/5a6193beafe92-rizky-nazar_216_287.jpg', '2023-11-01 10:28:45', '2023-11-01 10:28:46'),
	(10, '2', 'Omar Daniel', 'https://asset-2.tstatic.net/tribunnews/foto/bank/images/omar-daniel-19-november.jpg', '2023-11-01 10:29:03', '2023-11-01 10:29:04'),
	(11, '2', 'Aghniny Haque', 'https://cdn.antaranews.com/cache/1200x800/2022/12/29/WhatsApp-Image-2022-12-29-at-08.27.36.jpeg', '2023-11-01 10:29:10', '2023-11-01 10:29:10'),
	(12, '2', 'Yayan Ruhian', 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcSUfVVaj9QfFzXBo9cJ6b-hc7EdS-sY3TBleqmHVzFOnStHTwdQbfE7xxlIXIY6ezZx', '2023-11-01 10:29:59', '2023-11-01 10:30:00'),
	(17, '3', 'Cillian Murphy', 'https://www.lascimmiapensa.com/wp-content/uploads/2021/01/peaky-blinders-season-5.jpg', NULL, NULL),
	(18, '3', 'Paul Anderson', 'https://images.cinemaexpress.com/uploads/user/imagelibrary/2021/6/14/original/paulanderson.jpg', NULL, NULL),
	(19, '3', 'Tom Hardy', 'https://i.pinimg.com/originals/73/20/94/7320948092748c171eaef7603062fb67.jpg', NULL, NULL),
	(20, '3', 'Helen McCrory', 'https://awsimages.detik.net.id/visual/2021/04/18/helen-mccrory_169.jpeg?w=400&q=90', NULL, NULL),
	(21, '3', 'Finn Cole', 'https://hips.hearstapps.com/hmg-prod/images/peaky-blinders-michael-gray-season-3-1607686478.jpg', NULL, NULL),
	(22, '3', 'Joe Cole', 'https://hips.hearstapps.com/hmg-prod/images/joe-cole-peaky-blinders-reason-for-quitting-show-1646822176.jpeg?crop=0.526xw:1.00xh;0.221xw,0&resize=1200:*', NULL, NULL),
	(23, '13', 'Sylvester Stallone', 'https://ntvb.tmsimg.com/assets/assets/1682_v9_bb.jpg?w=270&h=360', NULL, NULL),
	(24, '13', 'Jason Statham', 'https://www.themoviedb.org/t/p/w500/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg', NULL, NULL),
	(25, '13', 'Dolph Lundgren', 'https://static.republika.co.id/uploads/images/inpicture_slide/aktor-laga-dolph-lundgren-teringat-akan-lawan-mainnya-brandon_211125160103-881.jpg', NULL, NULL),
	(26, '13', 'Megan Fox', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSycfDraKTyoPqdALDdPg18iHnfs5c_OoJePWLE6YGxtNxmYUkN2YjQ43vIcFh8_005v0Q&usqp=CAU', NULL, NULL),
	(27, '13', 'Tony Jaa', 'https://images.mubicdn.net/images/cast_member/24292/cache-95204-1407070103/image-w856.jpg?size=800x', NULL, NULL),
	(28, '13', 'Iko Uwais', 'https://cdn1-production-images-kly.akamaized.net/gTXMrzWkuXhZlNHfxUVKTGBX_gk=/469x625/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4562741/original/062719900_1693819448-Untitled-5.jpg', NULL, NULL),
	(29, '14', 'Vin Diesel', 'https://m.media-amazon.com/images/M/MV5BMjExNzA4MDYxN15BMl5BanBnXkFtZTcwOTI1MDAxOQ@@._V1_.jpg', NULL, NULL),
	(30, '14', 'Jason Momoa', 'https://static.republika.co.id/uploads/images/inpicture_slide/aktor-film-dune-jason-momoa-tengah-isolasi-mandiri-setelah_211102105926-135.jpg', NULL, NULL),
	(31, '14', 'Alan Ritchson', 'https://bacaterus.com/wp-content/uploads/2023/07/Alan-Ritchson_.webp', NULL, NULL),
	(32, '14', 'Michelle Rodriguez', 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2017/09/michelle-rodriguez-tak-mau-jadi-hanya-pemanis_m_156570.jpeg', NULL, NULL),
	(33, '14', 'Sung Kang', 'https://www.blackfilm.com/read/wp-content/uploads/2013/01/Sung-Kang.jpg', NULL, NULL),
	(34, '14', 'Jason Statham', 'https://www.themoviedb.org/t/p/w500/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg', NULL, NULL),
	(35, '14', 'Tyrese Gibson', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/TyreseGibsonDec08.jpg/220px-TyreseGibsonDec08.jpg', NULL, NULL);

-- Dumping structure for table db_api_film.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table db_api_film.favorites
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.favorites: ~0 rows (approximately)
DELETE FROM `favorites`;
INSERT INTO `favorites` (`id`, `UUID`, `movie_id`, `created_at`, `updated_at`) VALUES
	(1, 'FhyT1oPHbBOwtHTzkpEBq7EfAZh1', '1', NULL, NULL);

-- Dumping structure for table db_api_film.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_10_25_150928_create_movies_table', 1),
	(6, '2023_10_31_162651_create_casts_table', 2),
	(7, '2023_11_01_195126_create_favorites_table', 3);

-- Dumping structure for table db_api_film.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sampul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.movies: ~16 rows (approximately)
DELETE FROM `movies`;
INSERT INTO `movies` (`id`, `judul`, `genre`, `nilai`, `deskripsi`, `jenis`, `cover`, `sampul`, `trailer`, `created_at`, `updated_at`) VALUES
	(1, 'Mortal Kombat', 'Laga', '9.0', 'MMA fighter Cole Young seeks out Earth\'s greatest champions in order to stand against the enemies of Outworld in a high stakes battle for the universe.', 'new', 'https://m.media-amazon.com/images/M/MV5BY2ZlNWIxODMtN2YwZi00ZjNmLWIyN2UtZTFkYmZkNDQyNTAyXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_.jpg', 'https://cinemags.org/wp-content/uploads/2021/03/Mortal-Kombat.jpg', 'https://www.youtube.com/watch?v=jBa_aHwCbC4&ab_channel=WarnerBros.Pictures', '2023-10-25 08:45:54', '2023-10-25 08:45:54'),
	(2, 'Gatot Kaca', 'Laga', '8.0', 'Legends collide as young Yuda wrestles with his newfound godlike powers, defending his world in an endless battle against ancient and powerful evils.', 'new', 'https://m.media-amazon.com/images/M/MV5BOWEzN2IxOTktMzBjMS00ZWU1LWI0OTgtZjViNWYxOWY1MjUxXkEyXkFqcGdeQXVyNzY4NDQzNTg@._V1_.jpg', 'https://awsimages.detik.net.id/community/media/visual/2022/05/13/poster-satria-dewa-gatotkaca_43.jpeg?w=650&q=80', 'https://www.youtube.com/watch?v=R7SjBDyaWJk&pp=ygURZ2F0b3RrYWNhIHRyYWlsZXI%3D', '2023-10-25 08:47:21', '2023-10-25 08:47:21'),
	(3, 'Peaky Blinders', 'Drama', '9.8', 'A gangster family epic set in 1900s England, centering on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby.', 'new', 'https://o-cdn-cas.sirclocdn.com/parenting/images/Sinopsis-peaky-blinders.width-800.format-webp.webp', 'https://i.pinimg.com/originals/df/7f/2f/df7f2f1c633d83c3ba9850f9c8734a25.jpg', 'https://www.youtube.com/watch?v=WJnvAwkyMMg&ab_channel=moviesongsedit', '2023-11-01 10:27:03', '2023-11-01 10:27:04'),
	(8, 'Venom', 'Action', '8.7', 'A failed reporter is bonded to an alien entity, one of many symbiotes who have invaded Earth. But the being takes a liking to Earth and decides to protect it.', 'new', 'https://cdn.idntimes.com/content-images/duniaku/post/20210922/venom-2-poster-tom-hardy-7c2075740285744cc52c7646d1230ffb.jpg', 'https://simmsview.files.wordpress.com/2019/07/venom.jpg', 'https://www.youtube.com/watch?v=u9Mv98Gr5pY&ab_channel=SonyPicturesEntertainment', NULL, NULL),
	(9, 'Dr Strange 2', 'Action', '9.0', 'Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse. They seek help from Wanda the Scarlet Witch, Wong and others.', 'new', 'https://foto.kontan.co.id/A8LkRugYUwKDpJEgPSq3eH2tfG4=/smart/2022/06/16/1541077107p.jpg', 'https://pict.sindonews.net/dyn/850/pena/news/2022/02/15/700/686769/6-cameo-yang-terindikasi-di-trailer-dan-poster-doctor-strange-2-isa.jpg', 'https://www.youtube.com/watch?v=aWzlQ2N6qqg&ab_channel=MarvelEntertainment', NULL, NULL),
	(10, 'The Nun II', 'Horror', '8.0', '1956 - France. A priest is murdered. An evil is spreading. The sequel to the worldwide smash hit follows Sister Irene as she once again comes face-to-face with Valak, the demon nun.', 'new', 'https://img.hurawatch.bz/i/cache/images/8/80/805b09e2acc329f922a04049c9100f4b.jpg', 'https://www.blibli.com/friends-backend/wp-content/uploads/2023/07/B700237-Cover-Sinopsis-The-Nun-2-scaled.jpg', 'https://www.youtube.com/watch?v=CAeeIdD4KQU', NULL, NULL),
	(11, 'The Conjuring', 'Horror', '8.5', 'Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse.', 'new', 'https://img.hurawatch.bz/i/cache/images/3/32/3295ed8124de5cb9d8c555eda405ae0c.jpg', 'https://advocatechannel.com/media-library/image.jpg?id=24552607&width=1245&height=700&quality=85&coordinates=0%2C106%2C0%2C106', 'https://www.youtube.com/watch?v=k10ETZ41q5o', NULL, NULL),
	(12, 'The Nun', 'Horror', '8.2', 'A priest with a haunted past and a novice on the threshold of her final vows are sent by the Vatican to investigate the death of a young nun in Romania and confront a malevolent force in the form of a demonic nun.', 'new', 'https://img.hurawatch.bz/i/cache/images/0/0b/0b0c34f47b0d10d8528ca11325321325.jpg', 'https://moviewarden.files.wordpress.com/2018/09/the-nun-movie-poster.jpg', 'https://www.youtube.com/watch?v=pzD9zGcUNrw', NULL, NULL),
	(13, 'Expend4bles', 'Action', '8.7', 'Armed with every weapon they can get their hands on, the Expendables are the world\'s last line of defense and the team that gets called when all other options are off the table.', 'upcoming', 'https://img.hurawatch.bz/i/cache/images/8/84/8484b70947b973ca25667e4e5b0649da.jpg', 'https://assets-in.bmscdn.com/discovery-catalog/events/et00361629-evzxeubtft-landscape.jpg', 'https://www.youtube.com/watch?v=DhlaBO-SwVE', NULL, NULL),
	(14, 'Fast X', 'Action', '9.7', 'Dom Toretto and his family are targeted by the vengeful son of drug kingpin Hernan Reyes.', 'upcoming', 'https://img.hurawatch.bz/i/cache/images/2/26/26e5d063413fca41c8120643b655e2bc.jpg', 'https://www.escapistmagazine.com/wp-content/uploads/2023/05/fast-x-review.jpg?fit=1280%2C720', 'https://www.youtube.com/watch?v=eoOaKN4qCKw', NULL, NULL),
	(15, 'The Equalizer 3', 'Thriller', '8.1', 'Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends\' protector by taking on the ...', 'upcoming', 'https://img.hurawatch.bz/i/cache/images/a/a7/a72d174bfd5844b721fe7d3a7f976001.jpg', 'https://m.media-amazon.com/images/M/MV5BZWQxYzM4MWItNjA2NC00YjljLTg1YTMtY2JmOTUwMjE3YmEzXkEyXkFqcGdeQXVyMTE0MzQwMjgz._V1_QL75_UY281_CR18,0,500,281_.jpg', 'https://www.youtube.com/watch?v=ZsrahE6znRA', NULL, NULL),
	(16, 'Saw X', 'Thriller', '8.7', 'A sick and desperate John travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer only to discover the entire operation is a scam to defraud the most vulnerable.', 'upcoming', 'https://img.hurawatch.bz/i/cache/images/d/df/df5fa57c75a59bc859299bc9470478df.jpg', 'https://s1.eestatic.com/2023/09/26/series/cine/797430280_236310377_1706x960.jpg', 'https://www.youtube.com/watch?v=iQPxd8MXzx4', NULL, NULL),
	(17, 'Oppenheimer', 'Drama', '9.3', 'The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.', 'upcoming', 'https://img.hurawatch.bz/i/cache/images/0/04/04f7d5c5954f7c9c2e1313e0b34e4306.jpg', 'https://gumlet.assettype.com/greaterkashmir/2023-07/49721150-59ef-4db4-833b-9845819b35c4/Edit__.jpg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true', 'https://www.youtube.com/watch?v=uYPbbksJxIg', NULL, NULL),
	(18, 'Killer Cases', 'Chrime', '8.3', 'Real Life murder investigations , trial and verdict', 'new', 'https://img.hurawatch.bz/i/cache/images/7/7d/7d278e0f07ea31831d95aad3ae394f8e.jpg', 'https://cropper.watch.aetnd.com/cdn.watch.aetnd.com/sites/4/2023/09/killer-cases-s4-2048x1152-promo-16x9-1.jpg', 'https://www.youtube.com/watch?v=I2p2IvmV3Ig', NULL, NULL),
	(19, 'Bodies', 'Chrime', '8.0', 'Four detectives in four different time periods of London find themselves investigating the same murder.', 'new', 'https://img.hurawatch.bz/i/cache/images/e/ea/eac2e631952b007e346da58bb2329785.jpg', 'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABU9hUHwoFBcAiOZzp7E7Gj7APA6QHeq5mrfKNPUtl9uLpNTBCajCZfRno2l6j7ngMCL2LOczuOQmIiTEOeowZ6alXpUDoyFj2GBy.jpg?r=e76', 'https://i.imgur.com/eMfDtqy.png', NULL, NULL),
	(20, 'Blackwater', 'Chrime', '8.5', 'One midsummer evening in 1973 two tourists are found murdered in a tent. The unsolved crime casts shadows on the lives of several people.', 'new', 'https://img.hurawatch.bz/i/cache/images/8/8f/8fed88ccc9b3b548e0847078293060aa.jpg', 'https://images.cdn.yle.fi/image/upload/f_auto,fl_progressive/q_auto/w_7680/w_500/dpr_2/v1680544407/39-1094828642b11dc9d4db.jpg', 'https://www.youtube.com/watch?v=axGyDlJw8oE', NULL, NULL);

-- Dumping structure for table db_api_film.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table db_api_film.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table db_api_film.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_api_film.users: ~0 rows (approximately)
DELETE FROM `users`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

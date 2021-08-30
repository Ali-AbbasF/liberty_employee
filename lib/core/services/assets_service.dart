enum AssetKey{
  profile_pic
}

class AssetsService {
  AssetsService._();

  static String getAssetLocation(AssetKey key) =>
      'assets/images/${_assetsLocation[key]}';

  static const _assetsLocation = <AssetKey, String>{
    AssetKey.profile_pic: 'profile_pic.jpg',
  };

}

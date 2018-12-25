import Firebase

extension Spark {
    static let Firestore_Users_Collection = firestoreDatabase.collection(SparkKeys.CollectionPath.users)
    static let Storage_Profile_Images = Storage.storage().reference().child(SparkKeys.StorageFolder.profileImages)
}

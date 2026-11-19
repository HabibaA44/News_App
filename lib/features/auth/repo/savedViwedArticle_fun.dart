import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/home/model/news_response/article.dart';
import 'package:intl/intl.dart';

class SavedviwedarticleFun {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> viewArticle(Article article,String catigory) async {
    final uid = _firebaseAuth.currentUser!.uid;
    String articaleId = article.title.hashCode.toString();
    try {
      await _firebaseFirestore
          .collection('user')
          .doc(uid)
          .collection('viewedArticle')
          .doc(articaleId)
          .set({
            'author': article.author,
            'title': article.title,
            'description': article.description,
            'image': article.urlToImage,
            'content': article.content,
            'veiwAt': Timestamp.now(),
            'publishedAt': DateFormat(
              'MMM d,yyyy',
            ).format(DateTime.parse(article.publishedAt!)),
            'catigory': catigory
          });
    } catch (error) {
      print("viwed failed $error");
    }
  }

  Future<void> savedArticle(Article article, String catigory) async {
    final uid = _firebaseAuth.currentUser!.uid;
    String articaleId = article.title.hashCode.toString();

    try {
      await _firebaseFirestore
          .collection('user')
          .doc(uid)
          .collection('savedArticle')
          .doc(articaleId)
          .set({
            'author': article.author,
            'title': article.title,
            'description': article.description,
            'image': article.urlToImage,
            'savedAt': Timestamp.now(),
            'publishedAt': DateFormat(
              'MMM d,yyyy',
            ).format(DateTime.parse(article.publishedAt!)),
            'catigory': catigory,
          });
    } catch (error) {
      print("saved failed$error");
    }
    // isSaved = true;
    // print("Saved Done");
  }

  Stream<QuerySnapshot> getSavedArticle() {
    final uid = _firebaseAuth.currentUser!.uid;
    return _firebaseFirestore
        .collection('user')
        .doc(uid)
        .collection('savedArticle')
        .orderBy('savedAt', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getViwedArticle() {
    final uid = _firebaseAuth.currentUser!.uid;
    return _firebaseFirestore
        .collection('user')
        .doc(uid)
        .collection('viewedArticle')
        .orderBy('veiwAt', descending: true)
        .snapshots();
  }

  Future<void> unSaved(String articleTitle) async {
    final uid = _firebaseAuth.currentUser!.uid;
    final articleId = articleTitle.hashCode.toString();

    await _firebaseFirestore
        .collection('user')
        .doc(uid)
        .collection('savedArticle')
        .doc(articleId)
        .delete();
  }

  Future<bool> isSaved(String articleTitle) async {
    final uid = _firebaseAuth.currentUser!.uid;
    final articleId = articleTitle.hashCode.toString();

    final doc = await _firebaseFirestore
        .collection('user')
        .doc(uid)
        .collection('savedArticle')
        .doc(articleId)
        .get();

    return doc.exists;
  }
}

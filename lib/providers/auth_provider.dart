import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_finder/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  User? get currentUser => _authService.currentUser;

  Stream<User?> get authStateChanges => _authService.authStateChanges;

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.register(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getFirebaseError(e);

      return false;
    } catch (e) {
      _errorMessage = 'Register failed Please try again.';

      return false;
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> login({required email, required password}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.login(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getFirebaseError(e);

      return false;
    } catch (e) {
      _errorMessage = "Login failed Please try again.";

      return false;
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.logout();
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getFirebaseError(e);
    } catch (e) {
      _errorMessage = "Somthing went wrong";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _getFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Account already exists.';
      case 'invalid-email':
        return 'Wrong eamil format.';
      case 'weak-password':
        return 'Weak password at least 6 charcter.';
      case 'invalid-credential':
        return 'Email or password wrong.';
      case 'user-disabled':
        return 'Account not found.';
      case 'too-many-requests':
        return 'Wait try agrain.';
      case 'network-request-failed':
        return 'Internet connection failed.';
      case 'operation-not-allowed':
        return 'Enable email/password in firebase.';
      default:
        return e.message ?? 'Failed!';
    }
  }
}

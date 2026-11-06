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
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getFirebaseError(e);

      return false;
    } on FirebaseException catch (e) {
      _errorMessage = _getServiceError(e);

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
      _errorMessage = "Something went wrong";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _getServiceError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return 'Permission denied,Please check FireStore security rule.';
      case 'unavailable':
        return 'Service unavailable.Check your internet connection.';
      case 'deadline-exceeded':
        return 'Request timed out. Please try again';

      default:
        return e.message ?? 'Unable to save your profile';
    }
  }

  String _getFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Account already exists.';
      case 'invalid-email':
        return 'Wrong email format.';
      case 'weak-password':
        return 'Weak password at least 6 characters.';
      case 'invalid-credential':
        return 'Email or password wrong.';
      case 'user-disabled':
        return 'Account not found.';
      case 'too-many-requests':
        return 'Wait try again.';
      case 'network-request-failed':
        return 'Internet connection failed.';
      case 'operation-not-allowed':
        return 'Enable email/password in firebase.';
      default:
        return e.message ?? 'Failed!';
    }
  }
}

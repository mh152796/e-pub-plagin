/// All functions
///
String getDateTime(DateTime? createdAt) {
  if (createdAt == null) {
    return 'No date available';
  }

  final now = DateTime.now();
  final difference = now.difference(createdAt);

  if (difference.inDays > 0) {
    return '${difference.inDays} days ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}
# security_scoped_resource

[![Pub](https://img.shields.io/pub/v/security_scoped_resource?color=green)](https://pub.dev/packages/security_scoped_resource)

Allows an iOS Flutter App to access a greater scope of the file system

## Usage

```dart
await SecurityScopedResource.instance.startAccessingSecurityScopedResource(dir);
await SecurityScopedResource.instance.stopAccessingSecurityScopedResource(dir);
```

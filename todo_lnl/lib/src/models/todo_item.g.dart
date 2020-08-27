// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem(
    json['complete'] as bool,
    json['id'] as String,
    json['note'] as String,
    json['task'] as String,
  );
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'complete': instance.complete,
      'id': instance.id,
      'note': instance.note,
      'task': instance.task,
    };

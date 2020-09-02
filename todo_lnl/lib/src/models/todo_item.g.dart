// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem(
    complete: json['complete'] as bool,
    id: json['id'] as String,
    note: json['note'] as String,
    task: json['task'] as String,
  );
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'complete': instance.complete,
      'id': instance.id,
      'note': instance.note,
      'task': instance.task,
    };

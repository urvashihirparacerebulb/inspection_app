class InspectionFormsResponseModel {
  InspectionFormsResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  InspectionFormResponse? data;

  factory InspectionFormsResponseModel.fromJson(Map<String, dynamic> json) => InspectionFormsResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: InspectionFormResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class InspectionListResponseModel {
  InspectionListResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<InspectionForm>? data;

  factory InspectionListResponseModel.fromJson(Map<String, dynamic> json) => InspectionListResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<InspectionForm>.from(json["data"].map((x) => InspectionForm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class InspectionFormResponse {
  InspectionFormResponse({
    this.data,
  });

  List<InspectionForm>? data;

  factory InspectionFormResponse.fromJson(Map<String, dynamic> json) => InspectionFormResponse(
    data: List<InspectionForm>.from(json["data"].map((x) => InspectionForm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class InspectionForm {
  InspectionForm({
    this.id,
    this.formNumber,
    this.formCompleted,
    this.modelNo,
    this.formName,
    this.inspectionDate,
    this.inspectionTime,
    this.assignedBy,
    this.dueDate,
  });

  int? id;
  String? formNumber;
  String? formCompleted;
  String? modelNo;
  String? formName;
  String? inspectionDate;
  String? inspectionTime;
  String? assignedBy;
  String? dueDate;

  factory InspectionForm.fromJson(Map<String, dynamic> json) => InspectionForm(
    id: json["id"],
    formNumber: json["form_number"],
    formCompleted: json["form_completed"],
    modelNo: json["model_no"],
    formName: json["form_name"],
    inspectionDate: json["inspection_date"],
    inspectionTime: json["inspection_time"],
    assignedBy: json["assigned_by"],
    dueDate: json["due_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_number": formNumber,
    "form_completed": formCompleted,
    "model_no": modelNo,
    "form_name": formName,
    "inspection_date": inspectionDate,
    "inspection_time": inspectionTime,
    "assigned_by": assignedBy,
    "due_date": dueDate,
  };
}

class FormDetailResponseModel {
  FormDetailResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  bool? status;
  String? message;
  List<FormDetail>? data;

  factory FormDetailResponseModel.fromJson(Map<String, dynamic> json) => FormDetailResponseModel(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<FormDetail>.from(json["data"].map((x) => FormDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FormDetail {
  FormDetail({
    this.id,
    this.formCategory,
    this.question,
    this.answerControl,
    this.labelText,
    this.placeholderText,
    this.defualtValue,
    this.optionValue,
    this.fileAccept,
    this.answer,
  });

  int? id;
  String? formCategory;
  String? question;
  String? answerControl;
  String? labelText;
  String? placeholderText;
  String? defualtValue;
  String? optionValue;
  String? fileAccept;
  String? answer;

  factory FormDetail.fromJson(Map<String, dynamic> json) => FormDetail(
    id: json["id"],
    formCategory: json["form_category"],
    question: json["question"],
    answerControl: json["answer_control"],
    labelText: json["label_text"],
    placeholderText: json["placeholder_text"],
    defualtValue: json["defualt_value"],
    optionValue: json["option_value"],
    fileAccept: json["file_accept"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_category": formCategory,
    "question": question,
    "answer_control": answerControl,
    "label_text": labelText,
    "placeholder_text": placeholderText,
    "defualt_value": defualtValue,
    "option_value": optionValue,
    "file_accept": fileAccept,
    "answer": answer,
  };
}
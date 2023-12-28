// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ProductStates {}

class ProductIntialState extends ProductStates {}

class ProductAddSuccessState extends ProductStates {}

class ProductAddFailureState extends ProductStates {}

class ProductEditSuccessState extends ProductStates {}

class ProductEditFailureState extends ProductStates {}

class ProductDeleteSuccessState extends ProductStates {}

class ProductDeleteFailureState extends ProductStates {}

class ProductGetAllSuccessState extends ProductStates {}
class ProductGetAllFailureState extends ProductStates {}

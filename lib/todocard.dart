import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  String titel;
  bool stu;
  Function changestu;
  Function delete;
  Function doneORnot;
  int index;
  cards({
    super.key,
    required this.titel,
    required this.stu,
    required this.changestu,
    required this.index,
    required this.delete,
    required this.doneORnot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changestu(index);
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(58, 66, 86, 0.3),
                  borderRadius: BorderRadius.circular(22),
                ),
                margin: EdgeInsets.only(top: 22),
                padding: EdgeInsets.all(22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titel,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        decoration: doneORnot(index)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    Row(
                      children: [
                        stu
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.close, color: Colors.red),
                        SizedBox(width: 22),
                        IconButton(
                          onPressed: () {
                            delete(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

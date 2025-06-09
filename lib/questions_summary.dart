import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children:
            summaryData.map((data) {
              final isCorrect = data['user_answer'] == data['correct_answer'];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color:
                            isCorrect
                                ? const Color.fromARGB(255, 64, 164, 231)
                                : const Color.fromARGB(255, 242, 124, 247),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Tu respuesta: ${data['user_answer']}',
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 208, 147, 248),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Respuesta correcta: ${data['correct_answer']}',
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 147, 182, 248),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}

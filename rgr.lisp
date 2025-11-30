(defun calculate-sequence ()
  (labels ((iter (i prev acc)
             (if (> i 30)
                 (nreverse acc)
                 (let ((curr (cond
                               ((= i 1) 1.0d0)
                               ((<= i 15) (+ (* prev 2.0d0) (* 5.0d0 (sin (float i 1.0d0)))))
                               ((= i 16) 2.0d0)
                               (t (+ (/ prev 2.0d0) (* 5.0d0 (cos (float i 1.0d0))))))))
                   (iter (1+ i) curr (cons (cons i curr) acc)))))) ; Тут теж ITER
    (iter 1 0.0d0 '())))

(defun print-results (data)
  (when data
    (let ((pair (car data)))
      (format t "~2d | ~14,6f~%" (car pair) (cdr pair)))
    (print-results (cdr data))))

(defun run ()
  (format t "~% i |        F(i)~%---|------------------~%")
  (print-results (calculate-sequence))
  (values))

(run)

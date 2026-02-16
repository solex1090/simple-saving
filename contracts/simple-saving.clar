;; savings.clar
(define-map balances {user: principal} {amount: uint})

(define-public (deposit (amount uint))
  (let ((transfer-result (stx-transfer? amount tx-sender (as-contract tx-sender))))
    (match transfer-result
      ok-value
        (begin
          (map-set balances {user: tx-sender}
            {amount: (+ amount (get amount (default-to {amount: u0} (map-get? balances {user: tx-sender}))))})
          (ok amount))
      err-value
        (err err-value))))

(define-public (withdraw (amount uint))
  (let ((bal (default-to {amount: u0} (map-get? balances {user: tx-sender}))))
    (if (>= (get amount bal) amount)
        ;; Fixed match expression by adding the missing error case
        (match (stx-transfer? amount (as-contract tx-sender) tx-sender)
          transfer-ok
            (begin
              (map-set balances {user: tx-sender} {amount: (- (get amount bal) amount)})
              (ok amount))
          transfer-err
            (err transfer-err))
        (err u100))))

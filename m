From: schwab@suse.de (Andreas Schwab)
Date: Wed, 26 Sep 2018 10:41:18 +0200
Subject: futex_atomic_cmpxchg_inatomic is missing
Message-ID: <mvmh8icabwx.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The riscv port does not define futex_atomic_cmpxchg_inatomic, but glibc
is assuming that set_robust_list always works.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

From: deepa.kernel@gmail.com (Deepa Dinamani)
Date: Thu,  5 Jul 2018 14:35:57 -0700
Subject: [PATCH v2 0/7] Introduce struct __kernel_timex
Message-ID: <20180705213604.18883-1-deepa.kernel@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The series introduces struct __kernel_timex as a substitute for
the non y2038 safe struct timex.

The series is based on the original series posted by Arnd Bergmann
in [1].

The overview of the series is as below:
1. Prepare for the compat timex interfaces to be used unconditionally.
2. Introduce struct __kernel_timex.
3. Use struct __kernel_timex in place of struct timex.
4. Switch syscalls to use struct __kernel_timex.

[1] https://sourceware.org/ml/libc-alpha/2015-05/msg00070.html

Changes since v1:
* Fix riscv asm/compat.h to pick up generic compat types

Deepa Dinamani (7):
  arm64: Make basic compat_* types always available
  sparc: Make thread_info.h available directly
  riscv: Include asm-generic/compat.h
  timex: prepare compat helpers for y2038 changes
  time: Add struct __kernel_timex
  timex: use __kernel_timex internally
  timex: change syscalls to use struct __kernel_timex

 arch/alpha/kernel/osf_sys.c     |  2 +-
 arch/arm64/include/asm/compat.h | 22 ++++-----
 arch/riscv/include/asm/compat.h |  3 ++
 arch/sparc/include/asm/compat.h |  2 +
 drivers/ptp/ptp_clock.c         |  2 +-
 include/asm-generic/compat.h    |  8 +++-
 include/linux/compat.h          | 33 --------------
 include/linux/compat_time.h     | 34 ++++++++++++++
 include/linux/posix-clock.h     |  2 +-
 include/linux/syscalls.h        |  5 +--
 include/linux/timex.h           |  9 +++-
 include/uapi/linux/timex.h      | 41 +++++++++++++++++
 kernel/compat.c                 | 63 --------------------------
 kernel/time/ntp.c               | 12 ++---
 kernel/time/ntp_internal.h      |  2 +-
 kernel/time/posix-clock.c       |  2 +-
 kernel/time/posix-timers.c      | 14 ++----
 kernel/time/posix-timers.h      |  2 +-
 kernel/time/time.c              | 80 ++++++++++++++++++++++++++++++---
 kernel/time/timekeeping.c       |  4 +-
 20 files changed, 201 insertions(+), 141 deletions(-)


base-commit: e30b8745c892204095c0a8b69405868f63ddcce1
-- 
2.17.1

Cc: catalin.marinas at arm.com
Cc: davem at davemloft.net
Cc: linux-alpha at vger.kernel.org
Cc: linux-api at vger.kernel.org
Cc: linux-arch at vger.kernel.org
Cc: linux-riscv at lists.infradead.org
Cc: netdev at vger.kernel.org
Cc: palmer at sifive.com

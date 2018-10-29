From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 29 Oct 2018 11:48:52 +0100
Subject: [PATCH 0/2] riscv: add audit support
Message-ID: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patchset adds system call audit support on riscv (riscv32 &
riscv64).

The pachset was prepared on top of v4.19 tag.

audit-userspace changes were submitted. See:
https://github.com/linux-audit/audit-userspace/pull/73

Tested the following manually:
- auditctl (checked several different example rules from internet)
- aulast
- aulastlog
- ausearch
- ausyscall
- aureport
- autrace (compared some syscalls to strace: order and return 
  value/input arguments seem to be correct)
- /proc/self/loginuid (required by DNF [package manager])

I looked into audit-testsuite and with some adjustments results are:

Failed 4/14 test programs. 19/88 subtests failed.

The failing tests were due to missing CONFIG_IP_NF_MANGLE, 'id -Z' not 
printing categories (don't know why), not having loadable kernel module
support enablled and syscall_socketcall not being relevant for new arches.

audit-testsuite with adjustments:
https://github.com/davidlt/audit-testsuite/tree/riscv64

Depends on:
[PATCH 1/2] Move EM_RISCV into elf-em.h
http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html

This should solve DNF issues in Fedora 29/RISCV.

David Abdurachmanov (2):
  riscv: add audit support
  riscv: audit: add audit hook in do_syscall_trace_enter/exit()

 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/ptrace.h      |  5 +++++
 arch/riscv/include/asm/syscall.h     | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  6 ++++++
 arch/riscv/kernel/entry.S            |  4 ++--
 arch/riscv/kernel/ptrace.c           |  5 +++++
 include/uapi/linux/audit.h           |  2 ++
 7 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.2

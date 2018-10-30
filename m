From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Tue, 30 Oct 2018 11:01:05 +0100
Subject: [PATCH 0/2] riscv: add ARCH_HAS_SG_CHAIN to Kconfig
Message-ID: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This should improve virtio-gpu support for riscv.

David Abdurachmanov (2):
  riscv: add ARCH_HAS_SG_CHAIN
  doc: re-run features-refresh.sh

 Documentation/features/io/sg-chain/arch-support.txt           | 4 ++--
 .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
 Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
 Documentation/features/vm/pte_special/arch-support.txt        | 2 +-
 arch/riscv/Kconfig                                            | 1 +
 5 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.2

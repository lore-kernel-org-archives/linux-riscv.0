From: sashal@kernel.org (Sasha Levin)
Date: Thu, 22 Nov 2018 14:52:30 -0500
Subject: [PATCH AUTOSEL 4.19 26/36] riscv: add missing vdso_install target
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
Message-ID: <20181122195240.13123-26-sashal@kernel.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

[ Upstream commit f157d411a9eb170d2ee6b766da7a381962017cc9 ]

Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
vdso_install target in arch/riscv/Makefile.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 61ec42405ec9..110be14e6122 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -82,4 +82,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
+PHONY += vdso_install
+vdso_install:
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
+
 all: vmlinux
-- 
2.17.1

From: alankao@andestech.com (Alan Kao)
Date: Tue, 8 May 2018 11:21:57 +0800
Subject: [PATCH] riscv/ftrace: Fix the problem modules cannot find _mcount
Message-ID: <1525749717-384-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Enabling ftrace and module support at the same time fails the kernel
build process, because modules cannot find the _mcount symbol.  This
patch fixes this issue.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/mcount.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index ce9bdc57a2a1..5721624886a1 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -126,5 +126,5 @@ do_trace:
 	RESTORE_ABI_STATE
 	ret
 ENDPROC(_mcount)
-EXPORT_SYMBOL(_mcount)
 #endif
+EXPORT_SYMBOL(_mcount)
-- 
2.17.0

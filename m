From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon,  4 Jun 2018 13:30:28 -0700
Subject: [PATCH] riscv/ftrace: Export _mcount when FUNCTION_GRAPH_TRACER isn't
 set
In-Reply-To: <20180604203028.13886-1-palmer@sifive.com>
References: <1525749717-384-1-git-send-email-alankao@andestech.com>
 <20180604203028.13886-1-palmer@sifive.com>
Message-ID: <20180604203028.13886-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Alan Kao <alankao@andestech.com>

The EXPORT_SYMBOL(_mcount) for RISC-V ended up inside a
CONFIG_FUNCTION_GRAPH_TRACER ifdef.  If you enable modules without
enabling CONFIG_FUNCTION_GRAPH_TRACER then you'll get a build error
without this patch because the modules won't be able to find _mcount.

The new behavior is to export _mcount whenever CONFIG_FUNCTION_TRACER is
defined.  This matches what every other architecture is doing.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Zong Li <zong@andestech.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
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
2.16.4

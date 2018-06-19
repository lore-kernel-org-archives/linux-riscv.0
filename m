From: robh@kernel.org (Rob Herring)
Date: Tue, 19 Jun 2018 15:41:34 -0600
Subject: [PATCH] riscv: remove unnecessary of_platform_populate call
Message-ID: <20180619214134.20130-1-robh@kernel.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The DT core will call of_platform_default_populate, so it is not
necessary for arch specific code to call it unless there are custom
match entries, auxdata or parent device. Neither of those apply here, so
remove the call.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv at lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/riscv/kernel/setup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index ee44a48faf79..f0d2070866d4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -220,8 +220,3 @@ void __init setup_arch(char **cmdline_p)
 	riscv_fill_hwcap();
 }
 
-static int __init riscv_device_init(void)
-{
-	return of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
-}
-subsys_initcall_sync(riscv_device_init);
-- 
2.17.1

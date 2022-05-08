Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DC7C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOEdLEhtnHuUlugt4YBqVIfOKU6E+UCEyetiU7Yh1E4=; b=BfFWWT8WGQvlI2
	7hPBAWHVXIsMlZyw7T6hfUokxuyDLLgptOb7FK/D4Rou212i52hB7FnbGI+xjV3C6u2Dr4zLiBhD5
	3aRljQJVl/HD+Fi3TItGZpFH+88H7+QDTsrgBp01Sj40rVOSj9wFbNQZf/xWBQnbs20anXfPzNpTy
	OAtGgkD6hdCgkVuMQBTaRAEg8MpGvz+t9v9uo3XbcngMg/nEuQ0GPQ/AbgpGBntCU/iSXTBW6xguO
	jprN6FgFpJGYBVMTb5QP1aT3kFOObXIYHjf66xHr9g9ghKhclsJ93wRhrGPzSEBhm7vbtv1kDtd1I
	XnCP73Ffwj9IlymDHUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnjaJ-00Ab1K-NL; Sun, 08 May 2022 16:16:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnjaG-00Ab0J-Bc
 for linux-riscv@lists.infradead.org; Sun, 08 May 2022 16:16:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFA5C6121C;
 Sun,  8 May 2022 16:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDC1C385C0;
 Sun,  8 May 2022 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652026595;
 bh=1D217r1rSI/uUeSIUljN5J553Ajo8zPgW0SHZ2rk+io=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bkxkj8L1JiFS7MiCImm50YEZA/y0LoDC6dK+ZhYwc59l2AdRol9CFhGrkpuAUDYjy
 Wdv7f9x4kCNhOQdPCB4cKzmvR8VRc1tJchGSEuv5jGbQ2/8WhXcS3CBxGK07H1P2S0
 feZH21gUL3s8D9XG0WkxWHeDVH2G5SlXZkg8nE1O+Wl5lAFCBfEhtsmKSCyMtarMww
 Y6MF9P2PeoJi937nqmfY8bazzEtLdNZ8/3bLh/+Wd2I2D0zhnaFhx6DQG/fF7KUW0y
 hK2FqBj+6hTibsMrhxPSE8UthdSkITPTWpFTtX8MJBE1il89sfJrAeHsnWFfBmWWLE
 zCQK2m8bJ9Xkw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 2/4] riscv: introduce unified static key mechanism for CPU
 features
Date: Mon,  9 May 2022 00:07:47 +0800
Message-Id: <20220508160749.984-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220508160749.984-1-jszhang@kernel.org>
References: <20220508160749.984-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_091636_519809_C3C1FFF6 
X-CRM114-Status: GOOD (  25.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, riscv has several features why may not be supported on all
riscv platforms, for example, FPU, SV48 and so on. To support unified
kernel Image style, we need to check whether the feature is suportted
or not. If the check sits at hot code path, then performance will be
impacted a lot. static key can be used to solve the issue. In the past
FPU support has been converted to use static key mechanism. I believe
we will have similar cases in the future.

Similar as arm64 does(in fact, some code is borrowed from arm64), this
patch tries to add an unified mechanism to use static keys for all
the cpu features by implementing an array of default-false static keys
and enabling them when detected. The cpus_have_*_cap() check uses the
static keys if riscv_const_caps_ready is finalized, otherwise the
compiler generates the bitmap test.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Makefile                 |  3 +
 arch/riscv/include/asm/cpufeature.h | 94 +++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c      | 23 +++++++
 arch/riscv/tools/Makefile           | 22 +++++++
 arch/riscv/tools/cpucaps            |  5 ++
 arch/riscv/tools/gen-cpucaps.awk    | 40 ++++++++++++
 6 files changed, 187 insertions(+)
 create mode 100644 arch/riscv/include/asm/cpufeature.h
 create mode 100644 arch/riscv/tools/Makefile
 create mode 100644 arch/riscv/tools/cpucaps
 create mode 100755 arch/riscv/tools/gen-cpucaps.awk

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..f4df67369d84 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -154,3 +154,6 @@ PHONY += rv64_randconfig
 rv64_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
 		-f $(srctree)/Makefile randconfig
+
+archprepare:
+	$(Q)$(MAKE) $(build)=arch/riscv/tools kapi
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..d80ddd2f3b49
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#ifndef __ASM_CPUFEATURE_H
+#define __ASM_CPUFEATURE_H
+
+#include <asm/cpucaps.h>
+
+#include <linux/bug.h>
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
+
+extern DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
+extern struct static_key_false cpu_hwcap_keys[RISCV_NCAPS];
+extern struct static_key_false riscv_const_caps_ready;
+
+static __always_inline bool system_capabilities_finalized(void)
+{
+	return static_branch_likely(&riscv_const_caps_ready);
+}
+
+/*
+ * Test for a capability with a runtime check.
+ *
+ * Before the capability is detected, this returns false.
+ */
+static inline bool cpus_have_cap(unsigned int num)
+{
+	if (num >= RISCV_NCAPS)
+		return false;
+	return test_bit(num, cpu_hwcaps);
+}
+
+/*
+ * Test for a capability without a runtime check.
+ *
+ * Before capabilities are finalized, this returns false.
+ * After capabilities are finalized, this is patched to avoid a runtime check.
+ *
+ * @num must be a compile-time constant.
+ */
+static __always_inline bool __cpus_have_const_cap(int num)
+{
+	if (num >= RISCV_NCAPS)
+		return false;
+	return static_branch_unlikely(&cpu_hwcap_keys[num]);
+}
+
+/*
+ * Test for a capability without a runtime check.
+ *
+ * Before capabilities are finalized, this will BUG().
+ * After capabilities are finalized, this is patched to avoid a runtime check.
+ *
+ * @num must be a compile-time constant.
+ */
+static __always_inline bool cpus_have_final_cap(int num)
+{
+	if (system_capabilities_finalized())
+		return __cpus_have_const_cap(num);
+	else
+		BUG();
+}
+
+/*
+ * Test for a capability, possibly with a runtime check.
+ *
+ * Before capabilities are finalized, this behaves as cpus_have_cap().
+ * After capabilities are finalized, this is patched to avoid a runtime check.
+ *
+ * @num must be a compile-time constant.
+ */
+static __always_inline bool cpus_have_const_cap(int num)
+{
+	if (system_capabilities_finalized())
+		return __cpus_have_const_cap(num);
+	else
+		return cpus_have_cap(num);
+}
+
+static inline void cpus_set_cap(unsigned int num)
+{
+	if (num >= RISCV_NCAPS) {
+		pr_warn("Attempt to set an illegal CPU capability (%d >= %d)\n",
+			num, RISCV_NCAPS);
+	} else {
+		__set_bit(num, cpu_hwcaps);
+	}
+}
+
+#endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..e6c72cad0c1c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -9,6 +9,7 @@
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/of.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
 #include <asm/smp.h>
@@ -25,6 +26,15 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
 
+DECLARE_BITMAP(cpu_hwcaps, RISCV_NCAPS);
+EXPORT_SYMBOL(cpu_hwcaps);
+
+DEFINE_STATIC_KEY_ARRAY_FALSE(cpu_hwcap_keys, RISCV_NCAPS);
+EXPORT_SYMBOL(cpu_hwcap_keys);
+
+DEFINE_STATIC_KEY_FALSE(riscv_const_caps_ready);
+EXPORT_SYMBOL(riscv_const_caps_ready);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -62,6 +72,17 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static void __init enable_cpu_capabilities(void)
+{
+	int i;
+
+	for (i = 0; i < RISCV_NCAPS; i++) {
+		if (!cpus_have_cap(i))
+			continue;
+		static_branch_enable(&cpu_hwcap_keys[i]);
+	}
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -236,4 +257,6 @@ void __init riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		static_branch_enable(&cpu_hwcap_fpu);
 #endif
+	enable_cpu_capabilities();
+	static_branch_enable(&riscv_const_caps_ready);
 }
diff --git a/arch/riscv/tools/Makefile b/arch/riscv/tools/Makefile
new file mode 100644
index 000000000000..932b4fe5c768
--- /dev/null
+++ b/arch/riscv/tools/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gen := arch/$(ARCH)/include/generated
+kapi := $(gen)/asm
+
+kapi-hdrs-y := $(kapi)/cpucaps.h
+
+targets += $(addprefix ../../../,$(gen-y) $(kapi-hdrs-y))
+
+PHONY += kapi
+
+kapi:   $(kapi-hdrs-y) $(gen-y)
+
+# Create output directory if not already present
+_dummy := $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
+
+quiet_cmd_gen_cpucaps = GEN     $@
+      cmd_gen_cpucaps = mkdir -p $(dir $@) && \
+                     $(AWK) -f $(filter-out $(PHONY),$^) > $@
+
+$(kapi)/cpucaps.h: $(src)/gen-cpucaps.awk $(src)/cpucaps FORCE
+	$(call if_changed,gen_cpucaps)
diff --git a/arch/riscv/tools/cpucaps b/arch/riscv/tools/cpucaps
new file mode 100644
index 000000000000..cb1ff2747859
--- /dev/null
+++ b/arch/riscv/tools/cpucaps
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Internal CPU capabilities constants, keep this list sorted
+
+HAS_NO_FPU
diff --git a/arch/riscv/tools/gen-cpucaps.awk b/arch/riscv/tools/gen-cpucaps.awk
new file mode 100755
index 000000000000..52a1e1b064ad
--- /dev/null
+++ b/arch/riscv/tools/gen-cpucaps.awk
@@ -0,0 +1,40 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-cpucaps.awk: riscv cpucaps header generator
+#
+# Usage: awk -f gen-cpucaps.awk cpucaps.txt
+
+# Log an error and terminate
+function fatal(msg) {
+	print "Error at line " NR ": " msg > "/dev/stderr"
+	exit 1
+}
+
+# skip blank lines and comment lines
+/^$/ { next }
+/^#/ { next }
+
+BEGIN {
+	print "#ifndef __ASM_CPUCAPS_H"
+	print "#define __ASM_CPUCAPS_H"
+	print ""
+	print "/* Generated file - do not edit */"
+	cap_num = 0
+	print ""
+}
+
+/^[vA-Z0-9_]+$/ {
+	printf("#define RISCV_%-30s\t%d\n", $0, cap_num++)
+	next
+}
+
+END {
+	printf("#define RISCV_NCAPS\t\t\t\t%d\n", cap_num)
+	print ""
+	print "#endif /* __ASM_CPUCAPS_H */"
+}
+
+# Any lines not handled by previous rules are unexpected
+{
+	fatal("unhandled statement")
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

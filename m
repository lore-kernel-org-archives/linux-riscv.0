Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7875C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xag/eFpNh1/jOaLp7vz/78a9891DzijqCkfFcp2oRg4=; b=AQcHng4o/5S00o
	ApirS+97TXPX8vgFfX6bVKq1dqEf++GWGXSHFqQlxZyy5yHExu8UX4ksG3BqfvhTpiTzGvhNtIxQW
	pm33y1Dj0UqbytJX+KSvDOvYBVfatkO/3sLVN6na/sX2nGR5ed46Chq4bfubT+JgY+fOK1Xk84xWe
	z1cn27ZH928n0PK88LQ1Pi3OCYtfE1PQQErTLwTKqvtdr4leMJg1JcmlPnkUXGMQJV8/I0nPsG90T
	6xRsVtvvgVc2KuPU2w609szlNJ6zRy5+9dOjWiBx8sTY/VR2iC0U1ZTNYE5+9EPj7wN+92NbIV+6Y
	FTvFE6cuow9VbEBtgOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclZO-00GHna-9e; Fri, 08 Apr 2022 10:10:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclZH-00GHfY-25; Fri, 08 Apr 2022 10:10:17 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KZYqB5gRvzgYc1;
 Fri,  8 Apr 2022 18:08:22 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 18:10:08 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <palmer@dabbelt.com>, <liaochang1@huawei.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, <jszhang@kernel.org>,
 <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <mick@ics.forth.gr>,
 <paul.walmsley@sifive.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>
Subject: [PATCH v3 -next 5/6] RISC-V: Add purgatory
Date: Fri, 8 Apr 2022 18:09:13 +0800
Message-ID: <20220408100914.150110-6-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408100914.150110-1-lizhengyu3@huawei.com>
References: <20220408100914.150110-1-lizhengyu3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_031015_503769_31D1A844 
X-CRM114-Status: GOOD (  17.93  )
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

This patch adds purgatory, the name and concept have been taken
from kexec-tools. Purgatory runs between two kernels, and do
verify sha256 hash to ensure the kernel to jump to is fine and
has not been corrupted after loading. Makefile is modified based
on x86 platform.

Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
---
 arch/riscv/Kbuild                |  2 +
 arch/riscv/Kconfig               |  6 ++
 arch/riscv/purgatory/.gitignore  |  4 ++
 arch/riscv/purgatory/Makefile    | 95 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/entry.S     | 47 ++++++++++++++++
 arch/riscv/purgatory/purgatory.c | 45 +++++++++++++++
 6 files changed, 199 insertions(+)
 create mode 100644 arch/riscv/purgatory/.gitignore
 create mode 100644 arch/riscv/purgatory/Makefile
 create mode 100644 arch/riscv/purgatory/entry.S
 create mode 100644 arch/riscv/purgatory/purgatory.c

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index fb3397223d52..f562c7343fda 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -3,5 +3,7 @@
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 
+obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
+
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e95e4c390514..68733c2b6fcc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -394,6 +394,12 @@ config KEXEC_FILE
 	  for kernel and initramfs as opposed to list of segments as
 	  accepted by previous system call.
 
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+	select BUILD_BIN2C
+	depends on CRYPTO=y
+	depends on CRYPTO_SHA256=y
+
 config CRASH_DUMP
 	bool "Build kdump crash kernel"
 	help
diff --git a/arch/riscv/purgatory/.gitignore b/arch/riscv/purgatory/.gitignore
new file mode 100644
index 000000000000..38d7d1bda4d7
--- /dev/null
+++ b/arch/riscv/purgatory/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+purgatory.chk
+purgatory.ro
+kexec-purgatory.c
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
new file mode 100644
index 000000000000..d4df200f7edf
--- /dev/null
+++ b/arch/riscv/purgatory/Makefile
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+OBJECT_FILES_NON_STANDARD := y
+
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+
+targets += $(purgatory-y)
+PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
+
+$(obj)/string.o: $(srctree)/lib/string.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
+	$(call if_changed_rule,as_o_S)
+
+$(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
+	$(call if_changed_rule,as_o_S)
+
+$(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_sha256.o := -D__DISABLE_EXPORTS
+CFLAGS_string.o := -D__DISABLE_EXPORTS
+CFLAGS_ctype.o := -D__DISABLE_EXPORTS
+
+# When linking purgatory.ro with -r unresolved symbols are not checked,
+# also link a purgatory.chk binary without -r to check for unresolved symbols.
+PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
+LDFLAGS_purgatory.ro := -r $(PURGATORY_LDFLAGS)
+LDFLAGS_purgatory.chk := $(PURGATORY_LDFLAGS)
+targets += purgatory.ro purgatory.chk
+
+# Sanitizer, etc. runtimes are unavailable and cannot be linked here.
+GCOV_PROFILE	:= n
+KASAN_SANITIZE	:= n
+UBSAN_SANITIZE	:= n
+KCSAN_SANITIZE	:= n
+KCOV_INSTRUMENT := n
+
+# These are adjustments to the compiler flags used for objects that
+# make up the standalone purgatory.ro
+
+PURGATORY_CFLAGS_REMOVE := -mcmodel=kernel
+PURGATORY_CFLAGS := -mcmodel=medany -ffreestanding -fno-zero-initialized-in-bss
+PURGATORY_CFLAGS += $(DISABLE_STACKLEAK_PLUGIN) -DDISABLE_BRANCH_PROFILING
+PURGATORY_CFLAGS += -fno-stack-protector -g0
+
+# Default KBUILD_CFLAGS can have -pg option set when FTRACE is enabled. That
+# in turn leaves some undefined symbols like __fentry__ in purgatory and not
+# sure how to relocate those.
+ifdef CONFIG_FUNCTION_TRACER
+PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_FTRACE)
+endif
+
+ifdef CONFIG_STACKPROTECTOR
+PURGATORY_CFLAGS_REMOVE		+= -fstack-protector
+endif
+
+ifdef CONFIG_STACKPROTECTOR_STRONG
+PURGATORY_CFLAGS_REMOVE		+= -fstack-protector-strong
+endif
+
+CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
+CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
+
+CFLAGS_REMOVE_sha256.o		+= $(PURGATORY_CFLAGS_REMOVE)
+CFLAGS_sha256.o			+= $(PURGATORY_CFLAGS)
+
+CFLAGS_REMOVE_string.o		+= $(PURGATORY_CFLAGS_REMOVE)
+CFLAGS_string.o			+= $(PURGATORY_CFLAGS)
+
+CFLAGS_REMOVE_ctype.o		+= $(PURGATORY_CFLAGS_REMOVE)
+CFLAGS_ctype.o			+= $(PURGATORY_CFLAGS)
+
+AFLAGS_REMOVE_entry.o		+= -Wa,-gdwarf-2
+AFLAGS_REMOVE_memcpy.o		+= -Wa,-gdwarf-2
+AFLAGS_REMOVE_memset.o		+= -Wa,-gdwarf-2
+
+$(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
+		$(call if_changed,ld)
+
+$(obj)/purgatory.chk: $(obj)/purgatory.ro FORCE
+		$(call if_changed,ld)
+
+targets += kexec-purgatory.c
+
+quiet_cmd_bin2c = BIN2C   $@
+      cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
+
+$(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
+	$(call if_changed,bin2c)
+
+obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY)	+= kexec-purgatory.o
diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
new file mode 100644
index 000000000000..0194f4554130
--- /dev/null
+++ b/arch/riscv/purgatory/entry.S
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * purgatory: Runs between two kernels
+ *
+ * Copyright (C) 2022 Huawei Technologies Co, Ltd.
+ *
+ * Author: Li Zhengyu (lizhengyu3@huawei.com)
+ *
+ */
+
+.macro	size, sym:req
+	.size \sym, . - \sym
+.endm
+
+.text
+
+.globl purgatory_start
+purgatory_start:
+
+	lla	sp, .Lstack
+	mv	s0, a0	/* The hartid of the current hart */
+	mv	s1, a1	/* Phys address of the FDT image */
+
+	jal	purgatory
+
+	/* Start new image. */
+	mv	a0, s0
+	mv	a1, s1
+	ld	a2, riscv_kernel_entry
+	jr	a2
+
+size purgatory_start
+
+.align 4
+	.rept	256
+	.quad	0
+	.endr
+.Lstack:
+
+.data
+
+.globl riscv_kernel_entry
+riscv_kernel_entry:
+	.quad	0
+size riscv_kernel_entry
+
+.end
diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
new file mode 100644
index 000000000000..80596ab5fb62
--- /dev/null
+++ b/arch/riscv/purgatory/purgatory.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * purgatory: Runs between two kernels
+ *
+ * Copyright (C) 2022 Huawei Technologies Co, Ltd.
+ *
+ * Author: Li Zhengyu (lizhengyu3@huawei.com)
+ *
+ */
+
+#include <linux/purgatory.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <asm/string.h>
+
+u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
+
+struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
+
+static int verify_sha256_digest(void)
+{
+	struct kexec_sha_region *ptr, *end;
+	struct sha256_state ss;
+	u8 digest[SHA256_DIGEST_SIZE];
+
+	sha256_init(&ss);
+	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
+	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
+		sha256_update(&ss, (uint8_t *)(ptr->start), ptr->len);
+	sha256_final(&ss, digest);
+	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
+		return 1;
+	return 0;
+}
+
+/* workaround for a warning with -Wmissing-prototypes */
+void purgatory(void);
+
+void purgatory(void)
+{
+	if (verify_sha256_digest())
+		for (;;)
+			/* loop forever */
+			;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

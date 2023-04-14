Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5AAC77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZK1hGavdOc4hafFH4+8R9RBFXFZMOmQn561qEQYimgE=; b=WTC7FhMhaDUezNEciStYfEcTnn
	BCFv8wRLPYF8zx5JNr+HYNe685MgFMFXSexd2xO8fz5fdViy9sDvHjD9v1hZ6B9yCm6/7I9IBXBPQ
	2Vr2COTtOLelNoCioTDTDJb3lPBggHYd5T2WHpJ57KyR8/pQtnx6mzr2FClTIHDjlTk3MgOPOc5kB
	kJy20YjHtZQDWP9xHD5rtvsO9DfIq4yykJOL/Z5lBRKCXIrlR/1WZ6a4cTlz8z5avCEmtAqpzPMhQ
	SvB7mH1gqMcXTcojQGVkh670OZkj4h5h1+gsigFzq/bxYyfQY6ngss4HOjV7PSmZz8pkZAzOwePAv
	900EGSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpt-00A1kH-2q;
	Fri, 14 Apr 2023 15:59:41 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpq-00A1iP-1y
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id b2-20020a17090a6e0200b002470b249e59so8043905pjk.4
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487976; x=1684079976;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B94BkZ7daghX/inmD9rHvCSaX9DVRA1XEaP0tUQccbw=;
        b=LGr6tEu6iREyythLaMUfkOHD8BAkTlTDZJ8giXkI8tJt21GrojUizZGrI2hy59fwpj
         wO0jlf/s0CaWkqSF7QDb7Rl1tZLYhOXuUf/Y01Q2DD7vvmQXoSvRT+2Hdn/pWWnkhQF8
         RW1jo+54Pnl0cCKNIHu9VbvqZI2g5MVkieqIrQY4kalhyMuzxm5oqrvkaemp6my8/ADd
         7u5FslGK6m6ZXU+DlTmjpF5W6IhBTWJbMA82hUN6bHj8X0AuYrTiJCOo5WcblZ39lg/n
         I54+3Jwev4NKkR0L+CxitJE1odf5zuDsAjI32yqzhYraD3WGZ4pKxTjl9YQtc5W2fLsx
         jp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487976; x=1684079976;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B94BkZ7daghX/inmD9rHvCSaX9DVRA1XEaP0tUQccbw=;
        b=bjh0aZf017X8bujFULCwMxpNOIZDsfRkco4k/pdOoxqykdWCvwS2Tav/4FTCcHZk2p
         M+UHojRzin4Ym6wLKMeToxqrLXIMg3PfqV87CJD2RNA1BFyVmiukHJXs91CaG4dq7zZc
         vnIwwHB3pZJkth2KLsibzROIRf4YXmZSSUruYaX5kG7b8gdvXsYPoPzoz7A9Zog619vH
         9G20vq6+zbJk5/DKwKJUTSPkzQ/DZt7PIK8K5eVtjMXZEPbw7XwlI9Oh7jwhzMeVbbGJ
         aNzDJeIXYoA+hCyrHQvlb0D2ACQL4lwwWOIK2EThX1CZgVcVVGQkoyXhRo8IKwXTRoA3
         ccFw==
X-Gm-Message-State: AAQBX9fIy2XjSbTuOVHRlyYKSayDifWjifkLAKWIkhSxE68ghS7YF7Oc
	1Dp7Hw6K4onvma5sNkKPZO78q0ssud1pf0n8GIGn3951TfKtwCEmFabRCGs+3OeolR9HbOewhqH
	9m+enFO6dSsim5e42OGKA6Gp8kBWBSMbWBfwZbijm0v+LmJkVV+wLkDNtHKUJ/M/2pSn8WR8J1U
	xeh6eiSZO9LJl1
X-Google-Smtp-Source: AKy350Z/GDCabIKjwCihnSew4qRlImLymQVij6vd9gfZIWbugGjsZpJbbJRbZrStHp+sqZMowbsY5w==
X-Received: by 2002:a17:90b:215:b0:23d:376a:c2bc with SMTP id fy21-20020a17090b021500b0023d376ac2bcmr6023241pjb.5.1681487976338;
        Fri, 14 Apr 2023 08:59:36 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:35 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v18 07/20] riscv: Introduce riscv_v_vsize to record size of Vector context
Date: Fri, 14 Apr 2023 15:58:30 +0000
Message-Id: <20230414155843.12963-8-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085938_650903_004E75E3 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>, Xianting Tian <xianting.tian@linux.alibaba.com>, Liao Chang <liaochang1@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, greentime.hu@sifive.com, Heiko Stuebner <heiko.stuebner@vrull.eu>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch is used to detect the size of CPU vector registers and use
riscv_v_vsize to save the size of all the vector registers. It assumes all
harts has the same capabilities in a SMP system. If a core detects VLENB
that is different from the boot core, then it warns and turns off V
support for user space.

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---

Changes in v18:
 - Detect inconsistent VLEN setup on an SMP system (Heiko).

 arch/riscv/include/asm/vector.h |  8 ++++++++
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/smpboot.c     |  7 +++++++
 arch/riscv/kernel/vector.c      | 36 +++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index dfe5a321b2b4..68c9fe831a41 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -7,12 +7,16 @@
 #define __ASM_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <uapi/asm-generic/errno.h>
 
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
 #include <asm/csr.h>
 
+extern unsigned long riscv_v_vsize;
+int riscv_v_setup_vsize(void);
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
@@ -30,7 +34,11 @@ static __always_inline void riscv_v_disable(void)
 
 #else /* ! CONFIG_RISCV_ISA_V  */
 
+struct pt_regs;
+
+static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+#define riscv_v_vsize (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 392fa6e35d4a..be23a021ec32 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 923ca75f2192..267070f3cc9e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -17,6 +17,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -263,6 +264,7 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index ddb2afba6d25..67ae124db5a4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -32,6 +32,8 @@
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <uapi/asm/hwcap.h>
+#include <asm/vector.h>
 
 #include "head.h"
 
@@ -169,6 +171,11 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
+	if (has_vector()) {
+		if (riscv_v_setup_vsize())
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
 	 * a local TLB flush right now just in case.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..53bb32546248
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/export.h>
+
+#include <asm/vector.h>
+#include <asm/csr.h>
+#include <asm/elf.h>
+#include <asm/bug.h>
+
+unsigned long riscv_v_vsize __read_mostly;
+EXPORT_SYMBOL_GPL(riscv_v_vsize);
+
+int riscv_v_setup_vsize(void)
+{
+	unsigned long this_vsize;
+
+	/* There are 32 vector registers with vlenb length. */
+	riscv_v_enable();
+	this_vsize = csr_read(CSR_VLENB) * 32;
+	riscv_v_disable();
+
+	if (!riscv_v_vsize) {
+		riscv_v_vsize = this_vsize;
+		return 0;
+	}
+
+	if (riscv_v_vsize != this_vsize) {
+		WARN(1, "RISCV_ISA_V only supports one vlenb on SMP system");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

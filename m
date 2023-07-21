Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29344EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQJvBIyKTVN/1hd3hlyaZuOdcfgreFCbycPLMwfDhDQ=; b=DU81bh1mVYWJhn
	lZTPqavSijkzSIZUr9u+uJvp0qNNU+bnvvBImHvfVGVIMuQ/bVNQ9A2DFoCpa6KYPOhka4A2mH3AT
	dnCLjACb7GEB8XGhVyXuKRtifwCnzv0nm8+7TXKImMbiwU9ILduwl3qawEMshdvxiVamfj0WlNjsf
	3VH6q//w2j14S8DEDvDHpbbiHkx+MpC5zVSUPro8k2jSAbJ1ZMcpPeeU/St3DlnZu1RIposdI7nks
	NP5tWaKmF5FPMr6NjwJAd6n/EZJPM24Ag9m621jfAaVSUWb6NDjH/tv4vMjDJkjJ6UtfgdWcSt+Jd
	+aIBpqvmWuiYiMy9lDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoKA-00Dvel-1p;
	Fri, 21 Jul 2023 11:29:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoK6-00Dvd8-3C
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 11:29:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8ad907ba4so11098265ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689938965; x=1690543765;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xaxT72bLPg81xAbv2lFbqPbe5HQSZki7btL2KEJHTXk=;
        b=HhqdGMe6EvmQ1XaYtLlT1ByS4n6SKUUnmTimJcaGiUT9OqfdjCCOmoeGU5zgZGfh/E
         q84IZDC5h+9y4jgoY41KcNnh4SfXZR3dmlkpSD9ndseNCkKIec1j1Fgu1bYxfQ2cycUT
         GKP/pYgyU2hkETxmzC4YlI0TLuMnk7INVaV2Ldq3qNu8ess0bf0zYTWfprbJmBeLqkey
         QpwIroYAyJeu/HhNySplQIBiJu3Uvh35FbZshu1dYrcA+4a+YLtu8a3oXeybBTaMzEG9
         /5aEatm68NhSPE0A6VYb0hHAPk8Y3nhrqUPnHxnuCWxwD2xEepxPW9GBbRRHSaUsGLnz
         3zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689938965; x=1690543765;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaxT72bLPg81xAbv2lFbqPbe5HQSZki7btL2KEJHTXk=;
        b=kQZYMPmTLSUSUVo/X7UXTIWtqUZ7/otEYAMb09z5r1X3UaBPiQQMemSLJojJLPjWLS
         02DHBAknU1kPT9/B703NqpDCRbfR5djl+gedBjN0lsCB6RdzgbA5GUyJctC3hetmGnt4
         w1Cnh/X9oDe2cECvh2K9Xjvki1hDKvX3xOxfF8HvquBZnr7aR33G8kuDTwuJSQ8fr3Jn
         eIlf2tNxESV/slzQ1M6iv9gT+a4OGffEjpkr1VbJvt6J8vvZ3QofZwIFIVkVAjJNopQO
         mNwl6UhHiGZTOFTpC915CoTKHwUj/YFx29+jBffF0u+UXR5yhYXiyxLr4OsEBgGjU5rn
         Ve8w==
X-Gm-Message-State: ABy/qLYxwhOU1EBdL6QgTDMsONQ2cBmD7iQFfD64hy18zFFv2IcnVZXE
	Fk5Sd74FE3aTMuLo61zYV0XbG2GnasISGhzFx60omtnWdQzBV8dD1EBfSsR+vW/1su6uTCxiBJO
	Zh41CFbXwQz7DwuxYuuSHnXrcnBO6AKo2BJTBjrv+FnAqOOza5hzQrtBgezMYJKUlq9PwMtLsHe
	OooQFADvnsgGXd
X-Google-Smtp-Source: APBJJlH0oc3sMlUMXaV7WwhNdBlT9X2+5ZaY03PVBJVV1r71KD5MLHrnJ+wz5HCSD+J7s5H6aX0p0A==
X-Received: by 2002:a17:903:41cb:b0:1b8:ab0d:cd5 with SMTP id u11-20020a17090341cb00b001b8ab0d0cd5mr1763945ple.49.1689938964811;
        Fri, 21 Jul 2023 04:29:24 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b8953365aesm3243121plh.22.2023.07.21.04.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 04:29:24 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [v2, 2/5] riscv: Add support for kernel mode vector
Date: Fri, 21 Jul 2023 11:28:52 +0000
Message-Id: <20230721112855.1006-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721112855.1006-1-andy.chiu@sifive.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_042927_030289_5AB92DDD 
X-CRM114-Status: GOOD (  19.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Add kernel_vector_begin() and kernel_vector_end() function declarations
and corresponding definitions in kernel_mode_vector.c

These are needed to wrap uses of vector in kernel mode.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - 's/kernel_rvv/kernel_vector' and return void in kernel_vector_begin
   (Conor)
 - export may_use_simd to include/asm/simd.h
---
 arch/riscv/include/asm/simd.h          |  50 ++++++++++++
 arch/riscv/include/asm/vector.h        |   2 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/kernel_mode_vector.c | 101 +++++++++++++++++++++++++
 4 files changed, 154 insertions(+)
 create mode 100644 arch/riscv/include/asm/simd.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
new file mode 100644
index 000000000000..ef70af78005d
--- /dev/null
+++ b/arch/riscv/include/asm/simd.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef __ASM_SIMD_H
+#define __ASM_SIMD_H
+
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+
+DECLARE_PER_CPU(bool, vector_context_busy);
+
+/*
+ * may_use_simd - whether it is allowable at this time to issue vector
+ *                instructions or access the vector register file
+ *
+ * Callers must not assume that the result remains true beyond the next
+ * preempt_enable() or return from softirq context.
+ */
+static __must_check inline bool may_use_simd(void)
+{
+	/*
+	 * vector_context_busy is only set while preemption is disabled,
+	 * and is clear whenever preemption is enabled. Since
+	 * this_cpu_read() is atomic w.r.t. preemption, vector_context_busy
+	 * cannot change under our feet -- if it's set we cannot be
+	 * migrated, and if it's clear we cannot be migrated to a CPU
+	 * where it is set.
+	 */
+	return !in_irq() && !irqs_disabled() && !in_nmi() &&
+	       !this_cpu_read(vector_context_busy);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V */
+
+static __must_check inline bool may_use_simd(void)
+{
+	return false;
+}
+
+#endif /* ! CONFIG_RISCV_ISA_V */
+
+#endif
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index a4f3705fd144..b46b8f3261fa 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -22,6 +22,8 @@
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool riscv_v_first_use_handler(struct pt_regs *regs);
+void kernel_vector_begin(void);
+void kernel_vector_end(void);
 
 static __always_inline bool has_vector(void)
 {
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 506cc4a9a45a..3f4435746af7 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
+obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 000000000000..1c3b32d2b340
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Author: Catalin Marinas <catalin.marinas@arm.com>
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+#include <linux/types.h>
+
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+#include <asm/simd.h>
+
+DEFINE_PER_CPU(bool, vector_context_busy);
+
+/*
+ * Claim ownership of the CPU vector context for use by the calling context.
+ *
+ * The caller may freely manipulate the vector context metadata until
+ * put_cpu_vector_context() is called.
+ */
+static void get_cpu_vector_context(void)
+{
+	bool busy;
+
+	preempt_disable();
+	busy = __this_cpu_xchg(vector_context_busy, true);
+
+	WARN_ON(busy);
+}
+
+/*
+ * Release the CPU vector context.
+ *
+ * Must be called from a context in which get_cpu_vector_context() was
+ * previously called, with no call to put_cpu_vector_context() in the
+ * meantime.
+ */
+static void put_cpu_vector_context(void)
+{
+	bool busy = __this_cpu_xchg(vector_context_busy, false);
+
+	WARN_ON(!busy);
+	preempt_enable();
+}
+
+/*
+ * kernel_vector_begin(): obtain the CPU vector registers for use by the calling
+ * context
+ *
+ * Must not be called unless may_use_simd() returns true.
+ * Task context in the vector registers is saved back to memory as necessary.
+ *
+ * A matching call to kernel_vector_end() must be made before returning from the
+ * calling context.
+ *
+ * The caller may freely use the vector registers until kernel_vector_end() is
+ * called.
+ */
+void kernel_vector_begin(void)
+{
+	if (WARN_ON(!has_vector()))
+		return;
+
+	BUG_ON(!may_use_simd());
+
+	riscv_v_vstate_save(current, task_pt_regs(current));
+
+	get_cpu_vector_context();
+
+	riscv_v_enable();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kernel_vector_begin);
+
+/*
+ * kernel_vector_end(): give the CPU vector registers back to the current task
+ *
+ * Must be called from a context in which kernel_vector_begin() was previously
+ * called, with no call to kernel_vector_end() in the meantime.
+ *
+ * The caller must not use the vector registers after this function is called,
+ * unless kernel_vector_begin() is called again in the meantime.
+ */
+void kernel_vector_end(void)
+{
+	if (WARN_ON(!has_vector()))
+		return;
+
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+
+	riscv_v_disable();
+
+	put_cpu_vector_context();
+}
+EXPORT_SYMBOL_GPL(kernel_vector_end);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

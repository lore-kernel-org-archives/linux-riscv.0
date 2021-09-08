Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0897C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA97861131
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA97861131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mO/crue+mJS+3hXiJHjc67kP5Tjs7H5HqcFZmXevD2k=; b=CGKtuChBduQJoU
	ZhavDrChShc7osfNpmgWvTsyLx6wMfIxuce+2aIG4VoDzpE0mCXN0I6p2xb7G9fHkJy65cAaraXhL
	OlpE1lzY7P4hi0wAILYAc7C4aYw8KHYrptzFnpl5HPm0S2pU5lor3FZKvlVZlYt+j/5MseosDxhpE
	297hWSEoSwVYzSO/ayuGUbSw1CsYscWjAWFiIb+5A7LCakpl6gZAE1QLeQGhok28JUmJSGwVJWBmJ
	No7coQ1R4JFuIRLJFN0kQ2jTHZABWJQJXMntiEAx7wr48m6nNURvhRZk7sDFqnnm5Cg8n8w2+75tt
	mk7sy6PqGeuZthEnxrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1eP-007It9-Mg; Wed, 08 Sep 2021 17:46:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1e0-007IXB-VO
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id w6so1401285pll.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6oK4jNbYcTMU/+0WJjNoEZPUGOwkloI9wxPkGnC8fjQ=;
 b=HWpPkdxzM/riZwMXGoihezA9YyEA7iOlhkWjRyf7TPUI1cI8fvT7nVIa0ibcjnOpWW
 HefOjm1btTXd/FKCBV9h8zbBsm6EsBMGi9OCzIIdS1fN+zdYu+mWSTo23yAMPmAgt6Fs
 PH2BOFqpWWKsA8Zl779jAgYiBOjj7Ixq1FbzhgARlWxfX8uIMXxeKKz3jffw3Oer+bDk
 HqeGlGAAOH3JvpDZdoRJBgqVzoqNIASr5mVLr3eZ8BGaACTur0EI62O/jo+KlxeHJUdJ
 a2WLxTwQHIFsvWniO8Eay9E5gcOdSI8Z9wPwxjhrvTRq/Vsp4252fVtxhK2l2idM3+se
 OfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oK4jNbYcTMU/+0WJjNoEZPUGOwkloI9wxPkGnC8fjQ=;
 b=JWtis26PNu5vOxduBNTinE1EYFwO65cDSr7MyBJ5y3oBJ1D8FCYIbk66pzJdCYSzH9
 prNYieTAbJjXgepiVlROc9MQTus7XqDrUzsZOwMTZy0xjKyId1DyPHsaG3uj6o1r7D67
 unbOfrO1/Q+etnjWbCgAj1ppZHC0kgek/Bmrb2akFWqamtS/bUl8kP3w2h3ZHblLI3c2
 r1u3N7J7wKI6sJ9EfBng1ixYRr01iwOuhrSpN/iBQsdeItlLDPcvvXdNwyABs3IZ6P4d
 Hqs/belFKxMrXw2LIdvc5vEBG3ienjiVPmTWBoP/J1+uzk/URwJp2Ze8g91X9SdsHNhl
 JJuw==
X-Gm-Message-State: AOAM532k7gc7eB2zJsW1fLpf+U4eUwvDbN8HaKphr5VtmAud4KrogQSF
 RazuqS/sWuGmbQCeqc6x3zrNzX+9a2G/zg==
X-Google-Smtp-Source: ABdhPJwiFbDGdjLCARppFuAhuenxzRM2AP38Ty2sMqSVhbefKJDRjzCQI6IB6fU0nc+gd4UWBX1kww==
X-Received: by 2002:a17:903:189:b0:13a:186f:b8b7 with SMTP id
 z9-20020a170903018900b0013a186fb8b7mr4035031plg.57.1631123156209; 
 Wed, 08 Sep 2021 10:45:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:55 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 13/21] riscv: Add support for kernel mode vector
Date: Thu,  9 Sep 2021 01:45:25 +0800
Message-Id: <e3d94eee049fe9f3b6597e21748efbb1d4eb81de.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104557_066266_C49DE4C6 
X-CRM114-Status: GOOD (  18.52  )
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

Add <asm/vector.h> containing kernel_rvv_begin()/kernel_rvv_end() function
declarations and corresponding definitions in kernel_mode_vector.c

These are needed to wrap uses of vector in kernel mode.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/vector.h        |  14 ++
 arch/riscv/kernel/Makefile             |   6 +
 arch/riscv/kernel/kernel_mode_vector.c | 184 +++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..5d7f14453f68
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef __ASM_RISCV_VECTOR_H
+#define __ASM_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+void kernel_rvv_begin(void);
+void kernel_rvv_end(void);
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 344078080839..a2efd3646cd8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -41,6 +41,12 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_VECTOR)		+= vector.o
+obj-$(CONFIG_VECTOR)		+= kernel_mode_vector.o
+riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
+riscv-march-cflags-$(CONFIG_VECTOR)		:= $(riscv-march-cflags-y)v
+CFLAGS_kernel_mode_vector.o	+= -march=$(riscv-march-cflags-y)
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 000000000000..108cfafe7496
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Author: Catalin Marinas <catalin.marinas@arm.com>
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2020 SiFive
+ */
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+#include <linux/types.h>
+
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+
+DECLARE_PER_CPU(bool, vector_context_busy);
+DEFINE_PER_CPU(bool, vector_context_busy);
+
+/*
+ * may_use_vector - whether it is allowable at this time to issue vector
+ *                instructions or access the vector register file
+ *
+ * Callers must not assume that the result remains true beyond the next
+ * preempt_enable() or return from softirq context.
+ */
+static __must_check inline bool may_use_vector(void)
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
+
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
+static void rvv_enable(void)
+{
+	csr_set(CSR_STATUS, SR_VS);
+}
+
+static void rvv_disable(void)
+{
+	csr_clear(CSR_STATUS, SR_VS);
+}
+
+static void vector_flush_cpu_state(void)
+{
+	long tmp;
+
+	__asm__ __volatile__ (
+		"vsetvli %0, x0, e8, m1\n"
+		"vmv.v.i v0, 0\n"
+		"vmv.v.i v1, 0\n"
+		"vmv.v.i v2, 0\n"
+		"vmv.v.i v3, 0\n"
+		"vmv.v.i v4, 0\n"
+		"vmv.v.i v5, 0\n"
+		"vmv.v.i v6, 0\n"
+		"vmv.v.i v7, 0\n"
+		"vmv.v.i v8, 0\n"
+		"vmv.v.i v9, 0\n"
+		"vmv.v.i v10, 0\n"
+		"vmv.v.i v11, 0\n"
+		"vmv.v.i v12, 0\n"
+		"vmv.v.i v13, 0\n"
+		"vmv.v.i v14, 0\n"
+		"vmv.v.i v15, 0\n"
+		"vmv.v.i v16, 0\n"
+		"vmv.v.i v17, 0\n"
+		"vmv.v.i v18, 0\n"
+		"vmv.v.i v19, 0\n"
+		"vmv.v.i v20, 0\n"
+		"vmv.v.i v21, 0\n"
+		"vmv.v.i v22, 0\n"
+		"vmv.v.i v23, 0\n"
+		"vmv.v.i v24, 0\n"
+		"vmv.v.i v25, 0\n"
+		"vmv.v.i v26, 0\n"
+		"vmv.v.i v27, 0\n"
+		"vmv.v.i v28, 0\n"
+		"vmv.v.i v29, 0\n"
+		"vmv.v.i v30, 0\n"
+		"vmv.v.i v31, 0\n":"=r"(tmp)::);
+}
+
+/*
+ * kernel_rvv_begin(): obtain the CPU vector registers for use by the calling
+ * context
+ *
+ * Must not be called unless may_use_vector() returns true.
+ * Task context in the vector registers is saved back to memory as necessary.
+ *
+ * A matching call to kernel_rvv_end() must be made before returning from the
+ * calling context.
+ *
+ * The caller may freely use the vector registers until kernel_rvv_end() is
+ * called.
+ */
+void kernel_rvv_begin(void)
+{
+	if (WARN_ON(!has_vector))
+		return;
+
+	WARN_ON(!may_use_vector());
+
+	/* Acquire kernel mode vector */
+	get_cpu_vector_context();
+
+	/* Save vector state, if any */
+	vstate_save(current, task_pt_regs(current));
+
+	/* Enable vector */
+	rvv_enable();
+
+	/* Invalidate vector regs */
+	vector_flush_cpu_state();
+}
+EXPORT_SYMBOL(kernel_rvv_begin);
+
+/*
+ * kernel_rvv_end(): give the CPU vector registers back to the current task
+ *
+ * Must be called from a context in which kernel_rvv_begin() was previously
+ * called, with no call to kernel_rvv_end() in the meantime.
+ *
+ * The caller must not use the vector registers after this function is called,
+ * unless kernel_rvv_begin() is called again in the meantime.
+ */
+void kernel_rvv_end(void)
+{
+	if (WARN_ON(!has_vector))
+		return;
+
+	/* Invalidate vector regs */
+	vector_flush_cpu_state();
+
+	/* Restore vector state, if any */
+	vstate_restore(current, task_pt_regs(current));
+
+	/* disable vector */
+	rvv_disable();
+
+	/* release kernel mode vector */
+	put_cpu_vector_context();
+}
+EXPORT_SYMBOL(kernel_rvv_end);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

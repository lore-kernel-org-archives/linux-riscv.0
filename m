Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EAECA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2yLuWbHI+awCgDoXEv5Ai+Wl3sPIZfasVqpPGjLOSA=; b=ZJ0Wv+HSH8PIFO
	JW5IVuQRoiq+eb1w1Vap3agXCFlFK7Z5Tu8SCSaYFO7HZQa/9E8s7oV1RgF0TIWVKrwTNyVKBh+Pt
	XrdNVYyoUqNZONRIX0aluH1mKz8SW5peAbXt3csrA8h1EMx8aUs2GZcPnSm3We28nLtxPS6au3/VM
	8TlXI3j+8iUs7RA9PCPzD6xdQbWJMvwSDvKqDhXRny7ZUcmhRhmKF51VTtOnAxlBbesLOA8F9h7ur
	Qi19uvJwEC0MCJvGGytq5ODWNzCTJ3gcc/raAoo1g6W+ufexPwShUq8v3v3i+QGPynhe8cVmh4OUM
	VN2yPYm4BnqHW0RkAcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg21i-003Gti-0Q;
	Tue, 12 Sep 2023 11:57:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg21f-003Gsh-1G
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 11:57:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D277D60DFF;
	Tue, 12 Sep 2023 11:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03115C433C8;
	Tue, 12 Sep 2023 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694519870;
	bh=Jm4l0sbOk6Ms1fXIEvExUKNazEpiinXNjMDaBl0+dio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJQMU5KpIKu4PCBZchwGTlBMX7IENnzJyElrdYCvTtIKQkPONMCvt6kRbahyfGvwY
	 bTm2rJRSAq2A/vLpBEPb8bWmW0+NgG15rXRjfom+lF6MvKuNtOg7JMkwYmOxwcHVD3
	 kgzxeK9dgmEunco6QNKZOk06YqcFIzaoXCT1d5yeeZ1NwPsE8HZvtyDWWk/pqiNbvF
	 gTTfJJjhL21p8Y+5z5JGTWDBpDY8RS1N8jEtsWZVr6EVaIgeICyIODavG8R2kM/kJx
	 bOnVmMx6aoleYapblYH92RR+MCLKIuB84RKNFqHiBt20763Dy0/FeELGZ86dmHwGxy
	 jQOijpTQKUbtQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Samuel Neves <sneves@dei.uc.pt>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC PATCH 2/6] riscv: Add support for kernel mode vector
Date: Tue, 12 Sep 2023 13:57:24 +0200
Message-Id: <20230912115728.172982-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912115728.172982-1-bjorn@kernel.org>
References: <20230912115728.172982-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_045751_515101_C2F010C0 
X-CRM114-Status: GOOD (  21.08  )
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

From: Greentime Hu <greentime.hu@sifive.com>

Add kernel_vector_begin() and kernel_vector_end() function declarations
and corresponding definitions in kernel_mode_vector.c

These are needed to wrap uses of vector in kernel mode.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
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
index 531873986a15..768acd517414 100644
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
index 95cf25d48405..0597bb668b6e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

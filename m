Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D896BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F12061038
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F12061038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7ueZs7eVl2MC1s7WR3OhLx4+ecx599413ljOWBqB34=; b=GDjFi7utS9DGSn
	fyJDzlZgSzRPb93gkoalY7WW/cKwG9Q9BDtDO7eM4Ka0MQHI2CM7ofZ2eh+NQM9lPnHCvGaEOH/iS
	GDTC6zHFrho8SGO3fxv8XpMwHvRfvcUzvQN9yqV4b2QckpWBfYgoAC5F4oND+eTd6PdvvvPBYUxIw
	UX+9LhF4xzST+0pDjJ6uDcp1UCatGG69TahOW3+Z9+h18eX+At/4nXlq1Uo3XKIq1jNLfW4SHFWYq
	61jx7ownDq3hE2WnawPLtWJAfeA8/GH1UYHHJ+kWV6jrRfDlM+RzweNRCGDN1nLvaNcF35NzpR30X
	zIcL/2JVEWkCsTdwMUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNon-001LPd-I2; Tue, 09 Nov 2021 09:53:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkK-001JZc-Ob
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id m26so19009370pff.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F3gUTqBXHGiL19KAfjx/EYijGGOp0DCkOQjrfpw3bjc=;
 b=IISIGJipeVSh9FXbEQi+Tyuv/8NeGzpzw/sMW1HbuXQVW9bowNXkyt36J+Bx9iorlU
 Q2GBV8uhJKdZ6MYowxuM+fY4NS+RRCY/2RA5ydFQUCpNMNeswRMFpvfQkO+NNZfZ62nB
 z1HrBelhzRw7lzYwJmW6jU14nG4LbV4//kEt/2x1Mvvl93LBCaLeRjDf7eZ0WRJKb52u
 zgg3U+Zdg6/EEFousJtr59iw6zknwPZrYoCSFVZDQKiKnCXe+s8Dubu0GJnZDduLQmbM
 HUfmmhXPbKiGVjAgzgvOEUU0MkpKQNtWGDHsdiUtZwToY0uUhAEhzMs+fn2ifom7YgUB
 QvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3gUTqBXHGiL19KAfjx/EYijGGOp0DCkOQjrfpw3bjc=;
 b=GaP9K/tnL00oXLR8YD7iBybrt33kLntFD96NETayQ8aDU42gAguC/k2qQKSefQoTcR
 BDpYE44m6vAS8GpDkV/PvfvR4bfIn6NKOdVtCBJmj505XyHsClJDRpwtiq4bkIbsLazI
 lWSxPuXvgdPijZ3xAviNKs36qufejgNbKevN5OXKsMowgs7MSpEiCfmpgoIAzZLRhQab
 rbDmGeEfGWsZioVzaEgkBIbr49GujLFjC1wJNeS/NjEtoKMCv6AVDWl2+jui8jE2P//k
 Dg1b2h+XRmRvsMf+TEgH27c2EiX/ov/+1UYeSK3A6m4uPV0J1dJIuN+JApnKD90+I+sK
 j2Ng==
X-Gm-Message-State: AOAM530NPP35nQIecW/Dvl8jWOSdBXkqTmPP46/dfhjrFazlei61vdIJ
 2x2YTlagxqIumkO0umxxzKCLcA==
X-Google-Smtp-Source: ABdhPJylBWGGztsPastX75WALYPMLNUP9zNUffkdqiIDAW08rYy+g+UFLDsvl+F/dn5aAcIjAQskLQ==
X-Received: by 2002:a63:2b48:: with SMTP id r69mr4840642pgr.421.1636451331828; 
 Tue, 09 Nov 2021 01:48:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:51 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 13/17] riscv: Add support for kernel mode vector
Date: Tue,  9 Nov 2021 17:48:25 +0800
Message-Id: <5700882ca97cc9fb8ee44ce127f30ca04d81495e.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014852_844623_95019A57 
X-CRM114-Status: GOOD (  20.04  )
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
 arch/riscv/include/asm/switch_to.h     |   1 +
 arch/riscv/include/asm/vector.h        |  14 +++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/kernel_mode_vector.c | 144 +++++++++++++++++++++++++
 arch/riscv/kernel/vector.S             |   9 ++
 5 files changed, 169 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 576204217e0f..b02064a3effd 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -79,6 +79,7 @@ static __always_inline bool has_vector(void)
 extern unsigned long riscv_vsize;
 extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
 extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
+void vector_flush_cpu_state(void);
 
 static inline void __vstate_clean(struct pt_regs *regs)
 {
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
index 344078080839..8feda6312187 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_VECTOR)		+= vector.o
+obj-$(CONFIG_VECTOR)		+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 000000000000..8d2e53ea25c1
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,144 @@
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
+	if (WARN_ON(!has_vector()))
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
+EXPORT_SYMBOL_GPL(kernel_rvv_begin);
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
+	if (WARN_ON(!has_vector()))
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
+EXPORT_SYMBOL_GPL(kernel_rvv_end);
diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index 7f3e3a838424..a973532d2e7f 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -79,3 +79,12 @@ ENTRY(__vstate_restore)
 	csrc	sstatus, status
 	ret
 ENDPROC(__vstate_restore)
+
+ENTRY(vector_flush_cpu_state)
+	vsetvli t0, x0, e8, m8
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	ret
+ENDPROC(vector_flush_cpu_state)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

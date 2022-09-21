Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792AC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMhUOKsINOso+S65AmwWxy6s+kKQn88/Mmx3AE2wWes=; b=EiBvwlca9A0jZp
	SqUskYZH3sR1o60jzs0PReup/70TbTYdtLUu50iXrVjxaJOyhqMFShNWglI01MgJGGbQMaBsaQf4F
	t4vS7FiW7N/YZEtmcsSm4nmgvmd5RebYKEChpXyFXICp2lBU5G/QN0ky6t3RX2lb6OKAJIBVuzCLM
	+AkAXtCRSr1DRQLRfjvVrIZMfWNM6rXi3YycwkDc0WJuHdhPFZqWfyQCLGrHzoQSx1U6dE1+tRLW7
	P7MEA1mZlGBf6+fHYvkJg9PlGxfBy1ke7s0EXPaTNfldvpnlCKXrpmjb/311PyUxodgIzhCuZFFXr
	RHaMqTDYk7iQE9gWjqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2vL-00C3oQ-1c; Wed, 21 Sep 2022 16:50:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2vH-00C3lg-IP
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:50:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id bq9so10906183wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=el0T6aQTw3mwJKznCQ4/AJLb+bj7u+7hEjPO5x8RmzQ=;
        b=sVZi9+PmVQf9wKvYLoPvf63PkGmcMBM4+1sbSRUQveKD/HGtRI0GjOyE1hucL4WPRi
         zeJ5vZTIzUlAOJiHZHflS6RojRu7UVrZzmWiYjGmrCSKDg/R64Z1jVYz/OuU/Kb+en2s
         GEgaRi/lMpUNbEVamyOFBqB4hzGl8TYaIqYaLQi1q6pwpd20shh+81kCogWC3ZmmL/ik
         qLvSwzF+FWNBynlXPn71bLhhGkoDn3yuCmRk4eqze+XqsTGf6Dxr6/EqajrGfYaJ8IFc
         /YRgeEH9DzNu2UhkidoZm1o9VHp+ZSN5BRMjNFduDYLNzR1Gy+2KATPGulMLpyclsbiM
         GKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=el0T6aQTw3mwJKznCQ4/AJLb+bj7u+7hEjPO5x8RmzQ=;
        b=hff+CDXCNk7NXRlXg3JUdp+rHg+EGpHFCdC+SlQ01SUpMUviIs5UlKXF6bHxtLVH3e
         uOv0ZNLiaoxsQofflFcMGy38ugRBPK3b6JI8zUs9OBRNi9NaacRy1HRxho/MjQ6DcOxx
         IL+Kuac6l2SRr4NgTG1zXGdqDf66Pp5QidXOXdWCTjLlN+b06X8p7vUnXv4khRDzAEQE
         eRXsQebbXEQExQPcpwzjyhDWqLUV1/d4UGCUAWih5BprEHxrnDfcp1gBYe4cXippPOg2
         OBiJpMkuGaWQtVQUiMHwg07Dg0WVNB/vbWvTs8BHeRT1ItDnqJUjzj66plXKKMu0gQ1a
         yMnw==
X-Gm-Message-State: ACrzQf36e1SmYHgM3IWhnr41/2pIDc43ZPlA5apZ+MeGeEw426+sH4wo
	nFGlaw6WO+lpuXmviwrg2Y1XuS+vwEuiQkklhnyWVIehjIKEoQ==
X-Google-Smtp-Source: AMsMyM5JlZDR6cqlQzpRsTquLjatg0nJestYBAde/LLcXLS4vR90fylQZYQjpbLJTDteIu2T77KHmQmj4Rtvf9rXaHM=
X-Received: by 2002:a05:6000:1886:b0:22a:2944:a09 with SMTP id
 a6-20020a056000188600b0022a29440a09mr18105762wri.391.1663779004914; Wed, 21
 Sep 2022 09:50:04 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:49:28 -0700
Message-ID: <CAM2SziXTwcNSVjP78WbA_OVzOWrNfASpKfL0xH5ugJ0K7Goh-A@mail.gmail.com>
Subject: [PATCH 12/17] riscv: Add support for kernel mode vector
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_095007_632021_8E4947E0 
X-CRM114-Status: GOOD (  18.56  )
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

Add kernel_rvv_begin() and kernel_rvv_end() function declarations
and corresponding definitions in kernel_mode_vector.c

These are needed to wrap uses of vector in kernel mode.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/vector.h        |   3 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/kernel_mode_vector.c | 132 +++++++++++++++++++++++++
 arch/riscv/kernel/vector.S             |   9 ++
 4 files changed, 145 insertions(+)
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 16304b0c6a6f..a59841cc81fb 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -10,5 +10,8 @@

 void rvv_enable(void);
 void rvv_disable(void);
+void kernel_rvv_begin(void);
+void kernel_rvv_end(void);
+void vector_flush_cpu_state(void);

 #endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 35752fb6d145..8c238415f800 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_M_MODE)     += traps_misaligned.o
 obj-$(CONFIG_FPU)              += fpu.o
 obj-$(CONFIG_VECTOR)           += vector.o
+obj-$(CONFIG_VECTOR)           += kernel_mode_vector.o
 obj-$(CONFIG_SMP)              += smpboot.o
 obj-$(CONFIG_SMP)              += smp.o
 obj-$(CONFIG_SMP)              += cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c
b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 000000000000..0277168af0c5
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,132 @@
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
+       /*
+        * vector_context_busy is only set while preemption is disabled,
+        * and is clear whenever preemption is enabled. Since
+        * this_cpu_read() is atomic w.r.t. preemption, vector_context_busy
+        * cannot change under our feet -- if it's set we cannot be
+        * migrated, and if it's clear we cannot be migrated to a CPU
+        * where it is set.
+        */
+       return !in_irq() && !irqs_disabled() && !in_nmi() &&
+              !this_cpu_read(vector_context_busy);
+}
+
+/*
+ * Claim ownership of the CPU vector context for use by the calling context.
+ *
+ * The caller may freely manipulate the vector context metadata until
+ * put_cpu_vector_context() is called.
+ */
+static void get_cpu_vector_context(void)
+{
+       bool busy;
+
+       preempt_disable();
+       busy = __this_cpu_xchg(vector_context_busy, true);
+
+       WARN_ON(busy);
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
+       bool busy = __this_cpu_xchg(vector_context_busy, false);
+
+       WARN_ON(!busy);
+       preempt_enable();
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
+       if (WARN_ON(!has_vector()))
+               return;
+
+       WARN_ON(!may_use_vector());
+
+       /* Acquire kernel mode vector */
+       get_cpu_vector_context();
+
+       /* Save vector state, if any */
+       vstate_save(current, task_pt_regs(current));
+
+       /* Enable vector */
+       rvv_enable();
+
+       /* Invalidate vector regs */
+       vector_flush_cpu_state();
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
+       if (WARN_ON(!has_vector()))
+               return;
+
+       /* Invalidate vector regs */
+       vector_flush_cpu_state();
+
+       /* Restore vector state, if any */
+       vstate_restore(current, task_pt_regs(current));
+
+       /* disable vector */
+       rvv_disable();
+
+       /* release kernel mode vector */
+       put_cpu_vector_context();
+}
+EXPORT_SYMBOL_GPL(kernel_rvv_end);
diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index 9f7dc70c4443..9c2de823c0d9 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -91,3 +91,12 @@ ENTRY(rvv_disable)
        csrc    CSR_STATUS, status
        ret
 ENDPROC(rvv_disable)
+
+ENTRY(vector_flush_cpu_state)
+       vsetvli t0, x0, e8, m8, ta, ma
+       vmv.v.i v0, 0
+       vmv.v.i v8, 0
+       vmv.v.i v16, 0
+       vmv.v.i v24, 0
+       ret
+ENDPROC(vector_flush_cpu_state)
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

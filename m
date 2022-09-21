Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E5ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HASvP7/6ML+/2sXaLAf0Lu2a7ODg/7GMCWvh+x1Gmgc=; b=ayDf7L0+ptq9tO
	X8LRlVC4/dW4UNm8/fyjn21kP58mWcOd9MW4Uyt6yTefurgzKuI2QDgrm8ONLUmcprZ6Gm7RROs3I
	ba2UxOo9IEVoD4iqtC8YAs2gxWOPTZn8nKhugo8rcq1ixFZq2TF0X/q2/hu/dy1YfhzJBEQ0Lo7cT
	uaRRqhjCEBPeeir8SBK+Q0HSHYRH9Fd6jbqDXgWWqUR/xIzYVoTWlbS+iWGP8axL8CwtiHN6RRxsC
	Ug3q/Z0bUgwD0EYhEHFimVc60DMkYjKh/5PTYWuwvsoLysb1P/PkNsD78AdDJ0yVVjZ1tUWFwRjgQ
	uem20FuysclpMKpZW5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7eI-00Cmys-Vk; Wed, 21 Sep 2022 21:52:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7eF-00Cmwe-FP
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:52:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id f23so6981669plr.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9QztRJhDFYW9WZfYeW38b+1O0y8hGYDxe0zbOFpNx/M=;
        b=4FXEAyWnl8rEPNR7wbfnj5FmGXdFG3ED7A5Trq3qXhO0TVRAkAzXiPi9m5aZu4TXdp
         5gc4oJKyuy3QlWo8Zd3hGGQHg+9Z3RO3jY9PV5ln8dUqo9ty/PLDiMeFquJ8YxaLG8GP
         VAcPaec5zu3wKgRpoab3awGaBYP0XOZZmopsp0pGY/nhLfCGDz+A8GlBJ9+ZdvUoxqNr
         C+gdgHobTAA5WrJkfWII9pqdRzQ53hwmIbOPGQxSk8FK52ETaEDBp6llve5Su/T6KTWQ
         fPffBNJisYYv56YkayiFxA+AD2MUBbQbT+ttFlAwI9DLuIe6coi9VqGQ9XbGR30mhK3p
         LlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9QztRJhDFYW9WZfYeW38b+1O0y8hGYDxe0zbOFpNx/M=;
        b=XK6cSV57tYJlOVpiN68sMCI+IHncqyOVWD5O2KvS1Jw/WFdCa2SZBPLYQg7q3DNQ0Y
         XpkZUwrWfxeTG+FPkESh01EJEeTDuW0Eq0hHT26BaloVDv/U2D1+dmaPK0Azj5faz/ha
         d3NMrZN62LoEiZxZvo/27as8H1GfFPLtDdAejleBGYu7McJw7OH072ew+UzBd6uNHEJW
         hOZxd3e7qtyJ9eeZmtII+Jy0SvuIrkfv2+ZuIrm8GCB1hfhpw81PMG5PtxJbMTt2d1fE
         FK4HorXYMDbwi3Jd9i8icHgA/It6pGTWC/RikbU59kRJ7ZcJcyF5zkXB/7dug8fFVQDo
         /6rg==
X-Gm-Message-State: ACrzQf3FS1Dk5gd9MEfskXAeV2CDoh74xopkcGplDdr3bxmUM766oUnl
	1xb9GK0D/o3mNUDpk6UwxiiD8w==
X-Google-Smtp-Source: AMsMyM7FtJQyPVFcN5hAmKNQxQ5f0hiJdHy7x3MFQ7yEuNRelMTlBhku+aHb3OLsUtpA4xwmLlO6Vw==
X-Received: by 2002:a17:903:44e:b0:178:8492:d0ff with SMTP id iw14-20020a170903044e00b001788492d0ffmr126643plb.146.1663797170122;
        Wed, 21 Sep 2022 14:52:50 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:52:49 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Chris Stillson <stillson@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Changbin Du <changbin.du@intel.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Nick Knight <nick.knight@sifive.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Colin Cross <ccross@google.com>,
	Peter Collingbourne <pcc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Barret Rhoden <brho@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 12/17] riscv: Add support for kernel mode vector
Date: Wed, 21 Sep 2022 14:43:54 -0700
Message-Id: <20220921214439.1491510-12-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_145251_520626_E5921AD1 
X-CRM114-Status: GOOD (  21.99  )
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
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_VECTOR)		+= vector.o
+obj-$(CONFIG_VECTOR)		+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
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
index 9f7dc70c4443..9c2de823c0d9 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -91,3 +91,12 @@ ENTRY(rvv_disable)
 	csrc	CSR_STATUS, status
 	ret
 ENDPROC(rvv_disable)
+
+ENTRY(vector_flush_cpu_state)
+	vsetvli t0, x0, e8, m8, ta, ma
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	ret
+ENDPROC(vector_flush_cpu_state)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

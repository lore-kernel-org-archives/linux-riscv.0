Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E0C001E0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qDawcthkVV5SDsxO63e6MMKeomJjA3+170bSLE532lM=; b=l/xggM3pFepTNTHN/qkX1RpVkz
	PV16CBNPpLtsevNXSBMN31yGziaW6c1HR2u8+PcA2nryjufZ8eLxZxzDPPZUlSAoi35UqhpKsmGua
	i3OiGptYxckORRDlUKKzHYnyDQET6cAFDW67cbhp1oxwQniaTT9Lqi7DnJl53WadOdsjRVQDs3bHJ
	NbyylWu2EFAetmSAeY4KhSfCYg9x8jt2GktvMINzGZZousv6q80pNaRHSh6bBk0oeXkNboTghCNuy
	kfOd3hHwYBr75Edeu5qTRmrlSfxwqrquXqgKJtee2W8Z/ecr2xoHPZGMspNhM8tw8EIaVoxSvI0V2
	T6/vD1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgla-008zbz-1q;
	Sat, 15 Jul 2023 15:01:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKglX-008zbA-25
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:01:01 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso2103084b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433259; x=1692025259;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zV+n68z8zwXiYMhTDIWC1NXHhRag9MR6zl1GpKdQwv0=;
        b=W9u1Rh7FIMBncTNbzBPs5uTGKq2Z8+gAFBxCTcEF7A9Asouw4/CMUjolJ5olWBDEqS
         4Vs/Vg1so8bplsqYMxfGkwXtvPPjDYMu0e9fIuaS9CjzqsN8hvgSlD0WmXt7Td8XS2+p
         7E17PKwF3fxgRIRb8cOBkSjzegqlVtieE/88INo1akPm6GxLqp0dnJYGbcPznJvOAo6F
         FSVCDM4HtX+AD5N4YGEG5CTP8YHHuEhcpv67HmJIRgCOlPhNC3Y/GTMfUQ+AMM8hQ8p1
         1etqclN8yNV5CG0pSM5ZCoOuAXCA44MJBKcYZDjzEgMHSSmg/XxM8oNfIHmWY7VN8/hc
         n5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433259; x=1692025259;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zV+n68z8zwXiYMhTDIWC1NXHhRag9MR6zl1GpKdQwv0=;
        b=gvM7xHZBt1EbxAg9gHLwdTF4bqVhz1/DGwatXLF89Ryz0V8jGmzYFUfP3J+K6HTw0T
         Ub25HmBOsKVdwo65V8BF6b71ezK61p/2afBYnzN8PGwxsi61lC7SbYmJJX7/SMcrEPam
         QlGIg2pjy1AeM1D6RRor9nc4wbd13dUP1yH4+AArloCirWp2jXRhSxyfvIlb7sIygxOn
         4P3kWkkAM7bsnj1COtECPBMt6l+Aq07vUnhs4eqPVnDQd+f1BjyIAciujbh2UMpwEon0
         YAnNfmJGASbWsOEIew3otzcsU638o5JDDaqI98W5N+cd/l0LP7twAXkBIRaFNFMclWzW
         wNsg==
X-Gm-Message-State: ABy/qLaNmHxwdHfR30PAhIuT7B4QNaOVw3ncaskVmkmxSHNxhgX5pEU0
	OxlYud8MpVTZh7GU5TT7hj74w9FrA/5Tv2a+F/7ASJAEKxb6paev6DnhRLmktizW/zjn7qdCu78
	B1RitonEFamAaqHJqkX79uGNFHgxKAuRFbVF7MyhF4Rsb+6FvESaVTCAEmwf854dBulPz1qOLAZ
	GsV2L8xBQ05SSb
X-Google-Smtp-Source: APBJJlFGbgPSGyYp2zWN4S5JHSwJrlyR0E8ct/c2ZsjyFB0YUYArIyt6fJ/SYJe9ZI0705LRiimd0g==
X-Received: by 2002:a05:6a20:430f:b0:134:3013:cdb5 with SMTP id h15-20020a056a20430f00b001343013cdb5mr2701315pzk.35.1689433258301;
        Sat, 15 Jul 2023 08:00:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:00:57 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v1, 2/6] riscv: Add support for kernel mode vector
Date: Sat, 15 Jul 2023 15:00:28 +0000
Message-Id: <20230715150032.6917-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080059_686991_50D3233E 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, guoren@linux.alibaba.com, Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, anup@brainfault.org, Masahiro Yamada <masahiroy@kernel.org>, atishp@atishpatra.org, vineetg@rivosinc.com, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, paul.walmsley@sifive.com, greentime.hu@sifive.com, heiko.stuebner@vrull.eu
MIME-Version: 1.0
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
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h        |   2 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/kernel_mode_vector.c | 129 +++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index a4f3705fd144..9831b19153ae 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -22,6 +22,8 @@
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool riscv_v_first_use_handler(struct pt_regs *regs);
+int kernel_rvv_begin(void);
+void kernel_rvv_end(void);
 
 static __always_inline bool has_vector(void)
 {
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index a42951911067..b954bbf17c84 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
+obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 000000000000..c0c152c501a5
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,129 @@
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
+int kernel_rvv_begin(void)
+{
+	if (!has_vector())
+		return -EOPNOTSUPP;
+
+	if (!may_use_vector())
+		return -EPERM;
+
+	/* Save vector state, if any */
+	riscv_v_vstate_save(current, task_pt_regs(current));
+
+	/* Acquire kernel mode vector */
+	get_cpu_vector_context();
+
+	/* Enable vector */
+	riscv_v_enable();
+
+	return 0;
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
+	/* Restore vector state, if any */
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+
+	/* disable vector */
+	riscv_v_disable();
+
+	/* release kernel mode vector */
+	put_cpu_vector_context();
+}
+EXPORT_SYMBOL_GPL(kernel_rvv_end);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

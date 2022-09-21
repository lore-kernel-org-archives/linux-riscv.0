Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF1BC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HASvP7/6ML+/2sXaLAf0Lu2a7ODg/7GMCWvh+x1Gmgc=; b=4QkgfeLY4w5G9T
	21xb7VDiWU8uCH4VREU1GGKmysMC2cFY6yXCHe7m2mU2p+Gap1W20sU67w8H3wqxU8LwDSV2O936b
	mOI+LiBswS7N7JxISZsMaQGIT+fG3vls545uTbWgN3dbfmY7EubLS45TOSumpo8gyOzWWNGAA3X5G
	anCBLGI3wL8KQiIfuBqYdFys0GAjWVoypTkGZkWG4V/Dfs23uss6RXL/QNAHh58rJYXg3jOsUekaZ
	y3Q/psZTyWIz8XHIl2OHc+iy0oFmN9oHNf70Ou3nnBv1TfwYOw64Dy0qgtHZWYB6ehFLw7QpQdvES
	7+nRr8iHQcoCw3UgCJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hH-00CV0A-80; Wed, 21 Sep 2022 19:47:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5h8-00CUsm-4y
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 19:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9QztRJhDFYW9WZfYeW38b+1O0y8hGYDxe0zbOFpNx/M=; b=WHjirDpnQSfJ2XOR8fxPwrrQRY
	bw1+4uKRMk6sBf3aIcfOMFXQ4kymBpoVUpN87G0bLKlkz7CNb/M44UKepgvJ4WpZRu7GKmCuJ9rAH
	HOgNvcvth4iTABWWrPBhsuDzpnNokT3/gZFJbRCBLRQL5cr3H5GYEjQeEknRnWmRzmdSNeGTJsYuh
	7J2KP1Pkwgz1AHDUVONJtzJM4gwKDD/I0kKm1V7SNr0GJZyFICbqktUWIVlWTH0i3CLpgkdyHOkdA
	CPtRcXZsYeY5k+ZOb24SnME2+w03otkBgdZB2iocgdyqY1u+yucnC0bvJcfGFr7k+SwqltYkOTiOD
	8rDJPuwg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gb-00EkAC-7P
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso7003541pjm.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9QztRJhDFYW9WZfYeW38b+1O0y8hGYDxe0zbOFpNx/M=;
        b=QcIdVJ59ej/3IsYA0wjUm/s2LwgdwNyJ1rPY/dsSBiFys6BdG1dXKQnn14CCjLSJhX
         x4Yjb0PJO42qJwG+8NrarvDgbHfuqCKbsMK2H/6i9Z06Y7wR0UeZgLPIeErw7tBREdD2
         FnsflTUdgf/YdKAE82BRmERq9t3yfhABy690Pf/jwYBxykxY03fMVZCwdRKdyh/yLRxz
         inQISRVEUMj33EkITlbQlj5HM+sJnxnhjr7zt7bCvsO6k0fdO3mc9R0MKgir1E5uMh9x
         00mpfXr7d72Vp7b1OKOX3AC2W7n44ifRk/gwKjfGfxvxzLCy0f7WckQ9OSBWvyQnvV7d
         alGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9QztRJhDFYW9WZfYeW38b+1O0y8hGYDxe0zbOFpNx/M=;
        b=eeI70/Wh9vfXVEOtjM4Xus4pGLX6Bya6UY8ln/Xrvl2YpaGZQQFyfGULi5zp7/L9mn
         8AYlRndu6KVLSic/II2aEWTPyOWXExCLVsyEBsWAoGltBZSntCgUm0g0ZMwYM1u+ZFIg
         pfycblSD4HYsRDd7vZBs4U1fW6uDRB5ZwOVEWbh3F9rXDl7Q288vB4z17NxJRMAoWKms
         JidPcbjUmv1pcIJcK0AFVVb7iNCdgepzfxFALfRYd0G96D1D/2Li4HefbvkO6b3b0aZz
         p+rtWxVz3TgrIoZzk38BXHuhBlR0c4HXQvVX2KVe3RCHaI+TnxqoVjJFmRKzgKZpQG5a
         nndQ==
X-Gm-Message-State: ACrzQf0EFcCYa7FnhytxUTdhL+Mc1J/pNBLI306U5p8KHtcsyQkKTizu
	qt829WDluN4rg55IL5hEi9lq0JmvxWGdQQ==
X-Google-Smtp-Source: AMsMyM5tt2xFVDBuBqA182kunhBQT0wP4beIf/dc4RXqffxuq6rBfehzSCJwKOBWQGVgGjzjVl3s1Q==
X-Received: by 2002:a17:902:b089:b0:178:54cf:d692 with SMTP id p9-20020a170902b08900b0017854cfd692mr6291344plr.1.1663789616872;
        Wed, 21 Sep 2022 12:46:56 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:56 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH 12/17] riscv: Add support for kernel mode vector
Date: Wed, 21 Sep 2022 12:46:24 -0700
Message-Id: <20220921194629.1480202-13-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_204728_496843_3CCBA336 
X-CRM114-Status: GOOD (  19.58  )
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

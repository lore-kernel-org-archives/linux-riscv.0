Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5167EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5MlrVXtsWzguJ/qQd/OBDQFmAXqhSWo9JID4pgKrfo=; b=OoUFVLT3cuk/lH
	4pEtkbKSA8ocEEGD/Zhn9p/u8+X7WPMFvmCVnITFB0zh0qDNVyrdwozuYjvM4dXP+DznNuAnUNGzE
	1+krdR7JSvDvlUROGVIZxJu3Hbx3XlXTCJ94k7Je0kCPKpdUd430Y7MdJP5a6+q9EaRo25eWKLWID
	5Pdc+VKwLGXPtT3CvsPUacHNp4uWoTF4nqqlQl5PJZNHNyed0oYgBnmVNzrry5nrLbwMlFO+TsH8e
	MLu9eLTbnIg8+xg8wvsLEG/xG5/+cJXfpDQwo+Mz1RyNvADvd3hWDMRRbqyQOQK+hgEwL4/fKSKNO
	XZREfyCQ9M6bXTnynVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH5gR-00GXEu-0g;
	Wed, 05 Jul 2023 16:48:51 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH5gM-00GXD9-3A
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 16:48:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-262b213eddfso689549a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688575725; x=1691167725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnPCjVFvpyo3taQ22pXtwgP45WLDnjqDWVgjMVrGqW8=;
        b=MmpdiToMDw+7OAYGF6obDtC1jkYPCeA1C52b7MTyjNRR5lPDU3nNMa+3UNpQ0paWfo
         v+f2yL+08+pqLu+itLI/kCHW0LLc6eQeLMbFUorhvgngetyBA8zcbcPD2HBc6cGpz6ql
         F/tr1PQeJID6rw4Gpf5AMiZWE1n52iRlwuZQVFvd1xIw44ynVBOpQb7JzRHljxTpeOHj
         tnT4qKuUtPEIqHf3ErlWZtlJR4Oz/qFFlMUrc7Mr0o+FRSDl6wEVZqmIjqfCTCjCRwN8
         0CZwpdeMLsNPmsANDRYKYwlxCYny7vwgmkbUXh6sb+SBgD5m+Aj/f05D4YNAdaemBhMQ
         uaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688575725; x=1691167725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnPCjVFvpyo3taQ22pXtwgP45WLDnjqDWVgjMVrGqW8=;
        b=QOEoKROthkGIUbjYTgHm0257X0bztZE1AmdP+VEAIqLFxUgo8cNbDQwnxVutXsUrT4
         O0BKgWUSxGL9+qiBQfYh/oTFCw4YeCNLjIEY4Q8X296IaNPFHTXUByvXCUMOUfgZ+f2/
         nsqZMr3WcOE1IEA8DtbzBo8IVeY9ariRjdf9NVb1pE1q2/4rmKl2KoOh6ExTgOPTFszX
         81yIE/yRTqIzmFtYPvY6MQJIlndfRLvhF4g+Tu3irHD+m5c5DS05gYoQxSn+Vn/Oz+Iz
         clkjGCF2WiEDc6QLl4rcxoWEjhHDWu7qRseaR0VNg/oQkTuuiTDZQTuYODp7bt71cStG
         XwyA==
X-Gm-Message-State: ABy/qLYuv3gpcnHBWKSRBRY81JMyUjzCOBiwJLqNOr0/bk4nbGg7eo/q
	hSM9GzkJ+EtFiT8s+ANwZeVzqQ==
X-Google-Smtp-Source: APBJJlEWiP0/e+cTtqiZI/F/fmGsRWDRMRqvNDmteCuoYTaeMYDVl+G1yIwNoBmwlfYyzWnDTXGkLw==
X-Received: by 2002:a17:90b:607:b0:262:fa59:2908 with SMTP id gb7-20020a17090b060700b00262fa592908mr4069138pjb.1.1688575725423;
        Wed, 05 Jul 2023 09:48:45 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f21-20020a17090ace1500b00263f85b6a35sm1311431pju.29.2023.07.05.09.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 09:48:45 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 1/2] RISC-V: Probe for unaligned access speed
Date: Wed,  5 Jul 2023 09:48:32 -0700
Message-Id: <20230705164833.995516-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705164833.995516-1-evan@rivosinc.com>
References: <20230705164833.995516-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_094847_022541_5091C4BD 
X-CRM114-Status: GOOD (  35.29  )
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
Cc: linux-doc@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Evan Green <evan@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rather than deferring unaligned access speed determinations to a vendor
function, let's probe them and find out how fast they are. If we
determine that an unaligned word access is faster than N byte accesses,
mark the hardware's unaligned access as "fast". Otherwise, we mark
accesses as slow.

The algorithm itself runs for a fixed amount of jiffies. Within each
iteration it attempts to time a single loop, and then keeps only the best
(fastest) loop it saw. This algorithm was found to have lower variance from
run to run than my first attempt, which counted the total number of
iterations that could be done in that fixed amount of jiffies. By taking
only the best iteration in the loop, assuming at least one loop wasn't
perturbed by an interrupt, we eliminate the effects of interrupts and
other "warm up" factors like branch prediction. The only downside is it
depends on having an rdtime granular and accurate enough to measure a
single copy. If we ever manage to complete a loop in 0 rdtime ticks, we
leave the unaligned setting at UNKNOWN.

There is a slight change in user-visible behavior here. Previously, all
boards except the THead C906 reported misaligned access speed of
UNKNOWN. C906 reported FAST. With this change, since we're now measuring
misaligned access speed on each hart, all RISC-V systems will have this
key set as either FAST or SLOW.

Currently, we don't have a way to confidently measure the difference between
SLOW and EMULATED, so we label anything not fast as SLOW. This will
mislabel some systems that are actually EMULATED as SLOW. When we get
support for delegating misaligned access traps to the kernel (as opposed
to the firmware quietly handling it), we can explicitly test in Linux to
see if unaligned accesses trap. Those systems will start to report
EMULATED, though older (today's) systems without that new SBI mechanism
will continue to report SLOW.

I've updated the documentation for those hwprobe values to reflect
this, specifically: SLOW may or may not be emulated by software, and FAST
represents means being faster than equivalent byte accesses.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v2:
 - Explain more in the commit message (Conor)
 - Use a new algorithm that looks for the fastest run (David)
 - Clarify documentatin further (David and Conor)
 - Unify around a single word, "unaligned" (Conor)
 - Align asm operands, and other misc whitespace changes (Conor)

 Documentation/riscv/hwprobe.rst     |  11 ++-
 arch/riscv/include/asm/cpufeature.h |   2 +
 arch/riscv/kernel/Makefile          |   1 +
 arch/riscv/kernel/copy-unaligned.S  |  71 +++++++++++++++++++
 arch/riscv/kernel/copy-unaligned.h  |  13 ++++
 arch/riscv/kernel/cpufeature.c      | 104 ++++++++++++++++++++++++++++
 arch/riscv/kernel/smpboot.c         |   2 +
 7 files changed, 198 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/kernel/copy-unaligned.S
 create mode 100644 arch/riscv/kernel/copy-unaligned.h

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..88d7d64ec0bd 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -87,13 +87,12 @@ The following keys are defined:
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
-    in hardware, but are slower than the cooresponding aligned accesses
-    sequences.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
+    than equivalent byte accesses.  Misaligned accesses may be supported
+    directly in hardware, or trapped and emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
-    in hardware and are faster than the cooresponding aligned accesses
-    sequences.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
+       than equivalent byte accesses.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 23fed53b8815..d0345bd659c9 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+void check_unaligned_access(int cpu);
+
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 506cc4a9a45a..7e6c464cdfe9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -38,6 +38,7 @@ extra-y += vmlinux.lds
 obj-y	+= head.o
 obj-y	+= soc.o
 obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
+obj-y	+= copy-unaligned.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/kernel/copy-unaligned.S b/arch/riscv/kernel/copy-unaligned.S
new file mode 100644
index 000000000000..2b57fab18efb
--- /dev/null
+++ b/arch/riscv/kernel/copy-unaligned.S
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2023 Rivos Inc. */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+	.text
+
+/* void __copy_words_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using word loads and stores. */
+/* Note: The size is truncated to a multiple of 8 * SZREG */
+ENTRY(__copy_words_unaligned)
+	andi  a4, a2, ~((8*SZREG)-1)
+	beqz  a4, 2f
+	add   a3, a1, a4
+1:
+	REG_L a4,       0(a1)
+	REG_L a5,   SZREG(a1)
+	REG_L a6, 2*SZREG(a1)
+	REG_L a7, 3*SZREG(a1)
+	REG_L t0, 4*SZREG(a1)
+	REG_L t1, 5*SZREG(a1)
+	REG_L t2, 6*SZREG(a1)
+	REG_L t3, 7*SZREG(a1)
+	REG_S a4,       0(a0)
+	REG_S a5,   SZREG(a0)
+	REG_S a6, 2*SZREG(a0)
+	REG_S a7, 3*SZREG(a0)
+	REG_S t0, 4*SZREG(a0)
+	REG_S t1, 5*SZREG(a0)
+	REG_S t2, 6*SZREG(a0)
+	REG_S t3, 7*SZREG(a0)
+	addi  a0, a0, 8*SZREG
+	addi  a1, a1, 8*SZREG
+	bltu  a1, a3, 1b
+
+2:
+	ret
+END(__copy_words_unaligned)
+
+/* void __copy_bytes_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using only byte accesses. */
+/* Note: The size is truncated to a multiple of 8 */
+ENTRY(__copy_bytes_unaligned)
+	andi a4, a2, ~(8-1)
+	beqz a4, 2f
+	add  a3, a1, a4
+1:
+	lb   a4, 0(a1)
+	lb   a5, 1(a1)
+	lb   a6, 2(a1)
+	lb   a7, 3(a1)
+	lb   t0, 4(a1)
+	lb   t1, 5(a1)
+	lb   t2, 6(a1)
+	lb   t3, 7(a1)
+	sb   a4, 0(a0)
+	sb   a5, 1(a0)
+	sb   a6, 2(a0)
+	sb   a7, 3(a0)
+	sb   t0, 4(a0)
+	sb   t1, 5(a0)
+	sb   t2, 6(a0)
+	sb   t3, 7(a0)
+	addi a0, a0, 8
+	addi a1, a1, 8
+	bltu a1, a3, 1b
+
+2:
+	ret
+END(__copy_bytes_unaligned)
diff --git a/arch/riscv/kernel/copy-unaligned.h b/arch/riscv/kernel/copy-unaligned.h
new file mode 100644
index 000000000000..a4e8b6ad5b6a
--- /dev/null
+++ b/arch/riscv/kernel/copy-unaligned.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos, Inc.
+ */
+#ifndef __RISCV_KERNEL_COPY_UNALIGNED_H
+#define __RISCV_KERNEL_COPY_UNALIGNED_H
+
+#include <linux/types.h>
+
+void __copy_words_unaligned(void *dst, const void *src, size_t size);
+void __copy_bytes_unaligned(void *dst, const void *src, size_t size);
+
+#endif /* __RISCV_KERNEL_COPY_UNALIGNED_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..5387b1dc913b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -19,12 +19,19 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
 #include <asm/vector.h>
 
+#include "copy-unaligned.h"
+
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
+#define MISALIGNED_ACCESS_JIFFIES_LG2 1
+#define MISALIGNED_BUFFER_SIZE 0x4000
+#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -396,6 +403,103 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+void check_unaligned_access(int cpu)
+{
+	u64 c0, c1;
+	u64 word_cycles;
+	u64 byte_cycles;
+	int ratio;
+	unsigned long j0, j1;
+	struct page *page;
+	void *dst;
+	void *src;
+	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+
+	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
+	if (!page) {
+		pr_warn("Can't alloc pages to measure memcpy performance");
+		return;
+	}
+
+	/* Make an unaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+	word_cycles = -1ULL;
+	/* Do a warmup. */
+	__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	preempt_disable();
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	/*
+	 * For a fixed amount of time, repeatedly try the function, and take
+	 * the best time in cycles as the measurement.
+	 */
+	while (time_before(jiffies, j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		c0 = get_cycles64();
+		/* Ensure the CSR read can't reorder WRT to the copy. */
+		mb();
+		__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		/* Ensure the copy ends before the end time is snapped. */
+		mb();
+		c1 = get_cycles64();
+		if ((c1 - c0) < word_cycles)
+			word_cycles = c1 - c0;
+	}
+
+	byte_cycles = -1ULL;
+	__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	while (time_before(jiffies, j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		c0 = get_cycles64();
+		mb();
+		__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		mb();
+		c1 = get_cycles64();
+		if ((c1 - c0) < byte_cycles)
+			byte_cycles = c1 - c0;
+	}
+
+	preempt_enable();
+
+	/* Don't divide by zero. */
+	if (!word_cycles || !byte_cycles) {
+		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
+			cpu);
+
+		goto out;
+	}
+
+	if (word_cycles < byte_cycles)
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+
+	ratio = (byte_cycles * 100) / word_cycles;
+	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
+		cpu,
+		ratio / 100,
+		ratio % 100,
+		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
+
+	per_cpu(misaligned_access_speed, cpu) = speed;
+
+out:
+	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
+}
+
+static int check_unaligned_access0(void)
+{
+	check_unaligned_access(0);
+	return 0;
+}
+
+arch_initcall(check_unaligned_access0);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f4d6acb38dd0..00ddbd2364dc 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -26,6 +26,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
 #include <asm/cpu_ops.h>
+#include <asm/cpufeature.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/numa.h>
@@ -245,6 +246,7 @@ asmlinkage __visible void smp_callin(void)
 
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
+	check_unaligned_access(curr_cpuid);
 	probe_vendor_features(curr_cpuid);
 
 	if (has_vector()) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

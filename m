Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9FC001B1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwh5WC5nD/8E9I22zDDjwWgdyqOf1T1pnlF+ILo0+jw=; b=CQ+UG0ZYmUof6D
	mF1fkAETmybxaztb6d6erKEfL/bS9C68x2TGA2pFCPelWrGSMdytUzhc3bhRA7+w7mG3LbwPzrhr9
	OoGzd2sRP+Gmc5qVPwAIAc/6e0KIrPSWQynFS7pDwKrYJhMU9U013a/Nl2hgHz3ibrt15DVHcaWtY
	6UX+H030pC1u3FM8DDAYA7tFX6k1vKhk+ik9GvEWBr26az9MjEvslsstT103322qfdRmKC7P55X+o
	5/Zfgq3lNDZbBoijbm534Q9uLYyyPo08L2UFByqkKouWuKOhN220R2N7VIe5PI2Xx2cIZ8cBmnUA8
	zYFHJeyyYzptyKkQDGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCp99-004kBK-1o;
	Fri, 23 Jun 2023 22:20:51 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCp96-004k8s-34
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 22:20:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-51452556acdso752866a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687558840; x=1690150840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tOWF5jVjkcJnGVSJRQXmOufijKMT1TZldHmns4l6jA=;
        b=j7Uv46y88tuBgLQu6gWfP6l1YvmyaedR9YtQXaYX46hKRc81vhJsaHPRG1Hs0/l1cO
         mMgV7FKk6FmtZeBkWeoBHnN5QVus9+Evd9TD3kHi/hYRUNQ0OTND9lFox6aBOGTWphkk
         XBBaNdslGJb3bfB42fhGE/9DRzBk8QTwfYx3ndmbP6POwft9BGYyYr6IqiaPAM2VEGEK
         C0033CwonW4UvCgbYXCOU9Oht1NYmh8GN6hf0jOzrLWmAfNzxnXV+yOClk5ojLOAdPtC
         0ksRmXof7Rn+WvlBXTH18FhEhVv0XBM8fyIuAps2575BxtugwqY2VZa9iu7VODrQhcDa
         6iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687558840; x=1690150840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tOWF5jVjkcJnGVSJRQXmOufijKMT1TZldHmns4l6jA=;
        b=jP1VncyydNoqj7FgaMPcT2iYYTDBsErELQyYoxB9Dmn0H8IK0Oaw8KBN9bBHlPnu8z
         NBD0qaU0pkaHj3+JoXR/YE2XxTfMZ5mEP1OIxomMdmJGAwOFLy0+FX2bbw7bdYaZ9PSC
         ZVjUT2xQ2rIjxLWlZiSGwg75C085vRjEHfTzfokmvSYNaaC46FkvrJJ/2uLnTwR+cZe/
         9XsW+wVZALDnhYrlibrLJRh2NyTh090KS1Of1ZZ/zRz8mL8YppdJ2PWR8rhK2aQiIwSA
         dG29z8mjByNHfS73MpLIrFNQt6xDUZW9+opidxRKk1Wz6EmdWPGthmwkwKoUDAwhhZHD
         RQVQ==
X-Gm-Message-State: AC+VfDy4zWeGI03BEh6jC3AJPS82OOxezzwrfCC+8WUcQOXAvcBhzkLm
	Phhz6j4UCS+F21f/RdpxR54nWBkG27Qpbeup5h8=
X-Google-Smtp-Source: ACHHUZ5jseNwiCBYx3Vp2Jt1EnuGruMwwk6GbcJvwh8JVNPX3obSZyczhHcgUYVl3ZCui0U1efkKGQ==
X-Received: by 2002:a05:6a20:729f:b0:118:e70:6f7d with SMTP id o31-20020a056a20729f00b001180e706f7dmr18899903pzk.10.1687558840398;
        Fri, 23 Jun 2023 15:20:40 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b001a80ad9c599sm35535plb.294.2023.06.23.15.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 15:20:39 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Date: Fri, 23 Jun 2023 15:20:15 -0700
Message-Id: <20230623222016.3742145-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623222016.3742145-1-evan@rivosinc.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_152048_997320_E82871C1 
X-CRM114-Status: GOOD (  24.87  )
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
Cc: linux-doc@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rather than deferring misaligned access speed determinations to a vendor
function, let's probe them and find out how fast they are. If we
determine that a misaligned word access is faster than N byte accesses,
mark the hardware's misaligned access as "fast".

Fix the documentation as well to reflect this bar. Previously the only
SoC that returned "fast" was the THead C906. The change to the
documentation is more a clarification, since the C906 is fast in the
sense of the corrected documentation.

Signed-off-by: Evan Green <evan@rivosinc.com>
---

 Documentation/riscv/hwprobe.rst     |  8 +--
 arch/riscv/include/asm/cpufeature.h |  2 +
 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/copy-noalign.S    | 71 ++++++++++++++++++++++++++
 arch/riscv/kernel/copy-noalign.h    | 13 +++++
 arch/riscv/kernel/cpufeature.c      | 78 +++++++++++++++++++++++++++++
 arch/riscv/kernel/smpboot.c         |  2 +
 7 files changed, 171 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/copy-noalign.S
 create mode 100644 arch/riscv/kernel/copy-noalign.h

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..710325751766 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -88,12 +88,12 @@ The following keys are defined:
     always extremely slow.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
-    in hardware, but are slower than the cooresponding aligned accesses
-    sequences.
+    in hardware, but are slower than N byte accesses, where N is the native
+    word size.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
-    in hardware and are faster than the cooresponding aligned accesses
-    sequences.
+    in hardware and are faster than N byte accesses, where N is the native
+    word size.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 23fed53b8815..b8e917176616 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+void check_misaligned_access(int cpu);
+
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index a42951911067..f934d7ab7840 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -34,6 +34,7 @@ extra-y += vmlinux.lds
 obj-y	+= head.o
 obj-y	+= soc.o
 obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
+obj-y	+= copy-noalign.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/kernel/copy-noalign.S b/arch/riscv/kernel/copy-noalign.S
new file mode 100644
index 000000000000..3807fc2324b2
--- /dev/null
+++ b/arch/riscv/kernel/copy-noalign.S
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
+	andi a4, a2, ~((8*SZREG)-1)
+	beqz a4, 2f
+	add a3, a1, a4
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
+	addi a0, a0, 8*SZREG
+	addi a1, a1, 8*SZREG
+	bltu a1, a3, 1b
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
+	add a3, a1, a4
+1:
+	lb a4, 0(a1)
+	lb a5, 1(a1)
+	lb a6, 2(a1)
+	lb a7, 3(a1)
+	lb t0, 4(a1)
+	lb t1, 5(a1)
+	lb t2, 6(a1)
+	lb t3, 7(a1)
+	sb a4, 0(a0)
+	sb a5, 1(a0)
+	sb a6, 2(a0)
+	sb a7, 3(a0)
+	sb t0, 4(a0)
+	sb t1, 5(a0)
+	sb t2, 6(a0)
+	sb t3, 7(a0)
+	addi a0, a0, 8
+	addi a1, a1, 8
+	bltu a1, a3, 1b
+
+2:
+	ret
+END(__copy_bytes_unaligned)
diff --git a/arch/riscv/kernel/copy-noalign.h b/arch/riscv/kernel/copy-noalign.h
new file mode 100644
index 000000000000..99fbb9c763e0
--- /dev/null
+++ b/arch/riscv/kernel/copy-noalign.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos, Inc.
+ */
+#ifndef __RISCV_KERNEL_COPY_NOALIGN_H
+#define __RISCV_KERNEL_COPY_NOALIGN_H
+
+#include <linux/types.h>
+
+void __copy_words_unaligned(void *dst, const void *src, size_t size);
+void __copy_bytes_unaligned(void *dst, const void *src, size_t size);
+
+#endif /* __RISCV_KERNEL_COPY_NOALIGN_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..3f7200dcc00c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -19,11 +19,21 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
 #include <asm/vector.h>
 
+#include "copy-noalign.h"
+
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+#define MISALIGNED_ACCESS_JIFFIES_LG2 1
+#define MISALIGNED_BUFFER_SIZE 0x4000
+#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
+
+#define MISALIGNED_COPY_MBS(_count) \
+	((HZ * (_count) * MISALIGNED_COPY_SIZE) >> \
+	 (20 + MISALIGNED_ACCESS_JIFFIES_LG2))
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -396,6 +406,74 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+void check_misaligned_access(int cpu)
+{
+	unsigned long j0, j1;
+	struct page *page;
+	void *dst;
+	void *src;
+	long word_copies = 0;
+	long byte_copies = 0;
+	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+
+	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
+	if (!page) {
+		pr_warn("Can't alloc pages to measure memcpy performance");
+		return;
+	}
+
+	/* Make a misaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Misalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+	/* Do a warmup. */
+	__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	preempt_disable();
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	while (time_before(jiffies,
+			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+
+		__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		word_copies += 1;
+	}
+
+	__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	while (time_before(jiffies,
+			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		byte_copies += 1;
+	}
+
+	preempt_enable();
+	if (word_copies >= byte_copies)
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+
+	pr_info("cpu%d: Unaligned word copy %ld MB/s, byte copy %ld MB/s, misaligned accesses are %s\n",
+		cpu,
+		MISALIGNED_COPY_MBS(word_copies),
+		MISALIGNED_COPY_MBS(byte_copies),
+		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
+
+	per_cpu(misaligned_access_speed, cpu) = speed;
+	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
+}
+
+static int check_misaligned_access0(void)
+{
+	check_misaligned_access(0);
+	return 0;
+}
+
+arch_initcall(check_misaligned_access0);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index bb0b76e1a6d4..e34a71b4786b 100644
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
@@ -244,6 +245,7 @@ asmlinkage __visible void smp_callin(void)
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
+	check_misaligned_access(curr_cpuid);
 	probe_vendor_features(curr_cpuid);
 
 	if (has_vector()) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

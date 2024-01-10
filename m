Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61103C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ad5X5d0Gd2lzcLIPBMt/jxDjTKEc88bzCsJ5BqF5ngs=; b=4GU6g4+kZ2uQO/
	fLJqA9LzE58fB0+a8AvPy51U2l0dOiuG2QaV43LBcl8kd9KNkynas2arEzXTHs8gqqisAr97pvH6R
	uIvAGILiSYUYOYfGHUWJ20E0whTt5gpfExlNTIm6bFg5sWAzp65jZJNhQUFWXULvyBHMI2q0xeAWe
	ULmhIdgC3cCcbTecbCv+1Fsiiybl/++cEmJilGHxQ3bcUHJqnEnrTX/ukYMC2JTsPUbS7zDBKtBvW
	Zuyv+cwrd8+emZ+IsGEoi78Ebe2yB+yR5VsYdYtMWH5T2x8eF90+seDOneEm/+yftPgqkMRMhvSd9
	VYYma8AV36rWIIEEtxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa0A-00CRHG-1P;
	Wed, 10 Jan 2024 14:56:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa06-00CRBG-1v
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:56:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50e67e37661so5276873e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704898571; x=1705503371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLaTiUEqnhHpEDzcjzh0LRpXh9TZeJ5JQ1BIVLM+gqw=;
        b=FL9IFS93PnQ9Q4E456GFCTuApifIqXNuTZdZhYauXDon6bu92dCr/DecMsHzVsMra7
         5n0VuGgAjlj+/pZre2lLjJ2Rs3PUCXU3mliXuQ99vwm8w0XbC2QN82af2cCpM7N6i3HK
         nXyuc3g7NOr612qnOki8S8gRLL5znmsfyOidcwMxaHq/N7U9+vWZPY7HWuYhxxJEQE0t
         tXPeH5N1u4snQrrOVe+j2T17xlaNGqhNKKOkxEpY3fwID2WGA9jEBNbNR13/JFb5jVu8
         vnq+5mp77JEX18Dp5NJqhdWF5L/btA7LXjgYsenxw3HXGiVwwuqnppEapwsemKj3o/Wv
         Oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898571; x=1705503371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLaTiUEqnhHpEDzcjzh0LRpXh9TZeJ5JQ1BIVLM+gqw=;
        b=qsX9M9dQzoRLKf4RRH0uJVNNSUTwS/6+0qLXZznnxePtMFFm79Ay3/U9a74k1hW5d0
         8n7O7b9cpKRW9eOgH5gcH2b3DAb1fXclbrI6lFCWY2ri23PY7QzQHTE6jTJlBnJH4IWF
         dndzBWFDtdYnSmP7Eod/Mt5LP7u3sDnESO/BEu4LP7HI6kd6QBn4n3Cb7HEH11qkQ4e1
         oTO3Q+FnCMuUsvq/tKinABazaO4EkP+vX3dD3PgSwhgfFEcP5dsyCaz9/f6/raNjiFQj
         7ZGxhytUvDTLmlMUohBl7Cg8XYQ8c8/oGJOrJZdBBz5pO7TnDqwu5iv7aHymL7YCB8pv
         vnBg==
X-Gm-Message-State: AOJu0YxVZu2r0npvtPjBXepvr5gg/tlJxqb4g3MKI5MgBWYYSIrHMHxm
	3LnUynQFyXHoFA111ed3LKXexb9SEev0bg==
X-Google-Smtp-Source: AGHT+IEmWsRJPIzVvjKSG3W4CxovtYvIz/tPv4lvUtVx2c7SaE5vrwQD+TOsnx1Ylj+gfn5QPpRuDQ==
X-Received: by 2002:ac2:51b7:0:b0:50e:9343:64df with SMTP id f23-20020ac251b7000000b0050e934364dfmr488193lfk.70.1704898571178;
        Wed, 10 Jan 2024 06:56:11 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id bm3-20020a170906c04300b00a2a4efe7d3dsm2161032ejb.79.2024.01.10.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:56:10 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	corbet@lwn.net
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 4/4] membarrier: riscv: Provide core serializing command
Date: Wed, 10 Jan 2024 15:55:33 +0100
Message-Id: <20240110145533.60234-5-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110145533.60234-1-parri.andrea@gmail.com>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065614_658629_26623FCB 
X-CRM114-Status: GOOD (  23.71  )
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

RISC-V uses xRET instructions on return from interrupt and to go back
to user-space; the xRET instruction is not core serializing.

Use FENCE.I for providing core serialization as follows:

 - by calling sync_core_before_usermode() on return from interrupt (cf.
   ipi_sync_core()),

 - via switch_mm() and sync_core_before_usermode() (respectively, for
   uthread->uthread and kthread->uthread transitions) to go back to
   user-space.

On RISC-V, the serialization in switch_mm() is activated by resetting
the icache_stale_mask of the mm at prepare_sync_core_cmd().

Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 .../membarrier-sync-core/arch-support.txt     | 18 +++++++++++-
 MAINTAINERS                                   |  1 +
 arch/riscv/Kconfig                            |  3 ++
 arch/riscv/include/asm/membarrier.h           | 19 ++++++++++++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++++++++++
 kernel/sched/core.c                           |  4 +++
 kernel/sched/membarrier.c                     |  4 +++
 7 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/sync_core.h

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index d96b778b87ed8..a163170fc0f48 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -10,6 +10,22 @@
 # Rely on implicit context synchronization as a result of exception return
 # when returning from IPI handler, and when returning to user-space.
 #
+# * riscv
+#
+# riscv uses xRET as return from interrupt and to return to user-space.
+#
+# Given that xRET is not core serializing, we rely on FENCE.I for providing
+# core serialization:
+#
+#  - by calling sync_core_before_usermode() on return from interrupt (cf.
+#    ipi_sync_core()),
+#
+#  - via switch_mm() and sync_core_before_usermode() (respectively, for
+#    uthread->uthread and kthread->uthread transitions) to go back to
+#    user-space.
+#
+#  The serialization in switch_mm() is activated by prepare_sync_core_cmd().
+#
 # * x86
 #
 # x86-32 uses IRET as return from interrupt, which takes care of the IPI.
@@ -43,7 +59,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bce0aeecb4f2..e4ca6288ea3d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13817,6 +13817,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/scheduler/membarrier.rst
 F:	arch/*/include/asm/membarrier.h
+F:	arch/*/include/asm/sync_core.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 33d9ea5fa392f..2ad63a216d69a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,14 +28,17 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
+	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
+	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/riscv/include/asm/membarrier.h b/arch/riscv/include/asm/membarrier.h
index 6c016ebb5020a..47b240d0d596a 100644
--- a/arch/riscv/include/asm/membarrier.h
+++ b/arch/riscv/include/asm/membarrier.h
@@ -22,6 +22,25 @@ static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
 	/*
 	 * The membarrier system call requires a full memory barrier
 	 * after storing to rq->curr, before going back to user-space.
+	 *
+	 * This barrier is also needed for the SYNC_CORE command when
+	 * switching between processes; in particular, on a transition
+	 * from a thread belonging to another mm to a thread belonging
+	 * to the mm for which a membarrier SYNC_CORE is done on CPU0:
+	 *
+	 *   - [CPU0] sets all bits in the mm icache_stale_mask (in
+	 *     prepare_sync_core_cmd());
+	 *
+	 *   - [CPU1] stores to rq->curr (by the scheduler);
+	 *
+	 *   - [CPU0] loads rq->curr within membarrier and observes
+	 *     cpu_rq(1)->curr->mm != mm, so the IPI is skipped on
+	 *     CPU1; this means membarrier relies on switch_mm() to
+	 *     issue the sync-core;
+	 *
+	 *   - [CPU1] switch_mm() loads icache_stale_mask; if the bit
+	 *     is zero, switch_mm() may incorrectly skip the sync-core.
+	 *
 	 * Matches a full barrier in the proximity of the membarrier
 	 * system call entry.
 	 */
diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
new file mode 100644
index 0000000000000..9153016da8f14
--- /dev/null
+++ b/arch/riscv/include/asm/sync_core.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SYNC_CORE_H
+#define _ASM_RISCV_SYNC_CORE_H
+
+/*
+ * RISC-V implements return to user-space through an xRET instruction,
+ * which is not core serializing.
+ */
+static inline void sync_core_before_usermode(void)
+{
+	asm volatile ("fence.i" ::: "memory");
+}
+
+#ifdef CONFIG_SMP
+/*
+ * Ensure the next switch_mm() on every CPU issues a core serializing
+ * instruction for the given @mm.
+ */
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+	cpumask_setall(&mm->context.icache_stale_mask);
+}
+#else
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+}
+#endif /* CONFIG_SMP */
+
+#endif /* _ASM_RISCV_SYNC_CORE_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b51bc86f8340c..82de2b7d253cd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6682,6 +6682,10 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		 *
 		 * The barrier matches a full barrier in the proximity of
 		 * the membarrier system call entry.
+		 *
+		 * On RISC-V, this barrier pairing is also needed for the
+		 * SYNC_CORE command when switching between processes, cf.
+		 * the inline comments in membarrier_arch_switch_mm().
 		 */
 		++*switch_count;
 
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 6d1f31b3a967b..703e8d80a576d 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -342,6 +342,10 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 	/*
 	 * Matches memory barriers after rq->curr modification in
 	 * scheduler.
+	 *
+	 * On RISC-V, this barrier pairing is also needed for the
+	 * SYNC_CORE command when switching between processes, cf.
+	 * the inline comments in membarrier_arch_switch_mm().
 	 */
 	smp_mb();	/* system call entry is not a mb. */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

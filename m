Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C5C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHrtETVt0dQxyqXoym9C8G6LK/MtDKotp6WZvIv4QoY=; b=2Rtw/r1/x07Zcn
	0cGvRjy4GoJJXXuN0xRN9CXRY3+16wEd1B1Ry3eiIdEILuiBzSJc4UbHiBbBNW4BLqk95yqAjFC1H
	lku4TcdlKVm8SF3GPMgR5I4ETDoXr+JUwtH8AB7DhnyWqFkyHky/VAKwq93WFPUigJn9+2BMYCyS4
	KXC1mRwKWA/FhyWrRyCPPINnJt8YJowk8c5+TxFo1mhqnREGossb3Wuhhq/m6NNd74aWqhp4OMenW
	8uRhW4ZdtC3MAaFebNznb++gznfN0i32Z9nVTpdOoNQmvxJ83IY6i/ySNpURuSxT+9cnfahqfBrsG
	WY8k+4KGqbD9Yk/4g37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBv0-000000040HD-1WcJ;
	Wed, 31 Jan 2024 14:50:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBut-0000000409A-18JX
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:50:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33ae4205ad8so3013736f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706712616; x=1707317416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBtYOBqzah2COc6Cv21eJlyQjax7AL2k8qugBY856Dk=;
        b=fnr7gUg6FfOUas341TGlKbZsF9bdt6kCw0Ohao2Tk+xYjwkhp0cj9X2YmK3D+IS4ag
         OSBuCiJI29YoOIBN5dIp2YM6o2oaoPH2EEyZr7NgNd8XjEiYQhs3X+JPD2TZnECF2RUx
         GsxIRJrNl/DQmuFTgR51ltfi/puTuIojxQJwRUk9VRH1SckKCuC7tWMqZWUEVKRKlv82
         edDm3RCK7pt8Phj6Hg8H0d93AuuTz+Yf8TyInKrcKxorNI7AojvLvg6XIrtk6Anbl9Ln
         LGyfreEuCXnMr1Z2zBNKuJj27IlIuiK3DP2XVVMjLVJVwGJol34R5SLYv5vZFlMPE1N0
         CDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712616; x=1707317416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBtYOBqzah2COc6Cv21eJlyQjax7AL2k8qugBY856Dk=;
        b=uJYHWH5ZgWDHiRa/kmjJeqZrkNQv8Z5oHQvDB+Jx2GInMF+a02gKdM8ISymmemsYLw
         nPFdsgWYUWg2Nx/HsNoSyqQwaPm6JCzQIYFgNk6GgfN1or8nwZ57xRimCO33OWeVtz3g
         JdJXd3/AxxHJwwYNMlMsXtBZyEiNKezaYNNuCJ2+FmN2owHwWgfsbp7KiPcjaa6oyq/U
         1YqVQvcan4sUmWc8dnT9jQtSL90uAo/Kwsb4CedJntgBupHX23vBLNSTbGTve9dQQySO
         lywTZWts1Y58tdXlozbsXiHRq5tldpiQzKignAu2Bo3NTSdNou3tAvt6ZNo3J/oFoZHv
         gCVA==
X-Gm-Message-State: AOJu0Yw0OD2wM8LSGfGd5kqxZHj9BElugdgC1V9BWqhJOb3rkL3W9PVJ
	M/5eAd8kSsiK9Kc2j65u5ZpJYWWF6cwT9vILZajRWPCQSt4buZsJ
X-Google-Smtp-Source: AGHT+IFzHyII0E803YFcr2LWchdZp3gu+YQKrnRRDpAoCqkSNmvsjur8XaGr+luL1UtHCiX8h+kWWA==
X-Received: by 2002:a05:6000:12c2:b0:33a:ff90:68eb with SMTP id l2-20020a05600012c200b0033aff9068ebmr1309832wrx.26.1706712616480;
        Wed, 31 Jan 2024 06:50:16 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4046000000b0033b0d049c71sm419265wrp.54.2024.01.31.06.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:50:16 -0800 (PST)
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
	rdunlap@infradead.org,
	sorear@fastmail.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v4 4/4] membarrier: riscv: Provide core serializing command
Date: Wed, 31 Jan 2024 15:49:36 +0100
Message-Id: <20240131144936.29190-5-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
References: <20240131144936.29190-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065019_417587_14D125B5 
X-CRM114-Status: GOOD (  23.42  )
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
   uthread->uthread and kthread->uthread transitions) before returning
   to user-space.

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
index d96b778b87ed8..7425d2b994a39 100644
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
+#    uthread->uthread and kthread->uthread transitions) before returning
+#    to user-space.
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
index 628f3762d97cd..8373ce3e4350a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14042,6 +14042,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/scheduler/membarrier.rst
 F:	arch/*/include/asm/membarrier.h
+F:	arch/*/include/asm/sync_core.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 087abf9e51c69..70836381b9482 100644
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
index a972628e77567..e4a87bcf28d40 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6721,6 +6721,10 @@ static void __sched notrace __schedule(unsigned int sched_mode)
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688EC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGOq0lVCFakfWpqXQZ2Yo0IpkS23R+8vNW3b6hok+RI=; b=AKUrLLCciKx+zW
	wzeamEPxHbaiMI5D5Ba2dgmvq+Baxvhwtg9WTHW5OIWifB8bPZdmB9PjyqC/77HhKox5RVY4TA9qz
	8No+Xka3iOxcquKETwXFxp8YYC7mVTZW88uAT7WgEah1ZgO8DwR7Wu0fjbFy5HmBGtjwA5z6nEH0H
	qy0+hoCZ3219xa3duteDifJv2vRkmmEule7A7F6BwtdwjUgTtn307t8JF+bwCX5Zix7FjNxF/VGBk
	Y480tmrxClqRIQzWptiQURrddFTfPS5djF0OwN5kVqnd9++8JG7+/wMZ3RclFM2StEUBV07lPmE/I
	1+RZ2KBe6lwZnMhd7/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcqD-004VL4-1I;
	Mon, 11 Dec 2023 09:44:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq6-004VHP-10
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:44:43 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso5950744a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702287874; x=1702892674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGt5t/kAxS1mkU99JyGnFu1ODAbdCKJM932jBFyIPCw=;
        b=moYxZ7ARxPBjpHJbsUhPyAs9I8ttIHyrKmIsbCMIA8q7sRBY84Lcr3roNFWgWFnV1i
         wQRxLQCtN7bWc+rDyu5rUmP6r43uUv0AsV87uIr011z9maN4y43ASpArbvaBPswyn52w
         yypetPp6e7PaOA4Qw3yvMXNBzaqyPzPjkITRt/X1+XmL7uSaafX9hXR/lkvz54nH2OgK
         QIowEOOfI52fk0qxjIeFvOoCzHqY8Q3KGwfrAvCh2gKkCEs82RjFRsNMTd6OkZZQFZQV
         Z4RKdBlm/cEtomQWkEvI12YZkXfXuzuxZR7OOmJUTW/0j6TeecyQANjPgY4dUlo6sjkl
         vtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287874; x=1702892674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGt5t/kAxS1mkU99JyGnFu1ODAbdCKJM932jBFyIPCw=;
        b=afON8qg+uhPtaso1UX5d+7c4J1wmETq75nuWjKGXvgSUsp8oOEoyoHIeftRu5wmbz7
         0qtxVeolQFWFaaoMz7wUfV2Jqroh0YxXtSpMy7kbJVvTviBWpbx31WK8LsRdE6eQjy6S
         wY7URQ/0cqtPU9zK/CyLAnD0Q9gyECQVp1lRRA+SuXdEzXBwkgUOwrFgwRECtOuiMrBy
         7uSJu0+PByM8A4siSwebpnh92NL+cm/y0ZKvRccLueX6YvMcrLZQu2WR4BADVbgHVqvb
         AGpcj0d5Z0RYY8lhEWffTPMmtRnlQaNRo4t/OP8qsPwpszOTViPGEbMnRd6g7m2er7Xn
         Yf4g==
X-Gm-Message-State: AOJu0Yz5A19AlCeJ5iYnYVfYU1/isLilNJixPxciFMTUzn6hgcIsu3dK
	DYFdWt/0LIX1ErrTHU3dfnY=
X-Google-Smtp-Source: AGHT+IE3pzBUwNsGbb2VsHTBxI6r5mm1ppw958Piqi5Nb7wAbUVFDdXvSB1QAU+x6JNSWe35csvnSw==
X-Received: by 2002:a50:cd47:0:b0:54c:9cf0:fb67 with SMTP id d7-20020a50cd47000000b0054c9cf0fb67mr1257371edj.48.1702287874167;
        Mon, 11 Dec 2023 01:44:34 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm3463505edb.59.2023.12.11.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:44:33 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v2 3/4] membarrier: riscv: Provide core serializing command
Date: Mon, 11 Dec 2023 10:44:13 +0100
Message-Id: <20231211094414.8078-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211094414.8078-1-parri.andrea@gmail.com>
References: <20231211094414.8078-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_014438_349316_B392DDF6 
X-CRM114-Status: GOOD (  20.14  )
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
 5 files changed, 69 insertions(+), 1 deletion(-)
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
index a9166d82ffced..f6f1fdc76cf46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13808,6 +13808,7 @@ M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/*/include/asm/membarrier.h
+F:	arch/*/include/asm/sync_core.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7db95097caf1..db7b1acd943e4 100644
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
index 4be218fa03b14..a1071039c20ed 100644
--- a/arch/riscv/include/asm/membarrier.h
+++ b/arch/riscv/include/asm/membarrier.h
@@ -22,6 +22,25 @@ static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
 	/*
 	 * The membarrier system call requires a full memory barrier
 	 * after storing to rq->curr, before going back to user-space.
+	 *
+	 * The barrier is also needed for the SYNC_CORE command when
+	 * switching between processes; in particular, on a transition
+	 * from a thread belonging to another mm to a thread belonging
+	 * to the mm for which a membarrier SYNC_CORE is done on CPU0:
+	 *
+	 *   - [CPU0] sets all bits in the mm icache_stale_mask.
+	 *
+	 *   - [CPU1] store to rq->curr (by the scheduler).
+	 *
+	 *   - [CPU0] loads rq->curr within membarrier and observes
+	 *     cpu_rq(1)->curr->mm != mm, so the IPI is skipped on
+	 *     CPU1; this means membarrier relies on switch_mm() to
+	 *     issue the sync-core.
+	 *
+	 *   - [CPU1] switch_mm() loads icache_stale_mask; if the bit
+	 *     is zero, switch_mm() may incorrectly skip the sync-core.
+	 *
+	 * Matches the full barrier in membarrier_private_expedited().
 	 */
 	smp_mb();
 }
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

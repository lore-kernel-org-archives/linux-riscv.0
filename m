Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D680ACD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92hWcrwzT97pKJw1b50uB7RKKJBWv7AjJ12otAGJlpA=; b=BWcnAkvSYj6xGR
	4pXEAfPTsaZNAlox3EVanhsHt8RO0H2ivY2eDM+iN/A48zZ9JFIXsuQkzsfBp7w2QATnDIv+qM017
	ybZ1BRTtd8tvPvbx+fYsyRSwW/DdoWYd9vHOaqykvuf1F4kKhgzzdcSAdzadP0ZhwBrz5yMmfspnO
	DzgmHB2kBnyEcwlOGp74VhlJbToLJprgRSFYelDAVr0DhsYygQkUDdg0p9ho98btz9tWlkBSW/hww
	4Tx5qsjtAxYivQFfZf7tM2tcXVkVcJ/pD4pnhM9awhOcVvheBVj6E8K0EWYFzbGz1AZ52cgzdK+e3
	OJzV1B9l979JLwKAMrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUy2-0000000AKqD-16E7;
	Thu, 13 Nov 2025 10:54:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUxz-0000000AKov-3I2Q
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:54:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo610757b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031255; x=1763636055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyYQg/XjxJP8oSPs0jUhiEt1HKw71tyhJFd27FTylsA=;
        b=UfbdJPIutQ0rQsHY1+E1LmDtsMcEYIpDHdNUuOU5OrWcUgCqMIOjChu3fsnG8HTl9X
         n5LFRl+G+GFVD8lWJkcaTGkFbxR7eUvAlxV5Nli0GIGWq87+zOm/nhCcneAwhMMkNvjM
         /vFK6CiCQaK+SwilPjhlw0Mw4H94o1kas7H+FS5d1oHto57+SBkN73fx3A49jOzCEUDp
         ZwDdHihriehwx2ers6Ecj5BhpQR9U6Waup86RwOfjd9hPqJ0sV6sHBJIk875awhWaUVy
         JK2l9QIZKs70gB3P1qxFNtW4tIavemRCiT/sOQ4BPo9wET4hbgiNWZb/NFIrttfbBfIT
         yoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031255; x=1763636055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pyYQg/XjxJP8oSPs0jUhiEt1HKw71tyhJFd27FTylsA=;
        b=jijI28LCQJCs4Duti3B7Ph2U4LfD/VsTvpyA2L+YfUjPPsd7OIjxyLjMMZtjMkII0c
         zP5rfD7a6D8zheBtiN4ewzEMvMjmLtjX6jGav/LGBbW1b732ayKNcyd0DPlQ+wJypxGB
         9YRhq/OCgbUbi0dR8wbdTk48Dyf/6fwQZ6+rdX03Q7bJGsYxP9plorSAJ1J85jZWw1of
         3OL5c3RoW8idlllawz5JdEVeNvpnrshbAnzuZWrNaM+5YSJkRX7nGg8NO8UnimFlFSzG
         xRrr9L4mv1T1iIzNhH3AGmNDRGNq2wrWdhtneyupevBobrjX+JynU812Txqk3gP78LI+
         XpEw==
X-Forwarded-Encrypted: i=1; AJvYcCWjpt7cRzmHxnzHEV/JXJ2SLkid8DK1ZgCeCLEz3Jq79Z0tUcxRqgpsGI46610BW1Kb3jXe8oO8Bt3JEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHpdTMcss0j47tRcqUuaS/mnSPm4/0Yjz0kNcCa7xozbR22Ycw
	2lVy2ACpS8qjzXYptAPUzwQDEyocETWTlcs1gRAApsfQoLbhRmxLsFCI
X-Gm-Gg: ASbGncuh7wZuj5KsrBA6IVt7QnJLCGAFpRJ3PlUS7Wl+nXSJ0zQdSyG1XXzXxvpqOCg
	8C60Z11J2v8nezieJuS9qvF/TA+WmQaDx/EvZ1eLRlfjYTxV5b0fMxbf/bEjqn+bhuWeaSrAWOf
	QxsukbRKpPzlADw4A2Qj05K8+cTgg2B3qjMqF6cKAQvgFaTJ0smU+AnBIKCuQr9FmeFLwoXfqFp
	Kxo2I0Fc1REixTAM0clIKQiWPCJ7HFsY4ZGxRdoBI00cMNv/JBs3zDC3QGLXupMeAkPsmu3qn+J
	8QN2qhwXyC/cskLtv6Hb0xswfKhd9i3Cb3ry6mkhX3SxHTZhaRntI746ioD/UqJ0MNIlLEMrlci
	LxySxMsj93nwxnoZXYboFlb4x2Z5dg5Mj54ZjZbabHTIrp09EeBgNbXsEvTpVqK3ln2TBLsL4++
	Muze3T9JJLzTmaZUjVVFWyjJmK
X-Google-Smtp-Source: AGHT+IGCW0ShjG6rPEd7TTM9fU/qaA3GTD+Zt4V6c9Z/7+p3piw8u4iEYCY97jT4XSt6uXwfG5ifag==
X-Received: by 2002:a17:90b:384c:b0:32b:df0e:9283 with SMTP id 98e67ed59e1d1-343ddefd3eemr7447918a91.34.1763031254493;
        Thu, 13 Nov 2025 02:54:14 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed4c939dsm2139616a91.6.2025.11.13.02.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:54:13 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@redhat.com,
	peterz@infradead.org,
	hpa@zytor.com,
	osalvador@suse.de,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	sforshee@kernel.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	oleg@redhat.com,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v3 3/3] Make finish_task_switch and its subfuncs inline in context switching
Date: Thu, 13 Nov 2025 18:52:27 +0800
Message-ID: <20251113105227.57650-4-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-1-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025415_848955_4C9CAE4A 
X-CRM114-Status: GOOD (  17.45  )
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

`finish_task_switch` is a hot path in context switching, and due to
possible mitigations inside switch_mm, performance here is greatly
affected by function calls and branch jumps. Make it inline to optimize
the performance.

After `finish_task_switch` is changed to an inline function, the number of
calls to the subfunctions (called by `finish_task_switch`) increases in
this translation unit due to the inline expansion of `finish_task_switch`.
Due to compiler optimization strategies, these functions may transition
from inline functions to non inline functions, which can actually lead to
performance degradation.

Make the subfunctions of finish_task_stwitch inline to prevent
degradation.

Perf test:
Time spent on calling finish_task_switch (rdtsc):
 | compiler && appended cmdline | without patch   | with patch    |
 | gcc + NA                     | 13.93 - 13.94   | 12.39 - 12.44 |
 | gcc + "spectre_v2_user=on"   | 24.69 - 24.85   | 13.68 - 13.73 |
 | clang + NA                   | 13.89 - 13.90   | 12.70 - 12.73 |
 | clang + "spectre_v2_user=on" | 29.00 - 29.02   | 18.88 - 18.97 |

Perf test info:
1. kernel source:
linux-next
commit 9c0826a5d9aa4d52206d ("Add linux-next specific files for 20251107")
2. compiler:
gcc: gcc version 15.2.0 (Debian 15.2.0-7) with
GNU ld (GNU Binutils for Debian) 2.45
clang: Debian clang version 21.1.4 (8) with
Debian LLD 21.1.4 (compatible with GNU linkers)
3. config:
base on default x86_64_defconfig, and setting:
CONFIG_HZ=100
CONFIG_DEBUG_ENTRY=n
CONFIG_X86_DEBUG_FPU=n
CONFIG_EXPERT=y
CONFIG_MODIFY_LDT_SYSCALL=n
CONFIG_CGROUPS=n
CONFIG_BLK_DEV_NVME=y

Size test:
bzImage size:
 | compiler | without patches | with patches  |
 | clang    | 13722624        | 13722624      |
 | gcc      | 12596224        | 12596224      |

Size test info:
1. kernel source && compiler: same as above
2. config:
base on default x86_64_defconfig, and setting:
CONFIG_SCHED_CORE=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_NO_HZ_FULL=y

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/arm/include/asm/mmu_context.h      |  2 +-
 arch/riscv/include/asm/sync_core.h      |  2 +-
 arch/s390/include/asm/mmu_context.h     |  2 +-
 arch/sparc/include/asm/mmu_context_64.h |  2 +-
 arch/x86/include/asm/sync_core.h        |  2 +-
 include/linux/perf_event.h              |  2 +-
 include/linux/sched/mm.h                | 10 +++++-----
 include/linux/tick.h                    |  4 ++--
 include/linux/vtime.h                   |  8 ++++----
 kernel/sched/core.c                     | 14 +++++++-------
 kernel/sched/sched.h                    | 20 ++++++++++----------
 11 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
index db2cb06aa8cf..bebde469f81a 100644
--- a/arch/arm/include/asm/mmu_context.h
+++ b/arch/arm/include/asm/mmu_context.h
@@ -80,7 +80,7 @@ static inline void check_and_switch_context(struct mm_struct *mm,
 #ifndef MODULE
 #define finish_arch_post_lock_switch \
 	finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+static __always_inline void finish_arch_post_lock_switch(void)
 {
 	struct mm_struct *mm = current->mm;
 
diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
index 9153016da8f1..2fe6b7fe6b12 100644
--- a/arch/riscv/include/asm/sync_core.h
+++ b/arch/riscv/include/asm/sync_core.h
@@ -6,7 +6,7 @@
  * RISC-V implements return to user-space through an xRET instruction,
  * which is not core serializing.
  */
-static inline void sync_core_before_usermode(void)
+static __always_inline void sync_core_before_usermode(void)
 {
 	asm volatile ("fence.i" ::: "memory");
 }
diff --git a/arch/s390/include/asm/mmu_context.h b/arch/s390/include/asm/mmu_context.h
index d9b8501bc93d..c124ef6a01b3 100644
--- a/arch/s390/include/asm/mmu_context.h
+++ b/arch/s390/include/asm/mmu_context.h
@@ -97,7 +97,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 
 #define finish_arch_post_lock_switch finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+static __always_inline void finish_arch_post_lock_switch(void)
 {
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
diff --git a/arch/sparc/include/asm/mmu_context_64.h b/arch/sparc/include/asm/mmu_context_64.h
index 78bbacc14d2d..d1967214ef25 100644
--- a/arch/sparc/include/asm/mmu_context_64.h
+++ b/arch/sparc/include/asm/mmu_context_64.h
@@ -160,7 +160,7 @@ static inline void arch_start_context_switch(struct task_struct *prev)
 }
 
 #define finish_arch_post_lock_switch	finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+static __always_inline void finish_arch_post_lock_switch(void)
 {
 	/* Restore the state of MCDPER register for the new process
 	 * just switched to.
diff --git a/arch/x86/include/asm/sync_core.h b/arch/x86/include/asm/sync_core.h
index 96bda43538ee..4b55fa353bb5 100644
--- a/arch/x86/include/asm/sync_core.h
+++ b/arch/x86/include/asm/sync_core.h
@@ -93,7 +93,7 @@ static __always_inline void sync_core(void)
  * to user-mode. x86 implements return to user-space through sysexit,
  * sysrel, and sysretq, which are not core serializing.
  */
-static inline void sync_core_before_usermode(void)
+static __always_inline void sync_core_before_usermode(void)
 {
 	/* With PTI, we unconditionally serialize before running user code. */
 	if (static_cpu_has(X86_FEATURE_PTI))
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 9870d768db4c..d9de20c20f38 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1624,7 +1624,7 @@ static inline void perf_event_task_migrate(struct task_struct *task)
 		task->sched_migrated = 1;
 }
 
-static inline void perf_event_task_sched_in(struct task_struct *prev,
+static __always_inline void perf_event_task_sched_in(struct task_struct *prev,
 					    struct task_struct *task)
 {
 	if (static_branch_unlikely(&perf_sched_events))
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 0e1d73955fa5..e7787a6e7d22 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -44,7 +44,7 @@ static inline void smp_mb__after_mmgrab(void)
 
 extern void __mmdrop(struct mm_struct *mm);
 
-static inline void mmdrop(struct mm_struct *mm)
+static __always_inline void mmdrop(struct mm_struct *mm)
 {
 	/*
 	 * The implicit full barrier implied by atomic_dec_and_test() is
@@ -71,14 +71,14 @@ static inline void __mmdrop_delayed(struct rcu_head *rhp)
  * Invoked from finish_task_switch(). Delegates the heavy lifting on RT
  * kernels via RCU.
  */
-static inline void mmdrop_sched(struct mm_struct *mm)
+static __always_inline void mmdrop_sched(struct mm_struct *mm)
 {
 	/* Provides a full memory barrier. See mmdrop() */
 	if (atomic_dec_and_test(&mm->mm_count))
 		call_rcu(&mm->delayed_drop, __mmdrop_delayed);
 }
 #else
-static inline void mmdrop_sched(struct mm_struct *mm)
+static __always_inline void mmdrop_sched(struct mm_struct *mm)
 {
 	mmdrop(mm);
 }
@@ -104,7 +104,7 @@ static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
 	}
 }
 
-static inline void mmdrop_lazy_tlb_sched(struct mm_struct *mm)
+static __always_inline void mmdrop_lazy_tlb_sched(struct mm_struct *mm)
 {
 	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
 		mmdrop_sched(mm);
@@ -531,7 +531,7 @@ enum {
 #include <asm/membarrier.h>
 #endif
 
-static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
+static __always_inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
 {
 	/*
 	 * The atomic_read() below prevents CSE. The following should
diff --git a/include/linux/tick.h b/include/linux/tick.h
index ac76ae9fa36d..fce16aa10ba2 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -175,7 +175,7 @@ extern cpumask_var_t tick_nohz_full_mask;
 #ifdef CONFIG_NO_HZ_FULL
 extern bool tick_nohz_full_running;
 
-static inline bool tick_nohz_full_enabled(void)
+static __always_inline bool tick_nohz_full_enabled(void)
 {
 	if (!context_tracking_enabled())
 		return false;
@@ -299,7 +299,7 @@ static inline void __tick_nohz_task_switch(void) { }
 static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
 #endif
 
-static inline void tick_nohz_task_switch(void)
+static __always_inline void tick_nohz_task_switch(void)
 {
 	if (tick_nohz_full_enabled())
 		__tick_nohz_task_switch();
diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 29dd5b91dd7d..428464bb81b3 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -67,24 +67,24 @@ static __always_inline void vtime_account_guest_exit(void)
  * For now vtime state is tied to context tracking. We might want to decouple
  * those later if necessary.
  */
-static inline bool vtime_accounting_enabled(void)
+static __always_inline bool vtime_accounting_enabled(void)
 {
 	return context_tracking_enabled();
 }
 
-static inline bool vtime_accounting_enabled_cpu(int cpu)
+static __always_inline bool vtime_accounting_enabled_cpu(int cpu)
 {
 	return context_tracking_enabled_cpu(cpu);
 }
 
-static inline bool vtime_accounting_enabled_this_cpu(void)
+static __always_inline bool vtime_accounting_enabled_this_cpu(void)
 {
 	return context_tracking_enabled_this_cpu();
 }
 
 extern void vtime_task_switch_generic(struct task_struct *prev);
 
-static inline void vtime_task_switch(struct task_struct *prev)
+static __always_inline void vtime_task_switch(struct task_struct *prev)
 {
 	if (vtime_accounting_enabled_this_cpu())
 		vtime_task_switch_generic(prev);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e50ef3d819a..78d2c90bc73a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4868,7 +4868,7 @@ static inline void prepare_task(struct task_struct *next)
 	WRITE_ONCE(next->on_cpu, 1);
 }
 
-static inline void finish_task(struct task_struct *prev)
+static __always_inline void finish_task(struct task_struct *prev)
 {
 	/*
 	 * This must be the very last reference to @prev from this CPU. After
@@ -4884,7 +4884,7 @@ static inline void finish_task(struct task_struct *prev)
 	smp_store_release(&prev->on_cpu, 0);
 }
 
-static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
+static __always_inline void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
 {
 	void (*func)(struct rq *rq);
 	struct balance_callback *next;
@@ -4919,7 +4919,7 @@ struct balance_callback balance_push_callback = {
 	.func = balance_push,
 };
 
-static inline struct balance_callback *
+static __always_inline struct balance_callback *
 __splice_balance_callbacks(struct rq *rq, bool split)
 {
 	struct balance_callback *head = rq->balance_callback;
@@ -4949,7 +4949,7 @@ struct balance_callback *splice_balance_callbacks(struct rq *rq)
 	return __splice_balance_callbacks(rq, true);
 }
 
-static void __balance_callbacks(struct rq *rq)
+static __always_inline void __balance_callbacks(struct rq *rq)
 {
 	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
 }
@@ -4982,7 +4982,7 @@ prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf
 #endif
 }
 
-static inline void finish_lock_switch(struct rq *rq)
+static __always_inline void finish_lock_switch(struct rq *rq)
 {
 	/*
 	 * If we are tracking spinlock dependencies then we have to
@@ -5014,7 +5014,7 @@ static inline void kmap_local_sched_out(void)
 #endif
 }
 
-static inline void kmap_local_sched_in(void)
+static __always_inline void kmap_local_sched_in(void)
 {
 #ifdef CONFIG_KMAP_LOCAL
 	if (unlikely(current->kmap_ctrl.idx))
@@ -5067,7 +5067,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
  * past. 'prev == current' is still correct but we need to recalculate this_rq
  * because prev may have moved to another CPU.
  */
-static struct rq *finish_task_switch(struct task_struct *prev)
+static __always_inline struct rq *finish_task_switch(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d305ec10374..ec301a91cb43 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1374,12 +1374,12 @@ static inline struct cpumask *sched_group_span(struct sched_group *sg);
 
 DECLARE_STATIC_KEY_FALSE(__sched_core_enabled);
 
-static inline bool sched_core_enabled(struct rq *rq)
+static __always_inline bool sched_core_enabled(struct rq *rq)
 {
 	return static_branch_unlikely(&__sched_core_enabled) && rq->core_enabled;
 }
 
-static inline bool sched_core_disabled(void)
+static __always_inline bool sched_core_disabled(void)
 {
 	return !static_branch_unlikely(&__sched_core_enabled);
 }
@@ -1388,7 +1388,7 @@ static inline bool sched_core_disabled(void)
  * Be careful with this function; not for general use. The return value isn't
  * stable unless you actually hold a relevant rq->__lock.
  */
-static inline raw_spinlock_t *rq_lockp(struct rq *rq)
+static __always_inline raw_spinlock_t *rq_lockp(struct rq *rq)
 {
 	if (sched_core_enabled(rq))
 		return &rq->core->__lock;
@@ -1396,7 +1396,7 @@ static inline raw_spinlock_t *rq_lockp(struct rq *rq)
 	return &rq->__lock;
 }
 
-static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
+static __always_inline raw_spinlock_t *__rq_lockp(struct rq *rq)
 {
 	if (rq->core_enabled)
 		return &rq->core->__lock;
@@ -1487,12 +1487,12 @@ static inline bool sched_core_disabled(void)
 	return true;
 }
 
-static inline raw_spinlock_t *rq_lockp(struct rq *rq)
+static __always_inline raw_spinlock_t *rq_lockp(struct rq *rq)
 {
 	return &rq->__lock;
 }
 
-static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
+static __always_inline raw_spinlock_t *__rq_lockp(struct rq *rq)
 {
 	return &rq->__lock;
 }
@@ -1542,23 +1542,23 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass);
 extern bool raw_spin_rq_trylock(struct rq *rq);
 
-static inline void raw_spin_rq_lock(struct rq *rq)
+static __always_inline void raw_spin_rq_lock(struct rq *rq)
 {
 	raw_spin_rq_lock_nested(rq, 0);
 }
 
-static inline void raw_spin_rq_unlock(struct rq *rq)
+static __always_inline void raw_spin_rq_unlock(struct rq *rq)
 {
 	raw_spin_unlock(rq_lockp(rq));
 }
 
-static inline void raw_spin_rq_lock_irq(struct rq *rq)
+static __always_inline void raw_spin_rq_lock_irq(struct rq *rq)
 {
 	local_irq_disable();
 	raw_spin_rq_lock(rq);
 }
 
-static inline void raw_spin_rq_unlock_irq(struct rq *rq)
+static __always_inline void raw_spin_rq_unlock_irq(struct rq *rq)
 {
 	raw_spin_rq_unlock(rq);
 	local_irq_enable();
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

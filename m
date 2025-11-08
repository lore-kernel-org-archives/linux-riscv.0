Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED6ECCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3HHzzKmyr4oJaR0C/6BU5qwJe+mMC24JcrXk1+ufT0=; b=gZ5FB+HWfTb1ok
	fqrpMLgkGariXWqAMZLw2lKqgJqL6SP+pTbRKCXUFi/l8HB7i6tPelPU0yAgmx8D9XbH8XhoNKqBn
	d/9UuYKowQ1c9ttCzE3fp3bal+Rs13AeKSuB63zC7xj0DMVnQ+0mmT74y1KZvLRZf62O4nP3VsdGg
	zV2eQr5/e5qRhVIXfFu2+4C4rGztvnwjsPqP7d+xZiHExZEqDm91xACFYvFXmMWrcDkxr96PPhq21
	vjNLZbrTFKYk8ILoJIieKXiyVrQ4MXItmdM5Yx0NCXqrkjM2y+sufmUcZFjW36GWyYthUxqZL+e6s
	5+cGKqm7X2qZWaJC6HXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmiV-00000003KGc-1NfW;
	Sat, 08 Nov 2025 17:27:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmiS-00000003KFg-296F
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 17:27:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297e264528aso6882115ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622828; x=1763227628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifgJwqhkz81AiW/M580r37kIiR/Zt38Daw4xBcO/V58=;
        b=I/hgNIbZjiR25mNp7zJ19E0wui6gu0RquCOrWYKmhjmG6ekUySxmoDbACdVOJZ7Kno
         754GqivaOJkuWKyje3NaXFwx1nuhubwfSNdCIaD3uAbMShv9jFiN8yhhYs5JAtSxfYc+
         EzTkbX4Ax3f7MPFwQ4dvHUUe14uqARqYXA0R7FXQc3U1MAOD/Sg9RN4b6qKo6zuoLzpw
         CZ8ekvLRVNhieCuPS7ih55UYHHrDeSHy2yN6v+I/oqi8rIPUjIuPTigPy9GiZGUVHyOF
         tQtv0f38Ivsmr7dWtToOE+cJsLI8dO7X891hhKaAL5oRorv/LZE/xUmoLBAMJQTqax6P
         FRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622828; x=1763227628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ifgJwqhkz81AiW/M580r37kIiR/Zt38Daw4xBcO/V58=;
        b=l7okL8QhinQf+95GFkyEm+k766P76nHDATP67Z7b+WVQ8g3GuzmaWTiHfJXcXm2ENa
         v7eWjidvShONB+IA6DKouBacgNo60GreNcmbC2VWNEBWSIIE8G47rZyXP/S+LlE3AMaL
         Z2vaCQDV0qBjbkEy5MrQ4xS0kdaUQE/yioQZ1lzC4g5BtZepO69uq6frukYjF/XdEPBQ
         kboBOH2+bx7PN1UVhzSVaCszuYgDvGC5eq68/rEfdwNffQmpxVMml0I/LAzX2G8KCn7h
         LyCxYwMCvxAS45sBeXTRjThdAKsgKx3eP/YUxr3UTT8Sh3OFI5G9ctaPMjD26VXGwG/p
         hBkA==
X-Forwarded-Encrypted: i=1; AJvYcCXMLk6rOgYBJUeLvDWELgtycZq3Q+tODMQIBWFz8DwZJCyVRcEaSv1TQSxA9MnhsHHjI/tyyIwiGqYHvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvgRFRE7Mj39DqpVRVD4IZNCD78Ld8rP3OrEX/6c0h9E+bHYnn
	4Shy/ytvodfji6jquU50mcaS8nSrlkxLeseImfyQFtDAR12TGg/dO5+4
X-Gm-Gg: ASbGnctrAN9IJt4FMe8LlBJksdmAegQ4liKxCF16PQDkxAr5xe2NcohbN3gjvt/lM9/
	fvsTkLsXq3gML9sm068scngyNjRXuWeiEGgQSTlFdRHYcszrj+58h2ki5afN4DJiAuPwvUdpysg
	0jEL/qDfaO95ve8ZHak9bWWRLydmjFO7UmxyFCu6KcuDeTot9kv4pwJeGax8r9ulggD4mkdAHIb
	MlBQeyQo+Mo7sGghsiifNWaNHLttyB//jIaxj3rN/ghphuul1vkVY+p6vy4E9BLQrtDqkhFtoFm
	eUfQQauzRjBPBoJZLsg1KWEppkPIB8LdcsI8M3yw035nFSNoLnJnQRPibEun0YO/UWasGobnxsp
	4ff1XfDAgkzYJFtihBiCptyx07pqGLeqwgDCPeHHQKHwQBgj0Pr972JDiaxbXQXYoe3f2ZSq4Gc
	b50En6x1xRjmanmfESwXNHK3//9Pd5XO/NP1E=
X-Google-Smtp-Source: AGHT+IG2XNPxrCil9As1GPMbFbfiTLeZrJq06uWpTB8/dDMRqGxGXKnu96wXs+iZFmt1AddBNZ4izQ==
X-Received: by 2002:a17:902:cf42:b0:295:8da4:6404 with SMTP id d9443c01a7336-297e56f9154mr40667245ad.40.1762622827520;
        Sat, 08 Nov 2025 09:27:07 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:27:07 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
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
	hpa@zytor.com,
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
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
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
Subject: [PATCH v2 4/4] Make finish_task_switch and its subfuncs inline in context switching
Date: Sun,  9 Nov 2025 01:23:46 +0800
Message-ID: <20251108172346.263590-5-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251108172346.263590-1-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_092708_563842_0D570525 
X-CRM114-Status: GOOD (  19.21  )
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

Time spent on calling finish_task_switch (rdtsc):
 | compiler && appended cmdline | without patch   | with patch    |
 | gcc + NA                     | 13.93 - 13.94   | 12.39 - 12.44 |
 | gcc + "spectre_v2_user=on"   | 24.69 - 24.85   | 13.68 - 13.73 |
 | clang + NA                   | 13.89 - 13.90   | 12.70 - 12.73 |
 | clang + "spectre_v2_user=on" | 29.00 - 29.02   | 18.88 - 18.97 |

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/riscv/include/asm/sync_core.h |  2 +-
 arch/x86/include/asm/sync_core.h   |  2 +-
 include/linux/perf_event.h         |  2 +-
 include/linux/sched/mm.h           | 10 +++++-----
 include/linux/tick.h               |  4 ++--
 include/linux/vtime.h              |  8 ++++----
 kernel/sched/core.c                | 18 +++++++++---------
 kernel/sched/sched.h               | 20 ++++++++++----------
 8 files changed, 33 insertions(+), 33 deletions(-)

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
index c50e672e22c4..cba8b93ed37b 100644
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
@@ -4930,7 +4930,7 @@ struct balance_callback balance_push_callback = {
 	.func = balance_push,
 };
 
-static inline struct balance_callback *
+static __always_inline struct balance_callback *
 __splice_balance_callbacks(struct rq *rq, bool split)
 {
 	struct balance_callback *head = rq->balance_callback;
@@ -4967,12 +4967,12 @@ struct balance_callback *splice_balance_callbacks(struct rq *rq)
  */
 static __always_inline void __balance_callbacks_ainline(struct rq *rq)
 {
-	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
+	do_balance_callbacks_ainline(rq, __splice_balance_callbacks(rq, false));
 }
 
 static void __balance_callbacks(struct rq *rq)
 {
-	__balance_callbacks_ainline(rq);
+	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
 }
 
 void balance_callbacks(struct rq *rq, struct balance_callback *head)
@@ -5003,7 +5003,7 @@ prepare_lock_switch(struct rq *rq, struct task_struct *next, struct rq_flags *rf
 #endif
 }
 
-static inline void finish_lock_switch(struct rq *rq)
+static __always_inline void finish_lock_switch(struct rq *rq)
 {
 	/*
 	 * If we are tracking spinlock dependencies then we have to
@@ -5011,7 +5011,7 @@ static inline void finish_lock_switch(struct rq *rq)
 	 * prev into current:
 	 */
 	spin_acquire(&__rq_lockp(rq)->dep_map, 0, 0, _THIS_IP_);
-	__balance_callbacks(rq);
+	__balance_callbacks_ainline(rq);
 	raw_spin_rq_unlock_irq(rq);
 }
 
@@ -5036,7 +5036,7 @@ static inline void kmap_local_sched_out(void)
 #endif
 }
 
-static inline void kmap_local_sched_in(void)
+static __always_inline void kmap_local_sched_in(void)
 {
 #ifdef CONFIG_KMAP_LOCAL
 	if (unlikely(current->kmap_ctrl.idx))
@@ -5134,7 +5134,7 @@ static __always_inline struct rq *finish_task_switch_ainline(struct task_struct
 	finish_task(prev);
 	tick_nohz_task_switch();
 	finish_lock_switch(rq);
-	finish_arch_post_lock_switch();
+	finish_arch_post_lock_switch_ainline();
 	kcov_finish_switch(current);
 	/*
 	 * kmap_local_sched_out() is invoked with rq::lock held and
@@ -5289,7 +5289,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	return finish_task_switch_ainline(prev);
 }
 
 /*
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

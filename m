Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A0CCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tImaqL52eGqt2Ce8KEKYRZOeZju1GU7sV4eAVidP6Ok=; b=0ff39nUk3Nd1yE
	LaQZxAl6DcE2mX1rqcYy1piXAJaLEFsZgoP+6g5asWyiEWsn3FIy83AUsaVgaWb/RHZfWyp0fTIyP
	9mlMBc0v/vdH+BQUjBpLy2fNa0tvWaPOmRN3eDsvGk/KdU0afnGj1qK8UkW9EoQBfVSK+qd4uD6xc
	k8gYiCZvfGXxB6XvY32XvktT7RtUdyR1aZzWFQGIEdcdQjuCFYkzaC0OOtQ0szxDrYKT63v1dH4Kr
	yS1ETA86zr9/gxWwdqylv6jQbOV7gM3OIleRZJGKLjP57qiqVySXYz3IOTOOb8hqwg+GtYA0p5IC7
	bIImXLIEW1C/XCPRuTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHrE2-00000003W0z-0MtF;
	Sat, 08 Nov 2025 22:16:02 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHrDz-00000003W0U-3QYM;
	Sat, 08 Nov 2025 22:16:01 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5A8MEjxP2478531
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 8 Nov 2025 14:14:46 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5A8MEjxP2478531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1762640093;
	bh=B/Cs56oiwOfYFf5C+E+O3dVcT+FEPLCVGwSgjVsb61Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=fWeMhNebCueBIgpwwJ9HzqbFTchAPIdo17J2WvEY7kkjBFr98Hd14BZVU/elSj4e9
	 sYvaiqrxvUl4BY8IpX0uQCmYyYRGpwEYM4AMpxmeO6jowam81zKx+Iou/8ibo+BM+1
	 ywYMqpzqqzlsIya940Jmlzx8lzG2S8DMVB5+RfgE7pFBtdtphXJ6gZJo7OenPNVKFJ
	 UQgPH5eVKjpuy1XcgvLHNRCiWtDhbQz2AI+JZNS/Lv07T437bJJ0VfM8ndXOQVc3ZX
	 UAUehct6G47TvwmWI2P9q6uIb6MiC/veNOSx+dHqmpfeKU8Yq/RQ/QTtFSTKBOHhQF
	 vb74cw9jAoTUA==
Date: Sat, 08 Nov 2025 14:14:44 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com, tglx@linutronix.de,
        segher@kernel.crashing.org, riel@surriel.com, peterz@infradead.org,
        linux@armlinux.org.uk, mathieu.desnoyers@efficios.com,
        paulmck@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, davem@davemloft.net, andreas@gaisler.com,
        luto@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, acme@kernel.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        james.clark@linaro.org, anna-maria@linutronix.de, frederic@kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, qq570070308@gmail.com, thuth@redhat.com,
        brauner@kernel.org, arnd@arndb.de, jlayton@kernel.org,
        aalbersh@redhat.com, akpm@linux-foundation.org, david@kernel.org,
        lorenzo.stoakes@oracle.com, max.kellermann@ionos.com,
        ryan.roberts@arm.com, nysal@linux.ibm.com, urezki@gmail.com
CC: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
        will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/4=5D_Provide_the_alwa?=
 =?US-ASCII?Q?ys_inline_version_of_some_functions?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20251108172346.263590-4-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com> <20251108172346.263590-4-qq570070308@gmail.com>
Message-ID: <04CA2D22-4DE2-4DE1-A2BC-AACE666F5F93@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_141559_866754_7C1AA60B 
X-CRM114-Status: GOOD (  14.96  )
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

On November 8, 2025 9:23:45 AM PST, Xie Yuanbin <qq570070308@gmail.com> wrote:
>On critical hot code paths, inline functions can optimize performance.
>However, for current compilers, there is no way to request them to inline
>at a specific calling point of a function.
>
>Add a always inline version to some functions, so that they can be chosen
>when called in hot paths.
>
>Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
>Cc: Thomas Gleixner <tglx@linutronix.de>
>Cc: Rik van Riel <riel@surriel.com>
>Cc: Segher Boessenkool <segher@kernel.crashing.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Peter Zijlstra <peterz@infradead.org>
>---
> arch/arm/include/asm/mmu_context.h      | 12 +++++++-
> arch/s390/include/asm/mmu_context.h     | 12 +++++++-
> arch/sparc/include/asm/mmu_context_64.h | 12 +++++++-
> kernel/sched/core.c                     | 38 ++++++++++++++++++++++---
> 4 files changed, 67 insertions(+), 7 deletions(-)
>
>diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
>index db2cb06aa8cf..e77b271570c1 100644
>--- a/arch/arm/include/asm/mmu_context.h
>+++ b/arch/arm/include/asm/mmu_context.h
>@@ -80,7 +80,12 @@ static inline void check_and_switch_context(struct mm_struct *mm,
> #ifndef MODULE
> #define finish_arch_post_lock_switch \
> 	finish_arch_post_lock_switch
>-static inline void finish_arch_post_lock_switch(void)
>+/*
>+ * finish_arch_post_lock_switch_ainline - the always inline version of
>+ * finish_arch_post_lock_switch, used for performance sensitive paths.
>+ * If unsure, use finish_arch_post_lock_switch instead.
>+ */
>+static __always_inline void finish_arch_post_lock_switch_ainline(void)
> {
> 	struct mm_struct *mm = current->mm;
> 
>@@ -99,6 +104,11 @@ static inline void finish_arch_post_lock_switch(void)
> 		preempt_enable_no_resched();
> 	}
> }
>+
>+static inline void finish_arch_post_lock_switch(void)
>+{
>+	finish_arch_post_lock_switch_ainline();
>+}
> #endif /* !MODULE */
> 
> #endif	/* CONFIG_MMU */
>diff --git a/arch/s390/include/asm/mmu_context.h b/arch/s390/include/asm/mmu_context.h
>index d9b8501bc93d..577062834906 100644
>--- a/arch/s390/include/asm/mmu_context.h
>+++ b/arch/s390/include/asm/mmu_context.h
>@@ -97,7 +97,12 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> }
> 
> #define finish_arch_post_lock_switch finish_arch_post_lock_switch
>-static inline void finish_arch_post_lock_switch(void)
>+/*
>+ * finish_arch_post_lock_switch_ainline - the always inline version of
>+ * finish_arch_post_lock_switch, used for performance sensitive paths.
>+ * If unsure, use finish_arch_post_lock_switch instead.
>+ */
>+static __always_inline void finish_arch_post_lock_switch_ainline(void)
> {
> 	struct task_struct *tsk = current;
> 	struct mm_struct *mm = tsk->mm;
>@@ -120,6 +125,11 @@ static inline void finish_arch_post_lock_switch(void)
> 	local_irq_restore(flags);
> }
> 
>+static inline void finish_arch_post_lock_switch(void)
>+{
>+	finish_arch_post_lock_switch_ainline();
>+}
>+
> #define activate_mm activate_mm
> static inline void activate_mm(struct mm_struct *prev,
>                                struct mm_struct *next)
>diff --git a/arch/sparc/include/asm/mmu_context_64.h b/arch/sparc/include/asm/mmu_context_64.h
>index 78bbacc14d2d..ca7019080574 100644
>--- a/arch/sparc/include/asm/mmu_context_64.h
>+++ b/arch/sparc/include/asm/mmu_context_64.h
>@@ -160,7 +160,12 @@ static inline void arch_start_context_switch(struct task_struct *prev)
> }
> 
> #define finish_arch_post_lock_switch	finish_arch_post_lock_switch
>-static inline void finish_arch_post_lock_switch(void)
>+/*
>+ * finish_arch_post_lock_switch_ainline - the always inline version of
>+ * finish_arch_post_lock_switch, used for performance sensitive paths.
>+ * If unsure, use finish_arch_post_lock_switch instead.
>+ */
>+static __always_inline void finish_arch_post_lock_switch_ainline(void)
> {
> 	/* Restore the state of MCDPER register for the new process
> 	 * just switched to.
>@@ -185,6 +190,11 @@ static inline void finish_arch_post_lock_switch(void)
> 	}
> }
> 
>+static inline void finish_arch_post_lock_switch(void)
>+{
>+	finish_arch_post_lock_switch_ainline();
>+}
>+
> #define mm_untag_mask mm_untag_mask
> static inline unsigned long mm_untag_mask(struct mm_struct *mm)
> {
>diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>index 0e50ef3d819a..c50e672e22c4 100644
>--- a/kernel/sched/core.c
>+++ b/kernel/sched/core.c
>@@ -4884,7 +4884,13 @@ static inline void finish_task(struct task_struct *prev)
> 	smp_store_release(&prev->on_cpu, 0);
> }
> 
>-static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
>+/*
>+ * do_balance_callbacks_ainline - the always inline version of
>+ * do_balance_callbacks, used for performance sensitive paths.
>+ * If unsure, use do_balance_callbacks instead.
>+ */
>+static __always_inline void do_balance_callbacks_ainline(struct rq *rq,
>+		struct balance_callback *head)
> {
> 	void (*func)(struct rq *rq);
> 	struct balance_callback *next;
>@@ -4901,6 +4907,11 @@ static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
> 	}
> }
> 
>+static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
>+{
>+	do_balance_callbacks_ainline(rq, head);
>+}
>+
> static void balance_push(struct rq *rq);
> 
> /*
>@@ -4949,11 +4960,21 @@ struct balance_callback *splice_balance_callbacks(struct rq *rq)
> 	return __splice_balance_callbacks(rq, true);
> }
> 
>-static void __balance_callbacks(struct rq *rq)
>+/*
>+ * __balance_callbacks_ainline - the always inline version of
>+ * __balance_callbacks, used for performance sensitive paths.
>+ * If unsure, use __balance_callbacks instead.
>+ */
>+static __always_inline void __balance_callbacks_ainline(struct rq *rq)
> {
> 	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
> }
> 
>+static void __balance_callbacks(struct rq *rq)
>+{
>+	__balance_callbacks_ainline(rq);
>+}
>+
> void balance_callbacks(struct rq *rq, struct balance_callback *head)
> {
> 	unsigned long flags;
>@@ -5003,7 +5024,8 @@ static inline void finish_lock_switch(struct rq *rq)
> #endif
> 
> #ifndef finish_arch_post_lock_switch
>-# define finish_arch_post_lock_switch()	do { } while (0)
>+# define finish_arch_post_lock_switch()		do { } while (0)
>+# define finish_arch_post_lock_switch_ainline()	do { } while (0)
> #endif
> 
> static inline void kmap_local_sched_out(void)
>@@ -5050,6 +5072,9 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
> 
> /**
>  * finish_task_switch - clean up after a task-switch
>+ * finish_task_switch_ainline - the always inline version of this func
>+ * used for performance sensitive paths
>+ *
>  * @prev: the thread we just switched away from.
>  *
>  * finish_task_switch must be called after the context switch, paired
>@@ -5067,7 +5092,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
>  * past. 'prev == current' is still correct but we need to recalculate this_rq
>  * because prev may have moved to another CPU.
>  */
>-static struct rq *finish_task_switch(struct task_struct *prev)
>+static __always_inline struct rq *finish_task_switch_ainline(struct task_struct *prev)
> 	__releases(rq->lock)
> {
> 	struct rq *rq = this_rq();
>@@ -5159,6 +5184,11 @@ static struct rq *finish_task_switch(struct task_struct *prev)
> 	return rq;
> }
> 
>+static struct rq *finish_task_switch(struct task_struct *prev)
>+{
>+	return finish_task_switch_ainline(prev);
>+}
>+
> /**
>  * schedule_tail - first thing a freshly forked thread must call.
>  * @prev: the thread we just switched away from.

There is, in fact: you have to have an always_inline version, and wrap it in a noinline version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

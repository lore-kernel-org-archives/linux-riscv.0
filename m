Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C3CCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjdaG/PY/my9cVivyfdpSLjJpZAHKRMZ/AA6QgxRqxk=; b=bum3e7g9J61ycc
	Kp3S4d21C/01yJnXClmfFfKIgDdddM8VxuPjl5M1jST8tYFZQRIEncfYJoB2oqrT5ST7MiQN0R3NO
	85OQiXp2g7I5rZYqy3E0780bi2bbvSNR9iN1i/FVr4HMKK2wyHDfHQ3tsDQl82/yZw/3/uXE2jHx0
	TzwWm9fCHJMLhlqEO961/ma87w1iPdFpjnK00uY2wJhOTbI73TeQzz8uiqp19sExEZDDVZsgkTf8/
	khq26JJb1efTLPCrU+UmVMtVAM9W0P6S0ysX1nExt4fy+nnU882IhCLk6KTnB0ni4wopcu/kevXtx
	0HRGwpxA/Tkz8XuOX+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmhv-00000003K7z-14Xj;
	Sat, 08 Nov 2025 17:26:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmhs-00000003K70-3CB3
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 17:26:34 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so1226771a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 09:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622792; x=1763227592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKX/131TEur+U1ws0a+nOk/0nOWDLcKaeuLKOvTYpSE=;
        b=P7nFSTDiItRQ05MehgkJXgLSn/bHgphpw43KaXwqTBoZmGBclmQk+4uT2C29OYTted
         EjXPBR2TaaYaO95sU8z4eyE2IOhqx7rMiBYQefNNRzYvGzDazbxbRXA6sorWC+I2SfjU
         osAWKKeasCKuF1BNgHp+9VzObljtZY4GUvdnt7vn0PFy+Ox3/J1y2k0vV4r8hVQ4/j+c
         CeIq6/xG2WDCfawXqczDp+K7DaCW7lbDy9ondkr5q7AQoH+wUkUmWO9GsWZpcsS155xx
         fFwKWB9Al6+3lRIfOR/RKjobneob+ajUZgA7Z9eLJ7+dHOgAsdMaji5ipTqsN91BBBKp
         vcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622792; x=1763227592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKX/131TEur+U1ws0a+nOk/0nOWDLcKaeuLKOvTYpSE=;
        b=vK9yaXbf7N1DWih97Ur9CAHYl9+ZZYCqqOMMl1+9W26FZt3hXeRG9js8eaSMPfxpAL
         yfiXlCXz+01kWFnf3WxDdXNCbvfZKPiM8rkX7fEp86jOR9CzLSe9PhDUG+vGUoxH1nhu
         MQGUwGweTwN/CHGCVRUndQPYAUpvNpkxzi9T9RvzgShkkPKllZevHp+GkeGVVVmgVCBl
         jtKXZIy/XiO9m/Szp6rb9qEuPlWv2JjlsiEYxGNXkieYt2r5oPgJb16torC2crtjetCL
         lOpk/lYA/O3C9KFKvycHDH2ybuMnSdXdFdGcBhVfoE0U+DrLyW6JCHBDPsZq91vU56FF
         mt9w==
X-Forwarded-Encrypted: i=1; AJvYcCWyKt4weCxrbwgs+AVnbcCL1rMhPX6NSVeHKpE34y2FIqkH28bR6SU7lLjz/jiJS257OO4qo3ektn7zSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOVrjUFIN7CgHQ+Yrc2M4PMdXaYK2+G5UugZwFjjHcmcQGA2Hr
	flTzfBwc4RJnnLh7P2VG6hekZSD5KRPAJrL3krykIN7V5i8Gx20YkkkS
X-Gm-Gg: ASbGncuQ1q6fj7PHtGN765GRLmFfY1+R8VlQtryw+6gm7T20Zkb1mR71OC1wonAkDi9
	sHq2svGCtjdgjLFmxVos5SRu3n2up1fxoreirgNuME6t7CRUMnFLybXUzHobkWgBSt46TtZsZFv
	aBOkTf0jDVUVdJKneDT5PqnGiGHCp2wDm0znFZHKSOEN/oW0+k3wj96Ro8Z/SkzX7uGRcIXSHOD
	mzFFK0M0ZR3lio6vSzNKekpSWPBBeVWhZsNsCeWA5pbWLXwJjQRFNt9UbeBYmkhqAauVqWSWqtH
	2UhJyzR6R5AdVG4mKpD2boe4MpgnwJDz+oX4gxB4liAaRdyfu1tvdXA4ql2BLZwptGU7Cc4o9vV
	hSA9UDx5MUkiVWFPbZD4LsG2Iq0QX8tYlsLArTEOEHfW7RfJOFZrzhMAlokIzig2L54oOaM9I4i
	UNpn9iFZqIWc8b57U0GYEDx+akJZvIugnQ73g=
X-Google-Smtp-Source: AGHT+IH4teb6TaYW1xg4uJQv+WZcVr1MVnIhG1sOWOWypgVOcL81T9P773N1D5H9ZmD3rsY52c3wxQ==
X-Received: by 2002:a17:90b:37d0:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-3436cb9ed9emr4303314a91.16.1762622791726;
        Sat, 08 Nov 2025 09:26:31 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:26:31 -0800 (PST)
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
Subject: [PATCH v2 3/4] Provide the always inline version of some functions
Date: Sun,  9 Nov 2025 01:23:45 +0800
Message-ID: <20251108172346.263590-4-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251108172346.263590-1-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_092632_805219_3E35DB18 
X-CRM114-Status: GOOD (  16.23  )
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

On critical hot code paths, inline functions can optimize performance.
However, for current compilers, there is no way to request them to inline
at a specific calling point of a function.

Add a always inline version to some functions, so that they can be chosen
when called in hot paths.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/arm/include/asm/mmu_context.h      | 12 +++++++-
 arch/s390/include/asm/mmu_context.h     | 12 +++++++-
 arch/sparc/include/asm/mmu_context_64.h | 12 +++++++-
 kernel/sched/core.c                     | 38 ++++++++++++++++++++++---
 4 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
index db2cb06aa8cf..e77b271570c1 100644
--- a/arch/arm/include/asm/mmu_context.h
+++ b/arch/arm/include/asm/mmu_context.h
@@ -80,7 +80,12 @@ static inline void check_and_switch_context(struct mm_struct *mm,
 #ifndef MODULE
 #define finish_arch_post_lock_switch \
 	finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+/*
+ * finish_arch_post_lock_switch_ainline - the always inline version of
+ * finish_arch_post_lock_switch, used for performance sensitive paths.
+ * If unsure, use finish_arch_post_lock_switch instead.
+ */
+static __always_inline void finish_arch_post_lock_switch_ainline(void)
 {
 	struct mm_struct *mm = current->mm;
 
@@ -99,6 +104,11 @@ static inline void finish_arch_post_lock_switch(void)
 		preempt_enable_no_resched();
 	}
 }
+
+static inline void finish_arch_post_lock_switch(void)
+{
+	finish_arch_post_lock_switch_ainline();
+}
 #endif /* !MODULE */
 
 #endif	/* CONFIG_MMU */
diff --git a/arch/s390/include/asm/mmu_context.h b/arch/s390/include/asm/mmu_context.h
index d9b8501bc93d..577062834906 100644
--- a/arch/s390/include/asm/mmu_context.h
+++ b/arch/s390/include/asm/mmu_context.h
@@ -97,7 +97,12 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 }
 
 #define finish_arch_post_lock_switch finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+/*
+ * finish_arch_post_lock_switch_ainline - the always inline version of
+ * finish_arch_post_lock_switch, used for performance sensitive paths.
+ * If unsure, use finish_arch_post_lock_switch instead.
+ */
+static __always_inline void finish_arch_post_lock_switch_ainline(void)
 {
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
@@ -120,6 +125,11 @@ static inline void finish_arch_post_lock_switch(void)
 	local_irq_restore(flags);
 }
 
+static inline void finish_arch_post_lock_switch(void)
+{
+	finish_arch_post_lock_switch_ainline();
+}
+
 #define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev,
                                struct mm_struct *next)
diff --git a/arch/sparc/include/asm/mmu_context_64.h b/arch/sparc/include/asm/mmu_context_64.h
index 78bbacc14d2d..ca7019080574 100644
--- a/arch/sparc/include/asm/mmu_context_64.h
+++ b/arch/sparc/include/asm/mmu_context_64.h
@@ -160,7 +160,12 @@ static inline void arch_start_context_switch(struct task_struct *prev)
 }
 
 #define finish_arch_post_lock_switch	finish_arch_post_lock_switch
-static inline void finish_arch_post_lock_switch(void)
+/*
+ * finish_arch_post_lock_switch_ainline - the always inline version of
+ * finish_arch_post_lock_switch, used for performance sensitive paths.
+ * If unsure, use finish_arch_post_lock_switch instead.
+ */
+static __always_inline void finish_arch_post_lock_switch_ainline(void)
 {
 	/* Restore the state of MCDPER register for the new process
 	 * just switched to.
@@ -185,6 +190,11 @@ static inline void finish_arch_post_lock_switch(void)
 	}
 }
 
+static inline void finish_arch_post_lock_switch(void)
+{
+	finish_arch_post_lock_switch_ainline();
+}
+
 #define mm_untag_mask mm_untag_mask
 static inline unsigned long mm_untag_mask(struct mm_struct *mm)
 {
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e50ef3d819a..c50e672e22c4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4884,7 +4884,13 @@ static inline void finish_task(struct task_struct *prev)
 	smp_store_release(&prev->on_cpu, 0);
 }
 
-static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
+/*
+ * do_balance_callbacks_ainline - the always inline version of
+ * do_balance_callbacks, used for performance sensitive paths.
+ * If unsure, use do_balance_callbacks instead.
+ */
+static __always_inline void do_balance_callbacks_ainline(struct rq *rq,
+		struct balance_callback *head)
 {
 	void (*func)(struct rq *rq);
 	struct balance_callback *next;
@@ -4901,6 +4907,11 @@ static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
 	}
 }
 
+static void do_balance_callbacks(struct rq *rq, struct balance_callback *head)
+{
+	do_balance_callbacks_ainline(rq, head);
+}
+
 static void balance_push(struct rq *rq);
 
 /*
@@ -4949,11 +4960,21 @@ struct balance_callback *splice_balance_callbacks(struct rq *rq)
 	return __splice_balance_callbacks(rq, true);
 }
 
-static void __balance_callbacks(struct rq *rq)
+/*
+ * __balance_callbacks_ainline - the always inline version of
+ * __balance_callbacks, used for performance sensitive paths.
+ * If unsure, use __balance_callbacks instead.
+ */
+static __always_inline void __balance_callbacks_ainline(struct rq *rq)
 {
 	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
 }
 
+static void __balance_callbacks(struct rq *rq)
+{
+	__balance_callbacks_ainline(rq);
+}
+
 void balance_callbacks(struct rq *rq, struct balance_callback *head)
 {
 	unsigned long flags;
@@ -5003,7 +5024,8 @@ static inline void finish_lock_switch(struct rq *rq)
 #endif
 
 #ifndef finish_arch_post_lock_switch
-# define finish_arch_post_lock_switch()	do { } while (0)
+# define finish_arch_post_lock_switch()		do { } while (0)
+# define finish_arch_post_lock_switch_ainline()	do { } while (0)
 #endif
 
 static inline void kmap_local_sched_out(void)
@@ -5050,6 +5072,9 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
 
 /**
  * finish_task_switch - clean up after a task-switch
+ * finish_task_switch_ainline - the always inline version of this func
+ * used for performance sensitive paths
+ *
  * @prev: the thread we just switched away from.
  *
  * finish_task_switch must be called after the context switch, paired
@@ -5067,7 +5092,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
  * past. 'prev == current' is still correct but we need to recalculate this_rq
  * because prev may have moved to another CPU.
  */
-static struct rq *finish_task_switch(struct task_struct *prev)
+static __always_inline struct rq *finish_task_switch_ainline(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
@@ -5159,6 +5184,11 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	return rq;
 }
 
+static struct rq *finish_task_switch(struct task_struct *prev)
+{
+	return finish_task_switch_ainline(prev);
+}
+
 /**
  * schedule_tail - first thing a freshly forked thread must call.
  * @prev: the thread we just switched away from.
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

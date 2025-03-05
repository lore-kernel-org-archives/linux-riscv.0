Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841B3C282EC
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtlkEMzySJwDjKbqmAKM7/+o9BfneowYZX1+ayrwo0c=; b=gbigYLHglMhM/2
	Qr+GnNgd1kpHAeuwqihUwSKyNbeY/xUBj4OIn1gezP+VUQytVa21zyrDkdeTERw1CArd60+uzPe4G
	4pwUPN+Xvov8EqgAX3s3m+ryi06SBIoxfVLZb8Kn6bkCUvtTepGpnfog3N90bY/ogwVT/WYT6dGIQ
	eKiZyzIR0O5wa8Ehf8xdlfU+FpWs6efMLh1KXiUVsEaENClqfoilgoaXsAx2Mo+bv07v9XbCUa81i
	k3MXknYfcQNNkNmirrqH7+Gr+Pee9eAZ1W1JCIGrnEQGm2EJ/4viFBrfGxurFpBwVcE/atKqsFHQS
	5ptTFrTxfSkpY5aq95LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjQ-00000009YSo-2KpN;
	Wed, 05 Mar 2025 23:00:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjN-00000009YQU-06aL
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:00:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22185cddbffso24814775ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 15:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215648; x=1741820448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=wN7O7vcI02KiSrYYyR2Od/WEXcsIAMukeqiBQy5t+gdEX/Dj423O+5CCoAM0gvc6oq
         QLfL8DDXYKxZyJGcb87OUJHq9nGqgcM0D1FkpgRNBL3bN42qiHIxkMjNI/Y61e2l+Eac
         92WOU1ZTHIjDaqFfScCYOGgs9MardrrDvKbjTWpR/tREHRAnDYjnDE6GyrmEQg8J5zSU
         cHIdgWDxa9BEniFh8Xb4iFDC0WgAk8OygBYj4M/S1U1ckCF0ISJ06aJkpeumtUMUbRV8
         xa7vP6owHb+jmVC5gkYQPvNU5bWFn7mz5pMO6c9RCFYmv1DMMgoaAplxbVSDHK4Fz/8c
         lNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215648; x=1741820448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=R9EHgi4dojM+U28RKUK64wsS5rqetKLYsI5ncHqaexxCyXibwJceZ4Fm6+2l4uABDk
         W9pjT6/f3qCLdAAQzjWQznQ+YLOxDHktV2SQ8QhVJi2RjbNG4EO84EJyHnIqZ8PvQMqc
         dIxDAcTdjLH2mPs0+SNQvauwtFGmFnBeJ/tfz+kFSM54eXM4jcKpGbhZHXz+fmJoGgCH
         qAbLO1o03R/Cr8HZToMMX169PLxvlfyrT4KP1B+3+Vv0dBKCKFKUparfpcF0WNZiyAtE
         4wBlKAkP1CJSZp3MM644lKlpxWDu+/o+NlBvuNVtn1/whw0mHnAPc9xX9pQyjnfuTpG0
         EiWw==
X-Gm-Message-State: AOJu0YyTTP+vy6upeBtSDBRf1atnVPEHr1HOLmBJIwyi440sGq1UGCkV
	BermbQcjqadauOKCHbo1TvkiEdIX+6oBR7fK89pQt2879csEAbI3DCYWO7JD7BE=
X-Gm-Gg: ASbGncvL/1RRplneELJRWRY4zQPfmrR9VCkMb0oLDRiXRMndil7dDMV3V3oR33U1X2E
	3QIOIR0F0rWnwCaze5k3YX44ToS6L4tla9Ko4Ut2bnn93SFJyO/2/F0rN8j+f/lRZP8AlsFaPzL
	/fflXdfETgmYnZPQU02qmnBLPqmaVH6CYbm7IzHFauggDUbXWI7wEsGREF7mgw9WHhUDSAiW6kc
	zSWmRsqyfe6O02UQz6DuyFbaGx9xb1LIvOYf5qJwRuvT24/S7XVUTDTDjoXKdSJYHTkL1Jufcz5
	QGhKKq5SqlxQn8rLybUZAJFmrHVALsHk5fR3H0oCQR7YBbfMh4RlJFcwZ/ZW
X-Google-Smtp-Source: AGHT+IHIXuq48FCG34gQSDWE/fOeG6ktun6hvvxw8iNV8AUnzyOAu2vvj3lTw8zV66HwuuHt9MjAlA==
X-Received: by 2002:a05:6a21:78a8:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-1f359b16c26mr1515464637.5.1741215648040;
        Wed, 05 Mar 2025 15:00:48 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:47 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:28 -0800
Subject: [PATCH RESEND v4 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v4-4-0d81bb45203f@rivosinc.com>
References: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5141; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=j7ZO4FXV1Hf14yiJt7JLsFHCp0FLrXbd7xunBuFQ9j8=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69OP3ch+/m7/lUad2VUJDPL51ybv0VH/nvKC5SkLh
 xw7y9trHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzEjonhv4vXQjVhvjLJW47v
 WI/u84ud+Gj1tLXqLWe8m6Py1dcqMDAyrDtzKpZ5ai7br0NPPZ1Ktt3U837x7/vCZP99nPvecaj
 08AIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150049_065184_45CD47D3 
X-CRM114-Status: GOOD (  14.65  )
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

Architectures using the generic entry code can be optimized by having
syscall_exit_to_user_mode inlined.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/linux/entry-common.h | 43 ++++++++++++++++++++++++++++++++++++--
 kernel/entry/common.c        | 49 +-------------------------------------------
 2 files changed, 42 insertions(+), 50 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..f94f3fdf15fc0091223cc9f7b823970302e67312 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -14,6 +14,7 @@
 #include <linux/kmsan.h>
 
 #include <asm/entry-common.h>
+#include <asm/syscall.h>
 
 /*
  * Define dummy _TIF work flags if not defined by the architecture or for
@@ -366,6 +367,15 @@ static __always_inline void exit_to_user_mode(void)
 	lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
+/**
+ * syscall_exit_work - Handle work before returning to user mode
+ * @regs:	Pointer to current pt_regs
+ * @work:	Current thread syscall work
+ *
+ * Do one-time syscall specific work.
+ */
+void syscall_exit_work(struct pt_regs *regs, unsigned long work);
+
 /**
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
  * @regs:	Pointer to currents pt_regs
@@ -379,7 +389,30 @@ static __always_inline void exit_to_user_mode(void)
  * make the final state transitions. Interrupts must stay disabled between
  * return from this function and the invocation of exit_to_user_mode().
  */
-void syscall_exit_to_user_mode_work(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
+	unsigned long nr = syscall_get_nr(current, regs);
+
+	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
+			local_irq_enable();
+	}
+
+	rseq_syscall(regs);
+
+	/*
+	 * Do one-time syscall specific work. If these work items are
+	 * enabled, we want to run them exactly once per syscall exit with
+	 * interrupts enabled.
+	 */
+	if (unlikely(work & SYSCALL_WORK_EXIT))
+		syscall_exit_work(regs, work);
+	local_irq_disable_exit_to_user();
+	exit_to_user_mode_prepare(regs);
+}
 
 /**
  * syscall_exit_to_user_mode - Handle work before returning to user mode
@@ -410,7 +443,13 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs);
  * exit_to_user_mode(). This function is preferred unless there is a
  * compelling architectural reason to use the separate functions.
  */
-void syscall_exit_to_user_mode(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	instrumentation_begin();
+	syscall_exit_to_user_mode_work(regs);
+	instrumentation_end();
+	exit_to_user_mode();
+}
 
 /**
  * irqentry_enter_from_user_mode - Establish state before invoking the irq handler
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e33691d5adf7aab4af54cf2bf8e5ef5bd6ad1424..f55e421fb196dd5f9d4e34dd85ae096c774cf879 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -146,7 +146,7 @@ static inline bool report_single_step(unsigned long work)
 	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
 }
 
-static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 {
 	bool step;
 
@@ -173,53 +173,6 @@ static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 		ptrace_report_syscall_exit(regs, step);
 }
 
-/*
- * Syscall specific exit to user mode preparation. Runs with interrupts
- * enabled.
- */
-static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
-	unsigned long nr = syscall_get_nr(current, regs);
-
-	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
-
-	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
-			local_irq_enable();
-	}
-
-	rseq_syscall(regs);
-
-	/*
-	 * Do one-time syscall specific work. If these work items are
-	 * enabled, we want to run them exactly once per syscall exit with
-	 * interrupts enabled.
-	 */
-	if (unlikely(work & SYSCALL_WORK_EXIT))
-		syscall_exit_work(regs, work);
-}
-
-static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	syscall_exit_to_user_mode_prepare(regs);
-	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
-}
-
-void syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	__syscall_exit_to_user_mode_work(regs);
-}
-
-__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	__syscall_exit_to_user_mode_work(regs);
-	instrumentation_end();
-	exit_to_user_mode();
-}
-
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

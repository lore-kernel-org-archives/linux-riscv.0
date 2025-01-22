Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74742C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qtpMJIjOPtVuxK1g4pqkuWoa5970oYmSDA0h+QaR8g=; b=Fj5bwFiHRwirO7
	YTcqNYLNIV7m8tEAf0c91CiawmhjxYz4/7OQMgYevNwA7nfTwrvrrVs55HQyV7zyb/4iyaVXZy1iC
	3YA8mRPRyLlna7yzxMSf1xPhVIcWjLUSPJprI+c3/6r+p0MGylTu4wIjTpc3Yfxk2oAkUUQMZmoAY
	GEiubd3p9AiWqZkNTGX56JnVg3iU2SFWx7TRC3A8ckZWQezjtil+dB030C+XZNaRNdu6GATYv27C7
	Z5bMNVbI/WxaoQYAuSbJ3ymzs0YMB1n1NTYK9dFuJkUYC/4MWWNPIQR/Qn2CrHUXX1Kae0+CvdvRe
	Ez4J07mP5X94GzUl9stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajei-0000000BMaj-228Q;
	Wed, 22 Jan 2025 22:57:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajef-0000000BMYq-2Pr8
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:57:03 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso459860a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586621; x=1738191421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCJijnh3eucUGl1hsJuof30/Y1t6y46+I+a/ErqCn/w=;
        b=I+iQ/M9PoeTevflHZfrKeFuW+/bIP4Qnmtr25pC6m8YkXKy6zJJGHrcUWscFqHTvtn
         dxkxKUMFdnUKJOsql7aiyH/emEiKiTtsbi7G0/Y/4t9QWUje3/tj45YAZEfp54unm/E9
         e7zeRUtdQ1jTaAZyPHbzMFrY+nV2RMuNaMuBzQtCib9VzRWp+pXjk0J7LKKJOr6DSdvt
         mSHO/0mAXPMsjqPjEnu694JWDEAok3uXmwJRXMtEcEEizMl3iWEVnzEheYDZZMcIi+ta
         ciZFU+uIuwk/P9nLnaHgFoFQO1zuAYtSaU96OLn2JOxgvYXRfPS6HXjkQNgi63jl+56r
         WCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586621; x=1738191421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCJijnh3eucUGl1hsJuof30/Y1t6y46+I+a/ErqCn/w=;
        b=wZHs9a9HeHBsfPowaaXTw/hPJx/kvNwuPdDloRgEfyJgP2Xg5IyYKd2V/4ImZNvYrx
         uyPm4c2GGivgOXE7RKGbxsI/O2+zlFs51OVZrgDu1pJ3Lal2f12J7ivgdcg7CUhY6s0g
         0hROpvjfq7pEeUIExgLj8YZpWWhnwWeQrFLpdm/tNvlR/OC4fbpvFhAtlM55/DB0PxYu
         cWgH9WySVliiB46uBZSWj6QDvdyuDqcenkFJSPixINzQzTr3bTJ2S7UzPFZNif0EoPuq
         mqEF9WXBthZdYwdXwvVfXR91n9P/6K6D0jobxCH7Bb0eWBGFAgv0TO6yK6t/vx4odaQb
         HovA==
X-Gm-Message-State: AOJu0YyAs/DXOHyEbs/pMd9ghtAaTaHkkCkuY9DRxNcOnU2F3U23wFzw
	1EOSPYqFHXULRgFfkG037AyLLwYkZ+fdpIPoAko5a5TTksmDtun9lYIHQQhrQWk=
X-Gm-Gg: ASbGncuGMGiwP2RS8JEJXWuB82HlU1vYwS+xENSWPuP1QLCKqHYxVbdXpC2uQObyONJ
	IZiQP3K9+sAIf00+TedkHSlyy5QFhWE/4854euYH4VLo2nX4uDGuG5HvXAQR3j9D059QvYnzVp6
	CkEIiPBnONf8lsHZ4dm3ZFaIIcmKsjdR5+wPLEKohqEv7dEyE34hrg9kl20Z1z/PpKEg5PK3cAs
	F6nrR2jm8BHQflxBOto9o3PTf+2452pRlJEqGIcPDG/FK1zOFz66g1REg41y5iWGDvv0+6718RJ
	0iHieQb2qw==
X-Google-Smtp-Source: AGHT+IHS1l32r3sB5S5xxvBnREu6zfuZQuMS6eKu4LrFATLcIt6SklxYU1mGoLAC7M2MGJdnMK+c1Q==
X-Received: by 2002:a17:90b:1f88:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2f782d5d838mr33980210a91.30.1737586620724;
        Wed, 22 Jan 2025 14:57:00 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:59 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:23 -0800
Subject: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
In-Reply-To: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Z1tS2IEfH8NjFHjnsgjlU412ZTPZo9IgZRJ3cE9Ze5k=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i1Xrbq3yFk9XtolEHc+YPPKS4zHdLyPbp1l/T3K8
 ibjJu3nHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExEo4mR4cTqzcKbngRY/JjW
 1KZ9LnmP/3vOqTsu/eEzCLYLaWh9uJbhr5xYRZ/aZPPgR5fkV/YHnnWcJf2O39WubLv+9xcTFs2
 W4QIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145701_635674_0BEFB968 
X-CRM114-Status: GOOD (  15.04  )
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
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..a46861ffd6858fadf4014c387e8f2f216a879c25 100644
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
+	CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
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

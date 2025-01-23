Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F8AC0218D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWJgRsvBKUyrDoH6mpji1zYt5VMX4P6Bh6RH5MuSPhY=; b=umUIImnJzUxqVi
	gJhB72NJWSXiMtQ4mWMTKdOXMXXy//frWEnTH8MlltYZneSgT7FWEfnDomqiqSDhPw3ZF0BYgcgvc
	s6gX8KPWL2Yr54Q8R6xd82f9Ucyf23sc2DO0X1Ray6aru05f88eNn+J6kdz8TdWgEH0sU0eub0m79
	31a5M4p0JNBPJO5BlalOGF3UX4AsrrQ54PTUp2viL57zT0yk8aRNwp6UT4J79S6clsSGQ326JyojN
	S+2Lf3cENpTpFJA+jukzsMrFLCnHZa6I+HcWE/kI5XqNVdfwAofXpGJuf4ssX0fSIuYqE0yX3TXbk
	4WZsymjI/k+9XWEQOCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fn-0000000D6gu-409s;
	Thu, 23 Jan 2025 19:15:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fk-0000000D6er-2uul
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 19:15:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2166022c5caso20996425ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 11:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659724; x=1738264524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=3cwhrPWHv7aaq721z0Tb0l9Eno3Hmw3yZ8zV6LfxpzGo8MYRfhp9pkowWfwPCxHogU
         /0V7UatFE4+Ko6Eg+UfsOAw/P6yaXyfdRlbl6s1YEmrZXRKA6RETpVTXy68eBXjymGBX
         yX1cnPIvZntEeNxtWOyN6pj1cA6llNBs9lhlUEa+6OXylBFYd2evRQUOldpBoBLsYNW1
         DI207IvDm7CY6Z+T2ZoddXtkw+VC5it7bKlpbxlMdbYFoOUTqncvbLdLXpDCcFXVoLkw
         IXs4jFsdNk87aM0rXN59Nzzr6W5XFVmds14iOrjenEk7SHt5Cj3z3szYs0WCkhaMQK2N
         u+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659724; x=1738264524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=vjFutLYBhWsZZ8t+nvOrry1+NHwGbH3UeIomP0/PpTgPIn8gzTSHZv8NLiieowyId/
         jjo+BaxVAb2mTsobXuyms8nbrqnh9WYYBOjJ18TXeukVehOBNBfQ8BTaec9/YeULN64t
         JxSqrhYoH5s3JdrmJZ35Jz8HzbzGztZp+ootWCdy+kybD85UF0UXYLkbdhAy4FUcvhAi
         sloON+20E6vMSU2Eep4EmgAWEiwjkE7nnTg53qTm4AibwODN+spLVeOhQx6tiVu7ZBgW
         444fHikTxrYRws4o3Qx6GaEVdDaXNcY1U/uLIhsjGtngz9qFXwK/uWOpNsB5qd3+sX3y
         3Mug==
X-Gm-Message-State: AOJu0YzRu/hD6mqMkQAWjzidyiMIrZKPbH/ztlSKJ8Nn942pWkDb/rHx
	PxCthStD18LXJjNvxjLnsaYjp+IRZNtbewt7faRmPmkKfdilQeEqOel6C4Po/DQ=
X-Gm-Gg: ASbGncuTJghOL21xM01c7RhkJqnrwqV0kFUsJ/OoBli4Am0KsUOmVvvCzIyAXvpjxbi
	5dllR91BkFwfp+ICpe/Hs+wtMe7vrNAzNT9kW1+/jVnvbXPD2Uu0687j0CW7hfTgHtmbxUsxQFN
	zrfcAZyF5FtfvkNdQ4JNV6OFOUlnFYmwL55gvNDJL7ZpY/DpgtT6/S9NcJqXyrC9dsl19yaH4dm
	rRzP9/JoREXooKEuvmFmCon8b9fpYFgGQ3N+he99DIzNeILYYRnwFIpkDQoRemQs6HOTLnP1tsh
	nyxct85/bzoGceMYrNBu
X-Google-Smtp-Source: AGHT+IEYNOhlEJXPQBtWi85GhJgHV9Yrk3PSdmPAVSOzqlnq4qLhaCE8KgNu8jpQHMIt2g3t9EdDpA==
X-Received: by 2002:a17:902:ce0c:b0:21c:e34:c8c3 with SMTP id d9443c01a7336-21c35540560mr481214975ad.24.1737659723835;
        Thu, 23 Jan 2025 11:15:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:32 -0800
Subject: [PATCH v2 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250123-riscv_optimize_entry-v2-4-7c259492d508@rivosinc.com>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5145; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=sNZ3kRgQB3K0rJNT54yR9TpYcWCb1xtle/FG6x9msOc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU53TuRtTHj3fNe5lfPyE/IEpc/3RlRNFXlhaxe/Q
 9wmfbFCRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNZZs/wT7++1v5d9o4WnqBP
 p6Tbpq2w1IqbmD7lttHvQ9uM3U10tzP8D1grdbP/UmxWhqVs6beLTJv/6C04VHugw9nyjL1s4wE
 rZgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_111524_732506_F4F67ED8 
X-CRM114-Status: GOOD (  14.76  )
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
index fc61d0205c97084acc89c8e45e088946f5e6d9b2..ee1c400bc0eb0ebb5850f95e856b819fca7b3577 100644
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
+	CT_WARN_ON(ct_state() != PERF_CONTEXT_KERNEL);
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

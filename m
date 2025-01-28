Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C20C02192
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtlkEMzySJwDjKbqmAKM7/+o9BfneowYZX1+ayrwo0c=; b=E9cMP43dTVTvYH
	TFt/nTzVyVzbzcFPejvwupk9ZL92XjTWvLDvoNpTL1hQOSWY/DyS/TyI5RpNYANsDPOjzULs97PSX
	txgAXqvK2cf3lEG8f0PucEU1cuKACx1fvEhaFJQkEA/yXPbhjjyxsOuIesx7yJqkBqPnlK1rECQaq
	l605ca/OK1P8ZjryvBbb5Ye+qSa7BGKpioaa/WP4hvLS5M9WZnjYf72eOl8+9uQMG7pS+UCsNh7Rg
	x+ul8ZGfjnnAs6JuZKM82gBTm9d0bkFcGW1WCfztskUMTI3nTddKjySWqKsklZtpt6qVJsUrsyydc
	OTPYX8qThqRImfZCZ6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCU-00000004Dlu-2MFG;
	Tue, 28 Jan 2025 06:35:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE7-00000004AW9-2Iqf
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=; b=WS3Hn5uKM8he0aK7wlu1xDfL1L
	cTN7RqY1caZ0iN/a9ipmC803bPfIYAfhrfEWVBD6LMxW/o0tJwnOU6FMpv5O1pHVSWy+EaMUg2V1K
	ds1LAWpiqPzRsoIUH+BTWOjCYsY/1PIIlhriATMDH/AY1MN/PZml793tOW+DbgKWr3bN4LDYG16tY
	ZRVNoPzaRfbRoTRe1EbMd1itWWu0q09YXZzQ/DAf4K6yoTXf29hPoB6JOwtA74Z0FxMYniP9EPl2t
	ggkAluRltjtRHxRFXFSb6b5MLaEHttdIxKryQo4e2g8BUOs7hi6SQnl88ytDKf9wf9tOc27yth8hq
	lNbtWpDA==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE4-0000000EpfH-0bEu
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:33:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so9222308a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042407; x=1738647207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=ToVG89SPf0UofNiHHbIbILR0+OSuJdxhUl6ZUPaHkgJNnyQdlIDDgYUpSwQ6jAz3wI
         3EMw6q+3UwABx12Cx8J6TznOKOVuWo9AnDj6HKsmBHZyOlyJopihcpORGFUM80aMGrJN
         Wk41wqQOpwueyG7cIYMu8IJXsWsvXbq49bQYjwqehJtc7O6cys1O2Ze6H/jHc7eYf/oa
         a3t1UDarKFv1IQY6URgzlJYopZ0mNoDzxlrm/BL2Nk+MDRFxuebgUDmEBQ8Uf/U0n7YK
         ckVQupn6GK5WMBCczy+Lsvh4rAQAbxYk/eTAQFGrfHci2bgFW0x5UK1wLjWa9OR9qwM1
         cGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042407; x=1738647207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=YlGSjQdo9NgZKxy0amW0tNMw630Z7CUpYafdds63QA01nYIRCup8/FiMeDbR7BEOQ9
         sFWKZb69UfL4f14G/HzlgT2NUOonKOZXrQ45ueOsCEE5sNARUCCaLJnpyRg6ltei1z66
         0Np/UNcSCWk8UsUqd+uhpqt908qKk5SKkyJBg3ErFjaQivP0Wyc9QQDKFdYwUsO44G/a
         Y5GCPaB8WhUumy9p4mjN3vOzifFZ8eSRa8IDcl8u4o+7TgdSDnKSUbh+s/cwSNRdVQt2
         CG/QSKNRjV2b22AwWKNhtnEjF2qnx49G+ivYayzMZ0a0iDfOlZRMobYXFdBAEVHStkTd
         BMhg==
X-Gm-Message-State: AOJu0Ywsnok+Ll0xvt0qGWb9Zghs/ivxoLfJG6j2Kgwx+Vej+VedO/8u
	MHBjjF0k5R3F5gWXC+McXGcbwFFufNRDPkcNCVSjmtHwurkS4TeEiykoTjfu5xE=
X-Gm-Gg: ASbGncuzu6R4lc8DbffykUfggccbK/NXpekPqet4EM0CBNn+O3YnH28OMswXc/miP02
	WDyDAYOWA2hVJDfqqyt5nU4psvgVv/lfOyMHCu4mg5Pqznt+wIXgWrrvxxQYKcveefpb2+RdDQg
	eeF8kRsAI6uhQz7yBgDerXwlKL3TCeQryCuuYYp3jJYqJx6ExrXeDW9Fwi06t+m+iwUCReV2yuo
	GncaHVyc3SpI60SHiQIJib5hla1kutdVXLLRXVUJbgH23CdGQI7kcOjpaU6VpjjtmQTOUY++RwV
	d74qs90y5p41nsZ072sFVpQGHliOoIo=
X-Google-Smtp-Source: AGHT+IGkVxybbhmMu57xJQJzMyQwkOMbXHCtIM1pnr7yMYLR6mnolYIlXLb9ipU14x5Wd4npsIBS3g==
X-Received: by 2002:a17:90b:2805:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2f782c9406bmr66373912a91.11.1738042406754;
        Mon, 27 Jan 2025 21:33:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:12 -0800
Subject: [PATCH v4 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250127-riscv_optimize_entry-v4-4-868cf7702dc9@rivosinc.com>
References: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
In-Reply-To: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHLmT/cfrmEzXr81fsZRrrt1xy46eFcmTJkyf8yV3J
 +ONXa15HaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExkhSYjQ0tK9rqTG+6t2NJe
 OX3SYdNnU5/J+PQU124rOPzh9JWb76czMrxgbzSee55Z/3qgbdxOpv5PwVe4rM/rvZ2R9GX1ny3
 7ilgB
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_053328_502407_4927E70B 
X-CRM114-Status: GOOD (  15.01  )
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

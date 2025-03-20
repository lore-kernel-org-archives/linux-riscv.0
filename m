Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCBDC36005
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSsZEYKoYBfieDgkWPYCVMkCZ+lc3PjLyBrrOFyMlWQ=; b=NwN59jNsOUrZ/J
	Xof/jN4fiyjXhScadUDYcTdnoIIiTFik22nKfqOzTErp9HQPL28LD56KUL8MoQKHska7lhmO9Nvql
	/QZJRU9SxyEyx0ll3zC+5iVgDAP3qCq0AIA9wsktP1sKkWRkOoUq8RTOblsxhazYmSh3tvtTvA1dO
	f7sFJd+uCytcGiswCMsgn4L5hcVVm4GSc9NaGk+76HEpxDdlOpmDqSWFIDollIN2pKt+ErsPXNGnE
	SdaOi/MsAy4yQP5VH2HLQ4+lx9bOpDrhfWqju7xyI4CFqx5+VAnUZoY9kcI/ED2pl6Aviokfu5B4h
	viHq0A1PG60jnJJic1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJji-0000000CoHF-0nwY;
	Thu, 20 Mar 2025 17:31:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJi9-0000000Co11-2GcA
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 17:29:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223594b3c6dso25740955ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491781; x=1743096581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eCKaISwGTmHrKIN85ACd1M+I+peSRtvNHA2LnoFqyQ=;
        b=P155dMiZCALgBRrN24XagjCs3ih34KOBE4tj7SSI+mTldMWknOmj4Sk+jDgi/n1Pkq
         H0Y0OD+UUTwqNps2oKUthxMwbfLIuMijOfnZPpuiSaYizHBgF+7duXwp9Qsfyu5wgM/d
         1tZ3N76/5d/9hqJ0hBbGKHWzSVdIdlI0HwOBv7aLEalMCYtM+Cs2oL2ZCCv1FBP1ppDp
         mZ8ZLR83Mjg++4E726QuRz8t5gyFuh5y8/0o3vRYTwTilEQYBZisev91T8G4rGkWwzU0
         dmpS0pMDUhbooftgxmTzezRCKc6ii6qSvaqljDtOr9Zrj0jGNiFh4DCD2I2//32K43KI
         Rxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491781; x=1743096581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eCKaISwGTmHrKIN85ACd1M+I+peSRtvNHA2LnoFqyQ=;
        b=oRWSpYgHaP3QYtIF3y9QA/tFojPi4PFFM8OKLZSxqB1gZcRWgykc+k1y7oZ20+P37z
         t1JSLlPUC3URyNdkFqR0f/uu2mcYCFonXkMXolklyYL6waYdgOSUQu8yeYryLsPNYuJd
         TD7oVBFa17YsDvpJJeQhneAOBqAoClyjTlVJpSbWtiOk83K3yb6AeOwxoE7g7NNqBqEM
         CuouChsTZBIsN8S+nZkI27OZEssHu1n2rUNlCPqKv3Y3ngmCpQk16d9x8X/xrvgZYgSP
         6OuQqafAr8BJXoKRgbN8fLZ4xpbbDlvNniahLCAR6fGuykz1vzTcI3RVLrwqfspR8GpJ
         ysQw==
X-Gm-Message-State: AOJu0YxNrz+/Ebuzy4JBeRYSLMoD99Hg7HhGVzETdmQ8VDEbz+pYw+BX
	guZBoWgKbF3XsuYSZSlD0v6QgEHIbOnJs7GMqLtGtddsgf8MT3WiVhEHlR5d7Jc=
X-Gm-Gg: ASbGncsnaQjJsq1QOy2gtnGuhcX19WOy9aNq0Qny11DEM9w7W++b1aHh2diHXP5u6CA
	0S5HIA0jf4MzNFIfcAVjpI718mcQnIdqEedBzfYBw2Pd+2OR4ZGYS2eB9pSR2o2NSVEPWiLHhox
	3/LHijpxqG8SiCf5NLMF6bgvkJmA9TcWfPmRkGNFs4ntYCa8lysgoGfZ6gS6BhkMdu9W2CkzELt
	CpD+2+6sZhO7DqbiOb6b80Jxz5ZFgRWFZd994TRh9iILDCC8gjF0PT7xBZHAfzsUGzO469tBSZP
	9vHECo0vD6sLaKj+ArQYVPhI9jHLWzfAJic4i2u047e1cPR1SaTqTi9xx5so
X-Google-Smtp-Source: AGHT+IEoiSAT3PG2OtWmoV8mEdtsEZlvOKiVq4y4a6hslPNxV+g32GTCCxsgFDxyvEafNQCPfwNFsA==
X-Received: by 2002:a17:902:d511:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22780e259c5mr2788735ad.49.1742491780987;
        Thu, 20 Mar 2025 10:29:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Mar 2025 10:29:24 -0700
Subject: [PATCH v6 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250320-riscv_optimize_entry-v6-4-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5735; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=hwgP0eJzDOrIufwWh6p9CUUm5a7+Fj7HYXiMVVUL4i0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qdgGq/gwcSBbKN5p44aWIlPpmL3/weZ9XT/V/fHUmOf
 WD/Vr29o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgImEVDEyrBLd8GnjvikyV9/F
 i29z36Hy8PXSm5elT8rPVp7dM+fmBkZGhgnvBaQuX9uxPEsj9ztDn3DcJ3+Zs8yioUodqUxax45
 PYgMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_102941_590217_E3B30261 
X-CRM114-Status: GOOD (  15.83  )
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

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

[1] https://github.com/kdlucas/byte-unixbench
[2] https://lore.kernel.org/linux-riscv/202502051555.85ae6844-lkp@intel.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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

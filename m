Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A3AC0218B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWJgRsvBKUyrDoH6mpji1zYt5VMX4P6Bh6RH5MuSPhY=; b=D0Qgg0oRjQmDD5
	7bZzxQnuWqw6cF3xeOVYabuTkFhWx94U31+Ah6tu9IWPxBXUDgDVmdby2M2TfoZ8nsLO/ICJi1cKy
	H764vRINm+qTpPzoq4iVPDCxIGqEh23WacRXHGIQ6+85ZbDrMKsF+hPufXtqCg6VYh6yZpASjq9V9
	N6pSwge7qcbeUNG/0SgCRJLNIObWQXULdppWC9Y9+v5RDMT58q7zlkn8oen0k+BjyWY9/KhPpkGyE
	NKI0wJToUyraY/wLljM6Nfxz+K49jBkBr/y0deLoO/5236yT13vdA7EBfuiC/0kfszzRMcAHQ5Ewj
	3aVyYK1AdVP4bJWQDB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDj-0000000FcvR-2fmu;
	Fri, 24 Jan 2025 22:32:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSD7-0000000Fcig-1PE5
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:31:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21bc1512a63so52571445ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757893; x=1738362693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=Jux018lff7XesWDuVIF5D7CQKLJ6Y96O5DfAjdFJazgBETS/D33VRcON6hjjnfJxno
         KN5lWInAgwJweKDXBclS3msCx2Mr8od+BliDcE25jOj/zRE5pvAkphf4sIm7JdlHgAv7
         alm5s0VyStNnuDKq73t2M0Ng24XemLbWYM1R98jGk2YfMDwRsfpRWVA5FK+8FAxlzWq+
         i0HITrznXWQP3j6lY60l+iuA6ahyL3rFqZLX82XDTvnIgw8EKV02OFmAStmHuRpjwsq1
         pvKuNL/oxkE83CP36pRnMggd8S+oGOvSkcb56UpylhsauK5kxj3QifjO8rP5Ei39k55V
         NqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757893; x=1738362693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT7EL7aXHj5Qe8OT6w++iL8CLZKTuGLA5KeWTFGIQzY=;
        b=ck+UGSUPwADZo1ha3+bJVODw1uSz52zs9PcKRW+O2FzsHP93VQX79yuRIpVb40C612
         I20aM/ekUX1uNvCUQyPum6HlO3AK8pNYWkbtv6JnGZqOJzHX5zdRciDM2AYc0oEGis7W
         VR+HFXFXmqurIb1XbHtrkiqDS6B5YLvvpzfkX+uGRtSomcXF6hEzogc4lfTkNybpKKwS
         yMRdys4XUw7enzZUPiAYNj94wzEZs9+yBXIbDNp0ARkKGe7Aq/GxPPNYtU6Tm9qvW/GV
         FuwmzfO9oRd/2yAS3VJnAyWp82ZwDiisrCyIguEw/4tvcZFSj9YW+K1SCz5WYW/jJ38C
         zgbw==
X-Gm-Message-State: AOJu0YzUuGD3uvobnlAi+Os/3mqxvlirr1MtfezfKW64bLcEiOr8c+cE
	NyFOT2huIrBP6P7IlNu9emPmLAtFrxo8k4tb+M+UbAmSPt9HgMw4F6L9iY6/JNw=
X-Gm-Gg: ASbGncsb/lSpwaDo1OKMQ7JljpF+W5JlEzGSqemxN2XucbEQgrsIZ+3OVK+AwGRInV/
	jqbAv0KrPmrMWPuJhmFx2TKgked5+J1fTQRxCgeHqQOc+EmoBUvJHGRfImkq7XJ1c76JSG35cX1
	2tbMHIKeTKDwiYw3KAJ58xatGRxqNJHfH2Bz7t1NEfgqY3Milcg2ky9Ww89vAP5lUBNm5L1booz
	2w3jOw+V2MBI+wdxir+ABS7wwNk8uzMclVlrgjwd7zlJrljUPH3JysmdV5RuD7K78ApzLdcytX1
	cUKYlauCUjrBtkwMJS2M2dejjBIDNhA=
X-Google-Smtp-Source: AGHT+IFXK5F2oZ/QyolwaGkbszhQMrnQEgQ/zkG4vY/tsUK75EkmfNWITMpNDa0U8tOC37teAvGGhA==
X-Received: by 2002:a05:6a20:7f89:b0:1e0:dc34:2e7d with SMTP id adf61e73a8af0-1eb214650camr45666065637.5.1737757892796;
        Fri, 24 Jan 2025 14:31:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:31:02 -0800
Subject: [PATCH v3 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250124-riscv_optimize_entry-v3-4-869f36b9e43b@rivosinc.com>
References: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
In-Reply-To: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT0VfqffFouuyp4Vb3LsoMOtgw9+zgvqmDWt7m1u6
 uptVtNOdZSwMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRxYwMXzjKHDiO9HEpHtJd
 XMe7bKfCOlUBhU239h18IyXnPImPmeF/4OP5x+crPrF0lYizMbt4ZOOWJwxbIwtsblh/klvlYbu
 dDQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143133_369595_A2AFFE97 
X-CRM114-Status: GOOD (  14.88  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BBC19F32
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 00:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtlkEMzySJwDjKbqmAKM7/+o9BfneowYZX1+ayrwo0c=; b=fyia0YuO/NeK0k
	kvg8+jL9wrDAVuxUS35Oldk0pWCFXgtWKZzTUTkB5HLfK9RKbdbykORiP1VvsMfXqic/2qNXziy2p
	BJGy/q52c+PrOrSzWzwWanyCB4Cnbh3v/yoZTLF+YnxtTVNmo7XOTIeQn0urDGdSO61SAQ/ShWWcx
	vwm/kRNSlXGTyQAfPpbCWDP5T7XGzzIDL+xv9IWTWaQsfuqeiX9CAC6sdogweaKSDdrnNxTRgwSCb
	L0usDzCvuXXq8TIq+JfdnGOFe9ts+w/G5EOorpiTcuxp4j27xRsNUjIbVccx7bJk539kzHnqlW6k6
	2kvlRitK16gzmSS62B3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLU-00000009ilE-1hel;
	Thu, 06 Mar 2025 00:44:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLQ-00000009iil-2Xoq
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 00:44:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224100e9a5cso895665ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221852; x=1741826652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=YaENzrf6D8W/GUy8vOsVI/1RCb8LHw4S0+5A1hQhAe6Q9bcjdmmsQcJT/e1C/pheXF
         17gU5DTU5EQIBSNfIwATmAtBHXVeGKEOF9Llaihq54MweBAINncZz9RpsMn3ub+ijTK8
         GUwziJYwQ0yay/+FHQ+hl0/YKtdq3kGSKX+9jyqlyuTz8ESvtaBTNwP0w55wBv+2IJ9M
         ps0Subi3ixT5NC0xdUh9SSe4A4CVzCOQpGSvOg5cR/ddrdGZ+dXINosdradE6Ju/47R6
         BurpSOiP2GYOJfRlMo3IEmVRNJw/J/JoqK8SHeCYhuH7Yf1xS0edu/uL7kYIAoCdD4WQ
         DPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221852; x=1741826652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p30t3bidsL8DH7wJ55Ht0+lyyt5ZTgdtBsNdg8zXD0s=;
        b=hgSRe0A86+UctsmiLnFOybINKPMQYzQp6azXGdaYafQhGreB8myHp/HlrkA3L0fiiO
         5eZ3s/Z4pgWPrVUzNebGHsJOBX2RfBwHp8qeGxhbYo9It1qH3z9SDJ1D7cYJWMjAExw2
         PJWYTaiIEgc+kcg8B8VzUXaDeXlavVGnEloKEOsWrUX99mPLOsJ/6kcJ31Y9YLjJZ9GD
         PjR4L4idhNFrJbNwkXGy/9bAAjrSrhAE9qnuyiDToov6KbxR8IWzH/ee5vuZFuX846MD
         s3MRHyjO6Iw7MTUh8ShDbX+ER9AVXLhDIrCBdzeKqneUSAKXQLxZbBic3TVOOsRKU1pl
         6wIg==
X-Gm-Message-State: AOJu0YyVGAEruDwBXKAsKozBJV9u23FnQuF7m2UtprYpy5DR61B/F8Bk
	dZUQgd/x5PrHTeeDXOVLH5L2ZPUDHRkWBUFUZ8At8EhcXTA3QvuzvLcf70DZyXM=
X-Gm-Gg: ASbGncsf2ErW3UGJmA0J+ujXmNp/GUlQBtlH5aF9be9+WTF0voEgODmEEvoU0ZnoR2B
	U+XPHYIXPdJODiCTnp5Z2VV5mJTPAszJDkEOxN28TfKs/6Qdr6ooIDQO6/kV1H5eADX9361LHPK
	Bx6Z/IA6IfpSbBRFk41CX54hNShO4Q2GJi6MIpgX+/VO6ed4t3YgZtfPOw1vzZW+VCeUBZGiSV3
	5tePwZxbxa9oaaQGU3XYqG/McYh2wvVg36kCFt4rQyrLAdFryyi2fW56M6Jfos9GvTnzMDWEeYl
	a742b4HVOk6YOKuj0uKuwDy+nd3lyZmXtf00VX05JVUz6fXxA5WCTlWyamj1
X-Google-Smtp-Source: AGHT+IE3udje6D9ToJozjElnL03nykz3gt3O3YbFzCSzOAeX2/0ggHbBiX1+w1/L3X8PtcJZLOlRYA==
X-Received: by 2002:a17:902:d549:b0:224:3c9:19ae with SMTP id d9443c01a7336-22403c91a6cmr43245075ad.34.1741221851852;
        Wed, 05 Mar 2025 16:44:11 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:11 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 16:43:47 -0800
Subject: [PATCH v5 4/4] entry: Inline syscall_exit_to_user_mode()
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v5-4-6507b5dff3ce@rivosinc.com>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ95d9ndq3LQ44de6FoLjnP4Wflp+6lvkeeNEuvN8vl
 k/soW5mRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNRWMDIsEH+59MDmer/fzAU
 vvxYZjyFw/HQm6w1f54Er/xks8PGu5mRoa1Us0Hzc7CdgfrJc8aZ75wz9rt7hrUu4uo1/VOqxcH
 FAQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164412_643027_9C909E5B 
X-CRM114-Status: GOOD (  14.66  )
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

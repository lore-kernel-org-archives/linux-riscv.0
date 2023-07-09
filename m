Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06AEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAFs46XfJkV+OkzvqiI85Ej2m7QV1rn/LCL8l2RCNXw=; b=1CcEF8qeDHUFzn
	q38SsABEDBcsDLbBAFo5PsGMIJc40aRl2hL7D4zmyE8e67xF8Q5ejG8GxnRLSYPONgNaKz40DvYdP
	DuciDG6UwHaKgMJMscck1Uzo6Kzmp/evpm8qHFNQ32nW9WfSveXefoxqgLBnegVKuimQ6gmd7wnN+
	e1t9sNk6Kh1K3GYM2xbSKZsD9Z7xofnO8mg9j2YKgBNwOWV2sSnyxj9xjHQ8A3ifpUNLlVCrVcZYq
	EUQ/eDdqtnA/pLtx1TxcbUOgZlcBn5wbktgE5hgkhjFdgAvHjWj4qr333rH1F1YiFoG/b1WhSqKJS
	P/0/CDNg/S9r4Y5t2HfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIReY-008oUj-0B;
	Sun, 09 Jul 2023 10:28:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIReU-008oTq-10
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 10:28:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7BAF60B72;
	Sun,  9 Jul 2023 10:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD141C433C8;
	Sun,  9 Jul 2023 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688898503;
	bh=3sPwX4GVTHH+apYt2dKBk43WvXcfJBHi7r9smnLvACE=;
	h=From:To:Cc:Subject:Date:From;
	b=lYtFlNfTAA3tzzCsF5XPl5cdaF4pDoSIR4OXiGBZwf1uVoC0y/782/ax77YFkq+dx
	 HneYNDBK60xClp0GRzi2efpbIArOF+5gCm81Hp4PVvQiE9EUotpox3RlJhp1e6MCqS
	 7G+2zA5VaMB0WO4sfXCbHViLzpvPhFWmDLeDSCCYu0iee/Zo2WuAbjhDrKZZRuQN72
	 AL1dr44g8+MKXM8LvXjAoCdiwgZLjt7sT3ezMhkX4oX6Ahkbz0lnyAqhqTaw5ALV9Z
	 Vxm6gqbMi3NBaEY6rF7/4wmzaI+VxTWoJklhOsH922ffrHGk0JZldKIn0gm6OXNlCx
	 HzQJNAG5kA61g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH] riscv: support PREEMPT_DYNAMIC with static keys
Date: Sun,  9 Jul 2023 18:16:53 +0800
Message-Id: <20230709101653.720-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_032826_516506_8375FBD9 
X-CRM114-Status: GOOD (  13.66  )
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

Currently, each architecture can support PREEMPT_DYNAMIC through
either static calls or static keys. To support PREEMPT_DYNAMIC on
riscv, we face three choices:

1. only add static calls support to riscv
As Mark pointed out in commit 99cf983cc8bc ("sched/preempt: Add
PREEMPT_DYNAMIC using static keys"), static keys "...should have
slightly lower overhead than non-inline static calls, as this
effectively inlines each trampoline into the start of its callee. This
may avoid redundant work, and may integrate better with CFI schemes."
So even we add static calls(without inline static calls) to riscv,
static keys is still a better choice.

2. add static calls and inline static calls to riscv
Per my understanding, inline static calls requires objtool support
which is not easy.

3. use static keys

While riscv doesn't have static calls support, it supports static keys
perfectly. So this patch selects HAVE_PREEMPT_DYNAMIC_KEY to enable
support for PREEMPT_DYNAMIC on riscv, so that the preemption model can
be chosen at boot time. It also patches asm-generic/preempt.h, mainly
to add __preempt_schedule() and __preempt_schedule_notrace() macros
for PREEMPT_DYNAMIC case. Other architectures which use generic
preempt.h can also benefit from this patch by simply selecting
HAVE_PREEMPT_DYNAMIC_KEY to enable PREEMPT_DYNAMIC if they supports
static keys.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig            |  1 +
 include/asm-generic/preempt.h | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..bdea2e5a9f34 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -129,6 +129,7 @@ config RISCV
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_PREEMPT_DYNAMIC_KEY if !XIP_KERNEL
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index b4d43a4af5f7..1f476aec7e4c 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -80,9 +80,21 @@ static __always_inline bool should_resched(int preempt_offset)
 
 #ifdef CONFIG_PREEMPTION
 extern asmlinkage void preempt_schedule(void);
-#define __preempt_schedule() preempt_schedule()
 extern asmlinkage void preempt_schedule_notrace(void);
+
+#ifdef CONFIG_PREEMPT_DYNAMIC
+
+void dynamic_preempt_schedule(void);
+void dynamic_preempt_schedule_notrace(void);
+#define __preempt_schedule()		dynamic_preempt_schedule()
+#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
+
+#else /* CONFIG_PREEMPT_DYNAMIC */
+
+#define __preempt_schedule() preempt_schedule()
 #define __preempt_schedule_notrace() preempt_schedule_notrace()
+
+#endif /* CONFIG_PREEMPT_DYNAMIC */
 #endif /* CONFIG_PREEMPTION */
 
 #endif /* __ASM_PREEMPT_H */
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

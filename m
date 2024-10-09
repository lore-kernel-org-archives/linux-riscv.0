Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67763CF044A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 10:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNdJvTJXEPhh1mtEKfb1JXzKxqdwjBsMrZXgt92FbyM=; b=HtyCwbJg7I6zX9
	5Unoe6CcE+zpm/Rvav8CMUu6oU3TIkjrY/9ayzdX8kXZEnbdgGh3zdrCijI34R9mxfVzY5f8XfJeo
	FQQmNpLcOCdo+aDR0OjJty05g/QemiO9x4UIDev57tgS4v4zqrdXWSFHyumn4asDUx7VKvCEkBmr0
	IZ3eNFIl3B6o/5aZxCYzcg7oS/X0u7Unw1PVuvtpUQVeKHQia++1ixNgDAz99KnoeRVHRtDDZd0+s
	TRKA9Gl38mw99n3PGB8zQc6toiNCoN5OX009MH3l+8AiP+FWbX1V+QZbuP1vr/ZJH4CBi+rRIWt66
	IiJCKUziMHJSIiXu906w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUPB-00000008y4J-0K4k;
	Wed, 09 Oct 2024 10:58:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUNe-00000008xet-02wi
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 10:57:24 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728471438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMLrliO9lAbb+dJaG2LlaA1SSyEScnNEwlBTF2eF/dI=;
	b=Bz++JAuDWa3PCULVNbkOYe1NjQAHb4suiUw5KTd/ClMg2LC9b4aJWPRfiNJQwwMvYC+7+Z
	sl5n5YodQ97tWyKw7NX3aFQRiKq7Uc6rDHfWIlTxb+PHEhQBp+0bFdwqVoP0E7QpkgcLJp
	U75G3FwnqTQYnAuPn5EijoupkIYyqHIkvk8zVoaRQPlIl7TkpjTwZBR22KVvdEycX6ARYz
	Lk6X/s5WyK5/YmaogR6qSgTvjremFTMpAN5aR/+hUpsluY/ljxxCOP3eqearkzfpkVKHBA
	u+2ar/ejibmt6Dw+lrjGipJQAwd0a9Yb6T06ZQ0TfULLidwH2EWMrBM1NIW9eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728471438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMLrliO9lAbb+dJaG2LlaA1SSyEScnNEwlBTF2eF/dI=;
	b=L9sUCqacxH9ZpLdofZVOeTpbD/iXzqiub6ab3qtt8TLPPEQnO4gfx+F15rOYfvQDrwZAux
	DKTF505J55Kk/XCw==
To: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	tglx@linutronix.de,
	mingo@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	ankur.a.arora@oracle.com,
	efault@gmx.de,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 3/3] riscv: add PREEMPT_LAZY support
Date: Wed,  9 Oct 2024 12:50:57 +0200
Message-ID: <20241009105709.887510-4-bigeasy@linutronix.de>
In-Reply-To: <20241009105709.887510-1-bigeasy@linutronix.de>
References: <20241009105709.887510-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_035722_221657_69A00368 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

From: Jisheng Zhang <jszhang@kernel.org>

riscv has switched to GENERIC_ENTRY, so adding PREEMPT_LAZY is as simple
as adding TIF_NEED_RESCHED_LAZY related definitions and enabling
ARCH_HAS_PREEMPT_LAZY.

[bigeasy: Replace old PREEMPT_AUTO bits with new PREEMPT_LAZY ]

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/riscv/Kconfig                   | 1 +
 arch/riscv/include/asm/thread_info.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf43..3516c58480612 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
 	select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 9c10fb180f438..8b5a5ddea4293 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -107,6 +107,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
  * - pending work-to-be-done flags are in lowest half-word
  * - other flags in upper half-word(s)
  */
+#define TIF_NEED_RESCHED_LAZY	0       /* Lazy rescheduling needed */
 #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
@@ -117,6 +118,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define TIF_32BIT		11	/* compat-mode 32bit process */
 #define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing to user */
 
+#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED5D15DB1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRX7lZ7fFJ/nrFppEkosJA38ASkhzPFhaiUUVia4aYo=; b=gPhKvO1IXqhEBi
	NRaW6wKTv8Kgxt0t4NRT64eY+cSkpy444fWbsnPjD4gwVi+I9OmBbd/t6FGS/LZ1eFwfCONbi+8d5
	MeCze6MeK1zQ4olK3f4VX1C/MpRRce3FDpYE3bbUMyAJE9vavUqYwi4w5PH3IIb2sRe/XA5gIcPLg
	UHVH0vjOIPk8GIKpFrArgrRZn4k/K+yPgR629RnhMcOjacvfnWPWSivETPj+xtvYyF9XHTzz7ALLO
	Zqgnd7OZo4eZfZCRga5u2tDwB/59ne5j107RAfEomXkXH4c8CBHWPtzqh4JG9isCE67G14x4/pd2W
	sL7T/GtEJI+n7mvR7zQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2uLz-00000007n3l-1IZl;
	Mon, 21 Oct 2024 15:29:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2u5l-00000007k2q-2LC9
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 15:13:22 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729523588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGvx53aEC/g+kE5bhkxfRgADXQtsPpYeRVLsbQC037o=;
	b=Qo4c5rWqFncDfIbbuRC+Rp8DCxZPp4zNxCLSeKpYH5oM7Ypt0+6Htig1f5MI5lZgbFRJ69
	jmx9PJGF5aVLUBLPeO6nSlhGH/N8eq9JOiIOZiJAAKYbp5TPY7EBj7Chm9lhWNtVPLGqPp
	cEFb4HwUFwNP5nvTJG9ev3iENNOXv6Pi3VbL9snAz7BkRWY8Uhzc9f8MbsiRm+iD7Txeqx
	hGaejPBD5Mhz9UXovZLdy/EefnHYxc9gS9CvP5dUrpp7ktrFHS2LKhJ9xY/++TnyPXWTY7
	B0TYwV9MIcdjbRW1vzG9+Lx/QMd21JM/eiUEmJyI5UkiGBOKULLgSzA3Nxf6/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729523588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGvx53aEC/g+kE5bhkxfRgADXQtsPpYeRVLsbQC037o=;
	b=m7Fec6ZkmVQBTktBv5fQBVY1iDAxg54fWHlXfckdwPEpA24GJPlUy//0eBSeJDfODgj6uV
	uKtWzlapiB9DIICQ==
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
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 3/3] riscv: add PREEMPT_LAZY support
Date: Mon, 21 Oct 2024 17:08:42 +0200
Message-ID: <20241021151257.102296-4-bigeasy@linutronix.de>
In-Reply-To: <20241021151257.102296-1-bigeasy@linutronix.de>
References: <20241021151257.102296-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_081309_820589_5294EAC2 
X-CRM114-Status: UNSURE (   8.21  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/riscv/Kconfig                   |    1 +
 arch/riscv/include/asm/thread_info.h |   10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

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
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -107,9 +107,10 @@ int arch_dup_task_struct(struct task_str
  * - pending work-to-be-done flags are in lowest half-word
  * - other flags in upper half-word(s)
  */
-#define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
-#define TIF_SIGPENDING		2	/* signal pending */
-#define TIF_NEED_RESCHED	3	/* rescheduling necessary */
+#define TIF_NEED_RESCHED	0	/* rescheduling necessary */
+#define TIF_NEED_RESCHED_LAZY	1       /* Lazy rescheduling needed */
+#define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
+#define TIF_SIGPENDING		3	/* signal pending */
 #define TIF_RESTORE_SIGMASK	4	/* restore signal mask in do_signal() */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
@@ -117,9 +118,10 @@ int arch_dup_task_struct(struct task_str
 #define TIF_32BIT		11	/* compat-mode 32bit process */
 #define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing to user */
 
+#define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
-#define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F0FC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3CWahyTgUAR3NDUDQsM7ErI3ScmGw86YVgclPV/mD0=; b=lf1+AxBlitrosE
	RmiqbRx21QCplapIzxyEmF8v1neeeb+Ng3yc2zfJU0fT0BZEJD9ORGgm2AT7mLopFAuWyecNlJmY5
	OoE3XXpLCNh4FJfDOAULYj8EiCT6OFJjGI1oI9M+oZ3lHgFOIdUb1dMQSMs9pNW2cCOjRdzYHccVC
	3cVsgN6r3G9l3z5HVapYE7tpswL76u567FZ/FwJ8MzrJobYNuhk2yblkwP8JMxdhZhbTOeCuxKeBt
	9Lb1CurRiZA6p60Mv1MaBTTTGmkQFtt3/nodsieaAXwM/Curso2cjXimaFXppCUrcf4iSPEwOHaLn
	pZjYlmUT6DTdLee+Kfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1y-005SwM-0m;
	Tue, 31 Oct 2023 14:47:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1t-005Sui-0g
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D2E36B810E0;
	Tue, 31 Oct 2023 14:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67948C433C9;
	Tue, 31 Oct 2023 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698763659;
	bh=LF1DBN/Xu6TRTkGYwgIFXIqczkpJAKJAJKYWezoJUkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L2SGQMD9Pr6M0HtfW2uNeT4Wpfsqdtv0WJuBsL4YLu5arCjywAp28XtDFp/EZv/wh
	 EtGGq4rzL+sHgu1GsSoUZvtB5dDhmd2f1r9sjPNjUYq3Shx5NR7UCwcZQLJbPrAL+h
	 V/kR3HY3xMzWH/FvMRzV3Rsf/vVmwDAZ4GrkrPYLvGpXP4UmzJmisV9v+YzDUcBD+H
	 Iu6kTOMkHXFPMx4GXLjTsuyVWhS5Sb4eSrNByKJgw7l8jIcltb6VzaTDcPN0DOLytp
	 ROmzUg3amCuH9TeVanJE8UoBzYFEpF7or55IM0fuCF8d+mXkziKG2Jdf/UMYwh4gQw
	 diQAzxR8WwuFQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RT v2 1/2] riscv: add PREEMPT_AUTO support
Date: Tue, 31 Oct 2023 22:35:20 +0800
Message-Id: <20231031143521.441-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231031143521.441-1-jszhang@kernel.org>
References: <20231031143521.441-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_074741_396439_2CF78061 
X-CRM114-Status: UNSURE (   8.63  )
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

riscv has switched to GENERIC_ENTRY, so adding PREEMPT_AUTO is as simple
as adding TIF_ARCH_RESCHED_LAZY related definitions and enabling
HAVE_PREEMPT_AUTO.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig                   | 1 +
 arch/riscv/include/asm/thread_info.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..5f43b82691fc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -135,6 +135,7 @@ config RISCV
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_PREEMPT_DYNAMIC_KEY if !XIP_KERNEL
+	select HAVE_PREEMPT_AUTO
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1833beb00489..c5aebcdafd7b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -85,6 +85,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
  * - pending work-to-be-done flags are in lowest half-word
  * - other flags in upper half-word(s)
  */
+#define TIF_ARCH_RESCHED_LAZY	0	/* Lazy rescheduling */
 #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
@@ -99,6 +100,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
+#define _TIF_ARCH_RESCHED_LAZY	(1 << TIF_ARCH_RESCHED_LAZY)
 
 #define _TIF_WORK_MASK \
 	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

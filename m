Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F90CC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA0C21872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKs1Wc4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA0C21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfU+oWEOi9+ZbgjVSIoZHa61k03yAunpgm/f+NY+YQo=; b=lKs1Wc4NBfeveP
	kiasav1NoX31dSJXyliRNjeF3S1kEM05z96UMl4zyPlDD5JbKa3r6GcRvge5kGKv4aOIJZQa6a35c
	ctMmEYcmHatDSg98QzwNO/xLyBLy+qLfRKn18XGD8cbxEHXGVgtQo9VVVYskbxEB8XFQbGt79kl7C
	Mg+Lh1Eokn3f4GD9ttLaMYoRGMgeExAWHqeMhBuTuf4pImZjGrtukZs8kwOKFMmmC7vMFMUYeeUBQ
	opCQ7HBthL3Nr3zu7X3W5AxPCjlWF5vFp78wyLPu7EytTmKTtJOSGMjQud+JFcRIvB1G2wTe5hlcA
	66LZ9qDuEidKoiyI0nJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExM5-0001NL-24; Fri, 12 Apr 2019 14:40:37 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExM2-0001JP-OM; Fri, 12 Apr 2019 14:40:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 08/12] riscv: remove unreachable !CONFIG_FRAME_POINTER code
Date: Fri, 12 Apr 2019 16:39:44 +0200
Message-Id: <20190412143948.12478-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V port selects CONFIG_ARCH_WANT_FRAME_POINTERS, which causes
CONFIG_FRAME_POINTER to always be set.  Remove the unreachable code
for the !CONFIG_FRAME_POINTER case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/ftrace.h |  6 +-----
 arch/riscv/kernel/stacktrace.c  | 37 ---------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c6dcc5291f97..c52073a065e5 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -1,11 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2017 Andes Technology Corporation */
 
-/*
- * The graph frame test is not possible if CONFIG_FRAME_POINTER is not enabled.
- * Check arch/riscv/kernel/mcount.S for detail.
- */
-#if defined(CONFIG_FUNCTION_GRAPH_TRACER) && defined(CONFIG_FRAME_POINTER)
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 #define HAVE_FUNCTION_GRAPH_FP_TEST
 #endif
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index a4b1d94371a0..3cb439f8c7e6 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -20,8 +20,6 @@
 #include <linux/stacktrace.h>
 #include <linux/ftrace.h>
 
-#ifdef CONFIG_FRAME_POINTER
-
 struct stackframe {
 	unsigned long fp;
 	unsigned long ra;
@@ -73,41 +71,6 @@ static void notrace walk_stackframe(struct task_struct *task,
 	}
 }
 
-#else /* !CONFIG_FRAME_POINTER */
-
-static void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(unsigned long, void *), void *arg)
-{
-	unsigned long sp, pc;
-	unsigned long *ksp;
-
-	if (regs) {
-		sp = GET_USP(regs);
-		pc = GET_IP(regs);
-	} else if (task == NULL || task == current) {
-		const register unsigned long current_sp __asm__ ("sp");
-		sp = current_sp;
-		pc = (unsigned long)walk_stackframe;
-	} else {
-		/* task blocked in __switch_to */
-		sp = task->thread.sp;
-		pc = task->thread.ra;
-	}
-
-	if (unlikely(sp & 0x7))
-		return;
-
-	ksp = (unsigned long *)sp;
-	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(fn(pc, arg)))
-			break;
-		pc = (*ksp++) - 0x4;
-	}
-}
-
-#endif /* CONFIG_FRAME_POINTER */
-
-
 static bool print_trace_address(unsigned long pc, void *arg)
 {
 	print_ip_sym(pc);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

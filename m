Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4C9C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geW39jhzU2tAlbrRfMIQ1GHN9qTNkA7E/DDdWH8edQo=; b=d2n2i0AX3AUUHU
	B+BCqaKtRWshM1ff4p2UBUasnvjzIKgfcrVn5nxGxv9jla2HiPsTNRxvHmd919UEqm547V/7ugCcR
	2g1ZfgkUwDbVZXQIIp90epc+XhrPAxNC2nrCnOxFyGNHv/Nq1z0OkCJ261FcxBwK2rEaerLkuj/YF
	bVuH8AHYyDjqNQ0qOBOukMNQ1I/Zo5FYnxMCBIj74bWpP5Mpsd54TVi+3UzHox68/wX1SzSPLoIPM
	RnkMcY4h74FPw1mvlOjxX4Mae+Pld5q+bkBde/EmNFbyhqieSynoDKJa+CYdajFYDku9gSqnAO9Vi
	vz5QgIwhQw6i16lnfdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjBN-0000000AiNS-3Kqz;
	Tue, 16 Jul 2024 14:29:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjB2-0000000Ai9H-412E
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 14:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F371CE130A;
	Tue, 16 Jul 2024 14:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05554C4AF0E;
	Tue, 16 Jul 2024 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140150;
	bh=GvxcA8wr20XF4fdAl9dv1Gnq+YAu/czSgSdTv7mKfqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JjrWK31Tgf2ECx+RICyFeAsLcKxekalSZ60fIwoMf8XTjDe/YQzIdHbBumFxxnauk
	 FEyKg6cDEl9OLjy0mt9f3u48sufAGdjpeXynmYPiZLKirXS5obWZdWwP6KsMLJ1ldJ
	 uxXpnPBRxC1Ds/qtyzXs84IjdHKnFxFxzlTaOAZDYTxKN7oFv82339eAhySzoqZggb
	 lOPrj5xcXUjxXvJFNnEuctyZSWNftm2BsDeswUdoTxBykiSimVoKDqVnGaTeM1tKUW
	 iAkyMo2wVJgmJ58Y555wZ4dsZiwzFpCBfzHIgjFnzNrwaxsiqbpUx1Hfo0tDU3kljs
	 MvJeb4W9CsUXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	samuel.holland@sifive.com,
	dev.mbstr@gmail.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 15/15] riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
Date: Tue, 16 Jul 2024 10:28:12 -0400
Message-ID: <20240716142825.2713416-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142825.2713416-1-sashal@kernel.org>
References: <20240716142825.2713416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.99
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072913_187558_C95DB1B1 
X-CRM114-Status: GOOD (  11.37  )
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

From: Puranjay Mohan <puranjay@kernel.org>

[ Upstream commit 393da6cbb2ff89aadc47683a85269f913aa1c139 ]

ftrace_graph_ret_addr() takes an `idx` integer pointer that is used to
optimize the stack unwinding. Pass it a valid pointer to utilize the
optimizations that might be available in the future.

The commit is making riscv's usage of ftrace_graph_ret_addr() match
x86_64.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Link: https://lore.kernel.org/r/20240618145820.62112-1-puranjay@kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/stacktrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 0d3f00eb0baee..10e311b2759d3 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -32,6 +32,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long fp, sp, pc;
+	int graph_idx = 0;
 	int level = 0;
 
 	if (regs) {
@@ -68,7 +69,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			pc = regs->ra;
 		} else {
 			fp = frame->fp;
-			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
+			pc = ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
 						   &frame->ra);
 			if (pc == (unsigned long)ret_from_exception) {
 				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4328BC3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geW39jhzU2tAlbrRfMIQ1GHN9qTNkA7E/DDdWH8edQo=; b=D76E10icXzzsdP
	YygZoVfT/F62IfW1afQFdNPaCKdGZEkd6LzTWZHanU/f0HjLTmzCRwMrzXFy1SFEqM7WB7yn3V6ix
	BSSJEy95/J67DQrditaoaup4T6VHcPveNajSPxmm+mo5hY+1sJCwqSR1fKxTu1UyT5tu9eNWt7FDJ
	V3B+O2OrFm3pMv/+0O2Xo7X4ltwp0kAmFPj/179lr7qOQzIboB+pzxZUHNwdVy92NJ6cNkJqSXnbS
	b/dkSItp3M7ikFThtfh8LrDB89MzUEHBkGI7X8VAuOhXwr4mK4RqRJlKrZNa0HHZGix4w4KPeiRpm
	sOi0fe9B5QUobKmn2WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjAL-0000000Ahl5-3wKg;
	Tue, 16 Jul 2024 14:28:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjA3-0000000AhcR-0zN6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 14:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB38F60F80;
	Tue, 16 Jul 2024 14:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685D3C4AF0F;
	Tue, 16 Jul 2024 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140090;
	bh=GvxcA8wr20XF4fdAl9dv1Gnq+YAu/czSgSdTv7mKfqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rndp89b5g4wlnQBK6DclfrnvwlN+rVdhpWnk+N6rpSCyEDZjiNyTUmfjk0QxMdnqE
	 ad1zqnl1SWS/TPwDNR6uX4gGb0avt5/rY26DuBn5/Y4Gr3fvdjrrg157aLJUALWGC4
	 gVF/xqGvPdztxQbaX8EmJCs6ncQaHfsPbJ/ifT2aUh0I/B1AzwweJ7A0ixLZpiyCFR
	 WZxMPQMmXy8jVXNlLkxIBCS20UIKwISSl6GaXIUwMGSP4t4/dfuigivFkU0yOI+gLH
	 HkDntTcq533HofVlveRDR3y3vRDSMJB64JBonP653xYiVAt89680JDjMwfVkdEdCnI
	 SHlVwH9iS88Bw==
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
	dev.mbstr@gmail.com,
	alexghiti@rivosinc.com,
	andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 18/18] riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
Date: Tue, 16 Jul 2024 10:26:53 -0400
Message-ID: <20240716142713.2712998-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_072811_340490_F762961B 
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

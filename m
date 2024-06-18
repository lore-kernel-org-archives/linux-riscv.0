Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E87C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ppvVFJrpoaHcooKQy8Fg+JXaPjT3PksOhcNjTIkJeGw=; b=agd5rqVCGTq2A0
	uA9e92HZvyJYWryv10GH5xkWfea+8f/vP9j/OZCR5lK/ZbLLEGgKWglAcaAyMPANYmKHhcw/U4kw3
	lbHbBY4dVUAWgQFRFIIC8MXyb8YgDF4DD7wfISc1MrdjVJPGIkJhn4HR6xFS+JkupqYaD18k4LAYA
	sJR1bHPIX0bFOWZGPiYOL2yS7fgQ2AaWaSUgMP3YUpFMePIq7Ova90kPxZGT9Ow7gACbeAfLMud9z
	Je1Hxmuco0Rzq8wgKe1ONjlmfXhJzTA9HPeEjn9p5plR9hAKlCw13V6LWmIMC4sZB7dmzodkEKYSN
	uW1UIBT0iVCJ0/AHR46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaIK-0000000FVig-1hMQ;
	Tue, 18 Jun 2024 14:58:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaII-0000000FVhK-01fj
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 14:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BEF85CE1B98;
	Tue, 18 Jun 2024 14:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608BCC3277B;
	Tue, 18 Jun 2024 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718722722;
	bh=J2+M0QZB+3iNVpJ3pCU5SALGJs3I3cxIThL9w+gyU9M=;
	h=From:To:Cc:Subject:Date:From;
	b=NKVz41cthMe7Fer2+MAJuymZBSA+QFw1ETHg7RW4SdSyRUxvOfS8dsn5IE8flvlBg
	 CgPsR1kVe7bEmPhmA4yH75NC1KTRpaPnC22J3QDU64rL55XY/VAQXpTGQPK9JLpsX9
	 qKz0Oq0mDc8ydV1AhzvOPlfVu1B+fRaJRJsakERLssd28n5d0EDr3Wo3U1X6111Qri
	 Tm3EVeBtSaJjfuuaf+FzsiHooKBjMvBrZuemyKl1QJclf2RkydgtEC2p7fvW4LORsv
	 /hTqYaFdKH4km3+MaNhb3Ocd/NitUAWgSipgy+d1TAUOBm0v9HWp74R0VeCYBia/0n
	 jIAL1ADvrdo5g==
From: Puranjay Mohan <puranjay@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com,
	rostedt@goodmis.org
Subject: [PATCH] riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
Date: Tue, 18 Jun 2024 14:58:20 +0000
Message-Id: <20240618145820.62112-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_075846_369305_09DA0EA4 
X-CRM114-Status: GOOD (  10.88  )
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

ftrace_graph_ret_addr() takes an `idx` integer pointer that is used to
optimize the stack unwinding. Pass it a valid pointer to utilize the
optimizations that might be available in the future.

The commit is making riscv's usage of ftrace_graph_ret_addr() match
x86_64.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/riscv/kernel/stacktrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 528ec7cc9a62..6cb7f9ca9d82 100644
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

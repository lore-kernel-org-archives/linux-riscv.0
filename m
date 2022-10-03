Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0445C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TLMpf+AzY7LdECvSUV+zVnhWJ7RlkJehXsIbNXIDek=; b=wzugBZgRn0ZXPG
	lWh7xTWuTd3OuSxgj6ENEUGRIfD4lKfPdHfG/+yLjqhQt8HE79hcXaHY2PbHmN6vFIyLF67dEZghN
	1L8qnR2Ow5U5CtqivLMxG0RxvP2myh+4i5UhUbhQyh94JBIdT2ruCSQqzEZPepNkWUzriaXj89EaJ
	fl1PEdrWzcLwxoSTJCcvnUswJujAR+MssyUH/2ua+Ku6p/21R3Ca/MBfoLFBwZdRURFvTADevJjwf
	v4Uh8NMC3o3vwRlPvFbN/VO9zrqArIbDsd8hupBpv965K5QF1V3SDMmwQzw05Cpcx5si6zn9+B+Sm
	ceXFdEG5wCEDjDpPyNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqi-005KpM-PT; Mon, 03 Oct 2022 10:39:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqf-005KnF-Jy
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 10:38:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F15DB80F1A;
	Mon,  3 Oct 2022 10:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D63C43141;
	Mon,  3 Oct 2022 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664793534;
	bh=C4Vx5tvsjc4GTe+ODm+teOUMFaKT91CBKzQiLXfj2dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMuZyrKBqrNiFoQFi+CtalwIR9BMcH8RYBA2q9Ikh+r1G+fCMFL0fy59iTweNgB+O
	 40MadJensyCmFJYgg2V7DGmIi0R1OdmX4SvpR2YrnHigZ5p/x1TVhl0pn+CELNambv
	 RboGUr52C7Xp71TWbVhtIbce7ooMVP31jx57oF1CZ3wVbLPn/8c31Lr3B/r+ohOjcm
	 e8PqHQdiRpXAoxF3W0j5fEzPto1ef7AYwcIPJ2FwXDFAdQR47430QWmq+cGEGMCS4L
	 IGuA0A7K7BDRW6KpxrfV3WQQPVwyDNFfPOpmYbIPMS6wUuySlmfn8QRzR05K83j8WV
	 5M0QYkDgfjb0Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] riscv: process: fix kernel info leakage
Date: Mon,  3 Oct 2022 18:29:18 +0800
Message-Id: <20221003102921.3973-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221003102921.3973-1-jszhang@kernel.org>
References: <20221003102921.3973-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_033857_820394_9855CA7F 
X-CRM114-Status: GOOD (  10.69  )
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

thread_struct's s[12] may contain random kernel memory content, which
may be finally leaked to userspace. This is a security hole. Fix it
by clearing the s[12] array in thread_struct when fork.

As for kthread case, it's better to clear the s[12] array as well.

Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..52002d54b163 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -164,6 +164,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
 
+	memset(&p->thread.s, 0, sizeof(p->thread.s));
+
 	/* p->thread holds context to be restored by __switch_to() */
 	if (unlikely(args->fn)) {
 		/* Kernel thread */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

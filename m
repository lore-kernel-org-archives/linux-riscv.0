Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC50BC2D0E4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:41:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E0E2080A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 15:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbWVWaLw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awgx4kyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E0E2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vzzd9CFtkI/Kq+XJoFAz58UJJWhVL9opoVY/Zdrfiu0=; b=mbWVWaLwiqcsvx94nscdkbvh4v
	GEZU4Vjl8+iTCQwE7ISMjVVzYEA4JIId5r2J+K/iZ1M3VLDGa9JHy01bjob28EuwNYAZuzmRD/eG9
	18tnGTtLN7NCkdKe3onJ/rCgLp9Ctp/xe/EV3WQCWc/Ww2jxcVL85woNqiS5ulh1LJUrNkczxx4Sl
	piIemaIX2oOFe+AQgu9e56nswLO3Mlh63SDHjcRCYGOTaG52OdJO72mrf8xCvChm666rOGYMc1M4N
	398EQ/1X7+Ipztb6BV8/CtQSGEFMfv7d+WI6iws6Q/qP4pWUeg9dxT5OzjFGEL96mp0ghBwAGwKfv
	ep0qOI9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDxa-0008DM-M2; Mon, 23 Nov 2020 15:40:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDxY-0008Cq-9a
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 15:40:57 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14C8220719;
 Mon, 23 Nov 2020 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606146054;
 bh=Hcdyfk0kYZsv3hI9btjRLhXcU3rfrTM3E8RHn/I8BW8=;
 h=From:To:Cc:Subject:Date:From;
 b=Awgx4kyYENeoi1NYuacQXc+hhbiVF1VZs+iiqWoPyJ94EHr3CJZtVF0eMkqpW0Sq6
 MZ1Gu2tIiz9bm2IVkekd7Wsu8KjPDhNNU3fJYw9oxWoTLGGHfGrVuceTclBYibHXM/
 +UdB5YgHG6XdaM0NRPF8FiLWZFK61SxgIl4kJCIA=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, atish.patra@wdc.com
Subject: [PATCH 1/2] riscv: Fixup do_page_fault warning in uprobe_xol
Date: Mon, 23 Nov 2020 15:39:39 +0000
Message-Id: <1606145980-5153-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_104056_434307_5AD695FA 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>,
 guoren@kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

[  670.922295] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1491
[  670.930853] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 96, name: hello
[  670.938446] CPU: 0 PID: 96 Comm: hello Tainted: G        W         5.9.3-00875-gaf1498803464-dirty #31
[  670.947775] Call Trace:
[  670.950236] [<ffffffe000203dc8>] walk_stackframe+0x0/0xc2
[  670.955650] [<ffffffe000204078>] show_stack+0x46/0x52
[  670.960716] [<ffffffe0005a3fce>] dump_stack+0x90/0xb6
[  670.965783] [<ffffffe0002336b2>] ___might_sleep+0xf8/0x10c
[  670.971284] [<ffffffe000233716>] __might_sleep+0x50/0x7e
[  670.976613] [<ffffffe000a71498>] down_read+0x32/0xe0
[  670.981592] [<ffffffe000207798>] do_page_fault+0xf0/0x3d8
[  670.987006] [<ffffffe000201de8>] ret_from_exception+0x0/0x14

When CONFIG_DEBUG_ATOMIC_SLEEP is enabled:
mmap_read_lock()->down_read()->might_sleep->___might_sleep() will
check irqs_disabled() is 0 or Not. If irqs disabled, kernel prints
the BUG warning.

Uprobe need prepare a xol_slot to emulate single-step the instruction
for uprobe with irqs-off in user context. So it's the only case for
us to meet a irqs-off user context situation.

Second:

/* Enable interrupts if they were enabled in the parent context. */
if (likely(regs->status & SR_PIE))
	local_irq_enable();

It's duplicate with the patch by Vincent commit: c82dd6d078a2 ("
riscv: Avoid interrupts being erroneously enabled in
handle_exception()")

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/mm/fault.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index e889e65..a9d1f12 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -55,10 +55,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END)))
 		goto vmalloc_fault;
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (likely(regs->status & SR_PIE))
-		local_irq_enable();
-
 	/*
 	 * If we're in an interrupt, have no user context, or are running
 	 * in an atomic region, then we must not take the fault.
@@ -71,6 +67,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+	/* Enable interrupts for user context. */
+	local_irq_enable();
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, addr);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

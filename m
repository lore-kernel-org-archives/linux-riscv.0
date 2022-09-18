Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835E5ECAAD8
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S62/ubM86Q3s3g1FpDTQh99Z+Cc+xIzxx6LDs8q95jg=; b=QkiU5SqOCqUbAE
	LY49JSnIsUPCYc+2l8qxXiKPv9ac2nEAfgfyO6ea3sp27QkNUO3kheiz4KlGs4zqKXNyLbGpZ5YNy
	XJLc6LkQ4NwZf3+ZKvKVvWDvH+4Y6F5i9mLEoENfJhisK+fBhqhJTcNqOj3k/MMj65rJRLyFALtCN
	f1L0WuNHC+7HuC0OF2b97PXoo/J6nt/LTa7bJ7dnBJwD4MytR+WwH3kGxLk3QaDRG7lHtJoaWI8yH
	qZ9o1xFleK1wu1YmwqEPFiVRTIQJbJtOEL3Erza5OOAXH53Sr7ZB1VAaUjgr3SWPyMaIriwWq+s79
	Ax5IOWeHloMiVkfTDEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbt-000GDa-8T; Sun, 18 Sep 2022 15:53:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbp-000G8J-P2
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C0F961587;
	Sun, 18 Sep 2022 15:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF75C4347C;
	Sun, 18 Sep 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516408;
	bh=djdpWanOi4zWPI5MvBREvmwhOSv3FwS45ovTz/HZSl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KfCosz0tEYKD25aaVLOYyBJvJG3AIHXJ0umANml2aOl8rUbGHeMhSPdLG2pki7eDq
	 dNlGJo3NOYRF+IxXbm9AXmIgyyq+Rbnq+o714vDzCAbPen8yyfTaGt+Hudwd6iEF3a
	 AAfGXlBsDCGFDuxDSNcH1rbTR5/+srnfZWS0c991EHQo80nPXq0gZTo/3ULUhlu0LU
	 JixujdzO1sN3PXWnM3WPpDluQ/FVDasCswD3BL5meCMxvhZOwaqGDhj4Y5pRvBCbhg
	 pGEBfF57UmqPi/TKV0drZF2L/nO7U8yjwAN8qDJ36yDR+fmAyHGKPEVeTq5h8wEIJ5
	 B4gtT8vYRk/vw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 06/11] entry: Prevent DEBUG_PREEMPT warning
Date: Sun, 18 Sep 2022 11:52:41 -0400
Message-Id: <20220918155246.1203293-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085329_928062_1E0FC8E7 
X-CRM114-Status: GOOD (  10.16  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When DEBUG_PREEMPT=y,
	exit_to_user_mode_prepare
	->tick_nohz_user_enter_prepare
	  ->tick_nohz_full_cpu(smp_processor_id())
	    ->smp_processor_id()
	      ->debug_smp_processor_id()
		->check preempt_count() then:

[    5.717610] BUG: using smp_processor_id() in preemptible [00000000]
code: S20urandom/94
[    5.718111] caller is debug_smp_processor_id+0x24/0x38
[    5.718417] CPU: 1 PID: 94 Comm: S20urandom Not tainted
6.0.0-rc3-00010-gfd0a0d619c63-dirty #238
[    5.718886] Hardware name: riscv-virtio,qemu (DT)
[    5.719136] Call Trace:
[    5.719281] [<ffffffff800055fc>] dump_backtrace+0x2c/0x3c
[    5.719566] [<ffffffff80ae6cb0>] show_stack+0x44/0x5c
[    5.720023] [<ffffffff80aee870>] dump_stack_lvl+0x74/0xa4
[    5.720557] [<ffffffff80aee8bc>] dump_stack+0x1c/0x2c
[    5.721033] [<ffffffff80af65c0>]
check_preemption_disabled+0x104/0x108
[    5.721538] [<ffffffff80af65e8>] debug_smp_processor_id+0x24/0x38
[    5.722001] [<ffffffff800aee30>] exit_to_user_mode_prepare+0x48/0x178
[    5.722355] [<ffffffff80af5bf4>] irqentry_exit_to_user_mode+0x18/0x30
[    5.722685] [<ffffffff80af5c70>] irqentry_exit+0x64/0xa4
[    5.722953] [<ffffffff80af52f4>] do_page_fault+0x1d8/0x544
[    5.723291] [<ffffffff80003310>] ret_from_exception+0x0/0xb8

(Above is found in riscv platform with generic_entry)

The smp_processor_id() needs irqs disable or preempt_disable, so use
preempt dis/in protecting the tick_nohz_user_enter_prepare().

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 kernel/entry/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 063068a9ea9b..36e4cd50531c 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -194,8 +194,10 @@ static void exit_to_user_mode_prepare(struct pt_regs *regs)
 
 	lockdep_assert_irqs_disabled();
 
+	preempt_disable();
 	/* Flush pending rcuog wakeup before the last need_resched() check */
 	tick_nohz_user_enter_prepare();
+	preempt_enable();
 
 	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
 		ti_work = exit_to_user_mode_loop(regs, ti_work);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

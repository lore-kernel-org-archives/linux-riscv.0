Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxHHHk92SXQIWUsmaaCo9diPofCZ8g2/Na6h5+MU1DI=; b=H13dgQDBt6Tbgf
	iPcA6OkNR+X+vVLEBzfPbiCtdEVNIOT+T2iPlmIFNjkooMH1I06f5OT7zhf6MKzWJfjIpTxvjVpej
	PI9ne+H08GSRcYCA4jK9B7xRUYISaCDv0TyPbxIj36iTNC+2JSxkKJhjRhZbcINt77UHeSry0owYR
	ilPgiav7TimnyqzWV0HRFPt5UdeLFxaw2XPYz0KbOHL6NOhLoJAGJ/AY/ZX4rOLc9J2ECrTzzUbMy
	4UINTa90vYktNT1twfD11DtRUosioA1EmFcGgjfhWqpcrymIzCLN7hWEmCO9LzDIhBop2EcRCGKOZ
	hFKlVqol79u2as72OfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nydRo-008k2C-Bh; Tue, 07 Jun 2022 17:56:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nydRl-008jzr-FA
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 17:56:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 081CF617A6;
	Tue,  7 Jun 2022 17:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35046C3411F;
	Tue,  7 Jun 2022 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624612;
	bh=FgqMBOq8e9O8lSu4ZhdMaLrDjbWyv3KnilifVjuSL5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7pmM+X0RP5nmr6Y0zeCsiv6F4tTlWchfyO7cSV8rgb5VYvOqfIMH5gozwoAGnhha
	 k6giUzCqpIaiCBYzY1fK4+Apffu/upHIlpu5mh6yCJ33EQBdEF8obkP1veqPfRgLQO
	 clye/Tus5tu2wItBM/PjYeOC6YMydam3dfqzCUzz1J56eJlpy48o3dxqincnifCDB5
	 T1VAsgZKEIQw5h+1513QPQdNl4e9gtsNJMMOvx3onNUsNskKhLE8kxEQI3b5iySR+a
	 EP7bKzX0EsPDd93d2C0Xht4/Uf8pb2c9KR5Q6XpcSyKyBugdv+IrAe++tmPen3VT3q
	 bXqGtzdFBdrdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Changbin Du <changbin.du@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	jirislaby@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 17/51] sysrq: do not omit current cpu when showing backtrace of all active CPUs
Date: Tue,  7 Jun 2022 13:55:16 -0400
Message-Id: <20220607175552.479948-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_105653_624680_B8C89588 
X-CRM114-Status: GOOD (  13.37  )
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

From: Changbin Du <changbin.du@gmail.com>

[ Upstream commit 5390e7f46b9d5546d45a83e6463bc656678b1d0e ]

The backtrace of current CPU also should be printed as it is active. This
change add stack trace for current CPU and print a hint for idle CPU for
the generic workqueue based printing. (x86 already does this)

Now it looks like below:
[  279.401567] sysrq: Show backtrace of all active CPUs
[  279.407234] sysrq: CPU5:
[  279.407505] Call Trace:
[  279.408789] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
[  279.411698] [<ffffffff800060ac>] show_stack+0x32/0x3e
[  279.411809] [<ffffffff80542258>] sysrq_handle_showallcpus+0x4c/0xc6
[  279.411929] [<ffffffff80542f16>] __handle_sysrq+0x106/0x26c
[  279.412034] [<ffffffff805436a8>] write_sysrq_trigger+0x64/0x74
[  279.412139] [<ffffffff8029cd48>] proc_reg_write+0x8e/0xe2
[  279.412252] [<ffffffff8021a8f8>] vfs_write+0x90/0x2be
[  279.412362] [<ffffffff8021acd2>] ksys_write+0xa6/0xce
[  279.412467] [<ffffffff8021ad24>] sys_write+0x2a/0x38
[  279.412689] [<ffffffff80003ff8>] ret_from_syscall+0x0/0x2
[  279.417173] sysrq: CPU6: backtrace skipped as idling
[  279.417185] sysrq: CPU4: backtrace skipped as idling
[  279.417187] sysrq: CPU0: backtrace skipped as idling
[  279.417181] sysrq: CPU7: backtrace skipped as idling
[  279.417190] sysrq: CPU1: backtrace skipped as idling
[  279.417193] sysrq: CPU3: backtrace skipped as idling
[  279.417219] sysrq: CPU2:
[  279.419179] Call Trace:
[  279.419440] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
[  279.419782] [<ffffffff800060ac>] show_stack+0x32/0x3e
[  279.420015] [<ffffffff80542b30>] showacpu+0x5c/0x96
[  279.420317] [<ffffffff800ba71c>] flush_smp_call_function_queue+0xd6/0x218
[  279.420569] [<ffffffff800bb438>] generic_smp_call_function_single_interrupt+0x14/0x1c
[  279.420798] [<ffffffff800079ae>] handle_IPI+0xaa/0x13a
[  279.421024] [<ffffffff804dcb92>] riscv_intc_irq+0x56/0x70
[  279.421274] [<ffffffff80a05b70>] generic_handle_arch_irq+0x6a/0xfa
[  279.421518] [<ffffffff80004006>] ret_from_exception+0x0/0x10
[  279.421750] [<ffffffff80096492>] rcu_idle_enter+0x16/0x1e

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Link: https://lore.kernel.org/r/20220117154300.2808-1-changbin.du@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/sysrq.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index c911196ac893..6b445ece8339 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -232,8 +232,10 @@ static void showacpu(void *dummy)
 	unsigned long flags;
 
 	/* Idle CPUs have no interesting backtrace. */
-	if (idle_cpu(smp_processor_id()))
+	if (idle_cpu(smp_processor_id())) {
+		pr_info("CPU%d: backtrace skipped as idling\n", smp_processor_id());
 		return;
+	}
 
 	raw_spin_lock_irqsave(&show_lock, flags);
 	pr_info("CPU%d:\n", smp_processor_id());
@@ -260,10 +262,13 @@ static void sysrq_handle_showallcpus(int key)
 
 		if (in_hardirq())
 			regs = get_irq_regs();
-		if (regs) {
-			pr_info("CPU%d:\n", smp_processor_id());
+
+		pr_info("CPU%d:\n", smp_processor_id());
+		if (regs)
 			show_regs(regs);
-		}
+		else
+			show_stack(NULL, NULL, KERN_INFO);
+
 		schedule_work(&sysrq_showallcpus);
 	}
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

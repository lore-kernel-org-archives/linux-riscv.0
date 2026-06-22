Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ACECDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cMggM0KwsYFwlUz3FWpNm3OoT4Cc277K1pf2DAitmAM=; b=P0pcCUC0RQBNfr
	7ik0BwPa2rBkNgf0eLwMW+/vA12pSPq3M/m/HSU9X7St8s5lB36qpbDx6IGGhsafBia/T3/gE46Q7
	+AVho+bBs2g97gS9rHNWLhK5SPY74Y7Re9KKQPWb+bw35eL6iNWvN0OUjf3eYpt1Iy7JF2tBJRzVj
	LX3qMHlsThHb1OpOjF2phDBLPn3A+9IVYHT0oGRcwWVM+C2hcWj0BxlE5kuuS88O6yXZODcRwS5rZ
	TryRe4ckktpuWExUdPjXlBKXwoHZCDga38zHKLBpgKLC7aaNQgrwkCWXLM/Cpgh7kIDa5CMpp2wUE
	BmOrEOaE4Ay6MVGjCcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbetw-000000051lG-0BJT;
	Mon, 22 Jun 2026 13:41:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbetv-000000051l8-1qDf
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 13:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A68C444212;
	Mon, 22 Jun 2026 13:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D18A1F000E9;
	Mon, 22 Jun 2026 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782135682;
	bh=T7IOqd5vkEyp4/rz10IqEF6M2s/kC/BRz6fwpkX+S3I=;
	h=From:To:Cc:Subject:Date;
	b=PbM9xf6UqoPjgC87DNGdi3C2LHB9ff3CYceewfd/HMbPKjO8ytXjPxQXeaxZk1xhq
	 POaCH2DFAtHbRrmu9rXLft6vxOvYt5ldyL4iD/VEMHLPtYTpx69c4iqj4dtaTuj0Z5
	 4UJRsqEFpPSBrBLjr5mEq9WwWp1X7am6BcX0FurrFnNNrdOJM4GrrhFoZ4WeIgI5AH
	 vwACI4uv4QgH4hOBnSBaNZpHKzZ+rFN7nICj4ai3pmypdrK/iRQg3bz2uEIzPNUVin
	 KrwG2AZP4Ev1M9IqfJAEYArY1Cql0/KbY5tG5AzgUsFkGwt3/8xiBHje92E58TsbJ0
	 UF7+4yHiKhHTg==
From: Guo Ren <guoren@kernel.org>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	tglx@kernel.org,
	bigeasy@linutronix.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	stable@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: [PATCH] riscv: Report dying CPU to RCU in IPI_CPU_STOP
Date: Mon, 22 Jun 2026 13:40:18 +0000
Message-ID: <20260622134018.817508-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

This is a port of MIPS commit 9f3f3bdc6d9dac1 ("MIPS: smp: report
dying CPU to RCU in stop_this_cpu()") inspired by the Loongarch
mailing thread.

The smp_send_stop() parks all secondary CPUs in IPI_CPU_STOP, which
marks the CPU offline for the scheduler via set_cpu_online(false),
but never informs RCU, so RCU keeps expecting a quiescent state
from CPUs that are now spinning forever with interrupts disabled.

Please read the MIPS commit mentioned before for details.

Cc: stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>
Cc: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>
Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..0a73b36be825 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -82,6 +82,7 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 static void ipi_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
+	rcutree_report_cpu_dead();
 	while (1)
 		wait_for_interrupt();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

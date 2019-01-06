Return-Path: <SRS0=/Lqp=PO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBADC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Jan 2019 13:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFB02070B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Jan 2019 13:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQxQ5O1o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jr1Bdd18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFB02070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rWrq/s91OSyI7fvMMIw8/0hY3gCmHWBTRJW7Vk2qfoM=; b=sQx
	Q5O1ovZ7nRxIg/aMIIMZJkdmRRhF+9Z3dVUrWbiSrw6c3EKqE95BkhLWh2P0vMwB7IblHVsDfgKF+
	LtoL+EtuSYgN9giLvxxQChuRHivcEm9Fjc7sN9Ecsi/9OK743oqrDFO65JfZxHOaInh4zAc+2wu5Y
	PuCogPbC6egbZPZ7HkZrZ4dSvdasGheRN8ZlC/nIEwEzPj3kGqrhhNcy+an3u8wMo/AaAviTa5BlD
	i/imKRkwDkacJzWTdHrdfUgs8K3LhvMGeU0S0XJLNPsmeov2XZkCQBgPn9noZyaMcEJo364oIAjgd
	PPtcHYxyNu4QJz97qnPaCGL8ZC7LyZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gg8YD-00013D-JH; Sun, 06 Jan 2019 13:33:13 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gg8YA-00012G-H4
 for linux-riscv@lists.infradead.org; Sun, 06 Jan 2019 13:33:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id s198so19529489pgs.2
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jan 2019 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vfmcRA7rT28gwHLfFKyRxilDywRI1mQZldc5K70wYIo=;
 b=Jr1Bdd18ae2pQeAlv+/eQfwtdHoqjk1Uq3yzu4EOHfZIKO/6DCPElHbuyEIEikGKIv
 K7n0LACDFZ5Dtd3XcDAiK20vT85yHt5CMM2kIymU9rb43X77OHg+WbhwTDat3ZiIePC0
 BbZWU99fBtSS5WmQfyC8bIejsjFr4Rv6QrP1k2p+7zgwr/UxpTGQjlrrBuBJdHiuX2XJ
 oUkVSUZEEsFvQX8Z/veWfcVBKmxQ2/tzHaev8i3FTVDvGh1vbesW7wCeDSleuBCTFeu4
 bxflowWkZRa9ETEVAih3WJsniAWT74yyEqEk7oYHAYvIM6gVBWt8mZvX9UOdPHbMg0hF
 m1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vfmcRA7rT28gwHLfFKyRxilDywRI1mQZldc5K70wYIo=;
 b=CFZ+rW48U79lZBM/nDYI4vrmBat+VecutdUQtXq3+TgD4FSOdOrc2PK4/Ygziq5uTM
 yJXuwqvjz4IlMCH6RFTNkO4NpPXwgmc2E65Brgvdfa5CP6GpmsodV3X1sbtdcY1iUTpW
 82Jgr+n0PTjcQBg1UrYRp/89qBi7+ruES5zpEQ9zgfz44ouDXiHPdUmd1krr2ZQPNZNU
 PFUlrwX3V+23f2VR5knit7WSG0TbMeW6c5zN5ZEs6E3u/X6BlUftau1uCBVF6BX/EsLe
 yIgBseDAfV/QtiiAPXcxlu8TyrEd/gKQa8CLZ9BVdsgMs5CD9+ivx8shOzF35K9o7O2K
 nbJQ==
X-Gm-Message-State: AJcUukeLA2szZnXDiQiHrDN0ylXpPDj63vr5RYMrIP5/3n5Ew/ZgkwZc
 wZB6NUok2VcB0GB6Xe5iqozjVKfm
X-Google-Smtp-Source: ALg8bN6plNRHWDYfm7jBCCj7GRVxlL99jd7K2XH9lv+ti416/VDZpTrje4bQXP3hZYhZdqkfVGsQog==
X-Received: by 2002:a63:e80e:: with SMTP id s14mr7698280pgh.30.1546781587507; 
 Sun, 06 Jan 2019 05:33:07 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.61])
 by smtp.gmail.com with ESMTPSA id q199sm126957822pfc.97.2019.01.06.05.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 06 Jan 2019 05:33:06 -0800 (PST)
From: G SatishKumar <gsatish.ldd@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISCV:IRQ: Support IRQ_WORK interrupts with self IPI
Date: Sun,  6 Jan 2019 19:02:58 +0530
Message-Id: <1546781578-8126-1-git-send-email-gsatish.ldd@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190106_053310_597029_A6A68691 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: linux-arch@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 G SatishKumar <gsatish.ldd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

	This patch adds, IRQ Work interrupts support to RISCV arch.

	This patch is based on the arm32 patch ARM 7872/1
	which ports cleanly.

	Done set of changes based on RISCV SMP process.

	commit bf18525fd793 ("ARM: 7872/1: Support arch_irq_work_raise()
		via self IPIs")
	Author: Stephen Boyd <sboyd at codeaurora.org>
	Date:   Tue Oct 29 20:32:56 2013 +0100

	By default, IRQ work is run from the tick interrupt (see
	irq_work_run() in update_process_times()). When we're in full
	NOHZ mode, restarting the tick requires the use of IRQ work and
	if the only place we run IRQ work is in the tick interrupt we
	have an unbreakable cycle. Implement arch_irq_work_raise() via
	self IPIs to break this cycle and get the tick started again.
	Note that we implement this via IPIs which are only available on
	SMP builds. This shouldn't be a problem because full NOHZ is only
	supported on SMP builds anyway.

root@(none):~# cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  8:        134        112         73         75  SiFive PLIC   8  virtio0
 10:        123        131        142        126  SiFive PLIC  10  ttyS0
IPI0:       798        549        285        373  Rescheduling interrupts
IPI1:        53          8        101        181  Function call interrupts
IPI2:         0          0          0          0  IRQ work interrupts
Err:          0

Signed-off-by: G SatishKumar <gsatish.ldd@gmail.com>
---
 arch/riscv/kernel/smp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383..8953e73 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,6 +23,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/irq_work.h>
 
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -31,6 +32,7 @@
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
+	IPI_IRQ_WORK,
 	IPI_MAX
 };
 
@@ -94,6 +96,11 @@ void riscv_software_interrupt(void)
 			generic_smp_call_function_interrupt();
 		}
 
+		if (ops & (1 << IPI_IRQ_WORK)) {
+			stats[IPI_IRQ_WORK]++;
+			irq_work_run();
+		}
+
 		BUG_ON((ops >> IPI_MAX) != 0);
 
 		/* Order data access and bit testing. */
@@ -121,6 +128,7 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
+	[IPI_IRQ_WORK]		= "IRQ work interrupts"
 };
 
 void show_ipi_stats(struct seq_file *p, int prec)
@@ -162,6 +170,14 @@ void smp_send_reschedule(int cpu)
 	send_ipi_message(cpumask_of(cpu), IPI_RESCHEDULE);
 }
 
+#ifdef CONFIG_IRQ_WORK
+void arch_irq_work_raise(void)
+{
+	send_ipi_message(cpumask_of(smp_processor_id()), IPI_IRQ_WORK);
+}
+#endif
+
+
 /*
  * Performs an icache flush for the given MM context.  RISC-V has no direct
  * mechanism for instruction cache shoot downs, so instead we send an IPI that
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

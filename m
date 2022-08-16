Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E1BC25B0D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irRPoTU7jGy8yWJFy8YvVXFiMlyDG89vmywFSUSoonA=; b=ShkXdBDmViSA2I
	I+kDtbPUywySRyNEeZg0v/Xs6rDJBe/Xyby2sqzn+rwBlszlVAsKJhozBk369pcQKN5kndOiqbxr4
	W02AvDFEQs/3KpWuJoEDetYf4ofomVRGBdkGrn9YB6rhOcbZHA/tgGjYQmDvCyWoieXVAFK7JWJE0
	/sM9GEKAAPBguccxDRfYfAQ6T+nj0AjyJ92xtTgd1I4udaazL/U8N/UiDYcfiCi9lmsA9ShpjRetk
	+xzVL+LvInsm5hyVlg16yCttFp+/Nu2aqnbeUnJuRwmcqsnLXQ9iQxXEocWw517QK9z7x3nj3eozS
	bkgwnuTfqSa+hjOJTrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNlMX-008chI-MU; Tue, 16 Aug 2022 01:27:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNlMS-008ced-TI
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 01:27:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0770B81236;
	Tue, 16 Aug 2022 01:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A748AC433D6;
	Tue, 16 Aug 2022 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660613233;
	bh=dmLaa20TJjtO24bQO+wPMfgnol1pv4VrwShpWvKTm28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqTAHyjPMLvdcL95Os1dz+ijEWBu4FR7Av/+3Wdw3pUB9euNk6o3+3KA3AKeKeHff
	 Dse4VTdhV+16cSlJaN8p7hossEELL7dUjNJSHcZMD4iozqOUB1BYHSkRk9+xLMacXJ
	 0EMuz2uAjPa8el5rW1TnqO/uvccwectU6KZWfhqLs4K9enMAQ/qjV+TbrIDnSRQF90
	 s0l4SiEdRF6h3WFCpwVlZm7kX1Lou3hdpFQOXZHjp9iEAD7UVlVf0Io1h7kH5ZnRoT
	 A/DP5FGI8zIWHiYxBwVHFeTOs34WqsENTArh8DQPCbECNCZjmnPwt3OvZD3YpKCzTG
	 FSX8TsteuzmaA==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Will Deacon <will.deacon@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [PATCH 1/2] riscv: kexec: EOI active and mask all interrupts in kexec crash path
Date: Mon, 15 Aug 2022 21:27:00 -0400
Message-Id: <20220816012701.561435-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220816012701.561435-1-guoren@kernel.org>
References: <20220816012701.561435-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_182717_274873_DD7509B2 
X-CRM114-Status: GOOD (  15.17  )
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

If a crash happens on cpu3 and all interrupts are binding on cpu0, the
bad irq routing will cause a crash kernel that can't receive any irq.
Because start-up of crash kernel won't clean up other hart plic to
enable the context. The patch is similar to 9141a003a491 ("ARM: 7316/1:
kexec: EOI active and mask all interrupts in kexec crash path") and
78fd584cdec0 ("arm64: kdump: implement machine_crash_shutdown()"), also
PowerPC has the same mechanism.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>
---
 arch/riscv/kernel/machine_kexec.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index ee79e6839b86..db41c676e5a2 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -15,6 +15,8 @@
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
 #include <linux/reboot.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 
 /*
  * kexec_image_info - Print received image details
@@ -154,6 +156,37 @@ void crash_smp_send_stop(void)
 	cpus_stopped = 1;
 }
 
+static void machine_kexec_mask_interrupts(void)
+{
+	unsigned int i;
+	struct irq_desc *desc;
+
+	for_each_irq_desc(i, desc) {
+		struct irq_chip *chip;
+		int ret;
+
+		chip = irq_desc_get_chip(desc);
+		if (!chip)
+			continue;
+
+		/*
+		 * First try to remove the active state. If this
+		 * fails, try to EOI the interrupt.
+		 */
+		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
+
+		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
+		    chip->irq_eoi)
+			chip->irq_eoi(&desc->irq_data);
+
+		if (chip->irq_mask)
+			chip->irq_mask(&desc->irq_data);
+
+		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
+			chip->irq_disable(&desc->irq_data);
+	}
+}
+
 /*
  * machine_crash_shutdown - Prepare to kexec after a kernel crash
  *
@@ -169,6 +202,8 @@ machine_crash_shutdown(struct pt_regs *regs)
 	crash_smp_send_stop();
 
 	crash_save_cpu(regs, smp_processor_id());
+	machine_kexec_mask_interrupts();
+
 	pr_info("Starting crashdump kernel...\n");
 }
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

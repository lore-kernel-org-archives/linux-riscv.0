Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFF4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3Ev0aJpLI6pUj9FXTDpbKKimPtuRxLq3jhw69/GO+M=; b=xAmTqJSccXe1ar
	XlIHLfghMT+3xZo/ik6tiBxOSWwoOkl7xcTBbFzOPBnwYat8zR2Xs2C/08LBFI9+B70VLuInr0I96
	6QgOLFzmpUEG3wKsTtkMHWVsN71dA9CmW9RrpucYDGHMhZ7a5Zg4mzPMIy5NHOcUryWtf5AV0br+D
	7EeZhAuSJEZ1RSj7XUaa33DEHVW0LdMphLr8ku2ScJwtabbkJOhWAk8sLNA/7K9+5Nh87tHGwjSRt
	eqpy4aWsFvPepX1sSNRcvhUKJ12vusaoBvEZxtQny3biei3hzxp+/MYxsdmbYCnFJeeGI0r0h2+47
	0v7yMV2cg3B6zJ/kOktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YEE-005Ia7-TO; Fri, 09 Dec 2022 07:55:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YEB-005IWj-Vm
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 07:55:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73917B81B4D;
	Fri,  9 Dec 2022 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FF0C433F1;
	Fri,  9 Dec 2022 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670572525;
	bh=4nLQBcd8V0pueofOhtHaEJKIhLpE2Gc7g50/8xor77o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYTmQ/UOCCIBGrz5axni9cWPzMzpbmxGbLgghkZ1AnkMeTt/u/+1KFk9GLkRtIYnM
	 oWMbzf3VfSjmHklp1Z0DYJok4+g7+IGg5y/vGWO+U/jKh4QrDIXXwQnHuR/1i8wc+D
	 Es686IkaYTg0dC175moF6PsbxZvkp7L5zTe/ljvXC7IycbLRN5iMI0ZKYFGC9SCtjm
	 886HZLA/szfVvQHGKg3+VzwI2IZ5fGUeFyGJhmZgJ3CanxkKyjxtxs6dzsobz3ZxLq
	 5kxACdUNSCzRVvwGI587We/8+fPSAHlrXwPEKNduqLxngqUjnCuHA87kYlseW8qxS3
	 c5wG9ZRPo8csw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	conor.Dooley@microchip.com,
	guoren@kernel.org,
	heiko@sntech.de
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	crash-utility@redhat.com,
	Guo Ren <guoren@linux.alibaba.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH -next V6 1/2] riscv: kexec: EOI active and mask all interrupts in kexec crash path
Date: Fri,  9 Dec 2022 02:55:12 -0500
Message-Id: <20221209075513.532249-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221209075513.532249-1-guoren@kernel.org>
References: <20221209075513.532249-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_235528_378081_C1781883 
X-CRM114-Status: GOOD (  13.80  )
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
bad irq routing will cause the crash kernel can't receive any irq.
Because the crash kernel won't clean up PLIC harts' enable register.
This patch is similar to 'commit 9141a003a491 ("ARM: 7316/1: kexec: EOI
active and mask all interrupts in kexec crash path")'; arm64 and
PowerPC also have a similar mechanism.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
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

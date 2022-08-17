Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF5C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcTCDZHK8soDNj0HblAyvyKi2tHc72FXpjDCMzpmi04=; b=nBnTo3Dl//j8pj
	Km/0F8jwXwlyaDfrN5EcB4OKgsAbXLB9hsL1znbT7l8AcO6vsu64AklY8TlCAe3NcM+mQx2M1o/+k
	KUTqYnt8uorB9DCEvHfuiY2DHiQacBW1utNnd/S0TZ5daLYkt743ucHMFUF7iJTzbT/qEKFSKmyWy
	UAaccrSMChSX+OGv6NbaNVY7Ud4dfRquualSEdax4pyyCSlu6NJbMZv2fcjsPL0pXM16lA2TjloNS
	7gA/nKga3P3eCyn8M3WEgLbxJMrukK6ResotYKHA+hEgRrHIhMnE6EzvQz+FxNFKYoKhlk67d+PfV
	thcNAr4FkHETlI7PXf0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLff-003gUw-Ev; Wed, 17 Aug 2022 16:13:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLfb-003gRe-BP
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 16:13:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5887615BE;
	Wed, 17 Aug 2022 16:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994C1C433D7;
	Wed, 17 Aug 2022 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660752806;
	bh=FD9SlMuXmlO3EOLgvahsW7Sboc7tOAmKtseKYIHuBRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ah5/K3cXDTS7baUu/TIrWjvNn+9m0c6m5JvUszJKBu0/TJl/x2/pDBmxiw6sfiGNQ
	 S/7avkGq3x3P8dZf1nk411ED/E46+npxlrDFLYcykiJdSxFxotEHkFignzhkOHTbZZ
	 v2r565TKUAQuvbOCwXCFYpIKfhevWvz2BjtM2HPYEAuGqkrMLKPhSEp4zaD0eu3snu
	 85sIdhoIkC2NT1fm/oSU+L5OLxu0My+ZwfvNhqaSITJ1y3kNB/xljyvDumwjpa80Ob
	 yt+ID+1IY1R+gLK2/Jud9lBbo8BuflEkjxGZwgjHOXdkQeXFCDSasFcA8LNtFU0RCI
	 xau/qaFtdJ8fw==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de,
	guoren@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Will Deacon <will.deacon@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [PATCH V2 1/2] riscv: kexec: Disable all interrupts in kexec crash path
Date: Wed, 17 Aug 2022 12:12:57 -0400
Message-Id: <20220817161258.748836-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220817161258.748836-1-guoren@kernel.org>
References: <20220817161258.748836-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_091327_510484_375FA3F4 
X-CRM114-Status: GOOD (  14.49  )
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
bad irq routing will cause a crash kernel which can't receive any irq.
Because crash kernel won't clean up all harts' PLIC enable bits in
enable registers. This patch is similar to 9141a003a491 ("ARM: 7316/1:
kexec: EOI active and mask all interrupts in kexec crash path") and
78fd584cdec0 ("arm64: kdump: implement machine_crash_shutdown()"), and
PowerPC also has the same mechanism.

Fixes: fba8a8674f68 ("RISC-V: Add kexec support")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>
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

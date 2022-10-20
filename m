Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15562C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBZRDmIlSFKboWVujBnsAo0QCv6ivL620qQ1aFP8/9k=; b=TR5yj/PenhMzX5
	UGOaWpvYkucWKTMQpAuMEdBDsw31dcgIL1ZjAUuc4oUHCsRpi2UZLLX/jbLJ51ZNglg4lr8MRvcBe
	QgLcEIUEnpjz6BU5O+xo4kPC6wlo+zpzw5Z84PTIuj4e1trKquKoG989Ag2rXMA/i+6ExugOB+6Ws
	3OYfdfMQYiYGc4yhxyQ90mJYmvHtHSYa/R04lzdEu47fhO0vO1xtkpiO5cWu+xHCIGsNy2QDcIUzJ
	3olvNrqop6BqhO3BfJ363mz/b+xstJojfcaFBfAZuaJ3gTN0vGQTW3/7SVpYZ1oBzAGKNuC7R6F1a
	5Qacp9qhp86y/ynEr8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWZb-00GBtl-JS; Thu, 20 Oct 2022 14:31:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWLo-00FzCk-U4
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 14:16:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 563CFB82775;
	Thu, 20 Oct 2022 14:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23492C433B5;
	Thu, 20 Oct 2022 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666275406;
	bh=xstK3zkOHtc6QOgvpFphVjtbdDCoP5sViwZUf0BdeYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U3LlyRqHOBjAVnIEBN9khBKKuhSpAf8SRXM5yZ8+Koj4z/6g7noNLkFtpt+9p/Zj+
	 pzdPqmZQNMO4HZOhMN/5wEHiEes7Kjtd4nbmtft8bL+Oh2GdsRm4H9pKZS1blUMSMP
	 8ZKk4UKKY9N3j+pQPT7jeksTeOdx9omaRUOBSGaXDRVMoNomD5u5A8v0GEvQXJm7k3
	 EUM7mWCg9KadWJ1W6HTdwOmCBfu+45gLb8YkIy0JWgQjJEgLO+OCgkrckACL9RKFmM
	 2AY9yQhPb8/RJF3y3MwageHC1XTLfBMEUStZmx34vhQMtm89he0h1kC2t6GUIDpz2O
	 kIOGQ2kpMUXeg==
From: guoren@kernel.org
To: guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	arnd@arndb.de,
	lijiang@redhat.com,
	bagasdotme@gmail.com,
	bhe@redhat.com,
	yixun.lan@gmail.com,
	goyal@redhat.com,
	dyoung@redhat.com,
	corbet@lwn.net,
	Conor.Dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	crash-utility@redhat.com,
	Guo Ren <guoren@linux.alibaba.com>,
	Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH V5 1/2] riscv: kexec: Fixup irq controller broken in kexec crash path
Date: Thu, 20 Oct 2022 10:16:02 -0400
Message-Id: <20221020141603.2856206-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221020141603.2856206-1-guoren@kernel.org>
References: <20221020141603.2856206-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_071649_299394_FDB5C0A0 
X-CRM114-Status: GOOD (  14.83  )
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

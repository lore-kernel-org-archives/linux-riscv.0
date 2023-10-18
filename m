Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B84CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVSGFs7XHnb0Nk34TEcnXBNBdLn7gUx3IyPqkfrWfBQ=; b=FusMMlOH3cBZaH
	4GRHjKRJI7cS5kzpIAZjZ6UIG4xeE3mwvwB+1Zhr16dz84iiy8hxAcU7B8OPnMv/00Ql/wsJE6LOb
	Twb80jzXc188RQNQa3+HIeM0bV2fdfBZ2iVy0aPNuiVdYpwzX0RS4MAQrRxtuDTySy+1y8gLlej3s
	arDA/kA7tBS3QU86iDiIQz8CokvjqYzCWbHKEwo1ddNfF2defUW4CJpPF6+UxJFFeNraF3rmon14w
	lght4mXZidsZqBzQGkHnUZWHjzywLxFDhg3HOQfX9rvMCNVahMqX8dsvXNKsy6IZBMp331pLi3aTK
	s5wwjgOBOJ2LXvdDNC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Hy-00ErUW-22;
	Wed, 18 Oct 2023 14:12:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Hu-00ErQU-18
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 14:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F40E5B823A0;
	Wed, 18 Oct 2023 14:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86432C433C9;
	Wed, 18 Oct 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638360;
	bh=JIRr0gRvmQQNSAExZupPyrYT+vxJ3y/jlLLbi6tp3zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4FTIJUzfpTKfXZDgkZlizOrzz8VN6duZcuSZ7hsDzK4cl8Yi9cVvH65JgusXP3r1
	 XM5C8v0VrRka810qrXt65qsKc9CHVOrWv8KOEk7pxLghT2RDuiXMGacm7pWOQHmdOz
	 guEGtTx8vCGWlF4GjIriLqC5HvpCW9Y4bApxmcJ5vqwJ/34Bo7WW+uZVvu6oZQb2OY
	 nKfHqv1gx25BV+Ba+lV6gpHfEQYuHfLLPcW0E59aP8SeUHsli7InzHIp0fJQL2Kdj1
	 MdD5vjR0ytfGZD7TQHg0ypYtGPmBKeKwP+D0YFNfTBNAGuApmaMpM8ZF1Uze4eox0H
	 2JxaJ6t56VnHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Anup Patel <apatel@ventanamicro.com>,
	Dmitry Dunaev <dunaev@tecon.ru>,
	Marc Zyngier <maz@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 19/31] irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Wed, 18 Oct 2023 10:11:36 -0400
Message-Id: <20231018141151.1334501-19-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_071242_549461_709D77CD 
X-CRM114-Status: GOOD (  12.73  )
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

From: Anup Patel <apatel@ventanamicro.com>

[ Upstream commit e13cd66bd821be417c498a34928652db4ac6b436 ]

The RISC-V INTC local interrupts are per-HART (or per-CPU) so we
create INTC IRQ domain only for the INTC node belonging to the boot
HART. This means only the boot HART INTC node will be marked as
initialized and other INTC nodes won't be marked which results
downstream interrupt controllers (such as PLIC, IMSIC and APLIC
direct-mode) not being probed due to missing device suppliers.

To address this issue, we mark all INTC node for which we don't
create IRQ domain as initialized.

Reported-by: Dmitry Dunaev <dunaev@tecon.ru>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20230926102801.1591126-1-dunaev@tecon.ru
Link: https://lore.kernel.org/r/20231003044403.1974628-4-apatel@ventanamicro.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-riscv-intc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391f..e8d01b14ccdde 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -155,8 +155,16 @@ static int __init riscv_intc_init(struct device_node *node,
 	 * for each INTC DT node. We only need to do INTC initialization
 	 * for the INTC DT node belonging to boot CPU (or boot HART).
 	 */
-	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
+	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id()) {
+		/*
+		 * The INTC nodes of each CPU are suppliers for downstream
+		 * interrupt controllers (such as PLIC, IMSIC and APLIC
+		 * direct-mode) so we should mark an INTC node as initialized
+		 * if we are not creating IRQ domain for it.
+		 */
+		fwnode_dev_initialized(of_fwnode_handle(node), true);
 		return 0;
+	}
 
 	return riscv_intc_init_common(of_node_to_fwnode(node));
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

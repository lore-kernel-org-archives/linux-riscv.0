Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3728DCDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWHSq3UOlGzSM2ohdPvZIYFAjMZBXCgvMrRjmV61pa0=; b=Q1t1I89URxDqqt
	v37L0syXkm3Y9Z8rALBFomMd7PTS4bcgozJERnHzBK8bL+Ja5M3uBUsxPJuBCHNKUe2RUuVxpY5sd
	JAxKMpdqWug8Nj1PqHWsDrzyf3KbD0+JJ+f9tzN1y0X5v0SLctOZBBXoZG3VIvNcSAkIC7up6wAPY
	n2MMeyJqGvfBy2Oilo+u/9nRafLjNfFSyHo4TyQBa3xHLAIDlMd/h4VaPZYNB8FCjgRGdD/QBDVmg
	3Fv3tJtEvI0YxOpuryH0zCvdsZ1AXCkEoEEVWiJ5h+WJMiniMOtfkfMQ4KhxdIHuGzqCt7T6315JH
	LbftGVDYJmGivtKAU9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Jm-00EsKx-22;
	Wed, 18 Oct 2023 14:14:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Jj-00EsIZ-0D
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 14:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E21BCE25CE;
	Wed, 18 Oct 2023 14:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FAAC433C9;
	Wed, 18 Oct 2023 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638473;
	bh=14GQXwt2W7OgYXm3BLfldX+aT31k3vfoAlqbmW/xzcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBfgYDlvStJOeSODE4hhSF9K6PyGBJmJK3fw/y5od01L9GwDj7WLfcxLKuRT3uVQc
	 IvGzt5jDnJMHlNT2+nl5zaLKGNHVw/uiG5NY36GitlsMqmVl1sMNxdxlKRhIOrCCu2
	 7mc8Rd8gVgtHLYwjOwsKnwpbRoICycRGvRa7fXWNVL5gJXC7cwMnIb6k0Yg4hgEObz
	 fz+eMHoYocN9nbUbBSRgcHbFRK1mH+6T9zjiNYX9jZgDFCCZAKlKFjxpWv2mCb5C2A
	 T78OWida+AEfYJOZVd8OIKlr2iDZvecf5yIE0mIIbWd/mtKF2dFxenyKsZqFCHAIHX
	 QuR0JuUxes+5Q==
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
Subject: [PATCH AUTOSEL 5.15 07/14] irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Wed, 18 Oct 2023 10:14:07 -0400
Message-Id: <20231018141416.1335165-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141416.1335165-1-sashal@kernel.org>
References: <20231018141416.1335165-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_071435_276633_52D0F365 
X-CRM114-Status: GOOD (  12.76  )
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
index 8017f6d32d52b..54c99441c1b54 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -109,8 +109,16 @@ static int __init riscv_intc_init(struct device_node *node,
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
 
 	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
 					    &riscv_intc_domain_ops, NULL);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

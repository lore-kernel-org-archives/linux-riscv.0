Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97659CCFA03
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GfWLDwgpFRp7SLvcgmEfBTU0GbfRqSFTjnHXg1aFK3I=; b=K7Qx1VcJIxLmlR
	2d01cYnSChrutboy3jgXtybUaSr65IheJaBLO8ZD2DdVefQEVbRpPHM9LjB0zgsOnZlYj0Vh6U7bS
	Tn+DpSClK0u8x0LpXANlvmlIEZvZ5XKcPtc+Dbl7U5vQrw5pD4KS5EQSyaVuHod53GaTS++PcsNN2
	oYBFYNr12deThmxc0VtIt/vbnWnFImhg594oK4MdTIEDEYZ8vNdRf2JJTvq/R9VrX30zuQks2iqcp
	K0x+ahr6vPljIbo9CMg898G1M+TgXPPe1rB3+1RH8Yz4w4/dDIh5i/BbnOVAElyEbFW6pX5GJfn2G
	RhHpuBq7HHRDQa4rlUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxGT-0000000AFF1-3tUI;
	Mon, 03 Nov 2025 16:18:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxGR-0000000AFDb-1qiJ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 16:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762186717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ezCNaUCKcpwGk7sWAga5EHhyDCPk/Oxt4aXzp6O1YvQ=;
	b=CfowYNNMRGN0DrPdvQ3bU5ysXc2aUJUqRf2+h7+8thsAaCbb4NW2QajTs/Dw2j18auP5HM
	vWXPBlXz2acm0v66+D+sUpK01rCU8CL7oKCzItnBt5jXbfUyqtZ24TiEO/4tlbOB/oLfT6
	RXb0EzjEdNUmY1gcN28+w3n34HnF/4c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-5ogMiM_RPI6yIOzf3m55fA-1; Mon,
 03 Nov 2025 11:18:33 -0500
X-MC-Unique: 5ogMiM_RPI6yIOzf3m55fA-1
X-Mimecast-MFC-AGG-ID: 5ogMiM_RPI6yIOzf3m55fA_1762186710
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 838B81800669;
	Mon,  3 Nov 2025 16:18:29 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.64.253])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3EDAD30001A1;
	Mon,  3 Nov 2025 16:18:27 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] irqchip/sifive-plic: fix call to __plic_toggle in M-Mode code path
Date: Mon,  3 Nov 2025 11:18:13 -0500
Message-ID: <20251103161813.2437427-1-cmirabil@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081839_548037_093A9EF8 
X-CRM114-Status: GOOD (  13.47  )
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

The code path for M-Mode linux that disables interrupts for other contexts
was missed when refactoring __plic_toggle.

Since the new version caches updates to the state for the primary context,
its use in this codepath is no longer desireable even if it could be made
correct.

Replace the calls to __plic_toggle with a loop that simply disables all of
the interrupts in groups of 32 with a direct mmio write.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510271316.AQM7gCCy-lkp@intel.com/
Fixes: 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cbd7697bc148..0de3003981f1 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -592,12 +592,12 @@ static int plic_probe(struct fwnode_handle *fwnode)
 		if (parent_hwirq != RV_IRQ_EXT) {
 			/* Disable S-mode enable bits if running in M-mode. */
 			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
-				void __iomem *enable_base = priv->regs +
+				u32 __iomem *enable_base = priv->regs +
 					CONTEXT_ENABLE_BASE +
 					i * CONTEXT_ENABLE_SIZE;
 
-				for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-					__plic_toggle(enable_base, hwirq, 0);
+				for (int j = 0; j <= nr_irqs / 32; j++)
+					writel(0, enable_base + j);
 			}
 			continue;
 		}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

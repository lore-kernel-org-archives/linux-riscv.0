Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286BFC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqKYRYCNqwX0aAAJEtyT4XvSbqT1pY3E21XJykY6sL0=; b=ZsmbRFGNP7J17Y
	5XJ/CkTUDkHe+Uh2oeCNNIDNuUqxyj3jM56pyFC7B/uWxbJZ0UJdEoaIPPW0JKQ6eEGAExNz656ry
	qWeUpo3dYL77idjlPTg2SW8PLtz+IAvC1c3YSg16tuDI7KSwwlFBgSCv4tSlnkh6XhMACSx46o1GC
	bWD4E0KtzWT+hQPLi1/2gvx1V+/JcgyuOiQS//yG0z1Cdn3MGa3AIrM/nDvJ/u10GkdOhwqEmlej4
	MdwkuNsJlRXM8wJpYKymYjgTc/pJ5ysyjlX8G+JK96MRk2QbeBqLFlEWsWZpMFnFeFcRYzi8K1i+4
	00yKTI+NXY1Xxm7H5gJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDqa4-0055VO-TB; Sat, 29 Jan 2022 16:28:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDqa1-0055SV-7u
 for linux-riscv@lists.infradead.org; Sat, 29 Jan 2022 16:28:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 908BBB827EB;
 Sat, 29 Jan 2022 16:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8959C36AE2;
 Sat, 29 Jan 2022 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643473678;
 bh=mj+16Yua//ZuWpSt7mb3n3M0MCT6abub/gnEMjyeKxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=njlalEVBnq+YsBF/eQPkAGjPEqHK+QGU/iCXJE2G2TgMRF64o2SB0JgTa62jAXO4R
 b1ch9HX9WIdXD8JuUSXgSbdSKj++6mu5j4boufWOQJn6oE/qhebiQeo+3tis57ZaVU
 xn56YMVU+1donPQ9lWVN51aca0XevX6aqm3L80NjVXNCBjGfjigK7wPOF2G0TGQMAx
 3snex1IAG2c9E99a1FlLUEsAN9Eb4hRtA6n/m3I71up9qI/YEqPbxGuNTYu9GTeeuz
 ZlkxOxm6s+2jkFiUbbni/Dtu/VZXc9rcu5erGrelM6bDPl0wkGQvZprWghYCYXSbse
 R7RTA/9H5Hp+g==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,
 c900-plic dt parse in opensbi
Date: Sun, 30 Jan 2022 00:27:26 +0800
Message-Id: <20220129162726.1154501-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129162726.1154501-1-guoren@kernel.org>
References: <20220129162726.1154501-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_082801_613808_89CACB9B 
X-CRM114-Status: GOOD (  14.61  )
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

The thead,c900-plic has been used in opensbi to distinguish
PLIC [1]. Although PLICs have the same behaviors in Linux,
they are different hardware with some custom initializing in
firmware(opensbi).

[1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 259065d271ef..245655928076 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -172,7 +172,7 @@ static void plic_irq_eoi(struct irq_data *d)
 	}
 }
 
-static struct irq_chip plic_chip = {
+static struct irq_chip sifive_plic_chip = {
 	.name		= "SiFive PLIC",
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
@@ -182,12 +182,24 @@ static struct irq_chip plic_chip = {
 #endif
 };
 
+static struct irq_chip thead_plic_chip = {
+	.name		= "T-Head PLIC",
+	.irq_mask	= plic_irq_mask,
+	.irq_unmask	= plic_irq_unmask,
+	.irq_eoi	= plic_irq_eoi,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = plic_set_affinity,
+#endif
+};
+
+static struct irq_chip *def_plic_chip = &sifive_plic_chip;
+
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
 	struct plic_priv *priv = d->host_data;
 
-	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
+	irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
 	irq_set_affinity(irq, &priv->lmask);
@@ -396,5 +408,14 @@ static int __init plic_init(struct device_node *node,
 	return error;
 }
 
+static int __init thead_c900_plic_init(struct device_node *node,
+		struct device_node *parent)
+{
+	def_plic_chip = &thead_plic_chip;
+
+	return plic_init(node, parent);
+}
+
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

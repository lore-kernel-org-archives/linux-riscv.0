Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E32BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7856103D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B7856103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pc+3BbsK36P+3qYHyET0eGxqhVk93XS37WESnr5DAPc=; b=EPKGwU27yTuPRU
	AMCar2hbt7OXWczfaiG3LIN/krVpAcB3UHC1STiI29KDqttdF1IdmWEGwV0jRK7XD0QTP5zK9+bDm
	VyQR/QvZFg0IdsqOdPwA2fIHJbWAp2kaUnma1CLbrwlpKObnJHG/kdPPsSCEZE3ivIw7t59VHsPrR
	tn9repFM1I9ErCqfAAA06lEl5hYoFe+EY3tyQ3TgQfFsqekUk9512T09HNvLF7YbZGY2YdxKDC5y6
	/kHxLepypi25Vpy6kjL3TRZj5vJR4gCVvpXwOFRpvRzQ7Wgcnz4Xkk3MBRYcLpkS1CHSA7enNIJ6m
	4Q9eMvb3uI3DSqjr3BfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJnn-00DLtY-3x; Tue, 12 Oct 2021 15:34:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJnk-00DLsa-1d
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:34:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D98EE61074;
 Tue, 12 Oct 2021 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634052887;
 bh=6W6iHtb0gBp1lkXoNCKov43WbKN2Zd1lRk8xkWaz6QQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eWlwJ56npUHtTb2/do9cb/DEEJmL/Yx7tRUMtFBhd+kqagYFHTNqxKyLecJ3laX2r
 VoJB2UH2obniDyu5aNU3o0g8SU6zjrhS0UCUDgXrj5D6rnfYJFN41VWbhnyYCNWzN8
 75odFUkGJaQVjKrKqM/rHMPQIJSlsKjTbRQYaVLvlkx9IYWOlwn1y5e+ayZ7oHuvB3
 pJo9nRcOqXgy97bH9ay28nYMQS1DOFghl+Y3lEuhOPhLWxmQ4NPaFCH9teMGEZZH2g
 2U3HNw9sTCkMk3ExXpKqhzSuKH30oXP1loZaF0QQp3w08FlRhZj5tSvhivFBHZv79W
 K1bvAQT3y9EZg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 2/2] irqchip/sifive-plic: Add thead,c9xx-plic support
Date: Tue, 12 Oct 2021 23:34:32 +0800
Message-Id: <20211012153432.2817285-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012153432.2817285-1-guoren@kernel.org>
References: <20211012153432.2817285-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_083448_126950_985C1A37 
X-CRM114-Status: GOOD (  12.25  )
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

thead,c9xx-plic would mask IRQ with readl(claim), so it needn't
mask/unmask which needed in RISC-V PLIC.

When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
operation would cause a blocking irq bug in thead,c9xx-plic. Because
when IRQ is disabled in c9xx, writel(hwirq, claim) would be invalid.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>

---

Changes since V2:
 - Add a separate compatible string "thead,c9xx-plic"
 - set irq_mask/unmask of "plic_chip" to NULL and point
   irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
 - Add a detailed comment block in plic_init() about the
   differences in Claim/Completion process of RISC-V PLIC and C9xx
   PLIC.
---
 drivers/irqchip/irq-sifive-plic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..3756b1c147c3 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -79,6 +79,7 @@ struct plic_handler {
 };
 static int plic_parent_irq __ro_after_init;
 static bool plic_cpuhp_setup_done __ro_after_init;
+static bool disable_mask_unmask __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static inline void plic_toggle(struct plic_handler *handler,
@@ -181,6 +182,13 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 {
 	struct plic_priv *priv = d->host_data;
 
+	if (disable_mask_unmask) {
+		plic_chip.irq_mask	= NULL;
+		plic_chip.irq_unmask	= NULL;
+		plic_chip.irq_enable	= plic_irq_unmask;
+		plic_chip.irq_disable	= plic_irq_mask;
+	}
+
 	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
@@ -390,5 +398,14 @@ static int __init plic_init(struct device_node *node,
 	return error;
 }
 
+static int __init thead_c9xx_plic_init(struct device_node *node,
+		struct device_node *parent)
+{
+	disable_mask_unmask = true;
+
+	return plic_init(node, parent);
+}
+
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c9xx_plic, "thead,c9xx-plic", thead_c9xx_plic_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

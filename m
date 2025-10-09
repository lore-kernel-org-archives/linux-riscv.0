Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BEDCCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hn5qlohTdhbpvtUoBk5C3WZRfbIa1UPSv0EsuQ5LxA=; b=16pTww4+bFq6rW
	JbeQx9QPyQQzHaburWswMcRBz3bz35Sq0lIwzkHSqVcmoUsf6OFQW6wcEocrR1/WNQoGiS5YLX6Gz
	SSHccnt23HTVs6HjgM0K0XF45Ct/iIv9zSyzlOnp42SKC5VBLMNuC4NPtx+M+8o4uYRrYNTtJao/F
	z0FICTbHdeeW45tnixBxLhN6XRyQngBGi6pGhpzhxzN7rs+SamCGffagsEC5FJsgRs9rN54m8UBmZ
	VfqGvKRF2GR+YyLNBPcuk/fAYhMBtWpKCKL4R1JD8CgDqjbmuPYD2h5PT64DjAf15AT4L+l+2+YSl
	HhGtwxocuPZxmaI4kNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lu8-00000005VOZ-3CqH;
	Thu, 09 Oct 2025 08:21:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lu6-00000005VMk-1TTR
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759998097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0xBvB4cpvYBkdw6YrbIjRmoTGZP8mUNMzyTE8hHEnM=;
	b=ajSOeQBs/jTT2P9Sd36IeA19EmUl1V1W55uGPCWiAonAa0eMrgchIeUmWw7UZAVUx3BGjI
	FbEiPeNg0qAkOVryrr8Uv/gdI3ov3RhOHM972Dcy1ciezJICAXUEXbqfhErjnyPDzHYtRn
	CMhdjbD4Cs4I+1cmddp1TUvwcMp39xM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-Ive3AmFLNOWvs3VSFUpdXQ-1; Thu, 09 Oct 2025 04:21:36 -0400
X-MC-Unique: Ive3AmFLNOWvs3VSFUpdXQ-1
X-Mimecast-MFC-AGG-ID: Ive3AmFLNOWvs3VSFUpdXQ_1759998095
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b448c864d45so56172166b.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998095; x=1760602895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0xBvB4cpvYBkdw6YrbIjRmoTGZP8mUNMzyTE8hHEnM=;
        b=PgBRMi4v2L5I0QXEsHdEMrhVq0k8N/pOp3whCO4zoQ9XSLGRCu/7v6nKSXriVnl9sF
         gFA54ZO5kpaGS+k8e6IgG8uP63H868EducF9qakaap+Pl7R9GHF0MUk3BMF7fwMA+q07
         z5eb8JpxnJkDKWcaQM0HP+AIJE5DIAZLANSJBW4ry1H1HqNnlXJEFYl7/8IxS6esIy1w
         cLbMeRT7/p6dDPQUNdnsq4byZ3ClXhZoe8XaWUPzOb8DGE0AOazZ4SOVEY2Cdf44pJEs
         2CHpyquXll7FmbAXu6okDH1BfLaFA6182R9vvLv0L/841jBCH+I1jeCS5gIVW/RhLGGt
         9jUA==
X-Forwarded-Encrypted: i=1; AJvYcCXv8+8sage2uOIZuGEiiGbmWMfnCynjCSrjrzl6pXMYMNtjxRDj6JDmY5+lQniysDmSLNfM2CNf8OCjag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHajJ57J/5Qao5kMklwwgtsX2TtB68VnbpV9ElnN585rZKRaAu
	AxQoL4Yy4Ny+KhvHl9AlJj7XuxAZYJUPeBuweKDf2KI0UdU0FlBNK25bkO4BjyXSU2fLYCrsPag
	MsfOgSuH9IFcGy7snt0H+Am7PsDKB4KoQoreTNQez/HdbKBXnbUNUAkbxVqO9icQKTA+D5A==
X-Gm-Gg: ASbGncszT4kQX2iBh8IeRPpJSa2ta8b7U+qBuY8D1D6oupwFjBhVbNG9ADLfKWtspSg
	3EFdC5L3r1xfJgYnhSbRKLrZ6zLfq92XmiNlBU0z+o4zpJuXU+fEcCBXw7JEHjfbz+lIDI/p4oP
	MtIMm/DwA71e1Qx9qTb/WhWIUhkoDhcySFyD+L+mWZsmpldnA9ARWWngJNjUh8Mj4tai3447u1t
	tmUETFIppP5GDBWQk2g6DJiE2gikgOfg3B09VYgNUJ7KAwbvxo3IoWAOQDf2jPpbiZ+GoiaTQew
	gRawhhLZljI1ybFauRQge5ghsC7vBossWXQ46kPbrylqpAKdZ7ca
X-Received: by 2002:a17:907:94c3:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b50a9a6be43mr649671466b.5.1759998094655;
        Thu, 09 Oct 2025 01:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX1ep1IfrGZOFezAFxpz/haghG7x5n4wwnI1Tqd535Iu6MiRVa/gtslelpEHIAmjcL2ZVWKA==
X-Received: by 2002:a17:907:94c3:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b50a9a6be43mr649667966b.5.1759998094107;
        Thu, 09 Oct 2025 01:21:34 -0700 (PDT)
Received: from holism.redhat.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e27dsm1832988266b.70.2025.10.09.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:21:33 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
Subject: [PATCH 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Thu,  9 Oct 2025 09:20:13 +0100
Message-ID: <20251009082013.1331361-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009082013.1331361-1-lzampier@redhat.com>
References: <20251009082013.1331361-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: txEUxNO00cTPpuwPjwskST1Dpt1i6pJr_1tOShT5MZE_1759998095
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012138_471912_6FE3C4FA 
X-CRM114-Status: GOOD (  23.21  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
work around a known hardware bug with IRQ claiming.

When claiming an interrupt on the DP1000 PLIC all other interrupts must be
disabled before the claim register is accessed to prevent incorrect
handling of the interrupt.

When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
the enable state of all interrupts is saved and then all interrupts
except for the first pending one are disabled before reading the claim
register. The interrupts are then restored before further processing of
the claimed interrupt continues.

This modification matches "ultrarisc,dp1000-plic" and has no impact on
other platforms.

Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9c4af7d58846..a7b51a925e96 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -49,6 +49,8 @@
 #define CONTEXT_ENABLE_BASE		0x2000
 #define     CONTEXT_ENABLE_SIZE		0x80

+#define PENDING_BASE                    0x1000
+
 /*
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
@@ -63,6 +65,7 @@
 #define	PLIC_ENABLE_THRESHOLD		0

 #define PLIC_QUIRK_EDGE_INTERRUPT	0
+#define PLIC_QUIRK_CLAIM_REGISTER	1

 struct plic_priv {
 	struct fwnode_handle *fwnode;
@@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 	.free		= irq_domain_free_irqs_top,
 };

+static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
+				       void __iomem *pending,
+				       void __iomem *enable)
+{
+	u32 pending_irqs = 0;
+	int i, j;
+
+	/* Look for first pending interrupt */
+	for (i = 0; i < nr_irq_groups; i++) {
+		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
+		if (pending_irqs)
+			break;
+	}
+
+	if (!pending_irqs)
+		return false;
+
+	/* Disable all interrupts but the first pending one */
+	for (j = 0; j < nr_irq_groups; j++) {
+		u32 new_mask = 0;
+
+		if (j == i)
+			/* Extract mask with lowest set bit */
+			new_mask = (pending_irqs & -pending_irqs);
+
+		writel(new_mask, enable + j * sizeof(u32));
+	}
+
+	return true;
+}
+
+static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
+					void __iomem *claim)
+{
+	void __iomem *enable = handler->enable_base;
+	void __iomem *pending = handler->priv->regs + PENDING_BASE;
+	int nr_irqs = handler->priv->nr_irqs;
+	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
+	int i;
+	u32 ie[32] = { 0 };
+	irq_hw_number_t hwirq = 0;
+
+	raw_spin_lock(&handler->enable_lock);
+
+	/* Save current interrupt enable state */
+	for (i = 0; i < nr_irq_groups; i++)
+		ie[i] = readl(enable + i * sizeof(u32));
+
+	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
+		goto out;
+
+	hwirq = readl(claim);
+
+	/* Restore previous state */
+	for (i = 0; i < nr_irq_groups; i++)
+		writel(ie[i], enable + i * sizeof(u32));
+out:
+	raw_spin_unlock(&handler->enable_lock);
+	return hwirq;
+}
+
+static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
+				      void __iomem *claim)
+{
+	/*
+	 * Due to a hardware bug in the implementation of the claim register
+	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
+	 * before reading the claim register and restored afterwards.
+	 */
+
+	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
+		return dp1000_get_hwirq(handler, claim);
+
+	return readl(claim);
+}
+
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)

 	chained_irq_enter(chip, desc);

-	while ((hwirq = readl(claim))) {
+	while ((hwirq = plic_get_hwirq(handler, claim))) {
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
 		if (unlikely(err)) {
@@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "ultrarisc,dp1000-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
 	{}
 };

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

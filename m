Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9886CCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13LKUo8S8arNNFtPZfiLoDPMoWm647JDMwyTIIMzL2g=; b=PyDIkNs3Hq2BHO
	QpTeNb2n1Bl8k8P9HPzcbVnuW/O95FIvYfiIttlKNGTc2bpdlbwilHX6s6HyIF60f5nOAMqthAYh+
	vODSgxFVHixKKf8RINCRvmVi5eqb8k2EdwsWntg/C2N68lCfhs0z63oGESj/DzGvxWjU+zP4ihD8D
	SEItKlVoce78ils0LKmWwJW8Jct371w6RXcjGCmDnKDTGnN7/ygNctxUY00S8t/K+T+DVtZ1GC7qs
	Wxjqqlejt8OlxYrVoLjYFn0j0qeheQZp6yPEoN5sMTyyyVw5gIcydkqCnM7C3wpLffRBz2ANicK3i
	kn3/d8k9wNGWvMipbQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvu6-00000006W0x-12ti;
	Thu, 23 Oct 2025 14:02:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvu3-00000006W0T-3iSc
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 14:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761228174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IT49IQx4naO1r1BdT6bWbCUaLMDI3v7xXAjUka+ohY=;
	b=LOYk0vtrA6XLDd1eohuF+thhOq+eYhGgq2N9RCHZVT1uCHEk8s5fexHUHfKewfTBqxs7ER
	fXP9mPrGIDMBz4/ymqOv8/h7OZMSjzXV660AvS77Jl2GhSXo4PjVQV+WgH468vLKpTTbVI
	pa+M7Yj31gpxxsoqvq7foTBntaB0I5Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-uNz4784DNMGR8PFcz6gVOw-1; Thu, 23 Oct 2025 10:01:15 -0400
X-MC-Unique: uNz4784DNMGR8PFcz6gVOw-1
X-Mimecast-MFC-AGG-ID: uNz4784DNMGR8PFcz6gVOw_1761228075
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471168953bdso7196465e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228074; x=1761832874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IT49IQx4naO1r1BdT6bWbCUaLMDI3v7xXAjUka+ohY=;
        b=IrMlVImWCgwH+osyyGqTZMryzg7r1pQpVF8ngqh8NcB5ySBwbV5KCZomW2Vd5IZqzj
         B1ScffYEOHs8vDLfIpfDB8cNelszmcOi4TdZlj+KL7+rgMO+qQiuLlISddWYt4lSj8ej
         SrTGSQHHpWdcqBNgEGs4QUyNYmz1Dlfon16xhE4pez6crHxuqZIgob+viZ/IJZB0ES4k
         BGMrLk4nwAQqhnJlGmTCGsLzEpBCQg+lhcBNcy3gUWQLBuM07uADUjsoNh01ojObqyEW
         voYH9ngmexrqbqeUU/eu8RnrszhRgPxbPDfIIHA5Sjogvo6BszfB7Fy79cNlSA6vgXZH
         BqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuQWcRpat+6/RzrhgBAiGiiBUtuSSN/7HOVIET17KSu4f3q6E99wusP3v7nYQdcFKUqr6ASRK3wFcZEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlI4Jm7FsfWw6u6Sexp5NWKGC4JFPGwXwYgVhGN5FZA+gIAK02
	aNxQtsYl8+IuXp9Ep/0eveDwaKlxUcwfrBbYGeptdYiMIBSSQC3l4PJuVCmYY7Tdl/EkazzWRXu
	koFuwU+kpjWqGkVhcw29Sik+iP9ELPJvcC08AViRfQbMXZeKwYz7tbQ/4K7TJ/wSijVatyw==
X-Gm-Gg: ASbGnctODDXwrUEO6zSha9Y2rrWNQ8BW+9xcCx7Fc+SAFQRnIrhPry26oMpigE4RT6H
	blZU9gtmRgj+Nh75FPfDMniZfhe/brRZ7PD6fP3xiQiQeVu7W9QtC37IxckDUDiZPwtU79v6QaP
	keU59N80GU9nUIfQ9jFCtc9dIfrna4mV9CIW9Kf2YVRFeJCAg2IIfvnlaTneKhWdiuDm/FIVdhm
	Jt+7eOni6X4QjVF5KkcJ6aADKSxiT9zKLf6ikDcnOhSiLuvodGclOFZN+OcdnAafsOEity3smsM
	6Dc1z01CRtkQrpF/lwW+zgT1YWsIWRjcB8OTaB3ZxkkI0bGieBwoNFd8l95aNoPcdv8zH5t+K/o
	yk18=
X-Received: by 2002:a05:600c:6c8e:b0:471:611:c1e2 with SMTP id 5b1f17b1804b1-475c6f183b0mr37332125e9.3.1761228072927;
        Thu, 23 Oct 2025 07:01:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbae4T7r1ZXH6ZnLz9LtKcRSlj8ttV3yrDM9CKplmHZhaoKpWNiXlFJi5xjQ8l5s4E2djLEg==
X-Received: by 2002:a05:600c:6c8e:b0:471:611:c1e2 with SMTP id 5b1f17b1804b1-475c6f183b0mr37331065e9.3.1761228071672;
        Thu, 23 Oct 2025 07:01:11 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898add96sm4116154f8f.30.2025.10.23.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:01:09 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v6 4/4] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Thu, 23 Oct 2025 15:00:53 +0100
Message-ID: <20251023140057.204439-5-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140057.204439-1-lzampier@redhat.com>
References: <20251023140057.204439-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l9isScplJ591D5MNRTIcYD9pLIutv8CX0J-BXB3Q1fo_1761228075
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070256_009700_D62E00B2 
X-CRM114-Status: GOOD (  26.35  )
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
work around a known hardware bug with IRQ claiming in the UR-CP100 cores.

When claiming an interrupt on UR-CP100 cores, all other interrupts must be
disabled before the claim register is accessed to prevent incorrect
handling of the interrupt. This is a hardware bug in the CP100 core
implementation, not specific to the DP1000 SoC.

When the PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM flag is present, a
specialized handler (plic_handle_irq_cp100) saves the enable state of all
interrupts, disables all interrupts except for the first pending one before
reading the claim register, and then restores the interrupts before further
processing of the claimed interrupt continues.

This implementation leverages the enable_save optimization from the
previous patch, which maintains the current interrupt enable state in
memory, avoiding additional register reads during the workaround.

The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
This has no impact on other platforms.

Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Acked-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 116 +++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index d518a8b468742..786be200248f9 100644
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
+#define PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM	1

 struct plic_priv {
 	struct fwnode_handle *fwnode;
@@ -388,6 +391,110 @@ static void plic_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static u32 cp100_isolate_pending_irq(int nr_irq_groups, u32 ie[],
+				      u32 __iomem *pending,
+				      u32 __iomem *enable)
+{
+	u32 pending_irqs = 0;
+	int i, j;
+
+	/* Look for first pending interrupt */
+	for (i = 0; i < nr_irq_groups; i++) {
+		/* Any pending interrupts would be annihilated, so skip checking them */
+		if (!ie[i])
+			continue;
+
+		pending_irqs = ie[i] & readl_relaxed(pending + i);
+
+		if (pending_irqs)
+			break;
+	}
+
+	if (!pending_irqs)
+		return 0;
+
+	/* Isolate lowest set bit*/
+	pending_irqs &= -pending_irqs;
+
+	/* Disable all interrupts but the first pending one */
+	for (j = 0; j < nr_irq_groups; j++) {
+		u32 new_mask = j == i ? pending_irqs : 0;
+
+		/* If the new mask does not differ, skip writing it */
+		if (new_mask == ie[j])
+			continue;
+
+		writel_relaxed(new_mask, enable + j);
+	}
+
+	return pending_irqs;
+}
+
+static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler,
+					void __iomem *claim)
+{
+	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
+	u32 __iomem *pending = handler->priv->regs + PENDING_BASE;
+	u32 __iomem *enable = handler->enable_base;
+	irq_hw_number_t hwirq = 0;
+	u32 iso_mask;
+	int i;
+
+	guard(raw_spinlock)(&handler->enable_lock);
+
+	/* Existing enable state is already cached in enable_save */
+	iso_mask = cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable);
+
+	if (!iso_mask)
+		return 0;
+
+	/*
+	 * Interrupts delievered to hardware still become pending, but only
+	 * interrupts that are both pending and enabled can be claimed.
+	 * Clearing enable bit for all interrupts but the first pending one
+	 * avoids hardware bug that occurs during read from claim register
+	 * with more than one eligible interrupt.
+	 */
+	hwirq = readl(claim);
+
+	/* Restore previous state */
+	for (i = 0; i < nr_irq_groups; i++) {
+		u32 stored = handler->enable_save[i];
+		u32 written = i == hwirq / 32 ? iso_mask : 0;
+
+		/* If we did not need to change the mask, no need to change it back */
+		if (stored == written)
+			continue;
+
+		writel_relaxed(stored, enable + i);
+	}
+
+	return hwirq;
+}
+
+static void plic_handle_irq_cp100(struct irq_desc *desc)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
+	irq_hw_number_t hwirq;
+
+	WARN_ON_ONCE(!handler->present);
+
+	chained_irq_enter(chip, desc);
+
+	while ((hwirq = cp100_get_hwirq(handler, claim))) {
+		int err = generic_handle_domain_irq(handler->priv->irqdomain, hwirq);
+
+		if (unlikely(err)) {
+			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
+					    handler->priv->fwnode, hwirq);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
 static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
 {
 	/* priority must be > threshold to trigger an interrupt */
@@ -424,6 +531,8 @@ static const struct of_device_id plic_match[] = {
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "ultrarisc,cp100-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM) },
 	{}
 };
 
@@ -658,12 +767,17 @@ static int plic_probe(struct fwnode_handle *fwnode)
 		}

 		if (global_setup) {
+			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
+
+			if (test_bit(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM, &handler->priv->plic_quirks))
+				handler_fn = plic_handle_irq_cp100;
+
 			/* Find parent domain and register chained handler */
 			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
 			if (domain)
 				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
 			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
+				irq_set_chained_handler(plic_parent_irq, handler_fn);

 			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 					  "irqchip/sifive/plic:starting",
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

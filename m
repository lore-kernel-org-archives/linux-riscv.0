Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ADECCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPfpyRFZImONxlLGuWEWEtpvfDDcJcQ5gJf+NNkg/Ec=; b=rDjs4r4rX9fY54
	+aqmD04nFiRaft9ypiCDMRhnM+C6mLtI9VpbJlrN2kstLu/CcnVvEovlufn5ISqEAPno2sQgAg40z
	te8tRY9oiGfJxS8eV7Savm8M13s0ac4qB3jU7xc8+FH3Yh+xh8njItlYZTcefVwIxDRsWglb8xH1v
	G+uCwNVKq2UdJqT6MDvhwaiW7trNziPFx1fqiq7gu5svIoBABT4yLndgi6Dtd0WMIHmdaHoB08e41
	vwBT52OZN+P5xQsuBS6eXtdRgmrM2N5RqfUoCGi+BBjzV2VHn7UWVsPHoYjtZ7idyjJzHIVvZcGrB
	oAozS17vbKD117JPgkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92XG-00000001tRm-0wRD;
	Wed, 15 Oct 2025 14:31:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92XD-00000001tPO-0aqL
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 14:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760538682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ3PbqPH/LPP3qCouoXc35gFS4lh1EqDc5ueYOQ4ME8=;
	b=RHmpMN3ZdIL7zQZf9L/FYxNPtQ7odnUacF4qAhzdWDXIDKgUDT4cflSxgh54PrwqH7f+Qj
	TnXRt2F45+/Tvs7SJHE0rT+g8bHyzSdRuuOnHJBfyUR/UwwR1b83KvPCw+0jTyxYxbh1PS
	aoWmNKQZSm114zgCsdi/8HxReXONtj8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-X5OW8Ax0MBekIbv3oWDDTQ-1; Wed, 15 Oct 2025 10:31:21 -0400
X-MC-Unique: X5OW8Ax0MBekIbv3oWDDTQ-1
X-Mimecast-MFC-AGG-ID: X5OW8Ax0MBekIbv3oWDDTQ_1760538680
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so10541085e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538680; x=1761143480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ3PbqPH/LPP3qCouoXc35gFS4lh1EqDc5ueYOQ4ME8=;
        b=mVcszGe7msj51s/G5qeMK90yNS+37mBsYLqgUhLWUHz0Y/tfK8De6S5nA8UNukj4g5
         HP6pKUbNjVdQO3mO4EMdDdiCjIgyYsDdL1UBUA92GMk7NdwVFUt+yzBeYo5JnYZkfidk
         B9KlMZRPLJXsYL5baVY9El7WBioahxtdUDpn2u+Dw81HfCBi0zKwX1cjXRr1I79imfNY
         EfIyz4doGTaT1lSibM70od8XB5ux/AKEwBUMT95aes9vbLD/9zRowESHuGwvGBQbiMmV
         AQQYJLfIoSjptzJ0jGZQVJrOuzXGGAdRNwal/AmpLQx2sw2rl00PqvGbv3HQ1qxg1SfM
         pJPg==
X-Forwarded-Encrypted: i=1; AJvYcCVEOFFjteJoOwG1T2wg28+lKoF5QRQCzbNPiaZiwrjBnidul/KJaO0rkIjCfJOlKu1ZvVAj2gjP3jQXLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytYypM/leruL2k0Kj193XI1ky4M/wuBb+dMrhPovCU+JaT9yYp
	x05KjFs42XtFO5XnZ2vAfsb5ekvAH6b0Pfa0V+oXufU00pa9Zj1TbVujquBlWMzoxhFGUzzLWnG
	0dOTJ0byjXIhkiX5i5tXqwKOJBN8hqVzhT6PRapYUgTUTX/Il6vkxHnFsSkLm0dH847SjgQ==
X-Gm-Gg: ASbGncvOUrAuL2E4v4BXEF7hzWIC0Om+DSof53LnmqLvZe7GKixfjihi8S5QsV7Ht9Q
	pOTw4X81ZcJ+XcUz0nCD/HlWKdWqBUgtEuL3YU6FvqUint/MEeYg7eIbjw61D+zsZiFdjym83aJ
	sVsRHEAgOnxsxaH1MP1K1utIYN6a9GpRYhCjTHLXYTswY2PvEUntJzfd4zNxohPY0mkQ2sqRP5t
	W5exzN+SmML1516NPtEfnxJSAKiHcnww4FH2Ed1aJWfcXarNhkFLGKVZ4FaP+jACsE/I7VbA3se
	VEOOU4rBsap4gsg7bRdj7D2E+kzXTvCGbGWYZTcst+0udEMe+thUVRw=
X-Received: by 2002:a05:600d:420d:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-46fa9af9041mr215934815e9.22.1760538679832;
        Wed, 15 Oct 2025 07:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLp6f6711sgQUKuizHpqV871t5JrC5QuuNz5v7X1cxT23Pw64P4dbArMvd8WIxfdbe/kLA1w==
X-Received: by 2002:a05:600d:420d:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-46fa9af9041mr215934555e9.22.1760538679364;
        Wed, 15 Oct 2025 07:31:19 -0700 (PDT)
Received: from holism.lzampier.com ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c02377sm32617005e9.6.2025.10.15.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:31:18 -0700 (PDT)
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
Subject: [PATCH v4 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Wed, 15 Oct 2025 15:31:07 +0100
Message-ID: <20251015143108.441291-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015143108.441291-1-lzampier@redhat.com>
References: <20251015143108.441291-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KkuKzXr6GDuBW3jGUsi7SatVoe8y6bL7Kz3vS5zMM9M_1760538680
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073123_258863_4D74C81C 
X-CRM114-Status: GOOD (  22.64  )
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

When the PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM flag is present, a specialized
handler (plic_handle_irq_cp100) saves the enable state of all interrupts,
disables all interrupts except for the first pending one before reading the
claim register, and then restores the interrupts before further processing of
the claimed interrupt continues.

The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
This has no impact on other platforms.

Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Acked-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 94 ++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..0428e9f3423d 100644
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
@@ -394,6 +397,89 @@ static void plic_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static bool cp100_isolate_pending_irq(int nr_irq_groups, u32 ie[],
+				       void __iomem *pending,
+				       void __iomem *enable)
+{
+	u32 pending_irqs = 0;
+	int i, j;
+
+	/* Look for first pending interrupt */
+	for (i = 0; i < nr_irq_groups; i++) {
+		pending_irqs = ie[i] & readl_relaxed(pending + i * sizeof(u32));
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
+		writel_relaxed(new_mask, enable + j * sizeof(u32));
+	}
+
+	return true;
+}
+
+static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler,
+					void __iomem *claim)
+{
+	void __iomem *enable = handler->enable_base;
+	void __iomem *pending = handler->priv->regs + PENDING_BASE;
+	int nr_irqs = handler->priv->nr_irqs;
+	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
+	int i;
+	irq_hw_number_t hwirq = 0;
+
+	raw_spin_lock(&handler->enable_lock);
+
+	/* Save current interrupt enable state */
+	for (i = 0; i < nr_irq_groups; i++)
+		handler->enable_save[i] = readl_relaxed(enable + i * sizeof(u32));
+
+	if (!cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable))
+		goto out;
+
+	hwirq = readl(claim);
+
+	/* Restore previous state */
+	for (i = 0; i < nr_irq_groups; i++)
+		writel_relaxed(handler->enable_save[i], enable + i * sizeof(u32));
+out:
+	raw_spin_unlock(&handler->enable_lock);
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
+		int err = generic_handle_domain_irq(handler->priv->irqdomain,
+						    hwirq);
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
@@ -430,6 +516,8 @@ static const struct of_device_id plic_match[] = {
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "ultrarisc,cp100-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM) },
 	{}
 };
 
@@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
 		}
 
 		if (global_setup) {
+			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
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

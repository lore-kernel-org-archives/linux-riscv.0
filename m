Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F6CCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13LKUo8S8arNNFtPZfiLoDPMoWm647JDMwyTIIMzL2g=; b=dP9aH/C60glhgA
	KyjNwn3IPKCSwl5jJVeGdXV7o5CDal1uOwDd7ccf821yN4iONgdsMDFemZWJdtxC6UT5OM3RmjbHV
	nnLITFuunmi0zRqwgQPXFZF1WeUZRNOxZkND0BJxfR+3OZiAzSuR6TuhneIMhF1jLg3SKT/mJmbPz
	YaOBWDz57EiwFtCia5n8v708b9bUgqJFp12kLswZ0qnlAwyUhYyOBikHZNk5jAlL0XfKAW5/rb0+V
	CE0UgZOnk5qt1/3vgqKBSVMY4Dku91BcvlVeOK5AqY6b/Piaxz7sklZ6i13hqDyUCajhaKHqk5499
	FYTU2YbGMkGTKWk8lamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIP-00000008jml-0gPn;
	Fri, 24 Oct 2025 08:37:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDIM-00000008jkt-2kfP
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 08:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761295029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IT49IQx4naO1r1BdT6bWbCUaLMDI3v7xXAjUka+ohY=;
	b=fEElAK+a+dVgudEnwFoY9h6BHE3MmNCUGyXGgpYsIDraj781LxcbuNx+/vvD7aQUKd3OCN
	zW+IyNb8x5GSOy4OYUvjvJStM5kTR7CDixpYH5ZkjwvNPYqR2EvM+rA74TAnnVoamfSm9w
	iDmypShvvkO8zCX3sUvSOg3OJE0aOL0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-6IFefVyOMP6rOmqtYkvSpQ-1; Fri, 24 Oct 2025 04:37:08 -0400
X-MC-Unique: 6IFefVyOMP6rOmqtYkvSpQ-1
X-Mimecast-MFC-AGG-ID: 6IFefVyOMP6rOmqtYkvSpQ_1761295027
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47108163eeaso9189705e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295027; x=1761899827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IT49IQx4naO1r1BdT6bWbCUaLMDI3v7xXAjUka+ohY=;
        b=kydkVXxIuBhgVl/jiC+0Ofn7cRbSLK75H8SGu77sKsH2QIRfUL2s6eEAA0bNOKUCkf
         s1NpsLvFTlTST7Wa3qfh/ZjxI/GtW4n7+sSP16mO1vjRVKFydvKYNloe0FIZXieqI1AE
         cBjQPThvWH5A0iTidECZl8cosRNYUR0DIyStqekDHMdGlYRU8zUVV/G6EAH2w6KK7lev
         s+1zPEwMLK6SKe+Nya21aDA1r9KgIGASJqjq1YEvH1bqJSbPJlY0TjQbJtw0QC1/Pcu3
         ZtUytes6hktnxo2ZbMb3vYkh+cosZY1gWfzBGISS0cQ7dsbLmTfDs+pNeUt8kp5BbSsW
         5VLA==
X-Forwarded-Encrypted: i=1; AJvYcCUCpUHuxtwDKn1HXIjF+RirlNoRDlmS1aLrPoMS4yFGzwBi/tNH2oynKrKevpEgG6OwmP3yIoKGiQ4WEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YytcxOIEOe6SSmlufIeopxkKh7eKV1fO/sdi773gDnoP7MeDirK
	tVliN3uPBrlDGkZSeKZge0MKms6DYWz7ofAHZISrOFf5ZyJXCBgQ73EO8qBIGqfCDjjEViYGpDT
	zvwV6Fo/TfedBXZWXWVtvsvjRrCIa4tZYDCI+PMOGnNXrAeHNM5k3rIj+K14Yp/oRzZsBTw==
X-Gm-Gg: ASbGnct9EgKISsDgouOe+JoikPWmbTl21VJZ0UfUfZlLuDrJ9ke5NChSZ+ARlNH3KFX
	MnkPIlTbK1KffyEyuavl1pzjT83SHfgwmoUrd6y21xcK6olaFcEgT0zZLSVMyDHvkDmYf1Kc2cA
	yAneUDPFG7ujee31YxH8IMIJFLQGsK4TkLaO9oZPP5tIqWTwb6GWlUmiUeT/OoJ0MjpaD8ZDT7d
	eu6GV84N2BCUyvjM+UWyr7eSLIi6STMhdYNkrgeROOv+Ys8vME/G6pQm2j6zITwh2BO2IagGZaz
	ZsuB/hTIYrAw1j6NFutWqqD0/0hUTBzHEZ2rwtoEmnyXxqDKDoc2Wmv8xe6dQPDBXrFAKFW7gyX
	aKuWCo7UW
X-Received: by 2002:a05:600c:154b:b0:46f:b42e:edcd with SMTP id 5b1f17b1804b1-47117925d59mr167079985e9.38.1761295026812;
        Fri, 24 Oct 2025 01:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHABp1V97kl04EvJJ7E4Ix+e6A0Tpy/3SLGTAbnd7bu3MUfhtp6cG5IYxmZlmc9oJMTlIO6zw==
X-Received: by 2002:a05:600c:154b:b0:46f:b42e:edcd with SMTP id 5b1f17b1804b1-47117925d59mr167079575e9.38.1761295026379;
        Fri, 24 Oct 2025 01:37:06 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm8111636f8f.2.2025.10.24.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:37:05 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:36:43 +0100
Message-ID: <20251024083647.475239-5-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024083647.475239-1-lzampier@redhat.com>
References: <20251024083647.475239-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I_bAQxrqUPMGQ3lP3AJjMGk8dglvCrIi8ckF_h4YwH4_1761295027
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013710_769277_3F35D256 
X-CRM114-Status: GOOD (  26.27  )
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

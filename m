Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857E9CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFfTTyqKGmC4cFWcMQqjFe+LVhdnzkNENyTOrvrHVAo=; b=MeRWkf7sb/pvLW
	2t1H+ckYK4qHpUnAuotfd2MSA6kLK2yJSSvpuIPnKI8RlqNrcrzL138wVtfm/ZFZDjSkspoyEisqO
	ufMUYfFBZt1y6hZFSvM6j66htpRe6iFR9dxcW1IkJs/mDflHbPYgaAftY2SZNUqJ4PnvlTDqL9b4+
	IYgF9Ai2bTHOXBaX2LCXVydL8OcO0Tppfno+QQIXvEYBUT2nc7KZ7ZKBMMoW1GytWABYTTTIe9FXa
	3cUpfSCtJTHfcC0vPaUV5a/XyzdjWoRyxK78Mc6xML61S5PWjOxTJLzC3SwwfOACuOHAUB+iFkbpC
	PweDrZ+g8etJiRJLfcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ja4-000000040nr-11YZ;
	Thu, 16 Oct 2025 08:43:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ja1-000000040mL-1qfg
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760604204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ax80nK+NKV6/YU/qBv9lphSIJ/vcwRTM2uSJVvNymrE=;
	b=DdxIabWZP0pKkmeYGOrdEplFzKXpe863BSi0JEmTnmahmf4ceWtQRXqzYUkd63JUSMmrdF
	9p8co4bxg6z/go1bJQTiTO0QpJo4XXppg3++Afiph3kV+OVqSpfFb2Xift00JjDqdEVbqP
	DsDGmBnDQOphFRwxXKydsMHKh11D0PE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-6TFi88oRP02BrpODo5drtA-1; Thu, 16 Oct 2025 04:43:23 -0400
X-MC-Unique: 6TFi88oRP02BrpODo5drtA-1
X-Mimecast-MFC-AGG-ID: 6TFi88oRP02BrpODo5drtA_1760604202
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47113dcc15dso2015685e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 01:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604202; x=1761209002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ax80nK+NKV6/YU/qBv9lphSIJ/vcwRTM2uSJVvNymrE=;
        b=c/QVrWW83rohaWpyzlXalW0aXV7uAZtL7Sf0STi4jogwc/PCSDjOBWUAELWGYNDwjP
         yLYRNGCfE0HCSbHW/+fC10rE9ACVoYjQMj9CW3tov/VmoDV+3sd0gQh5WeOn6zUn7n0Y
         4QbmU+I7ubY9hnkeQ8+NVibFCwDy75uOgs2KQKUbnF9q9L+9hN1jrVhK7wE3JBh8JQtE
         J8QqrwJ5nW/dEtlpiZi2XLM1dfBnyWsAHlaJdVsFkVDzfljACUAhCdJXbWHV460Glt7n
         5ucX3kpdywmU4OtLCqMqBPIVmlV/kJAcgdgv3hcntTnGQsT/Uao/MuZMMhlew+I220aR
         f7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCX9nPT+xRDzTqi8zbL9rHRDSDtZOv0QaOy38ZzfGRE6WUsBE/4iO6N5Ihjl9wgt5PGfQ6EeYOvxf1n0fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKqKWZ/JIRynTwh/8otZQpGAVS5T4lVApCx3PBwxEnynfPn7kZ
	5PBFd7NfMXExct4ve4VgCP7CU2vNfocf+Hg79OUfhVoocrVsfRM6qLd75ii1GXBUIxHzD3JNizS
	Vancd0iTJcMSygsIPGapoOSTs1x2YOkfLV97q1EYrryw0SXRVbHOEVhHkbrnuEErsyJbAtg==
X-Gm-Gg: ASbGncu1tOAHbQ3zNZ+EfF1e8vMhEAVVGb0eiLkdzwR9WGttGXX9WQd+jCCV/UR1LS4
	lTMFwAb+n1MIFMEC5kPpMGM2PwPIF+UWlb32jyIGfDdq1OirwfhUZrlwtgFEpkQYSK9PYyUDgCn
	dIEmv3Rc5JaPhOKXDFZF8q8uggijnLtp6clvzNKuDf5AszIBvahzmlYvPyR61eqvIhoB+5APLuL
	AipQwTDleuZZAV3UCeVXM0ETSXFcYc6xKdPKGYW3lQ82IIB8E9oJoWVOUPcZUYYTgnNomIOC9LN
	Mwy9Jua23kK1XMxHV0UQYKDcddYfAA98WolUyGgf0Tv3UOAijaneKeDeDgSmKjh6MtI2BGQI+Xv
	xJIPNyt8z
X-Received: by 2002:a05:6000:40c9:b0:426:d619:cac7 with SMTP id ffacd0b85a97d-426d619cd64mr12707401f8f.36.1760604202125;
        Thu, 16 Oct 2025 01:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE87h87L5+cjbKqDzFGeScqw+GJyAWKB/ZTf9y7pe94sr7jbGPA3jOKyUr3qhAx/eeHS0qseQ==
X-Received: by 2002:a05:6000:40c9:b0:426:d619:cac7 with SMTP id ffacd0b85a97d-426d619cd64mr12707369f8f.36.1760604201696;
        Thu, 16 Oct 2025 01:43:21 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33047565f8f.45.2025.10.16.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:43:21 -0700 (PDT)
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
Subject: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Thu, 16 Oct 2025 09:42:56 +0100
Message-ID: <20251016084301.27670-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016084301.27670-1-lzampier@redhat.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V8pta4w2gTShG-Hdt6h_l-AXzqkQEMfa9WcLDD7qC-o_1760604202
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_014325_647184_8BA01B85 
X-CRM114-Status: GOOD (  22.59  )
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
+		if (j == i) {
+			/* Extract mask with lowest set bit */
+			new_mask = (pending_irqs & -pending_irqs);
+		}
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
+	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
+	void __iomem *pending = handler->priv->regs + PENDING_BASE;
+	void __iomem *enable = handler->enable_base;
+	irq_hw_number_t hwirq = 0;
+	int i;
+
+	guard(raw_spinlock)(&handler->enable_lock);
+
+	/* Save current interrupt enable state */
+	for (i = 0; i < nr_irq_groups; i++)
+		handler->enable_save[i] = readl_relaxed(enable + i * sizeof(u32));
+
+	if (!cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable))
+		return 0;
+
+	hwirq = readl(claim);
+
+	/* Restore previous state */
+	for (i = 0; i < nr_irq_groups; i++)
+		writel_relaxed(handler->enable_save[i], enable + i * sizeof(u32));
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

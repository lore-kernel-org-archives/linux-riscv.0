Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11ECCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc7YL2Bm4cOlzFdOVr9f47Ev67F29uqP4kF0KCD7+hY=; b=AaZk7AxYva4Ze7
	yPrhycDrPv1nqTto/OednDK5g1xZ8pyM1SlU2BmLoW727IfBM5GrMMYkMn75DemUYk66oDEzRbxrU
	xsspiiWTcEQcMZsp8Ax9LSTcZgRccvJeldDP3rOLdye08K27JxHTLqGKcnWu3w6x9sQTtAXuD0PAv
	wYRu12dYeFjrzvWtiSH9dUS3wlqesP4ta9bwllPH+UV1TNtOQKox5LGO60/j1P1aOtLNCTSVSN4QT
	+nYgVzTbQsAx5QT27jEMBb6iy2XDjAX21Njlxo0k+AlDCkVWtE2j6I1GVFd0cly7eNYuadyFT2aHQ
	H/JOTjNPLomgxTJD20tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9Q-0000000GslX-1XPD;
	Tue, 14 Oct 2025 15:41:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9O-0000000Gsjn-1p7P
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 15:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760456481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7lZewkuBAVdyN4JZJP+nOAcqX15LbPPR5tHpYtIJSQ=;
	b=Z8vEWv9yjVs5wjGoyjnsNWYIufiAIR21ipzh1dopgn8K5su9O3KM0yK5ZPd7n3y8U5186T
	1uhqxMAkSo8mevfff7jpjz9Ua64qfGjxw4Tu6qYPguGV4S2CrWHTUKjPNM5qk0rnC8MkW0
	OnOZcR1Q/0q0CZgycCUcqfO1Wq7mV38=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-W_SuLGvTNvC0UrBANiEAFQ-1; Tue, 14 Oct 2025 11:41:18 -0400
X-MC-Unique: W_SuLGvTNvC0UrBANiEAFQ-1
X-Mimecast-MFC-AGG-ID: W_SuLGvTNvC0UrBANiEAFQ_1760456477
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b47cf7544e0so541090866b.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 08:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456477; x=1761061277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7lZewkuBAVdyN4JZJP+nOAcqX15LbPPR5tHpYtIJSQ=;
        b=fRNCiLIsIRIKUUg4QbcmTfafPGoUx8RjIsUgftkLu1fReYSX0jsRnylMHXsEGZiP82
         I3KzcMJCuJZDJZGWHCS8E00Kt1IMxXhe4BmyRrsD53zVvyoqbpXkJn/UlcasE4FiAVrb
         BRH98skizgJUhykwTeKJI15SBhIeumaGBZEGLExZ5dHLp0DlkBMI8UkWjbGRNv/M4ycY
         2pjEODD3PZDGHbNqXTT4F7yIOP6uBgHwWnX4n94p/aaul6Cwc02pdjh/pCVKlU7d8UQf
         t6jKVuIyYuuBmgeO6ZLJMtybWwiZ+rBamTmwFIY1wQFPWz+V5XzIbOXX92+vDNeKFrk4
         o2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVwRqsABQZjysXIQNOhGWCUAXECpy9BJEJOoMM8Ah14wHNE2ReZ5YEGbkHTlDaz5PFmOZScQyvYylTXUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCGfWmT3lkCc5zvq9hUnu03hzsU8okkbjOTaisik1jtVsYhd2
	7zgwuFx+ZrrAvEwmL4abTbrrzx/DsdOQmsHboUlfaJYtSwBuV73DlmxeL2ZFUXrykN4Oqn8IQD2
	Lqd/5kQN8fTDllwZsIeM+rop1uBun16wk8UPFknRi527GiJSIRsMHQ1S6Qdsi5mmmSMzKqg==
X-Gm-Gg: ASbGncuvK/e+vLp3YDwSeKDXGsWkrM8xvGwUt8KGtzYNGOV15juCWMCJ16AdCHRukHq
	o33sTJE7tB2AjzVq8pDzgOTAiB99rqAsRw7Z20LNufjld0lhPSKCm347WwY/Nq+PB8Oma1uIGY2
	SZasZzH1+R+TKMebYkQdmJ7uHUg2cXvXtMEJmB7E6EIwBGUq4ui8aPlSh9gHf2W1lW41KW0Tdmu
	UU0cPPMkQLLJ5PRPyK5bpaa2GsASTkVzsb9NpN1VzdC0I6LsTvCnLoL6VmrW0kzI79astZ/cytY
	cT0XLs5lb8RB34Dfg+TyDatmnQb1olkYH14th100XkHfppD8Wg==
X-Received: by 2002:a17:906:c14c:b0:b49:96e4:183c with SMTP id a640c23a62f3a-b50a9a6cdebmr2459861166b.9.1760456477256;
        Tue, 14 Oct 2025 08:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxi3HOmmPdFAXXJcKIC3OMf7TwEi8WYlD9KX4pDU2Vz/Xka6zpLXX+wOVIoz+BKQRNnG1wDg==
X-Received: by 2002:a17:906:c14c:b0:b49:96e4:183c with SMTP id a640c23a62f3a-b50a9a6cdebmr2459858366b.9.1760456476812;
        Tue, 14 Oct 2025 08:41:16 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba45b3cbsm7897866b.40.2025.10.14.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:41:16 -0700 (PDT)
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
Subject: [PATCH v3 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Tue, 14 Oct 2025 16:40:57 +0100
Message-ID: <20251014154100.168236-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014154100.168236-1-lzampier@redhat.com>
References: <20251014154100.168236-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o7XneMPnI-oReWddwRq8oreSZUX_a_sbCSjeTOD73VY_1760456477
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_084122_576115_E6B0C814 
X-CRM114-Status: GOOD (  22.82  )
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

When the PLIC_QUIRK_CLAIM_REGISTER is present, a specialized handler
(plic_handle_irq_cp100) saves the enable state of all interrupts, disables
all interrupts except for the first pending one before reading the claim
register, and then restores the interrupts before further processing of
the claimed interrupt continues.

The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
This has no impact on other platforms.

Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 94 ++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bf69a4802b71..1d528904b353 100644
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
+	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
 	{}
 };
 
@@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
 		}
 
 		if (global_setup) {
+			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
+			if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
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

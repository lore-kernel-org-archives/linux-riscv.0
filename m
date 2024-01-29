Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D6C48285
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TWDSZ13uPwhJgKdQXX6WqYb6k6hFkLjOaG8VkLBxkE=; b=UXwpVSVlgoE9HV
	LKgw+aXRivlQEiKjk2R8I3kS3lUxwqZQ5d7wEig7DUVcCyhB6lUyWCwUQcCyd9q2ZPMH8mJUi6mC4
	R7NhcVHAowGVrldzWtKPpdCqpCyjOFYTmhhu0oEYt+GNm678BElv1An+iij9IbISbVt130DdGHc92
	m8J4zJh46pXEaeXh0NjdAuk+VG4fE4lPZ3sKAGZLHlF0U5fWBAXlmeJWhLm3cGCedQq+yk4UxK47x
	5SYaziD/3QqxLvqQRxYsLvyVCL2kZfQROw45w2SjPXb12oWd25sUdbygXzHE7aAc32lyaxbNVqmFI
	aOtRu7AzQABL5rJBjOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTNE-0000000DE45-1mif;
	Mon, 29 Jan 2024 15:16:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTN8-0000000DE1W-3BH3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40eacb6067dso43789435e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541389; x=1707146189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IASguh5aQbxO74V2rxNG4OIKBUmHt4c+RrRbON3ICTE=;
        b=Obd6C8f8a3WZgAFxMnOvibAhtwFdGMShd6nD/rXM/T2rWI7gMLs+VBIxVk4oNtYFG9
         q/e5olwJvyq43jugfZtYtVB36kHnp67npW0mu4f7v9W9AApd1WEetM9n1RLfaaDAUZjw
         jt1sJ6dUDQtWo4Ax20/1ypYU1FGQR/S7vpl58erBFzrNPYnaobE6tZzWSAeMfeCLisMJ
         Pt/AhFhGojsxYzBe+p99tYq2u8DUDgMcahyjRUWaUYUKIlK57anUdtPr50sqhwz7K9cR
         JJZkzPHBjRhpHhaMh9ggqFymGka9jDYiBdvWrcM3WLHKVK4cMk8j8CgQCf4HY3yJNKNw
         z6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541389; x=1707146189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IASguh5aQbxO74V2rxNG4OIKBUmHt4c+RrRbON3ICTE=;
        b=A5JxoTCh4v74SdwQuPBhZHRTe1xUhPS1EQXOlyvH4oqbaPkGY4E3ee3XJCkFCPKxlX
         c9/9DALX6QnXy/gKYns5L1pUnEjHN4dOOMZZxsjvsT+faPZ2DHJkznqxQuA5itKqsUAn
         PAPGr/CcklmJ6I3EIZBUp5d+oywoN4IVNxsBqtWHCfWSiiDucdJexj/L979VAEzkT7Qj
         lzBRQ/TebP9D6XeGV/NMxAV+r9I8oZAzGwn3UG99GtYSrIzypEEmSFLYbTeO+8G+4wjk
         ytr22eZVhfdpFgBtsGSmjG1nXBk+9zk9mcx6HizPs2XDkmmHvwEKmmCn/FsNO3+RX1CD
         Lzmg==
X-Gm-Message-State: AOJu0Yw0lPT6Xbvh1Wn7x9LfMPvtMuV5V3Oswyt6LyO4r5Rm+w/adZoI
	u9csZw/8F740/9507pxmHsnWMDBuIDFsINkfpGFOvQNzb3FD01yg
X-Google-Smtp-Source: AGHT+IHoTFuNLMl927g6cbRBKakXRsPcfNSENOcUKWQPxS8T5mWHuxTtNY/sAOmh7UhnSu91nJUrSQ==
X-Received: by 2002:a7b:c4c5:0:b0:40e:cf0f:5fc9 with SMTP id g5-20020a7bc4c5000000b0040ecf0f5fc9mr4687262wmk.31.1706541389323;
        Mon, 29 Jan 2024 07:16:29 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
Date: Mon, 29 Jan 2024 15:16:15 +0000
Message-Id: <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071630_830145_C9B8520B 
X-CRM114-Status: GOOD (  20.26  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The IX45 block has additional mask registers (NMSK/IMSK/TMSK) as compared
to the RZ/G2L (family) SoC.

Introduce masking/unmasking support for IRQ and TINT interrupts in IRQC
controller driver. Two new registers, IMSK and TMSK, are defined to
handle masking on RZ/Five SoC. The implementation utilizes a new data
structure, `struct rzg2l_irqc_data`, to determine mask support for a
specific controller instance.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 132 +++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 9494fc26259c..949280f95c29 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -37,6 +37,8 @@
 #define TSSEL_SHIFT(n)			(8 * (n))
 #define TSSEL_MASK			GENMASK(7, 0)
 #define IRQ_MASK			0x3
+#define IMSK				0x10010
+#define TMSK				0x10020
 
 #define TSSR_OFFSET(n)			((n) % 4)
 #define TSSR_INDEX(n)			((n) / 4)
@@ -66,15 +68,25 @@ struct rzg2l_irqc_reg_cache {
 	u32	titsr[2];
 };
 
+/**
+ * struct rzg2l_irqc_data - OF data structure
+ * @mask_supported: Indicates if mask registers are available
+ */
+struct rzg2l_irqc_data {
+	bool	mask_supported;
+};
+
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base:	Controller's base address
+ * @data:	OF data pointer
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
  * @cache:	Registers cache for suspend/resume
  */
 static struct rzg2l_irqc_priv {
 	void __iomem			*base;
+	const struct rzg2l_irqc_data	*data;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
@@ -129,44 +141,136 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
+static void rzg2l_irqc_mask_irq_interrupt(struct rzg2l_irqc_priv *priv,
+					  unsigned int hwirq)
+{
+	u32 imsk = readl_relaxed(priv->base + IMSK);
+	u32 bit = BIT(hwirq - IRQC_IRQ_START);
+
+	writel_relaxed(imsk | bit, priv->base + IMSK);
+}
+
+static void rzg2l_irqc_unmask_irq_interrupt(struct rzg2l_irqc_priv *priv,
+					    unsigned int hwirq)
+{
+	u32 imsk = readl_relaxed(priv->base + IMSK);
+	u32 bit = BIT(hwirq - IRQC_IRQ_START);
+
+	writel_relaxed(imsk & ~bit, priv->base + IMSK);
+}
+
+static void rzg2l_irqc_mask_tint_interrupt(struct rzg2l_irqc_priv *priv,
+					   unsigned int hwirq)
+{
+	u32 tmsk = readl_relaxed(priv->base + TMSK);
+	u32 bit = BIT(hwirq - IRQC_TINT_START);
+
+	writel_relaxed(tmsk | bit, priv->base + TMSK);
+}
+
+static void rzg2l_irqc_unmask_tint_interrupt(struct rzg2l_irqc_priv *priv,
+					     unsigned int hwirq)
+{
+	u32 tmsk = readl_relaxed(priv->base + TMSK);
+	u32 bit = BIT(hwirq - IRQC_TINT_START);
+
+	writel_relaxed(tmsk & ~bit, priv->base + TMSK);
+}
+
+/* Must be called while priv->lock is held */
+static void rzg2l_irqc_mask_once(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
+{
+	if (!priv->data->mask_supported)
+		return;
+
+	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+		rzg2l_irqc_mask_irq_interrupt(priv, hwirq);
+	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+		rzg2l_irqc_mask_tint_interrupt(priv, hwirq);
+}
+
+static void rzg2l_irqc_mask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+
+	raw_spin_lock(&priv->lock);
+	rzg2l_irqc_mask_once(priv, irqd_to_hwirq(d));
+	raw_spin_unlock(&priv->lock);
+	irq_chip_mask_parent(d);
+}
+
+/* Must be called while priv->lock is held */
+static void rzg2l_irqc_unmask_once(struct rzg2l_irqc_priv *priv, unsigned int hwirq)
+{
+	if (!priv->data->mask_supported)
+		return;
+
+	if (hwirq >= IRQC_IRQ_START && hwirq <= IRQC_IRQ_COUNT)
+		rzg2l_irqc_unmask_irq_interrupt(priv, hwirq);
+	else if (hwirq >= IRQC_TINT_START && hwirq < IRQC_NUM_IRQ)
+		rzg2l_irqc_unmask_tint_interrupt(priv, hwirq);
+}
+
+static void rzg2l_irqc_unmask(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+
+	raw_spin_lock(&priv->lock);
+	rzg2l_irqc_unmask_once(priv, irqd_to_hwirq(d));
+	raw_spin_unlock(&priv->lock);
+	irq_chip_unmask_parent(d);
+}
+
 static void rzg2l_irqc_irq_disable(struct irq_data *d)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 		u32 offset = hw_irq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
 
 		raw_spin_lock(&priv->lock);
+		rzg2l_irqc_mask_once(priv, hw_irq);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
 		reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
+	} else {
+		raw_spin_lock(&priv->lock);
+		rzg2l_irqc_mask_once(priv, hw_irq);
+		raw_spin_unlock(&priv->lock);
 	}
+
 	irq_chip_disable_parent(d);
 }
 
 static void rzg2l_irqc_irq_enable(struct irq_data *d)
 {
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
 		unsigned long tint = (uintptr_t)irq_data_get_irq_chip_data(d);
-		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 		u32 offset = hw_irq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
 		u8 tssr_index = TSSR_INDEX(offset);
 		u32 reg;
 
 		raw_spin_lock(&priv->lock);
+		rzg2l_irqc_unmask_once(priv, hw_irq);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
 		reg |= (TIEN | tint) << TSSEL_SHIFT(tssr_offset);
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
+	} else {
+		raw_spin_lock(&priv->lock);
+		rzg2l_irqc_unmask_once(priv, hw_irq);
+		raw_spin_unlock(&priv->lock);
 	}
+
 	irq_chip_enable_parent(d);
 }
 
@@ -294,8 +398,8 @@ static struct syscore_ops rzg2l_irqc_syscore_ops = {
 static const struct irq_chip irqc_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
-	.irq_mask		= irq_chip_mask_parent,
-	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_mask		= rzg2l_irqc_mask,
+	.irq_unmask		= rzg2l_irqc_unmask,
 	.irq_disable		= rzg2l_irqc_irq_disable,
 	.irq_enable		= rzg2l_irqc_irq_enable,
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
@@ -371,9 +475,23 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	return 0;
 }
 
+static const struct rzg2l_irqc_data rzfive_irqc_data = {
+	.mask_supported = true,
+};
+
+static const struct rzg2l_irqc_data rzg2l_irqc_default_data = {
+	.mask_supported = false,
+};
+
+static const struct of_device_id rzg2l_irqc_matches[] = {
+	{ .compatible = "renesas,r9a07g043f-irqc", .data = &rzfive_irqc_data },
+	{ }
+};
+
 static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *irq_domain, *parent_domain;
+	const struct of_device_id *match;
 	struct platform_device *pdev;
 	struct reset_control *resetn;
 	int ret;
@@ -392,6 +510,12 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	if (!rzg2l_irqc_data)
 		return -ENOMEM;
 
+	match = of_match_node(rzg2l_irqc_matches, node);
+	if (match)
+		rzg2l_irqc_data->data = match->data;
+	else
+		rzg2l_irqc_data->data = &rzg2l_irqc_default_data;
+
 	rzg2l_irqc_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

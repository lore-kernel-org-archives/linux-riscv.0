Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E8CCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldX2WSTdVGs6phe6Um2oVimPScxP9dzDOGNa79GQ508=; b=xtpvvGrRZObK01
	f01PczY/xa/hhupfXrqIyhQqOVoPYa4DTfMk5RH+LTvr9y2JUB1u3fH2sz1EB6/jFu6fow9vd+40U
	1EXRK9DqqZAwZP8Lb8ek447A3MkmXXrzJaL4RI507MiOXdXfhSHOrdV+yZDrHoaNG/CVXce9zErb5
	06mPXYet7mnqFGgR8ddmfrO6lqhOxLNo1pJRERaqKoQETQX/YqMFKd9QNDCtalf1FOQLDL6knfnW5
	BYGRQzpsYmBTLSYOoEnl4Nm1AzyLz2uRAsbS7FrqRPYm+X2XRyXuQCkMSIdPwd0irewLs4FUgGGmh
	ADbWCoC+kPXJh/9Grp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Ld-000000006sQ-2WnQ;
	Wed, 03 Apr 2024 20:36:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7La-000000006qq-0E2f
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4155baa696eso1700495e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176596; x=1712781396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMv83C9HZj+2SogqW00zXdzxUFZuc3kgXWuJykzdMro=;
        b=X8YdUW0UZ/sUb5y0F197od4sNKYlHxeFcAt4tUdAVt6tCC/D/iiLUDhUqKhmijpQVd
         WvWN91qpFfGi2qT3pHVFVoHBSONBV850wiaZWD4SplpgA4ihjzFUU9XBsTAxZ63Wt7kF
         pNPfzhoCHJDFBxm3pnkdp7An0xPOJhvjP79478uNvSCUckfdApyyxHxnsPc7gdCYiX+v
         YT5fWmToPGhgh50h1huHiLlmXKofKsAP9vhtkVNEcSzWXdN7/CMJr6+3DJZOUaZgyfkw
         mOzbMZ+z6eHbtHVbp4KasgSzfANa7IkBZocrcMjf3Rf3eLR7uPt5I9+ck9o5G6tYq+5S
         ZHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176596; x=1712781396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMv83C9HZj+2SogqW00zXdzxUFZuc3kgXWuJykzdMro=;
        b=sm8RrVgfDC49DaWqU9LYJhph2mIj3zvD6JTGTtTf9ZjnPhOLv+0yPr+4Er4v6QmYLL
         26K3c2hZ3c6QjP0IWE+ydzEHQe8eXSIaWNncl2sCrmEIAuliP2KPNOK4OV7Um9hMzaR5
         /Yc/bIAannf9SpvsLsu51nBRLLNjUFj4mPgLsHXcuiX0OM4RCcE1/6y92gD558l/GJNL
         l1S9JGOe35zJerOpWctui9X5XptWakhl6rdyW1NWZyWZ0MiKVg6Rj+ZBDs3xzQScmGJL
         um18Mwl9ewwhZ4NjsSVuDiXCzu1y1mwFKhdEfw817HeQ26eptalnfD4fb+VNY2jMncu8
         JrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Dk2g/BuIY1cPGprix27SV936c5mgIR3awDpGqkVIvP1cTTk9Wf0EVYYdJ1O+HsZrQm4i286bBbEdOLopLEnfTTnYslWoUo9cD97sg+Hc
X-Gm-Message-State: AOJu0Yx+xpPsSTjraU082Naun0KCwsXHtKLUBiYL29z1XLGpY4UqZnEv
	cd3mL/kqj5a8Wd6OjOkKX5E3jIl5yTEWNyqCF02hFpXjMEX9XYAi
X-Google-Smtp-Source: AGHT+IEiuoPlj2zo+VYIZTCevGavSKbOjyHDcIEW9nRIyqTbej1LKgxI7SRDzlI8L9bXy0Dm2IMGXg==
X-Received: by 2002:a05:600c:2285:b0:415:4853:f722 with SMTP id 5-20020a05600c228500b004154853f722mr522642wmf.10.1712176595776;
        Wed, 03 Apr 2024 13:36:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
Date: Wed,  3 Apr 2024 21:35:00 +0100
Message-Id: <20240403203503.634465-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133638_198893_0E7D2CF2 
X-CRM114-Status: GOOD (  21.40  )
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
v1->v2
- Added IRQCHIP_MATCH() for RZ/Five
- Retaining a copy of OF data in priv
- Rebased the changes
---
 drivers/irqchip/irq-renesas-rzg2l.c | 137 +++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index f6484bf15e0b..6fa8d65605dc 100644
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
+ * struct rzg2l_irqc_of_data - OF data structure
+ * @mask_supported: Indicates if mask registers are available
+ */
+struct rzg2l_irqc_of_data {
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
+	const struct rzg2l_irqc_of_data	*data;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
@@ -138,18 +150,102 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
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
 static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
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
+		if (enable)
+			rzg2l_irqc_unmask_once(priv, hw_irq);
+		else
+			rzg2l_irqc_mask_once(priv, hw_irq);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
 		if (enable)
 			reg |= TIEN << TSSEL_SHIFT(tssr_offset);
@@ -157,6 +253,13 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 			reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
+	} else {
+		raw_spin_lock(&priv->lock);
+		if (enable)
+			rzg2l_irqc_unmask_once(priv, hw_irq);
+		else
+			rzg2l_irqc_mask_once(priv, hw_irq);
+		raw_spin_unlock(&priv->lock);
 	}
 }
 
@@ -324,8 +427,8 @@ static struct syscore_ops rzg2l_irqc_syscore_ops = {
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
@@ -401,7 +504,16 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 	return 0;
 }
 
-static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
+static const struct rzg2l_irqc_of_data rzg2l_irqc_mask_supported_data = {
+	.mask_supported = true,
+};
+
+static const struct rzg2l_irqc_of_data rzg2l_irqc_default_data = {
+	.mask_supported = false,
+};
+
+static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent,
+			   const struct rzg2l_irqc_of_data *of_data)
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct platform_device *pdev;
@@ -422,6 +534,8 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	if (!rzg2l_irqc_data)
 		return -ENOMEM;
 
+	rzg2l_irqc_data->data = of_data;
+
 	rzg2l_irqc_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
@@ -472,8 +586,21 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
+static int __init rzg2l_irqc_default_init(struct device_node *node,
+					  struct device_node *parent)
+{
+	return rzg2l_irqc_init(node, parent, &rzg2l_irqc_default_data);
+}
+
+static int __init rzg2l_irqc_mask_supported_init(struct device_node *node,
+						 struct device_node *parent)
+{
+	return rzg2l_irqc_init(node, parent, &rzg2l_irqc_mask_supported_data);
+}
+
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
-IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_init)
+IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_default_init)
+IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzg2l_irqc_mask_supported_init)
 IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/G2L IRQC Driver");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

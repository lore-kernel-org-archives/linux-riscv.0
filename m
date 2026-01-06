Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AC1CD0431
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAlPL763jvUHrv8cc5a5SDVyXcAUTiTvm1jQtvKsFJg=; b=D1/Kx16K0XILIr
	YQrbnQJnIteKrVSU521NDEZA/s7k9YSm5RoQnuUTQUkeUFkY58LOjFOPo23RWkdTWsBVyZ89PhdVA
	VfEFr5OvNujuLgpcAT0W8EcPtb/7HawxQWW6It14ogrluE7IczhOwTdq7DRegA+QKw+xxtdR+QG2g
	FEb1zwuL+lj8ZcLtAtzsmxvXO/ipoGTIcGq3G2zKeA/KDVYrBYY7EZlIy6SnPIrZ4kgRfmlbvKXxp
	PSxyhzhjtI5OS5zB0++ByJREa52ap18TGA5M1OFHb/+kmfOUTUsDWGJBb8KxuIF6HzzMu/H5cdXhb
	Oh6/FlqU4Vm7EJ0Q33ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSP-0000000CMiU-40jc;
	Tue, 06 Jan 2026 03:10:05 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSM-0000000CMhL-2WfP
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 03:10:05 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 622093411D3;
	Tue, 06 Jan 2026 03:09:56 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 06 Jan 2026 11:09:33 +0800
Subject: [PATCH v3 2/2] gpio: spacemit: Add GPIO support for K3 SoC
MIME-Version: 1.0
Message-Id: <20260106-02-k3-gpio-v3-2-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10786; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=0nb3jxQTRtcOKvtrQjjeKH+5pJa7gVxQM42DMiqMS04=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpXHz49OLs6pRoGXnCwpKrwyvxmvmWPq35QPXqz
 O9zo8bbdc6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVx8+BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0yaw/9GbHQlTeHeBWoCnKp6Q11VdBicEEaJpiIzBhGQ24a3NkVYt4llHc/K
 zY8Xw31FmeZBoYU+esCzXWA6LnutwN5mEJd31IqjZO2CUkmmiws7pbiITWkgFBMzhQEUVzKwoWR
 uzvbV9n+ky2nc9NupbXPtgPjr3yj6TPUxqOZC9DkNWwOuQeBohKbOvYiYAhYVxnf7lZVq2MVRgl
 +MmyJOhJPrc2Ca79k+P+1VvFtbTlzj15zi4HrG8DrUxnbVXQZx0WUo7/Bg5l1cUWIXSxw3HLxKC
 RrPHq3kxvh3MT2HDhGXEQ/izXVCu6K2pfHiVuDDjZaJSZMehHF/6a11nl78OzZuyWu+GoB4FfoT
 UrjS7DUnpDN1QyUi1cuHGLpLgnjxy7IUNx07t5Ppm9kKPKlK+M0pIubExuo3xiBHpt6sdBrSjv4
 2zvpklpNzn3YhfqG6UFBbeeuTlpecp84fUncB28CsVvpZPJ7ZSXfrf/5sdYomYvgveY1xV3qEet
 zEbB9/8wLSyJz6tv39HbcIP2q+qlgocWUzs8AphCwhQTs+33KOEznAI5jO9nT+rWQDc5+TbxhYs
 e/t319dQ0GHzjIpn2j8AthleO7qhpKQm2QlQMuky3TRBv/7ZbAyPu2QzIA/+32VyAIBNaK15w3k
 PEAKbK4SCJzO8F5W+VA/igrAYWQt/E=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_191002_715187_D8F9BD97 
X-CRM114-Status: GOOD (  20.97  )
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

SpacemiT K3 SoC has changed gpio register layout while comparing
with previous generation, the register offset and bank offset
need to be adjusted, introduce a compatible data to extend the
driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
 1 file changed, 117 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index eb66a15c002f..8f570a1a4894 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -15,29 +15,37 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
-/* register offset */
-#define SPACEMIT_GPLR		0x00 /* port level - R */
-#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
-#define SPACEMIT_GPSR		0x18 /* port set - W */
-#define SPACEMIT_GPCR		0x24 /* port clear - W */
-#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
-#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
-#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
-#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
-#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
-#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
-#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
-#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
-#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
-#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
-
 #define SPACEMIT_NR_BANKS		4
 #define SPACEMIT_NR_GPIOS_PER_BANK	32
 
 #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
+#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
+
+enum spacemit_gpio_registers {
+	SPACEMIT_GPLR,		/* port level - R */
+	SPACEMIT_GPDR,		/* port direction - R/W */
+	SPACEMIT_GPSR,		/* port set - W */
+	SPACEMIT_GPCR,		/* port clear - W */
+	SPACEMIT_GRER,		/* port rising edge R/W */
+	SPACEMIT_GFER,		/* port falling edge R/W */
+	SPACEMIT_GEDR,		/* edge detect status - R/W1C */
+	SPACEMIT_GSDR,		/* (set) direction - W */
+	SPACEMIT_GCDR,		/* (clear) direction - W */
+	SPACEMIT_GSRER,		/* (set) rising edge detect enable - W */
+	SPACEMIT_GCRER,		/* (clear) rising edge detect enable - W */
+	SPACEMIT_GSFER,		/* (set) falling edge detect enable - W */
+	SPACEMIT_GCFER,		/* (clear) falling edge detect enable - W */
+	SPACEMIT_GAPMASK,	/* interrupt mask , 0 disable, 1 enable - R/W */
+	SPACEMIT_GCPMASK,	/* interrupt mask for K3 */
+};
 
 struct spacemit_gpio;
 
+struct spacemit_gpio_data {
+	const unsigned int *offsets;
+	u32 bank_offsets[SPACEMIT_NR_BANKS];
+};
+
 struct spacemit_gpio_bank {
 	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
@@ -49,9 +57,22 @@ struct spacemit_gpio_bank {
 
 struct spacemit_gpio {
 	struct device *dev;
+	const struct spacemit_gpio_data *data;
 	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
 };
 
+static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb,
+			      enum spacemit_gpio_registers reg)
+{
+	return readl(gb->base + to_spacemit_gpio_regs(gb)[reg]);
+}
+
+static void spacemit_gpio_write(struct spacemit_gpio_bank *gb,
+				enum spacemit_gpio_registers reg, u32 val)
+{
+	writel(val, gb->base + to_spacemit_gpio_regs(gb)[reg]);
+}
+
 static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
 {
 	return (u32)(gb - gb->sg->sgb);
@@ -63,10 +84,10 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 	unsigned long pending;
 	u32 n, gedr;
 
-	gedr = readl(gb->base + SPACEMIT_GEDR);
+	gedr = spacemit_gpio_read(gb, SPACEMIT_GEDR);
 	if (!gedr)
 		return IRQ_NONE;
-	writel(gedr, gb->base + SPACEMIT_GEDR);
+	spacemit_gpio_write(gb, SPACEMIT_GEDR, gedr);
 
 	pending = gedr & gb->irq_mask;
 	if (!pending)
@@ -82,7 +103,7 @@ static void spacemit_gpio_irq_ack(struct irq_data *d)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
 
-	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
+	spacemit_gpio_write(gb, SPACEMIT_GEDR, BIT(irqd_to_hwirq(d)));
 }
 
 static void spacemit_gpio_irq_mask(struct irq_data *d)
@@ -91,13 +112,13 @@ static void spacemit_gpio_irq_mask(struct irq_data *d)
 	u32 bit = BIT(irqd_to_hwirq(d));
 
 	gb->irq_mask &= ~bit;
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
 }
 
 static void spacemit_gpio_irq_unmask(struct irq_data *d)
@@ -108,12 +129,12 @@ static void spacemit_gpio_irq_unmask(struct irq_data *d)
 	gb->irq_mask |= bit;
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
 
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
 }
 
 static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -123,18 +144,18 @@ static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (type & IRQ_TYPE_EDGE_RISING) {
 		gb->irq_rising_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
 	} else {
 		gb->irq_rising_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
 	}
 
 	if (type & IRQ_TYPE_EDGE_FALLING) {
 		gb->irq_falling_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
 	} else {
 		gb->irq_falling_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
 	}
 
 	return 0;
@@ -179,15 +200,16 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
-	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
+	int ret;
 
-	gb->base = regs + bank_base[index];
+	gb->base = regs + sg->data->bank_offsets[index];
+	gb->sg = sg;
 
-	dat	= gb->base + SPACEMIT_GPLR;
-	set	= gb->base + SPACEMIT_GPSR;
-	clr	= gb->base + SPACEMIT_GPCR;
-	dirin	= gb->base + SPACEMIT_GCDR;
-	dirout	= gb->base + SPACEMIT_GSDR;
+	dat	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPLR];
+	set	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPSR];
+	clr	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPCR];
+	dirin	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GCDR];
+	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GSDR];
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
@@ -206,8 +228,6 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
-	gb->sg = sg;
-
 	gc->label		= dev_name(dev);
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
@@ -223,13 +243,13 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
 
 	/* Disable Interrupt */
-	writel(0, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, 0);
 	/* Disable Edge Detection Settings */
-	writel(0x0, gb->base + SPACEMIT_GRER);
-	writel(0x0, gb->base + SPACEMIT_GFER);
+	spacemit_gpio_write(gb, SPACEMIT_GRER, 0x0);
+	spacemit_gpio_write(gb, SPACEMIT_GFER, 0x0);
 	/* Clear Interrupt */
-	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
-	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
+	spacemit_gpio_write(gb, SPACEMIT_GCRER, 0xffffffff);
+	spacemit_gpio_write(gb, SPACEMIT_GCFER, 0xffffffff);
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
@@ -260,6 +280,10 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	if (!sg)
 		return -ENOMEM;
 
+	sg->data = of_device_get_match_data(dev);
+	if (!sg->data)
+		return dev_err_probe(dev, -EINVAL, "No available compatible data.");
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -287,8 +311,55 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const unsigned int spacemit_gpio_k1_offsets[] = {
+	[SPACEMIT_GPLR] = 0x00,
+	[SPACEMIT_GPDR] = 0x0c,
+	[SPACEMIT_GPSR] = 0x18,
+	[SPACEMIT_GPCR] = 0x24,
+	[SPACEMIT_GRER] = 0x30,
+	[SPACEMIT_GFER] = 0x3c,
+	[SPACEMIT_GEDR] = 0x48,
+	[SPACEMIT_GSDR] = 0x54,
+	[SPACEMIT_GCDR] = 0x60,
+	[SPACEMIT_GSRER] = 0x6c,
+	[SPACEMIT_GCRER] = 0x78,
+	[SPACEMIT_GSFER] = 0x84,
+	[SPACEMIT_GCFER] = 0x90,
+	[SPACEMIT_GAPMASK] = 0x9c,
+	[SPACEMIT_GCPMASK] = 0xA8,
+};
+
+static const unsigned int spacemit_gpio_k3_offsets[] = {
+	[SPACEMIT_GPLR] = 0x0,
+	[SPACEMIT_GPDR] = 0x4,
+	[SPACEMIT_GPSR] = 0x8,
+	[SPACEMIT_GPCR] = 0xc,
+	[SPACEMIT_GRER] = 0x10,
+	[SPACEMIT_GFER] = 0x14,
+	[SPACEMIT_GEDR] = 0x18,
+	[SPACEMIT_GSDR] = 0x1c,
+	[SPACEMIT_GCDR] = 0x20,
+	[SPACEMIT_GSRER] = 0x24,
+	[SPACEMIT_GCRER] = 0x28,
+	[SPACEMIT_GSFER] = 0x2c,
+	[SPACEMIT_GCFER] = 0x30,
+	[SPACEMIT_GAPMASK] = 0x34,
+	[SPACEMIT_GCPMASK] = 0x38,
+};
+
+static const struct spacemit_gpio_data k1_gpio_data = {
+	.offsets = spacemit_gpio_k1_offsets,
+	.bank_offsets = { 0x0, 0x4, 0x8, 0x100 },
+};
+
+static const struct spacemit_gpio_data k3_gpio_data = {
+	.offsets = spacemit_gpio_k3_offsets,
+	.bank_offsets = { 0x0, 0x40, 0x80, 0x100 },
+};
+
 static const struct of_device_id spacemit_gpio_dt_ids[] = {
-	{ .compatible = "spacemit,k1-gpio" },
+	{ .compatible = "spacemit,k1-gpio", .data = &k1_gpio_data },
+	{ .compatible = "spacemit,k3-gpio", .data = &k3_gpio_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
@@ -296,12 +367,12 @@ MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
 static struct platform_driver spacemit_gpio_driver = {
 	.probe		= spacemit_gpio_probe,
 	.driver		= {
-		.name	= "k1-gpio",
+		.name	= "spacemit-gpio",
 		.of_match_table = spacemit_gpio_dt_ids,
 	},
 };
 module_platform_driver(spacemit_gpio_driver);
 
 MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
-MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
+MODULE_DESCRIPTION("GPIO driver for SpacemiT K1/K3 SoC");
 MODULE_LICENSE("GPL");

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

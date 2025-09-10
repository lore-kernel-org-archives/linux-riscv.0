Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA69FCA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxkWT9pQuP2wy3UpNntrD2zuCWR0Sqs3mGsApMx/pl4=; b=vyQO2GVeWtLDa9
	LkXYD7g1zRFyNs2F07odWgJ58lPcNl2uz2X968IKbgEEFTM/v56jNvM/3+n2Nf+4KP146xFc9iDMO
	m2vqkRDzsIG+8dnXvTzm/KfdFoAuqa3ioWH6Ct4LhIZFyMABjEI0m9cjKFzdJaehBHGm4YoFr0GF8
	p5N4ktK26OablQiHTTUzebjxGAoE4+xZR696ZUHE3738Ncp5Km8X+5e9BHc+/E6exNbFLmkLmiOb0
	3awZxeno1x90oavVqrOQ87Tb5XSsULeOvSYF1XaoY1k6UbEL9MkPILhtrxz6Gaf/Z0NPhmyHXd/mi
	GBf15lx49XO/82lVm0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0t-0000000CRPs-1POm;
	Wed, 10 Sep 2025 07:13:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0l-0000000CRBV-49j9
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso15732625e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488378; x=1758093178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LgKNcxsdLsFnLguR4L7e69gd1tme3quh6qNbEycm/0=;
        b=eOX0RAYQMafWLD0/kZJUePGDirxB0hKEfPVK4GndTfJIgqyE1fk2QmuHNRvjKrf5cO
         5OqAlKv35AvE+jMWqf69OKNXHqpyxJtCg5sJBXRDQtpng7NPpiUzdNzUcb1IiFe1ZnwV
         j5sXv1FV6bgbU5NP040Aw8zLVCYcvjHCAz+Zmh9ajnKbrbAYBF4QSvs9yBwWc1HrS31T
         jpQoLj7DcvYTvxP1zY1atzD8MRqu8HutMLXpl5121xlk6vATlu9u/4sjWG6lzDPYSVhR
         PNTiWMOKQwHqi2JdOAbN05RWi+ktf0N6YZJKZ+ZauMr4Q55gdEXuCS5pKLkE4xQbL0ZT
         EF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488378; x=1758093178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LgKNcxsdLsFnLguR4L7e69gd1tme3quh6qNbEycm/0=;
        b=frFti0dJ0OEJmxtqgIMRz6D9YcdBBNFopW4BPT3WqBbmXcluiTFmd92rvCb7hEKnVc
         WlCshUVU5mSZTDGmxXDrFlvW7oA+/UQXy1ybLKPaaT0LY6fgLWaAHb5gIegQOyZofFt2
         OrmLPleZCaVjwmfgFejWLNXrfnek9wd3xpab4EU0oKnpwb0zSOF968liBf5k2yGj19Vv
         s3cbwXDG8hEoIaTHCSDIbKGs66AhWLS4lV97BMpZn2ys16+WLasJkfKwWv2pY0rrhlp9
         nyR08kgFl/gENNp57kgvIaKTzaVb7i+SowU34643zyTYg7g2LOxX1DI/AZZ6BjXTJQcP
         oYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5KoOkqz2qiMLuJgDdhvd2Yfbr7PnKJpPq179dLcaqPosuYVfoYA8noLerPIROdFRZTsUWb74RqJDILQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDb1MK4e0MXkbOLt3a4mMeXXk8vjE7IlC4JjA7spQQ4s87KFC+
	vIKBEMHMis/FD7C/WH8qFD+E4kZviEoZrMh/Q7SdA92GXWc73BZzHRMpQz2M0pI9frI=
X-Gm-Gg: ASbGncv+eCubl2+MSn5HRN9dN1DWnHSvXIu/hfS4Da9nRb3LYiO/O9WIkM5NjW11P32
	43C/azKO0FK6C56ekP1ajtQzLQgzsZRKTebBOEBXYok4FzaUhpso4nmdvEOaMYUHJXn6GrLJqN3
	DTTqIIaHiTz3FHNLS9ECCu1GRx9oCpknN4KtRCIF1eLLpDhBFEX7K6ucd7t8i3v+4ExTTXaru2I
	1QghWXom7uab5ANAhF06difJ0YKvNuwhxq8JLf1rGyOJyEcarxhVmwdRy5y41mDb8pAWQTtVOBl
	gLGknCC8+9Zza4DyZcUleNItXBHstB//UTvF5vAJjB7J3ikkIjFqaDrb+pbEuViVYvdwipynpOD
	lR2kxtelZPq9BbS6YUY+wwDvWTUI=
X-Google-Smtp-Source: AGHT+IGJB3PQIUYZyiw6+3o8Sn4R39vuxJ9NIx24EQd1RwwSDB8q/LrrapFJhvdDKRaEZQ28E4N+3A==
X-Received: by 2002:a05:600c:1ca4:b0:45d:edf6:367c with SMTP id 5b1f17b1804b1-45dfa19b7a9mr3614415e9.30.1757488377653;
        Wed, 10 Sep 2025 00:12:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:39 +0200
Subject: [PATCH v2 03/15] gpio: hlwd: use new generic GPIO chip API
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-3-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8099;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GIo9/S93VPUBfQ6xvrpidEregjsP7FkaGPkWmJwT4jo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsnxh40ocSMjnMrnX6+YmVvuhxetveQ9JD2
 RuxrOMz/veJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 ckv9D/4nLHThrlKEMZ2arKcEEyQC039F8gSblcrmQ1yb2JUPD1XxFGc6cwT7H6+DHECz9C7YhOn
 0ly3riecS1q0hqBTBBP7u1DGllHh5KNSLjSOD2npeqgYC4x2N7vWzOF6LwOYtXpsw95jB2RDx6t
 UxvVJwyXW7XEzBqexP3qUDzvGDMYXIHHVYQU65xT2xHsJNKGeChGVFKpvuGA9UvLEl3HGgOXUND
 cvB4L4rs5s+vh+yhOG+Ewn4lk++UDQCCAFk7+SsrQcux2I8uEon/iDlr6VA/iAn4nUlC02vylRE
 tu1OTxkHfTwn4LtLFDZfm5xYJ00r5EkvTD1nzch0qvWzgJHdcNRkXtX7ZTui2MyCGAVvRzUAoAJ
 dy+xABlcqRSZKYihMHMg1xFCKbUAtWGAAFv1K0rikut9lS/0ixaIdeuARtf6hwnZPFqLmhIjd8J
 35og3KjICmSzjp4S7SbXrZVCh8G9NiyaBkNHc9tfU6r7BBgC750h1nhYn0kO9mUC1Tn6tywYsgp
 M28kKTTkG2zcCOO6IP9VLtTWrfop7PplC9LZP0ZYCaDbnTcPXcdP/vPPc1jihj//nCCEdgqVuXU
 T60AjrsNtiLJElv/spQQiqoj6hONaUMrbozWw4rV6qzWxQtpod1QvyCtpRaakB3I9RJHyDUVLXX
 QoxyFu/BJLo3MKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001300_165189_471E3DC3 
X-CRM114-Status: GOOD (  20.62  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hlwd.c | 105 ++++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 0580f6712bea9a4d510bd332645982adbc5c6a32..a395f87436ac4df386ce2ee345fc0a7cc34c843d 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -6,6 +6,7 @@
 // Nintendo Wii (Hollywood) GPIO driver
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -48,7 +49,7 @@
 #define HW_GPIO_OWNER		0x3c
 
 struct hlwd_gpio {
-	struct gpio_chip gpioc;
+	struct gpio_generic_chip gpioc;
 	struct device *dev;
 	void __iomem *regs;
 	int irq;
@@ -61,45 +62,44 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned long flags;
 	unsigned long pending;
 	int hwirq;
 	u32 emulated_pending;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
-	pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
+		pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 
-	/* Treat interrupts due to edge trigger emulation separately */
-	emulated_pending = hlwd->edge_emulation & pending;
-	pending &= ~emulated_pending;
-	if (emulated_pending) {
-		u32 level, rising, falling;
+		/* Treat interrupts due to edge trigger emulation separately */
+		emulated_pending = hlwd->edge_emulation & pending;
+		pending &= ~emulated_pending;
+		if (emulated_pending) {
+			u32 level, rising, falling;
 
-		level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
-		rising = level & emulated_pending;
-		falling = ~level & emulated_pending;
+			level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
+			rising = level & emulated_pending;
+			falling = ~level & emulated_pending;
 
-		/* Invert the levels */
-		iowrite32be(level ^ emulated_pending,
-			    hlwd->regs + HW_GPIOB_INTLVL);
+			/* Invert the levels */
+			iowrite32be(level ^ emulated_pending,
+				    hlwd->regs + HW_GPIOB_INTLVL);
 
-		/* Ack all emulated-edge interrupts */
-		iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
+			/* Ack all emulated-edge interrupts */
+			iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
 
-		/* Signal interrupts only on the correct edge */
-		rising &= hlwd->rising_edge;
-		falling &= hlwd->falling_edge;
+			/* Signal interrupts only on the correct edge */
+			rising &= hlwd->rising_edge;
+			falling &= hlwd->falling_edge;
 
-		/* Mark emulated interrupts as pending */
-		pending |= rising | falling;
+			/* Mark emulated interrupts as pending */
+			pending |= rising | falling;
+		}
 	}
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 
 	chained_irq_enter(chip, desc);
 
 	for_each_set_bit(hwirq, &pending, 32)
-		generic_handle_domain_irq(hlwd->gpioc.irq.domain, hwirq);
+		generic_handle_domain_irq(hlwd->gpioc.gc.irq.domain, hwirq);
 
 	chained_irq_exit(chip, desc);
 }
@@ -116,30 +116,29 @@ static void hlwd_gpio_irq_mask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
-	mask &= ~BIT(data->hwirq);
-	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
-	gpiochip_disable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+		mask &= ~BIT(data->hwirq);
+		iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
+	}
+	gpiochip_disable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
 }
 
 static void hlwd_gpio_irq_unmask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	gpiochip_enable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	gpiochip_enable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
+
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
+
 	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 	mask |= BIT(data->hwirq);
 	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 }
 
 static void hlwd_gpio_irq_enable(struct irq_data *data)
@@ -173,10 +172,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 level;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
 
 	hlwd->edge_emulation &= ~BIT(data->hwirq);
 
@@ -197,11 +195,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 		hlwd_gpio_irq_setup_emulation(hlwd, data->hwirq, flow_type);
 		break;
 	default:
-		raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 		return -EINVAL;
 	}
 
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 	return 0;
 }
 
@@ -225,6 +221,7 @@ static const struct irq_chip hlwd_gpio_irq_chip = {
 
 static int hlwd_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct hlwd_gpio *hlwd;
 	u32 ngpios;
 	int res;
@@ -244,25 +241,31 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 	 * systems where the AHBPROT memory firewall hasn't been configured to
 	 * permit PPC access to HW_GPIO_*.
 	 *
-	 * Note that this has to happen before bgpio_init reads the
-	 * HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the wrong
-	 * values.
+	 * Note that this has to happen before gpio_generic_chip_init() reads
+	 * the HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the
+	 * wrong values.
 	 */
 	iowrite32be(0xffffffff, hlwd->regs + HW_GPIO_OWNER);
 
-	res = bgpio_init(&hlwd->gpioc, &pdev->dev, 4,
-			hlwd->regs + HW_GPIOB_IN, hlwd->regs + HW_GPIOB_OUT,
-			NULL, hlwd->regs + HW_GPIOB_DIR, NULL,
-			BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = hlwd->regs + HW_GPIOB_IN,
+		.set = hlwd->regs + HW_GPIOB_OUT,
+		.dirout = hlwd->regs + HW_GPIOB_DIR,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	res = gpio_generic_chip_init(&hlwd->gpioc, &config);
 	if (res < 0) {
-		dev_warn(&pdev->dev, "bgpio_init failed: %d\n", res);
+		dev_warn(&pdev->dev, "failed to initialize generic GPIO chip: %d\n", res);
 		return res;
 	}
 
 	res = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios);
 	if (res)
 		ngpios = 32;
-	hlwd->gpioc.ngpio = ngpios;
+	hlwd->gpioc.gc.ngpio = ngpios;
 
 	/* Mask and ack all interrupts */
 	iowrite32be(0, hlwd->regs + HW_GPIOB_INTMASK);
@@ -282,7 +285,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 			return hlwd->irq;
 		}
 
-		girq = &hlwd->gpioc.irq;
+		girq = &hlwd->gpioc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &hlwd_gpio_irq_chip);
 		girq->parent_handler = hlwd_gpio_irqhandler;
 		girq->num_parents = 1;
@@ -296,7 +299,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
+	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc.gc, hlwd);
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

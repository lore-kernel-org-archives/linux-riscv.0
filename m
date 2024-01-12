Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A9C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6ZUfZTq/sJIJ/friVA/k2S6dexgbgwK+Dbfz5SXmow=; b=ew9rU1Da2aVySV
	I1sjjLN3JIcsWr0AIsVIbhgq2gXqUaZj1ArXHCMqrhfnU+xqkj7JCyJ8lwOk+TSzTWT2EoiWdM+/e
	ouLx0nazAqYo+LqbSuwv01U1x1qYDwe2dpwVunwc0w3JZ1tFxQi9+Ys29tjDvn6zlxyuW8G4tabuv
	lVyGu+37CgclYK8AHUQOtNr8LviNVkl5w5oJ+Syf+2lhSa0vOyjDmQfhpPzQfGrn535jf9JANrEaH
	FsxVeX3t/QnmpzR6AYOC15kI7YnJq3tYgNGV7c4qjZ7ip90TasAwyMO2loHQS0tqF/LI7+a1G4+zG
	swge9wgcyMEZoOKv167Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUY-0031yH-0e;
	Fri, 12 Jan 2024 14:26:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUT-0031wA-0d
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 14:26:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40e5a5b0fb5so26175835e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705069591; x=1705674391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdyg0V8UXWHJnHyjJWow9MZ/XKXVEw7F8X1cJyMmX+4=;
        b=cTj2cl6/wfoLr8wQcBeE9q130+I3IG3JFhyg6kttFy1lq/HdIR2OXvdVXQ/4qKkTVV
         64DAd+oInKwXF4TAiOx77g8PYf9SFB7JdPjgq4X4xljswd6nSVr7ov4aFjIPZ/ncFa6k
         +PyXZTq+Vq4xWYD7y3xemGlAshNTuLSXnz0ML/+8D9+ltUg4dr54sqEmhrilYKLK7JMd
         MAYtUuUkGpzR6VGdI3O1iJ8nWDXvmg2mUYkeB7NvMGX7TBX9h/gnMCMC70NVo7iJ6kTk
         SS8N2jJJu7K0hTbnEYHdv+jlszPW0UyL7bre59aocbzJ58Hgfqrh/c8ovMSeAwrLgrOf
         Bl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069591; x=1705674391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kdyg0V8UXWHJnHyjJWow9MZ/XKXVEw7F8X1cJyMmX+4=;
        b=WjnqEeuJxihGuLIci9TjzP6sf/il98BPu8OJNLL4dcDThgT19IJ2HFxgYuH9W6QaDx
         2NvIzlykRQkKjZips6WYwumBegMsNX3wgsNVvlrqscZmhBrybHv8mIzwKmvW/+YnbYDM
         MXVrOXDA6Q383flQM4RiCIDGSkaT2LLv4lwgllF+j9F1n07X7JSAo9Fz8sCKit/zRiBe
         Qrqt+zinDWa6RLKVt0jbT0RCIXHBM3TzqjnPTD331qoNwYAj6bN0Xe5YmyclufN+cggb
         oJZUc6L/z+O1V6F1xPJm4riBul4k91OZ1s7WSHdkO66AIOxoCqYMNeXZr1BYQICpicW9
         9nOA==
X-Gm-Message-State: AOJu0YwP2crpVZ5NizuSmBYW7x8gxaP7zevMoJtIOz6OM5KBetwWEU7o
	zMq0crsy3MR1XK/yzYifckk=
X-Google-Smtp-Source: AGHT+IG5dESW3dbyFu5JQy50WMZ1coBXDzwM2eeJkjDUdePm4/NhAG1KsvMjg75R0UdAXJ7D+zy6vA==
X-Received: by 2002:a05:600c:5108:b0:40c:258d:2f01 with SMTP id o8-20020a05600c510800b0040c258d2f01mr802638wms.105.1705069590668;
        Fri, 12 Jan 2024 06:26:30 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:494d:c489:3d96:1b15])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d4dc6000000b00336a2566aa2sm4021219wru.61.2024.01.12.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:26:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
Date: Fri, 12 Jan 2024 14:26:20 +0000
Message-Id: <20240112142621.13525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062633_234309_95F3EA03 
X-CRM114-Status: GOOD (  22.14  )
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

Add the missing port pins P19 to P28 for RZ/Five SoC. These additional
pins provide expanded capabilities and are exclusive to the RZ/Five SoC.

Couple of port pins have different configuration and are not identical for
the complete port so introduce struct rzg2l_variable_pin_cfg to handle
such cases and introduce the PIN_CFG_VARIABLE macro. The actual pin config
is then assigned in rzg2l_pinctrl_get_variable_pin_cfg().

Add an additional check in rzg2l_gpio_get_gpioint() to only allow GPIO pins
which support interrupt facility.

While at define RZG2L_GPIO_PORT_PACK() using RZG2L_GPIO_PORT_SPARSE_PACK().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 213 +++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8b8644d2c355..04bb21d564d4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,6 +57,8 @@
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
 #define PIN_CFG_OEN			BIT(15)
+#define PIN_CFG_VARIABLE		BIT(16)
+#define PIN_CFG_NOGPIO_INT		BIT(17)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -76,17 +78,23 @@
 					 PIN_CFG_FILNUM | \
 					 PIN_CFG_FILCLKSEL)
 
-/*
- * n indicates number of pins in the port, a is the register index
- * and f is pin configuration capabilities supported.
- */
 #define PIN_CFG_PIN_MAP_MASK		GENMASK(35, 28)
 #define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
 #define PIN_CFG_MASK			GENMASK(19, 0)
 
-#define RZG2L_GPIO_PORT_PACK(n, a, f)	((((1ULL << (n)) - 1) << 28) | \
-					 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
-					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+/*
+ * m indicates the bitmap of supported pins, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
+						 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
+						 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+
+/*
+ * n indicates number of pins in the port, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
 
 /*
  * BIT(63) indicates dedicated pin, p is the register index while
@@ -200,6 +208,18 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
+/**
+ * struct rzg2l_variable_pin_cfg - pin data cfg
+ * @cfg: port pin configuration
+ * @port: port number
+ * @pin: port pin
+ */
+struct rzg2l_variable_pin_cfg {
+	u32 cfg:20;
+	u8 port:5;
+	u8 pin:5;
+};
+
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -208,6 +228,8 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
+	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
+	unsigned int n_variable_pin_cfg;
 };
 
 /**
@@ -243,6 +265,143 @@ struct rzg2l_pinctrl {
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
+#ifdef CONFIG_RISCV
+static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
+					      u64 pincfg,
+					      unsigned int port,
+					      u8 pin)
+{
+	unsigned int i;
+
+	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
+		if (pctrl->data->variable_pin_cfg[i].port == port &&
+		    pctrl->data->variable_pin_cfg[i].pin == pin)
+			return (pincfg & ~PIN_CFG_VARIABLE) | pctrl->data->variable_pin_cfg[i].cfg;
+	}
+
+	return 0;
+}
+
+static const struct rzg2l_variable_pin_cfg r9a07g043f_variable_pin_cfg[] = {
+	{
+		.port = 20,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 6,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 7,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT
+	},
+	{
+		.port = 23,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_NOGPIO_INT,
+	},
+};
+#endif
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -1446,6 +1605,25 @@ static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(4, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
+#ifdef CONFIG_RISCV
+	/* Below additional port pins (P19 - P28) are exclusively available on RZ/Five SoC only */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P19 */
+	RZG2L_GPIO_PORT_PACK(8, 0x07, PIN_CFG_VARIABLE),				/* P20 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P21 */
+	RZG2L_GPIO_PORT_PACK(4, 0x09, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),				/* P22 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x3e, 0x0a, PIN_CFG_VARIABLE),			/* P23 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0b, PIN_CFG_VARIABLE),				/* P24 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
+				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_NOGPIO_INT),				/* P25 */
+	0x0,										/* P26 */
+	0x0,										/* P27 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0f, RZG2L_MPXED_PIN_FUNCS | PIN_CFG_NOGPIO_INT),	/* P28 */
+#endif
 };
 
 static const u64 r9a08g045_gpio_configs[] = {
@@ -1606,12 +1784,18 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						       PIN_CFG_IO_VMC_SD1)) },
 };
 
-static int rzg2l_gpio_get_gpioint(unsigned int virq, const struct rzg2l_pinctrl_data *data)
+static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
+	const struct rzg2l_pinctrl_data *data = pctrl->data;
+	u64 *pin_data = pin_desc->drv_data;
 	unsigned int gpioint;
 	unsigned int i;
 	u32 port, bit;
 
+	if (*pin_data & PIN_CFG_NOGPIO_INT)
+		return -EINVAL;
+
 	port = virq / 8;
 	bit = virq % 8;
 
@@ -1721,7 +1905,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	unsigned long flags;
 	int gpioint, irq;
 
-	gpioint = rzg2l_gpio_get_gpioint(child, pctrl->data);
+	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
@@ -1907,6 +2091,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 		if (i && !(i % RZG2L_PINS_PER_PORT))
 			j++;
 		pin_data[i] = pctrl->data->port_pin_configs[j];
+#ifdef CONFIG_RISCV
+		if (pin_data[i] & PIN_CFG_VARIABLE)
+			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
+									 pin_data[i],
+									 j,
+									 i % RZG2L_PINS_PER_PORT);
+#endif
 		pins[i].drv_data = &pin_data[i];
 	}
 
@@ -2058,6 +2249,10 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.n_port_pins = ARRAY_SIZE(r9a07g043_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common),
 	.hwcfg = &rzg2l_hwcfg,
+#ifdef CONFIG_RISCV
+	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
+#endif
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

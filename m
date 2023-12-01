Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CEC07E97
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLrYmNejrl+6QjJbOdZ4Do+PnCQQpy1T+vN9H01Rvhk=; b=xg9k7hmVlpCJDJ
	9qpHutdJLo60IU6MBt7DKogNjREMIq9dQfJb+Xb3mkrRjcd40DuNruNlTOvkHeiZiJ9ZD6trQeRse
	5D6QaSk0XLj6ojr/+1j4tL4cp2owBg4y+GMc0H0dmrPKgZM8cbQFBiwjna4ytFaYkb/jPEFoKWOtP
	roEkcwAu2ph0NPFDNp+XKnkUgLEXBoSv+cDtHyvTH3c5KFpKGKAp89IbczZAabxxIzgjx/idhw5q3
	g94ruTDOmQpxWNob7mAToF1r6+ccY/hmJ9cmvrsaxNZ+XB+1WEp5j/WKqVJpo2Yti4ARtyyx1eC5d
	rGmpNeHVEsyS+aSma5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r93bY-00Do61-2a;
	Fri, 01 Dec 2023 13:30:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r93Nb-00Dhol-2I
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 13:16:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b397793aaso13688795e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701436585; x=1702041385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uNoIoPUELJBsLUBDRMQjbKl7BixhEh7Na3k/mIMrAs=;
        b=nRK3k9ncaojgVMIkL5L6jAwJ/YIBDPNRybBCPzrl3zI98mE+Gi3jfEmMVrLf+PECOw
         30nnc+ZDbD0BRCdutLdF40b30fw22yEUcHkzyuakvP3qPZ2jwmPib3WmtjXikPQP9sDW
         HRwyPJ1Peo1VTdAjVRyVyudDzzafzfYQff/zfRPGm5yLSwSy7y2yhCDzxeN7voZQBs2Z
         tnS+RbXwNBQcrqOvZks32YpSINHmaPdTvD4G2vT1eWcrmX7dCI0ow+rs7EUzl1GnbZu7
         3751TtB/voDrm0NHoiiKm0IOVeCD/b8UWDipGfVNAucP7bNKCI2fyfTgkwEMbAeTI5xS
         0irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436585; x=1702041385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uNoIoPUELJBsLUBDRMQjbKl7BixhEh7Na3k/mIMrAs=;
        b=mPUgyjcu6OoEQHr7zhEIz7GbCfSeq9WlqHkMd/ht3ZbqBd7es4rhmOJaQhfUlN8UXA
         imVU0OpZ4sTuUeTn7RDZ1TuAn1B9/qC9sbo9hqzNmdkOr5PaogGr5yWylt7qlyMQsS38
         zQPT2YyeNM0/48784PO/ysX0Cri78yKDzKTlMha/scQp3qA11fNgMIq3QqHCUgXI1ATN
         8kLn4NZiUiqL6k3sa8hrL+CNZQopA5dy+5+q6DUVHBES2S6K1G9TTVe8v6oyEWUt2ICF
         glWZZBPEK2E5YVRTAw5/FRS56n7m7PDIXKhS5SN4GPNaXURX5Iei8dA0K0u8RPv4i/kR
         K0Vw==
X-Gm-Message-State: AOJu0Yz6dDIqglPd7LvYFNqlEPY5pK4nAKIge+VGfuCmaI4ve10R/6g2
	577njoBdnTgzycBt5qOzZ0E=
X-Google-Smtp-Source: AGHT+IFRyOm7GEpydRJ2f+0NVMJU2tS/rdO/mLolIwYRT8SgE7C9IicmN03PBhRUNkluMBLMy6l3/w==
X-Received: by 2002:a05:600c:3b10:b0:40b:5e26:237c with SMTP id m16-20020a05600c3b1000b0040b5e26237cmr726083wms.45.1701436585196;
        Fri, 01 Dec 2023 05:16:25 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b3dbb5c93sm1451723wmb.1.2023.12.01.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:16:24 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/3] pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
Date: Fri,  1 Dec 2023 13:15:50 +0000
Message-Id: <20231201131551.201503-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_051627_748437_372628D4 
X-CRM114-Status: GOOD (  22.16  )
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

Couple of port pins have different configuration and is not identical for
the complete port so introduced struct rzg2l_variable_pin_cfg to handle
such cases and introduced PIN_CFG_VARIABLE macro. The actual pin config is
then assigned rzg2l_pinctrl_get_variable_pin_cfg().

Add an additional check in rzg2l_gpio_get_gpioint() to only allow GPIO pins
which support interrupt facility.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 215 +++++++++++++++++++++++-
 1 file changed, 213 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 94d072c8a743..083cc63c2c82 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,6 +57,8 @@
 #define PIN_CFG_FILCLKSEL		BIT(12)
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
+#define PIN_CFG_VARIABLE		BIT(15)
+#define PIN_CFG_NOGPIO_INT		BIT(16)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -82,6 +84,11 @@
  */
 #define RZG2L_GPIO_PORT_PACK(n, a, f)	(((n) > 0 ? ((u64)(GENMASK_ULL(((n) - 1 + 28), 28))) : 0) | \
 					 ((a) << 20) | (f))
+/*
+ * m indicates the bitmap of supported pins, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)	(((u64)(m) << 28) | ((a) << 20) | (f))
 #define RZG2L_GPIO_PORT_GET_PINMAP(x)	(((x) & GENMASK_ULL(35, 28)) >> 28)
 #define RZG2L_GPIO_PORT_GET_PINCNT(x)  (hweight8(RZG2L_GPIO_PORT_GET_PINMAP((x))))
 
@@ -185,6 +192,18 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
+/**
+ * struct rzg2l_variable_pin_cfg - pin data cfg
+ * @cfg: port pin configuration
+ * @port: port number
+ * @pin: port pin
+ */
+struct rzg2l_variable_pin_cfg {
+	u32 cfg;
+	u8 port;
+	u8 pin;
+};
+
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -193,6 +212,8 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
+	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
+	unsigned int n_variable_pin_cfg;
 };
 
 /**
@@ -228,6 +249,158 @@ struct rzg2l_pinctrl {
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
+#ifdef CONFIG_RISCV
+static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
+					      u64 pincfg,
+					      unsigned int port,
+					      u8 pin)
+{
+	unsigned int i;
+	u8 pincount;
+	u8 pinmap;
+	u32 off;
+
+	if (!pctrl->data->n_variable_pin_cfg)
+		return pincfg;
+
+	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
+		if (pctrl->data->variable_pin_cfg[i].port == port &&
+		    pctrl->data->variable_pin_cfg[i].pin == pin)
+			break;
+	}
+	if (i == pctrl->data->n_variable_pin_cfg)
+		return pincfg;
+
+	pinmap = RZG2L_GPIO_PORT_GET_PINMAP(pincfg);
+	pincount = RZG2L_GPIO_PORT_GET_PINCNT(pincfg);
+	off = RZG2L_PIN_CFG_TO_PORT_OFFSET(pincfg);
+
+	if (pinmap == pincount)
+		return RZG2L_GPIO_PORT_PACK(pincount, off, pctrl->data->variable_pin_cfg[i].cfg);
+
+	return RZG2L_GPIO_PORT_SPARSE_PACK(pinmap, off, pctrl->data->variable_pin_cfg[i].cfg);
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
@@ -1320,6 +1493,27 @@ static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(4, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
+#ifdef CONFIG_RISCV
+	/* Below additional port pins (P19 - P28) are exclusively available on RZ/Five SoC only */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),	/* P19 */
+	RZG2L_GPIO_PORT_PACK(8, 0x07, PIN_CFG_VARIABLE),	/* P20 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),	/* P21 */
+	RZG2L_GPIO_PORT_PACK(4, 0x09, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),	/* P22 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x3e, 0x0a, PIN_CFG_VARIABLE),	/* P23 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0b, PIN_CFG_VARIABLE),	/* P24 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
+				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_NOGPIO_INT),	/* P25 */
+	0x0,	/* Dummy port P26 */
+	0x0,	/* Dummy port P27 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0f, PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_PUPD |
+			     PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+			     PIN_CFG_NOGPIO_INT),	/* P28 */
+#endif
 };
 
 static const u64 r9a08g045_gpio_configs[] = {
@@ -1478,12 +1672,18 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
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
 
@@ -1593,7 +1793,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	unsigned long flags;
 	int gpioint, irq;
 
-	gpioint = rzg2l_gpio_get_gpioint(child, pctrl->data);
+	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
@@ -1778,6 +1978,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
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
 
@@ -1925,6 +2132,10 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
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

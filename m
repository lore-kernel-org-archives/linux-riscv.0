Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9173C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/hmcplfWQO26X2qv4BM558PnQgUixBQh4ZuWFVSETY=; b=cprjY8/dukQRXJ
	LHkkK4qjrE/AykUnbh5evLC9W0f3akCY+1Lg3F21zt0m70ibNrWB3xdnq8Hr7CRo0XkyJ4rAGe9Wa
	M7aVQ1ohvl89efuAVoQnbzB0wX6Ke3Z1OrpL7pwRKsLdyTwBo4I1QwlZBbrJ0pTGVeiQKlUael3FB
	V6CZDiDkjn/qHCbzH3Wub4dUJK910h1v7UdwJXvOQ8sOMq+7gbzaqIHS/ZyvqECcS3Q6eM9WtmCge
	afYo/AEmofQcYLhNbBuXvJVfEZJjP1uQ9zwts0SIjpmeQcgp7iJe1DG3i4zRQ+/eXHU4RPdS03qFE
	XilXPGR4iZH0wclaAN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxPF-00000009q0E-3uRb;
	Wed, 03 Jul 2024 10:40:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxPC-00000009pyV-0sJa;
	Wed, 03 Jul 2024 10:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Bx2CQCZLnvl2mGaHzoLhHeTCe30chHxVgbi6fu5d+s=; b=dpbuIEewclt9oZ34TjujGzbmx6
	7vmsasZmxGUKBDHlPTwvUySoWO2zg1YOqlY7NCeaJPJyqt2uBvk2tgmNJaFl6svHfYyBejMiSpjoO
	cY/+tIR/CE01mzITK4Zt+sj9XLjbAGe255syfSERi1DsjU5HwvbAfdgP+5nbxFKWrmUA4oNB1Pa+T
	UsqF4F2tKHewvWbF4U+aKtx7WZ4KKR4IM+B9LLfr6NMjtLV8o+rkTo5pMHJR5eYng+N44e5qjckAq
	fsO1szbNrhyghy97ZzswLdxSThWEfscP6DOF2/eEOXvajMxBw75jfWS98GaHbX8ztZUJ99xQpz9lh
	RIVnw2yw==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNx-00000009xZ4-2R9Y;
	Wed, 03 Jul 2024 10:40:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42E2C40006;
	Wed,  3 Jul 2024 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bx2CQCZLnvl2mGaHzoLhHeTCe30chHxVgbi6fu5d+s=;
	b=aLctC95xt2Q6rMLnoKMX3FJ/PPaRdMHQEBg8Yh4ab3FSY9cbwu/dUFTyd2apLZ20deWbHL
	p+IzkHN10jVZ1AG9Zn60wT53j8GY4YjZh45RcrSYSRiZO/UmHE3QPIVv0XvnhM2mXl2hWz
	VOJOVdL5ZPhpZJKh1jWQ96KV9qbUgn5W/5TTMt7H+C2eSDixGWwEKYYBbQX1xXqSkyGHz5
	91ju+rAKcnrwNcrolgluBFlh3QFO+/DQF5Wl+7Xbh+KtpnaGIUDYbYcsxewuu+9dpHQeok
	x6ehLSPvrF/uwBxNqrMB68JqQwCZNKNJ8SkpeUBfTvTBYcpghA0kpCr+80jVbg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:04 +0200
Subject: [PATCH 20/20] of: deprecate and rename of_property_for_each_u32()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_113958_496730_980F7203 
X-CRM114-Status: GOOD (  18.15  )
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

of_property_for_each_u32() is meant to disappear. All the call sites not
using the 3rd and 4th arguments have already been replaced by
of_property_for_each_u32_new().

Deprecate the old macro. Also rename it to minimize the number of new
usages and encourage conversion to the of_property_for_each_u32_new() macro
in not(-yet)-upstream code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Notes:

 * The following files have not been build-tested simply because I haven't
   managed to have a config that enables them so far:

     drivers/irqchip/irq-pic32-evic.c
     drivers/pinctrl/pinctrl-k210.c

 * These have not been converted yet as they are not trivial, and they will
   need to use a more specific function that does the lookup they need and
   returns the result:

     drivers/clk/clk-si5351.c
     drivers/clk/clk.c
---
 .clang-format                    | 2 +-
 drivers/clk/clk-si5351.c         | 4 ++--
 drivers/clk/clk.c                | 2 +-
 drivers/irqchip/irq-pic32-evic.c | 2 +-
 drivers/pinctrl/pinctrl-k210.c   | 2 +-
 include/linux/of.h               | 3 ++-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/.clang-format b/.clang-format
index db25cde2651a..a91b9bb39d9b 100644
--- a/.clang-format
+++ b/.clang-format
@@ -569,8 +569,8 @@ ForEachMacros:
   - 'nr_node_for_each_safe'
   - 'of_for_each_phandle'
   - 'of_property_for_each_string'
-  - 'of_property_for_each_u32'
   - 'of_property_for_each_u32_new'
+  - 'of_property_for_each_u32_old'
   - 'pci_bus_for_each_resource'
   - 'pci_dev_for_each_resource'
   - 'pcl_for_each_chunk'
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 4ce83c5265b8..ff990b15d616 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1191,7 +1191,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 	 * property silabs,pll-source : <num src>, [<..>]
 	 * allow to selectively set pll source
 	 */
-	of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
+	of_property_for_each_u32_old(np, "silabs,pll-source", prop, p, num) {
 		if (num >= 2) {
 			dev_err(&client->dev,
 				"invalid pll %d on pll-source prop\n", num);
@@ -1232,7 +1232,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 	pdata->pll_reset[0] = true;
 	pdata->pll_reset[1] = true;
 
-	of_property_for_each_u32(np, "silabs,pll-reset-mode", prop, p, num) {
+	of_property_for_each_u32_old(np, "silabs,pll-reset-mode", prop, p, num) {
 		if (num >= 2) {
 			dev_err(&client->dev,
 				"invalid pll %d on pll-reset-mode prop\n", num);
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8ea168c00997..aae940c18459 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5383,7 +5383,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	/* if there is an indices property, use it to transfer the index
 	 * specified into an array offset for the clock-output-names property.
 	 */
-	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
+	of_property_for_each_u32_old(clkspec.np, "clock-indices", prop, vp, pv) {
 		if (index == pv) {
 			index = count;
 			break;
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index 1d9bb28d13e5..d9aec87f8b59 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -196,7 +196,7 @@ static void __init pic32_ext_irq_of_init(struct irq_domain *domain)
 	int i = 0;
 	const char *pname = "microchip,external-irqs";
 
-	of_property_for_each_u32(node, pname, prop, p, hwirq) {
+	of_property_for_each_u32_old(node, pname, prop, p, hwirq) {
 		if (i >= ARRAY_SIZE(priv->ext_irqs)) {
 			pr_warn("More than %d external irq, skip rest\n",
 				ARRAY_SIZE(priv->ext_irqs));
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index b6d1ed9ec9a3..03acca8b01ef 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -797,7 +797,7 @@ static int k210_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto exit;
 
-	of_property_for_each_u32(np, "pinmux", prop, p, pinmux_group) {
+	of_property_for_each_u32_old(np, "pinmux", prop, p, pinmux_group) {
 		const char *group_name, *func_name;
 		u32 pin = FIELD_GET(K210_PG_PIN, pinmux_group);
 		u32 func = FIELD_GET(K210_PG_FUNC, pinmux_group);
diff --git a/include/linux/of.h b/include/linux/of.h
index 756847539384..15c291ab6e71 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1429,7 +1429,8 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     err == 0;							\
 	     err = of_phandle_iterator_next(it))
 
-#define of_property_for_each_u32(np, propname, prop, p, u)	\
+/* deprecated - will be removed */
+#define of_property_for_each_u32_old(np, propname, prop, p, u)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		p = of_prop_next_u32(prop, NULL, &u);		\
 		p;						\

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

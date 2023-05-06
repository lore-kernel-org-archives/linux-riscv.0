Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A2EC7EE22
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4n72OzECfg6BEe706+5SkQKnOkeoK9cvICO0UJMeI/g=; b=JlrZWohrsK+n0B
	nzX+W9KOMzmBH8mvo4UHCcAnchhUT8JSHrAhEHPWBLYFTNZ1bSkT75gCL2oxKNvpZjFohT/X+ImgU
	p8DrqsU6gUR7tPN7bx+qFll/Szv21gSD4MkTWO/5Slokc7cx3OYfoiN9uqLQXXQRHKQTkc98TvNjV
	z2+si7xJcQqJG/ZAZsOZjCqOUSVMSHeNGSXAipzSfr7r4Z+tBEq+qv1tf11CukclyG0jke2oiU+M+
	P3PkFULlqBo4AXsJhS90gZpllRu/3fq+hJajNCw81DnfjuuTww1Lo3Yipedmcj7wCPwZVwFhu7rpp
	0ggUrReNc5GkIG1vDcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJT-00EaQt-0t;
	Sat, 06 May 2023 23:27:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJO-00EaNU-38;
	Sat, 06 May 2023 23:27:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f1950f5676so31842705e9.3;
        Sat, 06 May 2023 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415649; x=1686007649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz+u5N4kcArj/4/4O+XvKmG7yrDykhccEDf8daX3ZbA=;
        b=h0dREcW8aiCUpfPiBMA01W4AdvM5HxHH/X9SFFeYN3dxrTbGzf0w02Zj9XIrp0vhF+
         g3ONrCGrCxn/6Y/0PXq0G3apgo70GDqhEV5N9hl5w2EMlZ5vK0JF3t4oRB0w+Xg/RdY7
         /kF3K2gtDGYpZOse3BHg/uGTr+JO7kfEXw2cD3t6hhIciKANHnaxih6+xtIzMGJVUF8w
         b4N07hxDVc56sS/xQFJL7Kh+yYMbv+xV6uymxdH3V+ihcRno+wARarxt/Acjro2pDOPv
         PeI/CZF/SdhA0qynwWViNElbAupMJGd0LOCSWSsMXMasdCwzb4LGf/WtkxfYYWpBAHu3
         hL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415649; x=1686007649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz+u5N4kcArj/4/4O+XvKmG7yrDykhccEDf8daX3ZbA=;
        b=cJO73lnNOz+nO5OKWsMbG2PcU1PrrvrkPUdhBK8R5lD3jeoiWQPBwCKHxAiMPRqYox
         Euax1XBR3R3jZlnlNWXXFQ29QX/yKLNLBf2ZwjiFagA2skfyO/F+5+mU2mqW+3nFPdeO
         qm2m4d0d4yShXDufXzSxekP/ocBUHDULlTLpun+Sx5AgCRWqRvImk3r8z8wLupkO1nN3
         5czaFZeRmpJjPOQCn3D2hX7RAnkGjY9TsEjfktm5R6qyp5BsN8U138tLsllBBel3RD0A
         8rohNXAh/K/+pqUJCVTayUOqZ4frWR5fOpyEliq1EJe+nx8L3OLikGE2V3Qrf6UxQ14j
         YCUQ==
X-Gm-Message-State: AC+VfDwnL9apvl85DfbMfJQH96OhvvGcI0jwD0zQU0lpjW7jolFEiDpE
	fllxjcGNpf5d05vAotkLYJU=
X-Google-Smtp-Source: ACHHUZ558Vn2BHGt7HPcyoo/dxzfQ/bcKey8DMqGxSRedZ+6NdT67o63GCejna/hoVRU+xuhhRs00Q==
X-Received: by 2002:a1c:7712:0:b0:3f4:1dd9:e9e0 with SMTP id t18-20020a1c7712000000b003f41dd9e9e0mr1526884wmi.7.1683415648950;
        Sat, 06 May 2023 16:27:28 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:28 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/5] spi: sun6i: add quirk for in-controller clock divider
Date: Sun,  7 May 2023 02:26:06 +0300
Message-Id: <20230506232616.1792109-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162735_020531_093D82A6 
X-CRM114-Status: GOOD (  23.01  )
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

Previously SPI controllers in Allwinner SoCs has a clock divider inside.
However now the clock divider is removed and to set the transfer clock
rate it's only needed to set the SPI module clock to the target value
and configure a proper work mode.

According to the datasheet there are three work modes:

| SPI Sample Mode         | SDM(bit13) | SDC(bit11) | Run Clock |
|-------------------------|------------|------------|-----------|
| normal sample           |      1     |      0     | <= 24 MHz |
| delay half cycle sample |      0     |      0     | <= 40 MHz |
| delay one cycle sample  |      0     |      1     | >= 80 MHz |

Add a quirk for this kind of SPI controllers.

Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/spi/spi-sun6i.c | 92 +++++++++++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 01a01cd86db5..1e9e9a8159d9 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -42,7 +42,9 @@
 #define SUN6I_TFR_CTL_CS_MANUAL			BIT(6)
 #define SUN6I_TFR_CTL_CS_LEVEL			BIT(7)
 #define SUN6I_TFR_CTL_DHB			BIT(8)
+#define SUN6I_TFR_CTL_SDC			BIT(11)
 #define SUN6I_TFR_CTL_FBS			BIT(12)
+#define SUN6I_TFR_CTL_SDM			BIT(13)
 #define SUN6I_TFR_CTL_XCH			BIT(31)
 
 #define SUN6I_INT_CTL_REG		0x10
@@ -87,6 +89,7 @@
 
 struct sun6i_spi_cfg {
 	unsigned long		fifo_depth;
+	bool			has_clk_ctl;
 };
 
 struct sun6i_spi {
@@ -260,7 +263,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 				  struct spi_transfer *tfr)
 {
 	struct sun6i_spi *sspi = spi_master_get_devdata(master);
-	unsigned int mclk_rate, div, div_cdr1, div_cdr2, timeout;
+	unsigned int div, div_cdr1, div_cdr2, timeout;
 	unsigned int start, end, tx_time;
 	unsigned int trig_level;
 	unsigned int tx_len = 0, rx_len = 0;
@@ -350,39 +353,66 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 
 	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 
-	/* Ensure that we have a parent clock fast enough */
-	mclk_rate = clk_get_rate(sspi->mclk);
-	if (mclk_rate < (2 * tfr->speed_hz)) {
-		clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
-		mclk_rate = clk_get_rate(sspi->mclk);
-	}
+	if (sspi->cfg->has_clk_ctl) {
+		unsigned int mclk_rate = clk_get_rate(sspi->mclk);
 
-	/*
-	 * Setup clock divider.
-	 *
-	 * We have two choices there. Either we can use the clock
-	 * divide rate 1, which is calculated thanks to this formula:
-	 * SPI_CLK = MOD_CLK / (2 ^ cdr)
-	 * Or we can use CDR2, which is calculated with the formula:
-	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
-	 * Wether we use the former or the latter is set through the
-	 * DRS bit.
-	 *
-	 * First try CDR2, and if we can't reach the expected
-	 * frequency, fall back to CDR1.
-	 */
-	div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
-	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
-	if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
-		reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
-		tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
+		/* Ensure that we have a parent clock fast enough */
+		if (mclk_rate < (2 * tfr->speed_hz)) {
+			clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
+			mclk_rate = clk_get_rate(sspi->mclk);
+		}
+
+		/*
+		 * Setup clock divider.
+		 *
+		 * We have two choices there. Either we can use the clock
+		 * divide rate 1, which is calculated thanks to this formula:
+		 * SPI_CLK = MOD_CLK / (2 ^ cdr)
+		 * Or we can use CDR2, which is calculated with the formula:
+		 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
+		 * Whether we use the former or the latter is set through the
+		 * DRS bit.
+		 *
+		 * First try CDR2, and if we can't reach the expected
+		 * frequency, fall back to CDR1.
+		 */
+		div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
+		div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
+		if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
+			reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
+			tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
+		} else {
+			div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
+			reg = SUN6I_CLK_CTL_CDR1(div);
+			tfr->effective_speed_hz = mclk_rate / (1 << div);
+		}
+
+		sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
 	} else {
-		div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
-		reg = SUN6I_CLK_CTL_CDR1(div);
-		tfr->effective_speed_hz = mclk_rate / (1 << div);
+		clk_set_rate(sspi->mclk, tfr->speed_hz);
+		tfr->effective_speed_hz = clk_get_rate(sspi->mclk);
+
+		/*
+		 * Configure work mode.
+		 *
+		 * There are three work modes depending on the controller clock
+		 * frequency:
+		 * - normal sample mode           : CLK <= 24MHz SDM=1 SDC=0
+		 * - delay half-cycle sample mode : CLK <= 40MHz SDM=0 SDC=0
+		 * - delay one-cycle sample mode  : CLK >= 80MHz SDM=0 SDC=1
+		 */
+		reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
+
+		if (tfr->effective_speed_hz <= 24000000)
+			reg |= SUN6I_TFR_CTL_SDM;
+		else if (tfr->effective_speed_hz >= 80000000)
+			reg |= SUN6I_TFR_CTL_SDC;
+		else
+			reg &= ~(SUN6I_TFR_CTL_SDM | SUN6I_TFR_CTL_SDC);
+
+		sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 	}
 
-	sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
 	/* Finally enable the bus - doing so before might raise SCK to HIGH */
 	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
 	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
@@ -701,10 +731,12 @@ static void sun6i_spi_remove(struct platform_device *pdev)
 
 static const struct sun6i_spi_cfg sun6i_a31_spi_cfg = {
 	.fifo_depth	= SUN6I_FIFO_DEPTH,
+	.has_clk_ctl	= true,
 };
 
 static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
 	.fifo_depth	= SUN8I_FIFO_DEPTH,
+	.has_clk_ctl	= true,
 };
 
 static const struct of_device_id sun6i_spi_match[] = {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

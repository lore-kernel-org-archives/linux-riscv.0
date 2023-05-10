Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB06C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmMMWGZE4tZzu0MgkW3Nk76IDsjm85xgimZuOl0Rumo=; b=1W3tbF+DALS4fH
	a1bSOURxQ8XtkUdnXAGTEEAn+k7lJ6R1pZZ5Jp+J4lngxzgh0l4dHWuaGroRjfUcCjqfKuWh79HwH
	lJkXQkCmBPeSgtBfY6RX48TjNz2SB5C9tBkiAd6ob/C0LaZ1g9USMDbl0GJE1T6KlKbJU4srn0UlM
	Llo+UOoZKHjIdRm6T3SIQEosJR5lD6C0RQD2nzqwVG3Xniz5pHcHi3FE9htDGz4c6zQfY+CASKUF2
	5birBj8s7qFVZEYmHMWim6caNvr2aDpI7ak3hQYIVy06/unO32SIBqm++Ce04V3Rgfr5K3ZYJ8vCC
	Skt3HbjBRC1dm2G6Erqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevp-005Tz4-2c;
	Wed, 10 May 2023 08:12:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwevj-005TrB-37;
	Wed, 10 May 2023 08:12:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3063afa2372so6314512f8f.0;
        Wed, 10 May 2023 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683706323; x=1686298323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8Xbue+dZrUS0EtWBIjxZwNQ7G1HJWZPzEox+l8G5TM=;
        b=ilLqa4TIHk3vsCNzQPNPreZVusj7unaBLMLeM5ZUQEL7RYDEKZGyeg6Po5XgRyhIM9
         NA1ZpzcrniOt2D/B7rIgjZ5dguaybhSBgQHaALXnjc5VlMDXyq0xs/QdKFcOys/TZGW4
         vfwyqrnNqNV3tj35MYu03Fv6DvU1p7bjrEXFmXw1+gBOLB38BEy7zxp1A/8t6IMtVneX
         1fyW66M5JjhJoef7SqkDgV5AxnoEz9lNfxDn+zaPZNrzgYid6uW6PUFiJKiOpuLgK5D+
         SvsQKlIyiVtn8oUNmBLBVf831eKxd5n9Y6fIvgxxsq7gGZCdBGPMRWbwQuUNjQmFIUbM
         O71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706323; x=1686298323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8Xbue+dZrUS0EtWBIjxZwNQ7G1HJWZPzEox+l8G5TM=;
        b=gAQ1Z0F9c5STiP9qqmoqKbV6J90G2FY/N+Gaxx7ibTA5ycuj0r73cYjoPW4n/ZMFHr
         fkQE8Y94+IFagXQszLp704Ss2C2L2yPE7CPFBqsQ3K/4wAjl5/oc6lTA0kU1cempAJ4J
         uKnle9SejU+WVORYIrI12iLbOY+yIR+9G+rtbKKTvQ9yJDDo5SYQCYYGlFSAlq3IurF7
         N+d/a7vBy1I4XIfbapBEE1V0igCAVXsZaw8l/uVfb771qzvRvvnDwuOiXh2dmyOFn2PA
         tG4/sYJWKSfuYDzvtPa23s9FTUE1X5w7yDboER5beX2MzYLosYCY1aGGuPy3UQMXmCcN
         UvPw==
X-Gm-Message-State: AC+VfDxRzvwjT0bJFvgdrPVDq9wb32rW59QsY+YVyTNOPzq1U1bsi8LJ
	z+FEn/j9cyeyoB6LW0P43x8=
X-Google-Smtp-Source: ACHHUZ6U+cGMbulmj6nJrRqn5l5Tf1FQijCWZ80FeaYUifagQC6IDHhOU5heb6VUO5cb2bd5NXRAjg==
X-Received: by 2002:a5d:4c82:0:b0:307:a77c:c167 with SMTP id z2-20020a5d4c82000000b00307a77cc167mr3678929wrs.57.1683706323286;
        Wed, 10 May 2023 01:12:03 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm16496375wru.14.2023.05.10.01.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:12:02 -0700 (PDT)
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
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/5] spi: sun6i: add quirk for in-controller clock divider
Date: Wed, 10 May 2023 11:11:10 +0300
Message-Id: <20230510081121.3463710-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_011212_003779_B84F6173 
X-CRM114-Status: GOOD (  22.76  )
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
 drivers/spi/spi-sun6i.c | 91 +++++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 01a01cd86db5..e4efab310469 100644
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
@@ -350,39 +353,65 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 
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
+		 * Wether we use the former or the latter is set through the
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
+		reg &= ~(SUN6I_TFR_CTL_SDM | SUN6I_TFR_CTL_SDC);
+
+		if (tfr->effective_speed_hz <= 24000000)
+			reg |= SUN6I_TFR_CTL_SDM;
+		else if (tfr->effective_speed_hz >= 80000000)
+			reg |= SUN6I_TFR_CTL_SDC;
+
+		sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
 	}
 
-	sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
 	/* Finally enable the bus - doing so before might raise SCK to HIGH */
 	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
 	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
@@ -701,10 +730,12 @@ static void sun6i_spi_remove(struct platform_device *pdev)
 
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

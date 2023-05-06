Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA88C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 23:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RiLkEw+bgkQsdoc4d/0HKizrvFF8xIPtZ3L/s31cGk=; b=CQrWP84Ms8Air3
	Wwt3xsGxfXG0JiagCuRP+qEvlUw4G+XMUQrtpl2oJiHwyhDeoFKBNThmyTKIy0KqeWf4IreSvPi5N
	ftRsVco451mPx2ycor0JRgIb5C+COuhLIVG5vMLfzs7GDzUIBWnSw5tYxGNsTjfopReBFd3AvMhNM
	UtsAoWieuBU3IFEfjd5kEINRvNTlW/2L8XGLXPAbmURgizNRnCBL61QVAvh3F7zeh2coq8SjinFU2
	/Ym47WHvXz0b91V5m6ijofIFZkrkBB+/zkvImSU61fJOWomiSGrQdfXIp69io/qWPvQcOapITSCv9
	g7eksZKFhPqhUfD2MNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJW-00EaSU-0h;
	Sat, 06 May 2023 23:27:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvRJP-00EaM3-0I;
	Sat, 06 May 2023 23:27:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso31575705e9.2;
        Sat, 06 May 2023 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683415640; x=1686007640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77wc1d6atkrSEJWlP3Ir0nLtSYker340vhK9d9PW+mI=;
        b=htlYjx58sfYfqUSXlNWMUwZdBb22bNBlNiRAf/CRTYXgdYQh2iKZc7QNwQrd73/26U
         ykpF5/fcZDPP+7g2/45uXpnI6Bq7FKknfXiPABUSTf/o6c+BjrI2Qub4WP6w/p2JmnKC
         1C6F/MXp18Gq6r6eZs4upDXCS67raF2FnJEu4SkxuGEeWl/lCrI5Ufuc8c7uPXK+WGPc
         vRp68gst2Z50XksNb4lKmjNNB8zVc+pS2oYqLAllRSOfckHRa2LSFRuH9Yl08lpTzbKl
         4JRHBBmr+HCxhOfrPqxq/3d81iHk1Ea1ZguQDkcBZkl5EtL5bLCkXSHn55qnllKs7lnx
         Tlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683415640; x=1686007640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77wc1d6atkrSEJWlP3Ir0nLtSYker340vhK9d9PW+mI=;
        b=K6Kw5m589/mIaQ2RsexLJ2KrPNk4KPXpRKcEBegUKOIQDOta0Hz7S8aIge/SdQib5X
         cu9PO71Gz0W2PWpmAfwBtgakU9ymF6ZrX0ciCFdruT4qBrBfh9U2k8fhoV1QoW0tUygq
         tF3re63Fz94HrXU7Q8He43Hk+84OPeS+msRlMdEmTZUQKelboIRSjOs//3yTv+VeHla1
         DXNZhw5G9v+KSoHZw5O2z3PSRAOsrbZuXi5Ohls/PteU3G+nputWHdD6NRF0dXYt14gu
         31RzFH8gvOnqGVTRdonkty9+ie7oiLMDlT1+Rp5P/Mpc9D20m2iJDG4yDClJwvWItq1A
         zR3g==
X-Gm-Message-State: AC+VfDz6TmuGOx/EaIqEHnuIswWubpHqtoF/bvy+EJxZmNetBd16t2Zp
	zYcJnvIbQCsrsvbSp46FA2o=
X-Google-Smtp-Source: ACHHUZ7eOJkv41Uz6Bjs2UsKXTpCwH/2AaHJ7q98bu4Voane946A3QUcNvLa3Hs19fS6LJji8k5idg==
X-Received: by 2002:a1c:cc14:0:b0:3f4:20bd:ba46 with SMTP id h20-20020a1ccc14000000b003f420bdba46mr1199340wmb.5.1683415640049;
        Sat, 06 May 2023 16:27:20 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003f1739a0116sm12098655wmc.33.2023.05.06.16.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 16:27:19 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
Date: Sun,  7 May 2023 02:26:05 +0300
Message-Id: <20230506232616.1792109-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506232616.1792109-1-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_162735_131528_670074A7 
X-CRM114-Status: GOOD (  20.05  )
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

From: Icenowy Zheng <icenowy@aosc.io>

As we're adding more properties to the OF match data, convert it to a
struct now.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/spi/spi-sun6i.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 7532c85a352c..01a01cd86db5 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -85,6 +85,10 @@
 #define SUN6I_TXDATA_REG		0x200
 #define SUN6I_RXDATA_REG		0x300
 
+struct sun6i_spi_cfg {
+	unsigned long		fifo_depth;
+};
+
 struct sun6i_spi {
 	struct spi_master	*master;
 	void __iomem		*base_addr;
@@ -99,7 +103,7 @@ struct sun6i_spi {
 	const u8		*tx_buf;
 	u8			*rx_buf;
 	int			len;
-	unsigned long		fifo_depth;
+	const struct sun6i_spi_cfg *cfg;
 };
 
 static inline u32 sun6i_spi_read(struct sun6i_spi *sspi, u32 reg)
@@ -156,7 +160,7 @@ static inline void sun6i_spi_fill_fifo(struct sun6i_spi *sspi)
 	u8 byte;
 
 	/* See how much data we can fit */
-	cnt = sspi->fifo_depth - sun6i_spi_get_tx_fifo_count(sspi);
+	cnt = sspi->cfg->fifo_depth - sun6i_spi_get_tx_fifo_count(sspi);
 
 	len = min((int)cnt, sspi->len);
 
@@ -289,14 +293,14 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 		 * the hardcoded value used in old generation of Allwinner
 		 * SPI controller. (See spi-sun4i.c)
 		 */
-		trig_level = sspi->fifo_depth / 4 * 3;
+		trig_level = sspi->cfg->fifo_depth / 4 * 3;
 	} else {
 		/*
 		 * Setup FIFO DMA request trigger level
 		 * We choose 1/2 of the full fifo depth, that value will
 		 * be used as DMA burst length.
 		 */
-		trig_level = sspi->fifo_depth / 2;
+		trig_level = sspi->cfg->fifo_depth / 2;
 
 		if (tfr->tx_buf)
 			reg |= SUN6I_FIFO_CTL_TF_DRQ_EN;
@@ -410,9 +414,9 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
 	reg = SUN6I_INT_CTL_TC;
 
 	if (!use_dma) {
-		if (rx_len > sspi->fifo_depth)
+		if (rx_len > sspi->cfg->fifo_depth)
 			reg |= SUN6I_INT_CTL_RF_RDY;
-		if (tx_len > sspi->fifo_depth)
+		if (tx_len > sspi->cfg->fifo_depth)
 			reg |= SUN6I_INT_CTL_TF_ERQ;
 	}
 
@@ -543,7 +547,7 @@ static bool sun6i_spi_can_dma(struct spi_master *master,
 	 * the fifo length we can just fill the fifo and wait for a single
 	 * irq, so don't bother setting up dma
 	 */
-	return xfer->len > sspi->fifo_depth;
+	return xfer->len > sspi->cfg->fifo_depth;
 }
 
 static int sun6i_spi_probe(struct platform_device *pdev)
@@ -582,7 +586,7 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 	}
 
 	sspi->master = master;
-	sspi->fifo_depth = (unsigned long)of_device_get_match_data(&pdev->dev);
+	sspi->cfg = of_device_get_match_data(&pdev->dev);
 
 	master->max_speed_hz = 100 * 1000 * 1000;
 	master->min_speed_hz = 3 * 1000;
@@ -695,9 +699,17 @@ static void sun6i_spi_remove(struct platform_device *pdev)
 		dma_release_channel(master->dma_rx);
 }
 
+static const struct sun6i_spi_cfg sun6i_a31_spi_cfg = {
+	.fifo_depth	= SUN6I_FIFO_DEPTH,
+};
+
+static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
+	.fifo_depth	= SUN8I_FIFO_DEPTH,
+};
+
 static const struct of_device_id sun6i_spi_match[] = {
-	{ .compatible = "allwinner,sun6i-a31-spi", .data = (void *)SUN6I_FIFO_DEPTH },
-	{ .compatible = "allwinner,sun8i-h3-spi",  .data = (void *)SUN8I_FIFO_DEPTH },
+	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
+	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun6i_spi_match);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

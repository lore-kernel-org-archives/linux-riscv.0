Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C658AEA4E20
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPRPxz4EAO8KaDH50JNs+mZtRTq9Xu4PTHLoAG3M8/s=; b=bsgVP06CwqEeYr
	EFG1sYs7I2LgmZrDqodFWq6BtPRh6uH2wS4T1NmcxOZO54d1H7PznW5QChKfv+gIN8jLHKo0ZOMvy
	jaOXa05ARo7zvm11UmO+XIMt7BTDjCE0fHaKwWpEmEACUOtUvKCNtgS272xypaZQ+PpZBp2Czkrad
	P9ngBzx3Xm6VhV0SY0nYEriSZRdggqks1H67vKLOF9n78Y2forJ1EaHSA1lUnVXIuzwThQm0PuGnt
	rvrgQZFEyGjT4izJpKysz4RetciuEKXRej93tsND9dUNgZrB+sKXpi5VBS0EoYzUGNw6bvMUKAILD
	3LO0/RUQTV1y8cppkTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y9-0000000DK5U-2zig;
	Mon, 02 Mar 2026 15:14:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y7-0000000DK2R-1SXu
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:14:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48372efa020so39365675e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464437; x=1773069237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vMnihDprCpz00E0mqvOLaz+xzD900tygzUTesRDljg=;
        b=aeH5atwX9G6erlF8nkWprnAdV9sKkFLqDJewILjg8eOJ6OnYcmx60gtv4PAns2/W2y
         m1L1m3NVCPbhhXH5LzVnq53uzscXlkqSqp+LXSsdwMxZf+8h1ZUd4wEnGf2nuSXblCjn
         LlSwrMGPWPHElY2bnrSi5+p+jCtwNH2ggcGAd4hH/5/b9x0ikZ2DYbs3OJiSrqE4aX+Z
         zXNVyqtfIDbL/alSWH2nw9ZcFcYRfRnE5LyUH+a4VTP7kWTOwruxIyA8XEHrahlKUoIQ
         q9wBDbDVv7/n6ASHpEu4MEHfEoRoIj6ZkTpnFiiG8s7N2hWJme4+a+IBi8uyuIg2qW2w
         juZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464437; x=1773069237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1vMnihDprCpz00E0mqvOLaz+xzD900tygzUTesRDljg=;
        b=cXO3Uv1B8fdavWWp7yvN2+zXV8ldp9eARwQkg9fiNCwEyCybGdAEFcw7VhMtleOIi8
         lVdFRNorNB3Vt0qcYElFDMP4IJypJt/K5GXPhTLMPM0hFu9jKBUrOT5EUdVjcVnUoPCw
         ybgShQTrRtYJy3FGt+isWvBW94M9ijxuuHDTDRzyjSAoqcIxjYZGfZ1k80RVDMFFZ2Nk
         BJPoPOGzXv3fYqt57lqnrfwR+8NXwaiMIVDSzyaOJWj6s3xWjtaEfg474NCHZuduobgK
         rId9flHqny0O4QLprBt403vcWBB0/JSumtCs7vTt1fY4S188fl/2s8wdbUTbQ4f8gKU/
         /B7g==
X-Forwarded-Encrypted: i=1; AJvYcCUoE1QiceE35jIX7dMFgDK/hjze1owKS7tpq+AyOF++sHlCOQKDYLki0SmA1OYb/B4O3zNbiuQV6InC5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGeDH6yyhmO3vOZFsnhj8fLIHXOWwywae2H11ik2045P0LGF3Q
	WyWu993f9BGFAtrQ72BNGW4tAN0OLvTNMihIdiLmq23oV8AdDFTCBqeq
X-Gm-Gg: ATEYQzxDj3x2nof1J9Aq3Srl+NP5+XuxRspuyAd5/GzPG1Rsmb6m+VohDBCVR9fn0YA
	+Z+cMd/97C8ZAclq3PyRGbRPklC1cXx8whLRbaKXS1jO2DGrDv+hpiV71upeO48ZuUdTgu+xHCU
	D884gEGhUBNuCh1WB3SgFCXtWxKjlTjZrsBANXb5LRguC+xKIlbeZ1MSfoUSxV2VhQ9R2UGLau7
	4QmJgxAD7wKF8S+oD/N0TR8tPNKNvRy5hQoYhrhl/jKWFnQdzXZspKvzxranNl3we9i9xdV6NIp
	eVHrkN1UO8q9gXlT/FFLkDB6ZVhjUOSuXvA8h2Nxx3Vwc9sEbNnI6bWqYfeH7L53W6LsvihBIFV
	bRVe5BW1AS9tEU8diKLN0z0u1Tk6DFq/h3+oDEe3MSaZeEDkX74JrJ6eNzpeAcA71QO/5iZ58aj
	+vuCmXPXsaj/H9NzZtopKPEWbxg8dKU9lxZ74p0AhmbnZIZnDPwBYiOBA0FZF3wYk2Qg==
X-Received: by 2002:a05:600c:c16e:b0:482:e5d4:b7ca with SMTP id 5b1f17b1804b1-483c9bbb8d3mr200785895e9.8.1772464437211;
        Mon, 02 Mar 2026 07:13:57 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:56 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:26 +0100
Subject: [PATCH 05/10] mmc: sdhci-of-k1: add AIB register support for
 voltage switching
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-5-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071359_414966_026A08E7 
X-CRM114-Status: GOOD (  15.59  )
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

Add support for SpacemiT K1 Analog Interface Block (AIB) register
programming required for proper UHS voltage switching. The AIB register
controls SoC-level voltage domain coordination between the SDHCI
controller and I/O pins.

- Add AIB register address parsing from device tree
- Implement authentication sequence for secure register access
- Add voltage domain switching for 3.3V/1.8V operation

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 2a982bca2a50ca96f43af7b4de5bc4fb4b5b195b..9425bde6a72541bd628997e91f957072a6266c25 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -68,12 +68,19 @@
 #define  SDHC_PHY_DRIVE_SEL		GENMASK(2, 0)
 #define  SDHC_RX_BIAS_CTRL		BIT(5)
 
+#define  MMC1_IO_V18EN			BIT(2)
+#define  AKEY_ASFAR			0xBABA
+#define  AKEY_ASSAR			0xEB10
+
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pinctrl_default;
 	struct pinctrl_state *pinctrl_uhs;
+	u32 aib_mmc1_io_reg;
+	u32 apbc_asfar_reg;
+	u32 apbc_assar_reg;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -220,6 +227,47 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_set_aib_mmc1_io(struct sdhci_host *host, int signal_voltage)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	void __iomem *aib_reg, *asfar_reg, *assar_reg;
+	u32 reg_value;
+
+	if (!sdhst->aib_mmc1_io_reg || !sdhst->apbc_asfar_reg || !sdhst->apbc_assar_reg)
+		return;
+
+	asfar_reg = ioremap(sdhst->apbc_asfar_reg, 4);
+	assar_reg = ioremap(sdhst->apbc_assar_reg, 4);
+	aib_reg = ioremap(sdhst->aib_mmc1_io_reg, 4);
+
+	if (!asfar_reg || !assar_reg || !aib_reg) {
+		dev_err(mmc_dev(host->mmc), "Failed to map AIB registers\n");
+		goto cleanup;
+	}
+
+	writel(AKEY_ASFAR, asfar_reg);
+	writel(AKEY_ASSAR, assar_reg);
+	reg_value = readl(aib_reg);
+
+	if (signal_voltage == MMC_SIGNAL_VOLTAGE_180)
+		reg_value |= MMC1_IO_V18EN;
+	else
+		reg_value &= ~MMC1_IO_V18EN;
+
+	writel(AKEY_ASFAR, asfar_reg);
+	writel(AKEY_ASSAR, assar_reg);
+	writel(reg_value, aib_reg);
+
+cleanup:
+	if (aib_reg)
+		iounmap(aib_reg);
+	if (asfar_reg)
+		iounmap(asfar_reg);
+	if (assar_reg)
+		iounmap(assar_reg);
+}
+
 static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 						      struct mmc_ios *ios)
 {
@@ -233,6 +281,8 @@ static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 	if (ret)
 		return ret;
 
+	spacemit_sdhci_set_aib_mmc1_io(host, ios->signal_voltage);
+
 	/* Select appropriate pinctrl state based on signal voltage */
 	if (sdhst->pinctrl) {
 		switch (ios->signal_voltage) {
@@ -341,6 +391,16 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 		dev_warn(dev, "Failed to get regulators: %d\n", ret);
 
 	sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	if (of_property_read_u32(dev->of_node, "spacemit,aib-mmc1-io-reg", &sdhst->aib_mmc1_io_reg))
+		sdhst->aib_mmc1_io_reg = 0;
+
+	if (of_property_read_u32(dev->of_node, "spacemit,apbc-asfar-reg", &sdhst->apbc_asfar_reg))
+		sdhst->apbc_asfar_reg = 0;
+
+	if (of_property_read_u32(dev->of_node, "spacemit,apbc-assar-reg", &sdhst->apbc_assar_reg))
+		sdhst->apbc_assar_reg = 0;
+
 	sdhst->pinctrl = devm_pinctrl_get(dev);
 	if (!IS_ERR(sdhst->pinctrl)) {
 		sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

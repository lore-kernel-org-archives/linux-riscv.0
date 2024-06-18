Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB53C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW2kRBmDeuNMSVg2zjxqagql/evLfPuHXKkMjOxTmb8=; b=JH8/r/A0Xl0tZ3
	7euIIkpGZSVJxswJadpGjTKbRcjp48vnwtaMYaDvfSv/6ITOpsnoawk5j1BBkFltNjHmOSDSttft4
	c9TgoZ2X3VEghwYpXGqT0hixkOC+tPm7X0qX/qZkLaCFFv5L5m15K/wiiOlaO3zmZvsxqF1f/GaUI
	9vWMCzy0fd0lCGyBlEV49BfmFGpReURHL9S//7okFmuqRDtwxBL4yRheZev6Xu9lOnGD6TNSboMzJ
	hazvJT6Di4N6daFyhiP8efqrw5jOTosCDGuxE9SWQWxNCkK6hWNsTe5YGfGg3nkJPI1doTcGgUCfU
	wwKdwqn+6aq0+QFwnv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUMw-0000000E69U-2ESO;
	Tue, 18 Jun 2024 08:39:10 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUMt-0000000E68S-3R7A
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:39:09 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6f855b2499cso2870182a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699946; x=1719304746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqNE9BQXbQMY9LnYcxBOu7BaOTd6cy5mJT0V1mtLz+0=;
        b=N3R8d5xF6zV/wbVcQqpOYUWp8dbMB0ItphU9364mzESpvk1+/HdPmiWoahDVV6yke4
         1xd5XL6ZMeBrBdFneqLNVCn/Z80nqSHkQ6ZIzEGGQsYg/mrlSzreXUUqMPyOu86opuUS
         LKYiK9hok0y9sjNGXp9iE3r0IAxooUkDmP8iGdOtsIaoCY7RM3insD/cDmHpF+6c9Hv+
         XV/FBo1EMZ3sqWis2MzUWs4Q10rTS83O4Vhz9R19XPLVTP2yn6R+29Dg96mFbqutXK1b
         ufpOqIKqWOelghprcHlZMDJZQ8iwJjKc0H/0qv9umN62JWFtkulIqca1Ralo6seq0iVd
         zHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699946; x=1719304746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqNE9BQXbQMY9LnYcxBOu7BaOTd6cy5mJT0V1mtLz+0=;
        b=VEPUfWEzUoIDFdtamJTiBjHG5HsvRQIRRWFXWcmw4n3nlQJA5LiARRxWJqvWmeps5n
         nVTWDhAkUI6VldqERpe+7HVmeeNma7UwIkIl6lAiat+dlQHnBpU9VFQVAL7Ai509qekA
         EohZvheIc2altGmJ9JwC8Cd15wZ75UUCLK8rmqlPxMxPpVJE5ocwlIk6p5rCD74xFVbY
         f86CqwFlK77IAlLt4XyVzZG0iWfyKozTETbMBWvHqyt0gJ5aWvUDAZZ0lf2MzOVxN11T
         j1RmlAS1G2M/N2sM/iMLe6618f3e+Iv9b9+MdlOmahv2awwyLN2nzYoQglwLBeZM48CE
         vu9A==
X-Forwarded-Encrypted: i=1; AJvYcCWGUNFi3wKYEkVmjFydFxyJFW7j5p/1e80lS9NJKP+7+uTOSbmeXrOqm+Xy/+cbxZVrTo4zmBUcZHx3cdjpejS1l0DDSPWsRJHSGMIANq7q
X-Gm-Message-State: AOJu0YwOpUvrjE+zThWBc1PVh80MS5rqlC3utnpdd5W4aQLmO2FEWU+o
	bOX/PwgLS9JSZvtAGbfHE/R7pFDjQeulXoVNW5pAzqllru30RiL8
X-Google-Smtp-Source: AGHT+IFrDIzuSkJZBQmony515u1eRDgXxiL0D+F4Cidloyg3pJW1+8xd63nDB5YUb6XJE7T9z7viig==
X-Received: by 2002:a9d:6d0c:0:b0:6fc:f2b:d45 with SMTP id 46e09a7af769-6fc0f2b0e49mr12815399a34.3.1718699946434;
        Tue, 18 Jun 2024 01:39:06 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5afa9f62sm1779101a34.3.2024.06.18.01.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:39:04 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v4 3/4] mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
Date: Tue, 18 Jun 2024 16:38:56 +0800
Message-Id: <66af68e1c1be09fb3300ec0ed72acff752f7d799.1718697954.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718697954.git.unicorn_wang@outlook.com>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_013907_897942_7F61AF18 
X-CRM114-Status: GOOD (  19.95  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add support for the mmc controller of Sophgo SG2042.

SG2042 uses Synopsys PHY the same as TH1520 so we reuse the tuning
logic from TH1520. Besides this, this patch implement some SG2042
specific work, such as clocks and reset ops.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 172 ++++++++++++++++++++++++++--
 1 file changed, 165 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index f6d6903a0e36..e18a7f97c994 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -114,12 +114,15 @@
 #define DWC_MSHC_PTR_PHY_R	0x300
 
 /* PHY general configuration */
-#define PHY_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x00)
-#define PHY_CNFG_RSTN_DEASSERT	0x1  /* Deassert PHY reset */
-#define PHY_CNFG_PAD_SP_MASK	GENMASK(19, 16) /* bits [19:16] */
-#define PHY_CNFG_PAD_SP		0x0c /* PMOS TX drive strength */
-#define PHY_CNFG_PAD_SN_MASK	GENMASK(23, 20) /* bits [23:20] */
-#define PHY_CNFG_PAD_SN		0x0c /* NMOS TX drive strength */
+#define PHY_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x00)
+#define PHY_CNFG_RSTN_DEASSERT		0x1  /* Deassert PHY reset */
+#define PHY_CNFG_PHY_PWRGOOD_MASK	BIT_MASK(1) /* bit [1] */
+#define PHY_CNFG_PAD_SP_MASK		GENMASK(19, 16) /* bits [19:16] */
+#define PHY_CNFG_PAD_SP			0x0c /* PMOS TX drive strength */
+#define PHY_CNFG_PAD_SP_SG2042		0x09 /* PMOS TX drive strength for SG2042 */
+#define PHY_CNFG_PAD_SN_MASK		GENMASK(23, 20) /* bits [23:20] */
+#define PHY_CNFG_PAD_SN			0x0c /* NMOS TX drive strength */
+#define PHY_CNFG_PAD_SN_SG2042		0x08 /* NMOS TX drive strength for SG2042 */
 
 /* PHY command/response pad settings */
 #define PHY_CMDPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x04)
@@ -148,10 +151,12 @@
 #define PHY_PAD_TXSLEW_CTRL_P		0x3 /* Slew control for P-Type pad TX */
 #define PHY_PAD_TXSLEW_CTRL_N_MASK	GENMASK(12, 9) /* bits [12:9] */
 #define PHY_PAD_TXSLEW_CTRL_N		0x3 /* Slew control for N-Type pad TX */
+#define PHY_PAD_TXSLEW_CTRL_N_SG2042	0x2 /* Slew control for N-Type pad TX for SG2042 */
 
 /* PHY CLK delay line settings */
 #define PHY_SDCLKDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x1d)
-#define PHY_SDCLKDL_CNFG_UPDATE	BIT(4) /* set before writing to SDCLKDL_DC */
+#define PHY_SDCLKDL_CNFG_EXTDLY_EN	BIT(0)
+#define PHY_SDCLKDL_CNFG_UPDATE		BIT(4) /* set before writing to SDCLKDL_DC */
 
 /* PHY CLK delay line delay code */
 #define PHY_SDCLKDL_DC_R		(DWC_MSHC_PTR_PHY_R + 0x1e)
@@ -159,10 +164,14 @@
 #define PHY_SDCLKDL_DC_DEFAULT		0x32 /* default delay code */
 #define PHY_SDCLKDL_DC_HS400		0x18 /* delay code for HS400 mode */
 
+#define PHY_SMPLDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x20)
+#define PHY_SMPLDL_CNFG_BYPASS_EN	BIT(1)
+
 /* PHY drift_cclk_rx delay line configuration setting */
 #define PHY_ATDL_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x21)
 #define PHY_ATDL_CNFG_INPSEL_MASK	GENMASK(3, 2) /* bits [3:2] */
 #define PHY_ATDL_CNFG_INPSEL		0x3 /* delay line input source */
+#define PHY_ATDL_CNFG_INPSEL_SG2042	0x2 /* delay line input source for SG2042 */
 
 /* PHY DLL control settings */
 #define PHY_DLL_CTRL_R			(DWC_MSHC_PTR_PHY_R + 0x24)
@@ -206,6 +215,11 @@ struct rk35xx_priv {
 	u8 txclk_tapnum;
 };
 
+#define SG2042_MAX_CLKS 2
+struct sg2042_priv {
+	struct clk_bulk_data clks[SG2042_MAX_CLKS];
+};
+
 struct dwcmshc_pltfm_data;
 struct dwcmshc_priv {
 	struct clk	*bus_clk;
@@ -1017,6 +1031,125 @@ static int cv18xx_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 	return ret;
 }
 
+static inline void sg2042_sdhci_phy_init(struct sdhci_host *host)
+{
+	u32 val;
+
+	/* Asset phy reset & set tx drive strength */
+	val = sdhci_readl(host, PHY_CNFG_R);
+	val &= ~PHY_CNFG_RSTN_DEASSERT;
+	val |= FIELD_PREP(PHY_CNFG_PHY_PWRGOOD_MASK, 1);
+	val |= FIELD_PREP(PHY_CNFG_PAD_SP_MASK, PHY_CNFG_PAD_SP_SG2042);
+	val |= FIELD_PREP(PHY_CNFG_PAD_SN_MASK, PHY_CNFG_PAD_SN_SG2042);
+	sdhci_writel(host, val, PHY_CNFG_R);
+
+	/* Configure phy pads */
+	val = PHY_PAD_RXSEL_3V3;
+	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLUP);
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
+	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
+
+	val = PHY_PAD_RXSEL_3V3;
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
+	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
+
+	val = PHY_PAD_RXSEL_3V3;
+	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLDOWN);
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
+	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
+	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
+
+	/* Configure delay line */
+	/* Enable fixed delay */
+	sdhci_writeb(host, PHY_SDCLKDL_CNFG_EXTDLY_EN, PHY_SDCLKDL_CNFG_R);
+	/*
+	 * Set delay line.
+	 * Its recommended that bit UPDATE_DC[4] is 1 when SDCLKDL_DC is being written.
+	 * Ensure UPDATE_DC[4] is '0' when not updating code.
+	 */
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val |= PHY_SDCLKDL_CNFG_UPDATE;
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+	/* Add 10 * 70ps = 0.7ns for output delay */
+	sdhci_writeb(host, 10, PHY_SDCLKDL_DC_R);
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val &= ~(PHY_SDCLKDL_CNFG_UPDATE);
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+
+	/* Set SMPLDL_CNFG, Bypass */
+	sdhci_writeb(host, PHY_SMPLDL_CNFG_BYPASS_EN, PHY_SMPLDL_CNFG_R);
+
+	/* Set ATDL_CNFG, tuning clk not use for init */
+	val = FIELD_PREP(PHY_ATDL_CNFG_INPSEL_MASK, PHY_ATDL_CNFG_INPSEL_SG2042);
+	sdhci_writeb(host, val, PHY_ATDL_CNFG_R);
+
+	/* Deasset phy reset */
+	val = sdhci_readl(host, PHY_CNFG_R);
+	val |= PHY_CNFG_RSTN_DEASSERT;
+	sdhci_writel(host, val, PHY_CNFG_R);
+}
+
+static void sg2042_sdhci_reset(struct sdhci_host *host, u8 mask)
+{
+	sdhci_reset(host, mask);
+
+	if (mask & SDHCI_RESET_ALL)
+		sg2042_sdhci_phy_init(host);
+}
+
+static int sg2042_clks_enable(struct dwcmshc_priv *dwc_priv)
+{
+	int ret = 0;
+	struct sg2042_priv *soc = dwc_priv->priv;
+
+	if (soc)
+		ret = clk_bulk_prepare_enable(SG2042_MAX_CLKS, soc->clks);
+	return ret;
+}
+
+static void sg2042_clks_disable(struct dwcmshc_priv *dwc_priv)
+{
+	struct sg2042_priv *soc = dwc_priv->priv;
+
+	if (soc)
+		clk_bulk_disable_unprepare(SG2042_MAX_CLKS,
+					   soc->clks);
+}
+
+static int sg2042_init(struct device *dev, struct sdhci_host *host,
+		       struct dwcmshc_priv *dwc_priv)
+{
+	int err;
+	struct sg2042_priv *soc = NULL;
+
+	soc = devm_kzalloc(dev, sizeof(struct sg2042_priv), GFP_KERNEL);
+	if (!soc)
+		return -ENOMEM;
+
+	soc->clks[0].id = "card";
+	soc->clks[1].id = "timer";
+	err = devm_clk_bulk_get_optional(mmc_dev(host->mmc), SG2042_MAX_CLKS,
+					 soc->clks);
+	if (err) {
+		dev_err(mmc_dev(host->mmc), "failed to get clocks %d\n", err);
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(SG2042_MAX_CLKS, soc->clks);
+	if (err) {
+		dev_err(mmc_dev(host->mmc), "failed to enable clocks %d\n", err);
+		return err;
+	}
+
+	dwc_priv->priv = soc;
+
+	return 0;
+}
+
 static const struct sdhci_ops sdhci_dwcmshc_ops = {
 	.set_clock		= sdhci_set_clock,
 	.set_bus_width		= sdhci_set_bus_width,
@@ -1066,6 +1199,16 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_pdata = {
 	},
 };
 
+static const struct sdhci_ops sdhci_dwcmshc_sg2042_ops = {
+	.set_clock		= sdhci_set_clock,
+	.set_bus_width		= sdhci_set_bus_width,
+	.set_uhs_signaling	= dwcmshc_set_uhs_signaling,
+	.get_max_clock		= dwcmshc_get_max_clock,
+	.reset			= sg2042_sdhci_reset,
+	.adma_write_desc	= dwcmshc_adma_write_desc,
+	.platform_execute_tuning = th1520_execute_tuning,
+};
+
 #ifdef CONFIG_ACPI
 static const struct dwcmshc_pltfm_data sdhci_dwcmshc_bf3_pdata = {
 	.pdata = {
@@ -1108,6 +1251,17 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
 	},
 };
 
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_sg2042_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_sg2042_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
+	.init = sg2042_init,
+	.clks_enable = sg2042_clks_enable,
+	.clks_disable = sg2042_clks_disable,
+};
+
 static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
 	.enable		= dwcmshc_sdhci_cqe_enable,
 	.disable	= sdhci_cqe_disable,
@@ -1200,6 +1354,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
 		.compatible = "thead,th1520-dwcmshc",
 		.data = &sdhci_dwcmshc_th1520_pdata,
 	},
+	{
+		.compatible = "sophgo,sg2042-dwcmshc",
+		.data = &sdhci_dwcmshc_sg2042_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

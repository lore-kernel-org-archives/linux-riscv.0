Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EC5C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2lWub9V3STXi/RT032LuOuyXJBNgIVR/UntcEnzNeQ=; b=MlJkkVTxF0274h
	XUNPlyvFOdSWO9Mz5D6f+9CB9MDU2xU4CQYbehx+KkWdQMH+6gZKpqJcWblNQlo0f7Y2wno/q1xuk
	wD43ZLyi3WMOuWYsQIxfGnxXXw6HvUpyszhIXmj1BScnB8E2Dwg9MzscUTtsXpJgdLiR4BD1HA9Hf
	yCo9b4RygrJr87wmquFgIDZFZoZHGSOLd+V0a7TZz588l2g93OQDsJyXbKE55DwfhfEPFZNmAHxPR
	gd69mLQQWzFyVThZ4yIa5sAnpmhKoFYBxY0qxRwgakYPkStV7mCtoHSj6tTOkpNgbO9tmSBMR04YS
	Fyz4xRJw2JMjMmMaC65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGn-000000028sP-47VV;
	Fri, 19 Jul 2024 08:47:18 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGk-000000028qp-3P4A
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:47:16 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d9e13ef9aaso1008554b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378834; x=1721983634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfm2+ftrh7cg8BlJVGfYgXVjbaiPePDwJgIlvGLtpaE=;
        b=STP9vQWl0XEQcXadeG8G7evJKpoNJwbxMCyX3TofPmVxuysafH2kzFMRG3PrMbkqws
         25FoFaCFCLlv13cJtNnIgVByQTvpo3/LU33MmjVl9YvyenVElQaGAfNI2iPKCMKY9oNe
         nhiZch2Z/IUmxMuxquJ9lq4gt5wqGMyX6ii6hsDvHiKws2EibkAbxAuF3AEcj+u+VKuW
         ATl3oieJT+wRRHAVlQGMHDX7+2YC2ySXSaHkL4+kuLx0Iy27XyBWtLpJI5YpbIFjvu0p
         4kBN/+y8n1xYugVYZHCezjQAHnq6g3BZ3nVUNf2JKk02yPxTdiFhgg7eECzA6Jk/JYnS
         2Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378834; x=1721983634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfm2+ftrh7cg8BlJVGfYgXVjbaiPePDwJgIlvGLtpaE=;
        b=EMigrNPd5TNmETTF4DuUEd/RLRVkcQ97S2aVUNLeD3LO031p4a/aGZhShFJZ9sbIO/
         6E1XbCSMQyh9oyDr/MDT5zIMH8NGGA9njKJbwUmUkM7q7n0dCe7LPs0LUlTlf4q+hWu2
         Tu/wimPYBKmL5W2i0rGJjSRqeu1P0mlbHriMDpey+teg1SmSOolGV3BYMm10W/XtRjGN
         Nk95hZ13lq9Ek8m7dCzE81VOZAgRbgzxRo4N3TA6XjHOIy/hKJas3ef3YjJr1zZRAJ+x
         h8i1aMX6QXJR6PpT3UH8ewkWLyTYiE1yPna+rj4bQKyMwhU6JG1D6jL/4xsOwV+Ma9av
         Lo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYBqYYH5KY9PmFJyQGayqTQod9FdJ+5LdUXxmWNVB6cQgiH74To1RzRkT+cg0j3z9Mczx68v584iQ3jZYKDlFlXB2TulvuhlGnzpZiXybG
X-Gm-Message-State: AOJu0YzqmVUrW9lwUvRdM7rWq7D/1dVj4hZtegDb206unX6WNt6qPUNz
	QPrg7Mo5Wiu3ov3j70SZwpDZZCFK+Gvejy460QAu5PqTHxrLZLGw
X-Google-Smtp-Source: AGHT+IHSMvYAu4FEW8B5oC5AEPd5DObu5q2/RRZ2raFurSo4HYZm90JXZt0hhxJClP+FLkhEsSBf2g==
X-Received: by 2002:a05:6870:a54e:b0:260:f7e7:65e with SMTP id 586e51a60fabf-260f7e70c68mr3172139fac.45.1721378833607;
        Fri, 19 Jul 2024 01:47:13 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c771dc8sm232411fac.24.2024.07.19.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:47:13 -0700 (PDT)
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
Subject: [PATCH v5 7/8] mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
Date: Fri, 19 Jul 2024 16:47:06 +0800
Message-Id: <0009673a6fc7fd1dcadaaefca83cb27c8444c045.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014714_883896_4789DF1D 
X-CRM114-Status: GOOD (  17.99  )
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
 drivers/mmc/host/sdhci-of-dwcmshc.c | 130 ++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 972d03ec60e3..d963b8986182 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -113,12 +113,15 @@
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
@@ -147,10 +150,12 @@
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
@@ -158,10 +163,14 @@
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
@@ -1015,6 +1024,90 @@ static int cv18xx_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
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
+static int sg2042_init(struct device *dev, struct sdhci_host *host,
+		       struct dwcmshc_priv *dwc_priv)
+{
+	static const char * const clk_ids[] = {"timer"};
+	int err;
+
+	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
+					    ARRAY_SIZE(clk_ids), clk_ids);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static const struct sdhci_ops sdhci_dwcmshc_ops = {
 	.set_clock		= sdhci_set_clock,
 	.set_bus_width		= sdhci_set_bus_width,
@@ -1056,6 +1149,16 @@ static const struct sdhci_ops sdhci_dwcmshc_cv18xx_ops = {
 	.platform_execute_tuning = cv18xx_sdhci_execute_tuning,
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
 static const struct dwcmshc_pltfm_data sdhci_dwcmshc_pdata = {
 	.pdata = {
 		.ops = &sdhci_dwcmshc_ops,
@@ -1104,6 +1207,15 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
 	},
 };
 
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_sg2042_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_sg2042_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
+	.init = sg2042_init,
+};
+
 static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
 	.enable		= dwcmshc_sdhci_cqe_enable,
 	.disable	= sdhci_cqe_disable,
@@ -1196,6 +1308,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

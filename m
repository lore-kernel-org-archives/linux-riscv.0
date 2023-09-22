Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB1E7D0BB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQDg9q9g1FG+u3ik2p2fDujQ5ueRppovD4wxE89Diws=; b=QUH72QpPbJxEIo
	o2TpF1dePo03NGCSTC4sbDUFrClbPAax8nm1AuZIUCOMfLP8AG6WZ2RyyPQIi422c9cbZFgXAAWwy
	ka4xhQ2sxptk2RQiefwtDvvNN5fFLC9tG0MstN6y3eI9W62zlFYug8GynRi+Uhc2hTjyfJMNcDbVH
	YrPdgcmmhkkVF0uJruVAlZi43hnc5trNQ8f9vJk4pNP/7ZN2XRLatspWGzgK6/kgqkwH5MDi/GTsd
	+wzv9jdRNUfRMNfskrY9RGg2/180kBvpv7rwunBhV9ANnNmj2PrqpoealXuKrPnHks1TW4Ox1n3zO
	zzpJrAHXGCoc3J8udV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKG-007aib-34;
	Fri, 22 Sep 2023 01:51:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKE-007aeo-0c
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Sep 2023 01:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Qr4tSpb4BNnKQQwWMoToDq5tTNIzWA+Sp0qHl9b8Mo=; b=jPRhAa2RdLtpbYXGO8AkZMlXIr
	uj/CLG3O1iB3B/qTYDvplbcP+kk2a4ZlWMlpQCTblaZIr4Ccu+Xahov9JpEIi8YLaPmi4w4dm4lCN
	b58Z1XnnWe1jIIo3e9GcXgG50s0WvuyCKtDMBV9AKI9fwt7F9txxwzIwf/edjQtLP6AmtgI2rw9Z5
	WZLcBC1N6Hg/NK0wulyqtiJhrzMc6l1prGxtNt9jH7M+aUkZQ3V5LzEcvmH+iafi9egbJXkCdHQCn
	tUqNg2+9pZt0Erm57W4w3/JQLUph1iEItaQ3WM4kstZ0wMkBPtaUk6H+s/SFQHkfCC8OCvkR8eVEn
	Hy3Tj/ww==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK6-00Fq1V-1a
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:20 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59c0b5f984aso19799277b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347471; x=1695952271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Qr4tSpb4BNnKQQwWMoToDq5tTNIzWA+Sp0qHl9b8Mo=;
        b=XOrg4wXMTPuIl4iFo4IkxxHfXgdh0tUaNTVVPDTm/npluZxOrlAODY22FVMOHdi33B
         YX+VTHaIdnSqi+6oke7b+tzLQjC8M9pT1923TxMFc24BxRGZp0CEF3800XeIQ8iC8SSi
         i4bt9M3iYA7lCWfj4qbHSv1a0bwOKJ0wBe+RZ1gcdicKa8D1r2egKLmkrkJpGea689LS
         6dKzG1N7heaeLPXIseMR2HzR2mbHiTGanllsPIz08MMkOgPKHIF6NrAaJmeliGgzSnwu
         mnT89tIKx3AWCTcGVmiuomB8x1GJHBOwM8xTMkKP1XTELdXj7FrPHBrBN4elcS7LEKtm
         B8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347471; x=1695952271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Qr4tSpb4BNnKQQwWMoToDq5tTNIzWA+Sp0qHl9b8Mo=;
        b=iZnJ/ejuuM+cbUD8D9n+mZoVXMNrN3/4MZ+UJeKkHPPBhqdeMqAhQzFZqOVT/4Dwvv
         1If55Wb1XdmnBQffjO+wt7H+NWZIFu/DB/3FTv/+pyGc95dYG5uT+jbD60LK693ra1pA
         gN4O/2LQoj4xQJr8Cbv1OSzgzeC1d/mXsISoxLDfDbseiY7QTFbP/jKIAwBpzwSGpRZy
         hg6rghhbItvzJiF1ybw34tpNrR7/AFSymrjhKHQrwSi8Dxhucx9R3so+DpOuQBnkO9FY
         se7dfwrqgLNCrXI76ClPAk0yxovEYpeos2awQhgpZ/CgyuZ/ZRlnBevvc3O5mIX/5uU3
         5z/g==
X-Gm-Message-State: AOJu0YwDhiuJgJVcPfS6mvaNUUISKlatGjviwjJ+NIk925GqSv5vG7bK
	yX5AQ1jCxmSrLyFlGuBfzoVo5g==
X-Google-Smtp-Source: AGHT+IHz4MeKzQNpGS3GuXJru1bhFANMtBidBLfjB0S7BBLwpdV+bF/LMZO4YdD6LDF1rILDlQEt4w==
X-Received: by 2002:a81:5c45:0:b0:59b:fda7:9d7f with SMTP id q66-20020a815c45000000b0059bfda79d7fmr7108949ywb.49.1695347471227;
        Thu, 21 Sep 2023 18:51:11 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:10 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:50 -0700
Subject: [PATCH 3/6] mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-3-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=20376;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=LDBhzAz693ogyYuKvJM9mF/EbXQOvMewS07B6vi+b3k=;
 b=yYz3jnd3fEfUzx0/uJpKvvgpPyCv7j4OeZ9Sn2VxAp4GZKuyrjqgk7tJ8bGXYL5sV2RObxTKr
 pp//Lt66lltA4rUCNzwYqkpUs+FZmCsr1rEqst8FYmfO5JZpmDkH1V1
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025116_721154_0F347620 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for the mmc controller in the T-Head TH1520 with the new
compatible "thead,th1520-dwcmshc". Implement custom sdhci_ops for
set_uhs_signaling, reset, voltage_switch, and platform_execute_tuning.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 456 ++++++++++++++++++++++++++++++++++++
 1 file changed, 456 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 3a3bae6948a8..7294bf1afb7d 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -35,6 +35,26 @@
 #define DWCMSHC_CARD_IS_EMMC		BIT(0)
 #define DWCMSHC_ENHANCED_STROBE		BIT(8)
 #define DWCMSHC_EMMC_ATCTRL		0x40
+/* Tuning and auto-tuning fields in AT_CTRL_R control register */
+#define AT_CTRL_AT_EN			0x1 /* autotuning is enabled */
+#define AT_CTRL_CI_SEL_SHIFT		0x1 /* bit 1 */
+#define AT_CTRL_CI_SEL			0x1 /* interval to drive center phase select */
+#define AT_CTRL_SWIN_TH_EN_SHIFT	0x2 /* bit 2 */
+#define AT_CTRL_SWIN_TH_EN		0x1 /* sampling window threshold enable */
+#define AT_CTRL_RPT_TUNE_ERR_SHIFT	0x3 /* bit 3 */
+#define AT_CTRL_RPT_TUNE_ERR		0x1 /* enable reporting framing errors */
+#define AT_CTRL_SW_TUNE_EN_SHIFT	0x4 /* bit 4 */
+#define AT_CTRL_SW_TUNE_EN		0x1 /* enable software managed tuning */
+#define AT_CTRL_WIN_EDGE_SEL_SHIFT	0x8 /* bits [11:8] */
+#define AT_CTRL_WIN_EDGE_SEL		0xf /* sampling window edge select */
+#define AT_CTRL_TUNE_CLK_STOP_EN_SHIFT	0x10 /* bit 16 */
+#define AT_CTRL_TUNE_CLK_STOP_EN	0x1  /* clocks stopped during phase code change */
+#define AT_CTRL_PRE_CHANGE_DLY_SHIFT	0x11 /* bits [18:17] */
+#define AT_CTRL_PRE_CHANGE_DLY		0x1  /* 2-cycle latency */
+#define AT_CTRL_POST_CHANGE_DLY_SHIFT	0x13 /* bits [20:19] */
+#define AT_CTRL_POST_CHANGE_DLY		0x3  /* 4-cycle latency */
+#define AT_CTRL_SWIN_TH_VAL_SHIFT	0x18 /* bits [31:24] */
+#define AT_CTRL_SWIN_TH_VAL		0x9  /* sampling window threshold */
 
 /* Rockchip specific Registers */
 #define DWCMSHC_EMMC_DLL_CTRL		0x800
@@ -72,6 +92,84 @@
 	(((x) & DWCMSHC_EMMC_DLL_TIMEOUT) == 0))
 #define RK35xx_MAX_CLKS 3
 
+/* PHY register area pointer */
+#define DWC_MSHC_PTR_PHY_R	0x300
+
+/* PHY general configuration */
+#define PHY_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x00)
+#define PHY_CNFG_RSTN_DEASSERT	0x1  /* Deassert PHY reset */
+#define PHY_CNFG_PAD_SP_SHIFT	0x10 /* bits [16:9] */
+#define PHY_CNFG_PAD_SP_VALUE	0x0c /* PMOS TX drive strength */
+#define PHY_CNFG_PAD_SN_SHIFT	0x14 /* bits [23:20] */
+#define PHY_CNFG_PAD_SN_VALUE	0x0c /* NMOS TX drive strength */
+
+/* PHY command/response pad settings */
+#define PHY_CMDPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x04)
+
+/* PHY data pad settings */
+#define PHY_DATAPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x06)
+
+/* PHY clock pad settings */
+#define PHY_CLKPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x08)
+
+/* PHY strobe pad settings */
+#define PHY_STBPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x0a)
+
+/* PHY reset pad settings */
+#define PHY_RSTNPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x0c)
+
+/* Bitfields are common for all pad settings */
+#define PHY_PAD_RXSEL_1V8		0x1 /* Receiver type select for 1.8V */
+#define PHY_PAD_RXSEL_3V3		0x2 /* Receiver type select for 3.3V */
+
+#define PHY_PAD_WEAKPULL_SHIFT		0x3 /* bits [4:3] */
+#define PHY_PAD_WEAKPULL_PULLUP		0x1 /* Weak pull down enabled */
+#define PHY_PAD_WEAKPULL_PULLDOWN	0x2 /* Weak pull down enabled */
+
+#define PHY_PAD_TXSLEW_CTRL_P_SHIFT	0x5 /* bits [8:5] */
+#define PHY_PAD_TXSLEW_CTRL_P_VALUE	0x3 /* Slew control for P-Type pad TX */
+#define PHY_PAD_TXSLEW_CTRL_N_SHIFT	0x9 /* bits [12:9] */
+#define PHY_PAD_TXSLEW_CTRL_N_VALUE	0x3 /* Slew control for N-Type pad TX */
+
+/* PHY CLK delay line settings */
+#define PHY_SDCLKDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x1d)
+#define PHY_SDCLKDL_CNFG_UPDATE_SHIFT	0x4 /* bit 4 */
+#define PHY_SDCLKDL_CNFG_UPDATE_DC	0x1 /* set before writing to SDCLKDL_DC */
+
+/* PHY CLK delay line delay code */
+#define PHY_SDCLKDL_DC_R		(DWC_MSHC_PTR_PHY_R + 0x1e)
+#define PHY_SDCLKDL_DC_INITIAL		0x40 /* initial delay code */
+#define PHY_SDCLKDL_DC_DEFAULT		0x32 /* default delay code */
+#define PHY_SDCLKDL_DC_HS400		0x18 /* delay code for HS400 mode */
+
+/* PHY drift_cclk_rx delay line configuration setting */
+#define PHY_ATDL_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x21)
+#define PHY_ATDL_CNFG_INPSEL_SHIFT	0x2 /* bits [3:2] */
+#define PHY_ATDL_CNFG_INPSEL_VALUE	0x3 /* delay line input source */
+
+/* PHY DLL control settings */
+#define PHY_DLL_CTRL_R			(DWC_MSHC_PTR_PHY_R + 0x24)
+#define PHY_DLL_CTRL_DISABLE		0x0 /* PHY DLL is enabled */
+#define PHY_DLL_CTRL_ENABLE		0x1 /* PHY DLL is disabled */
+
+/* PHY DLL  configuration register 1 */
+#define PHY_DLL_CNFG1_R			(DWC_MSHC_PTR_PHY_R + 0x25)
+#define PHY_DLL_CNFG1_SLVDLY_SHIFT	0x4 /* bits [5:4] */
+#define PHY_DLL_CNFG1_SLVDLY_VALUE	0x2 /* DLL slave update delay input */
+#define PHY_DLL_CNFG1_WAITCYCLE		0x5 /* DLL wait cycle input */
+
+/* PHY DLL configuration register 2 */
+#define PHY_DLL_CNFG2_R			(DWC_MSHC_PTR_PHY_R + 0x26)
+#define PHY_DLL_CNFG2_JUMPSTEP		0xa /* DLL jump step input */
+
+/* PHY DLL master and slave delay line configuration settings */
+#define PHY_DLLDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x28)
+#define PHY_DLLDL_CNFG_SLV_INPSEL_SHIFT	0x5 /* bits [6:5] */
+#define PHY_DLLDL_CNFG_SLV_INPSEL_VALUE	0x3 /* clock source select for slave DL */
+
+#define FLAG_PULL_UP_EN		BIT(0)
+#define FLAG_IO_FIXED_1V8	BIT(1)
+
 #define BOUNDARY_OK(addr, len) \
 	((addr | (SZ_128M - 1)) == ((addr + len - 1) | (SZ_128M - 1)))
 
@@ -92,6 +190,8 @@ struct dwcmshc_priv {
 	struct clk	*bus_clk;
 	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA reg */
 	void *priv; /* pointer to SoC private stuff */
+	u16 delay_line;
+	u16 flags;
 };
 
 /*
@@ -157,6 +257,206 @@ static void dwcmshc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	sdhci_request(mmc, mrq);
 }
 
+static void th1520_phy_1_8v_init_no_pull(struct sdhci_host *host)
+{
+	u32 val;
+
+	/* deassert phy reset */
+	sdhci_writel(host, PHY_CNFG_RSTN_DEASSERT, PHY_CNFG_R);
+
+	/* disable delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT,
+		     PHY_SDCLKDL_CNFG_R);
+
+	/* set delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_DC_INITIAL, PHY_SDCLKDL_DC_R);
+
+	/* enable delay lane */
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val &= ~(PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT);
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+
+	/* configure phy pads */
+	val = sdhci_readw(host, PHY_CMDPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_1V8, PHY_CMDPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_DATAPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_1V8, PHY_DATAPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_RSTNPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_1V8, PHY_RSTNPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_STBPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_1V8, PHY_STBPAD_CNFG_R);
+
+	/* enable phy dll */
+	val = sdhci_readb(host, PHY_DLL_CTRL_R);
+	sdhci_writeb(host, val | PHY_DLL_CTRL_ENABLE, PHY_DLL_CTRL_R);
+}
+
+static void th1520_phy_3_3v_init_no_pull(struct sdhci_host *host)
+{
+	u32 val;
+
+	/* deassert phy reset */
+	sdhci_writel(host, PHY_CNFG_RSTN_DEASSERT, PHY_CNFG_R);
+
+	/* disable delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT,
+		     PHY_SDCLKDL_CNFG_R);
+
+	/* set delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_DC_INITIAL, PHY_SDCLKDL_DC_R);
+
+	/* enable delay lane */
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val &= ~(PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT);
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+
+	/* configure phy pads */
+	val = sdhci_readw(host, PHY_CMDPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_3V3, PHY_CMDPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_DATAPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_3V3, PHY_DATAPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_RSTNPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_3V3, PHY_RSTNPAD_CNFG_R);
+
+	val = sdhci_readw(host, PHY_STBPAD_CNFG_R);
+	sdhci_writew(host, val | PHY_PAD_RXSEL_3V3, PHY_STBPAD_CNFG_R);
+
+	/* enable phy dll */
+	val = sdhci_readb(host, PHY_DLL_CTRL_R);
+	sdhci_writeb(host, val | PHY_DLL_CTRL_ENABLE, PHY_DLL_CTRL_R);
+}
+
+static void th1520_phy_1_8v_init(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u32 val;
+
+	if (!priv)
+		return;
+
+	if (!(priv->flags & FLAG_PULL_UP_EN)) {
+		th1520_phy_1_8v_init_no_pull(host);
+		return;
+	}
+
+	/* deassert phy reset & set tx drive strength */
+	sdhci_writel(host, PHY_CNFG_RSTN_DEASSERT |
+		    (PHY_CNFG_PAD_SP_VALUE << PHY_CNFG_PAD_SP_SHIFT) |
+		    (PHY_CNFG_PAD_SN_VALUE << PHY_CNFG_PAD_SN_SHIFT),
+		    PHY_CNFG_R);
+
+	/* disable delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT,
+		     PHY_SDCLKDL_CNFG_R);
+
+	/* set delay line */
+	sdhci_writeb(host, priv->delay_line, PHY_SDCLKDL_DC_R);
+	sdhci_writeb(host, PHY_DLL_CNFG2_JUMPSTEP, PHY_DLL_CNFG2_R);
+
+	/* enable delay lane */
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val &= ~(PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT);
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+
+	/* configure phy pads */
+	val = PHY_PAD_RXSEL_1V8 | (PHY_PAD_WEAKPULL_PULLUP << PHY_PAD_WEAKPULL_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
+
+	val = (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
+
+	val = PHY_PAD_RXSEL_1V8 | (PHY_PAD_WEAKPULL_PULLDOWN << PHY_PAD_WEAKPULL_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
+
+	/* enable data strobe mode */
+	sdhci_writeb(host, PHY_DLLDL_CNFG_SLV_INPSEL_VALUE << PHY_DLLDL_CNFG_SLV_INPSEL_SHIFT,
+		     PHY_DLLDL_CNFG_R);
+
+	/* enable phy dll */
+	sdhci_writeb(host, PHY_DLL_CTRL_ENABLE,  PHY_DLL_CTRL_R);
+}
+
+static void th1520_phy_3_3v_init(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u32 val;
+
+	if (!(priv->flags & FLAG_PULL_UP_EN)) {
+		th1520_phy_3_3v_init_no_pull(host);
+		return;
+	}
+
+	/* deassert phy reset & set tx drive strength */
+	sdhci_writel(host, PHY_CNFG_RSTN_DEASSERT |
+		    (PHY_CNFG_PAD_SP_VALUE << PHY_CNFG_PAD_SP_SHIFT) |
+		    (PHY_CNFG_PAD_SN_VALUE << PHY_CNFG_PAD_SN_SHIFT),
+		    PHY_CNFG_R);
+
+	/* disable delay line */
+	sdhci_writeb(host, PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT,
+		     PHY_SDCLKDL_CNFG_R);
+
+	/* set delay line */
+	sdhci_writeb(host, priv->delay_line, PHY_SDCLKDL_DC_R);
+	sdhci_writeb(host, PHY_DLL_CNFG2_JUMPSTEP, PHY_DLL_CNFG2_R);
+
+	/* enable delay lane */
+	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
+	val &= ~(PHY_SDCLKDL_CNFG_UPDATE_DC << PHY_SDCLKDL_CNFG_UPDATE_SHIFT);
+	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
+
+	/* configure phy pads */
+	val = PHY_PAD_RXSEL_3V3 | (PHY_PAD_WEAKPULL_PULLUP << PHY_PAD_WEAKPULL_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
+	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
+
+	val = (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
+
+	val = PHY_PAD_RXSEL_3V3 | (PHY_PAD_WEAKPULL_PULLDOWN << PHY_PAD_WEAKPULL_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_P_VALUE << PHY_PAD_TXSLEW_CTRL_P_SHIFT) |
+	      (PHY_PAD_TXSLEW_CTRL_N_VALUE << PHY_PAD_TXSLEW_CTRL_N_SHIFT);
+	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
+}
+
+static void th1520_sdhci_set_phy(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u16 emmc_ctrl;
+
+	/* Before power on, set PHY configs */
+	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
+		th1520_phy_1_8v_init(host);
+		emmc_ctrl = sdhci_readw(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
+		emmc_ctrl |= DWCMSHC_CARD_IS_EMMC;
+		sdhci_writew(host, emmc_ctrl, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
+	} else {
+		th1520_phy_3_3v_init(host);
+	}
+
+	sdhci_writeb(host, (PHY_DLL_CNFG1_SLVDLY_VALUE << PHY_DLL_CNFG1_SLVDLY_SHIFT) |
+		     PHY_DLL_CNFG1_WAITCYCLE, PHY_DLL_CNFG1_R);
+}
+
 static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
 				      unsigned int timing)
 {
@@ -189,9 +489,30 @@ static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
 		ctrl_2 |= DWCMSHC_CTRL_HS400;
 	}
 
+	if (priv->flags & FLAG_IO_FIXED_1V8)
+		ctrl_2 |= SDHCI_CTRL_VDD_180;
 	sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
 }
 
+static void th1520_set_uhs_signaling(struct sdhci_host *host,
+				     unsigned int timing)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u32 reg;
+
+	dwcmshc_set_uhs_signaling(host, timing);
+	if (timing == MMC_TIMING_MMC_HS400) {
+		reg = sdhci_readl(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+		reg &= ~AT_CTRL_AT_EN;
+		sdhci_writel(host, reg, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+		priv->delay_line = PHY_SDCLKDL_DC_HS400;
+		th1520_sdhci_set_phy(host);
+	} else {
+		sdhci_writeb(host, 0, PHY_DLLDL_CNFG_R);
+	}
+}
+
 static void dwcmshc_hs400_enhanced_strobe(struct mmc_host *mmc,
 					  struct mmc_ios *ios)
 {
@@ -338,6 +659,91 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u32 val = 0;
+
+	if (host->flags & SDHCI_HS400_TUNING)
+		return 0;
+
+	sdhci_writeb(host, PHY_ATDL_CNFG_INPSEL_VALUE << PHY_ATDL_CNFG_INPSEL_SHIFT,
+		     PHY_ATDL_CNFG_R);
+	val = sdhci_readl(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+
+	/*
+	 * configure tuning settings:
+	 *  - center phase select code driven in block gap interval
+	 *  - disable reporting of framing errors
+	 *  - disable software managed tuning
+	 *  - disable user selection of sampling window edges,
+	 *    instead tuning calculated edges are used
+	 */
+	val &= ~((AT_CTRL_CI_SEL << AT_CTRL_CI_SEL_SHIFT) |
+		(AT_CTRL_RPT_TUNE_ERR << AT_CTRL_RPT_TUNE_ERR_SHIFT) |
+		(AT_CTRL_SW_TUNE_EN << AT_CTRL_SW_TUNE_EN_SHIFT) |
+		(AT_CTRL_WIN_EDGE_SEL << AT_CTRL_WIN_EDGE_SEL_SHIFT));
+
+	/*
+	 * configure tuning settings:
+	 *  - enable auto-tuning
+	 *  - enable sampling window threshold
+	 *  - stop clocks during phase code change
+	 *  - set max latency in cycles between tx and rx clocks
+	 *  - set max latency in cycles to switch output phase
+	 *  - set max sampling window threshold value
+	 */
+	val |= AT_CTRL_AT_EN | (AT_CTRL_SWIN_TH_EN << AT_CTRL_SWIN_TH_EN_SHIFT) |
+		(AT_CTRL_TUNE_CLK_STOP_EN << AT_CTRL_TUNE_CLK_STOP_EN_SHIFT) |
+		(AT_CTRL_PRE_CHANGE_DLY << AT_CTRL_PRE_CHANGE_DLY_SHIFT) |
+		(AT_CTRL_POST_CHANGE_DLY << AT_CTRL_POST_CHANGE_DLY_SHIFT) |
+		(AT_CTRL_SWIN_TH_VAL << AT_CTRL_SWIN_TH_VAL_SHIFT);
+
+	sdhci_writel(host, val, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+	val = sdhci_readl(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+
+	/* check if is possible to enable auto-tuning */
+	if (!(val & AT_CTRL_AT_EN)) {
+		dev_err(mmc_dev(host->mmc), "failed to enable auto tuning\n");
+		return -EIO;
+	}
+
+	/* disable auto tuning */
+	val &= ~AT_CTRL_AT_EN;
+	sdhci_writel(host, val, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+
+	/* perform tuning */
+	sdhci_start_tuning(host);
+	host->tuning_err = __sdhci_execute_tuning(host, opcode);
+	if (host->tuning_err) {
+		val &= ~AT_CTRL_AT_EN;
+		sdhci_writel(host, val, priv->vendor_specific_area1 + DWCMSHC_EMMC_ATCTRL);
+		dev_err(mmc_dev(host->mmc), "tuning failed: %d\n", host->tuning_err);
+		return -EIO;
+	}
+	sdhci_end_tuning(host);
+
+	return 0;
+}
+
+static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	u16 ctrl_2;
+
+	sdhci_reset(host, mask);
+
+	if (priv->flags & FLAG_IO_FIXED_1V8) {
+		ctrl_2 = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+		if (!(ctrl_2 & SDHCI_CTRL_VDD_180)) {
+			ctrl_2 |= SDHCI_CTRL_VDD_180;
+			sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
+		}
+	}
+}
+
 static const struct sdhci_ops sdhci_dwcmshc_ops = {
 	.set_clock		= sdhci_set_clock,
 	.set_bus_width		= sdhci_set_bus_width,
@@ -356,6 +762,17 @@ static const struct sdhci_ops sdhci_dwcmshc_rk35xx_ops = {
 	.adma_write_desc	= dwcmshc_adma_write_desc,
 };
 
+static const struct sdhci_ops sdhci_dwcmshc_th1520_ops = {
+	.set_clock		= sdhci_set_clock,
+	.set_bus_width		= sdhci_set_bus_width,
+	.set_uhs_signaling	= th1520_set_uhs_signaling,
+	.get_max_clock		= dwcmshc_get_max_clock,
+	.reset			= th1520_sdhci_reset,
+	.adma_write_desc	= dwcmshc_adma_write_desc,
+	.voltage_switch		= th1520_phy_1_8v_init,
+	.platform_execute_tuning = &th1520_execute_tuning,
+};
+
 static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
 	.ops = &sdhci_dwcmshc_ops,
 	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
@@ -379,6 +796,12 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
 		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
 };
 
+static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
+	.ops = &sdhci_dwcmshc_th1520_ops,
+	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+};
+
 static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
 	int err;
@@ -447,6 +870,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
 		.compatible = "snps,dwcmshc-sdhci",
 		.data = &sdhci_dwcmshc_pdata,
 	},
+	{
+		.compatible = "thead,th1520-dwcmshc",
+		.data = &sdhci_dwcmshc_th1520_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);
@@ -542,6 +969,35 @@ static int dwcmshc_probe(struct platform_device *pdev)
 			goto err_clk;
 	}
 
+	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
+		priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
+
+		if (device_property_present(&pdev->dev, "thead,phy-pull-up"))
+			priv->flags |= FLAG_PULL_UP_EN;
+		else
+			priv->flags &= ~FLAG_PULL_UP_EN;
+
+		if ((device_property_read_bool(dev, "mmc-ddr-1_8v")) |
+		    (device_property_read_bool(dev, "mmc-hs200-1_8v")) |
+		    (device_property_read_bool(dev, "mmc-hs400-1_8v")))
+			priv->flags |= FLAG_IO_FIXED_1V8;
+		else
+			priv->flags &= ~FLAG_IO_FIXED_1V8;
+
+		/*
+		 * start_signal_voltage_switch() will try 3.3V first
+		 * then 1.8V. Use SDHCI_SIGNALING_180 ranther than
+		 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
+		 * in sdhci_start_signal_voltage_switch().
+		 */
+		if (priv->flags & FLAG_IO_FIXED_1V8) {
+			host->flags &= ~SDHCI_SIGNALING_330;
+			host->flags |=  SDHCI_SIGNALING_180;
+		}
+
+		sdhci_enable_v4_mode(host);
+	}
+
 #ifdef CONFIG_ACPI
 	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
 		sdhci_enable_v4_mode(host);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

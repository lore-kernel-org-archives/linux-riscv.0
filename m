Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66781CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kirSRAU487EAvbA3QgXmAF2yoJxUHvwMFFD//SmxslE=; b=uiDxbHXEGFAv9x
	QQEKyGa7DruoOPDxS78Cwxn+iw2W8cqDAc9aROs2CPjoXLRaAYviv2opiW2xAFVXnHQpmKLSLNZll
	5PR3goVDDxgYSvPMY4+1X2BIP7ReJ3MsTF6LiOYaEObqEVKFUBKN42YCbeU/3EJekcex9Oaic9RDX
	6dNZIV6Xel5p4MJlffBOPmUJT0a06L8HdjMN1XlGNmk54mPT9tc2XBIt7nLIv3yRRJWv5FlJfEFz5
	axQRA95U4rBbIDKwiO/GMckQDe1Yg8O6I2vQKOSlAp9hM89fOKlVO0UQBs4cr4ZPB10Nz9Nfy5NCQ
	6hKk8wK0E3huWQD0PLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb6-000000078B3-31pn;
	Thu, 23 Oct 2025 17:59:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb3-0000000789C-2U7V
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:34 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso1210833a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242373; x=1761847173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAhNnAyRlJ+k8SadU3zB3G7wfuMMC4IwP0K85LfBSkY=;
        b=pz1V1PB9UaKCE28JSmgR5C0A5H6hIzR79SvVa+jrZfg9xeCTRT0Boabx2u11ezhKfb
         nKRLfr7ZP+bU2w7ERf2uF9Z3YcKLXIEyu0CDd9kvZx/gCxCGWbDug00glBmrH5+rQosr
         yFbLBqiZMzNCph7bDt8q2JeQ2HsPVODm0GIKwqyT3TThmxjBfC5h1bKbHEssIqt74kar
         HEsPU9lCt504HUqNISQaqTdSFd9UEv963BxQBJEDXwbcovK4kyavgeTcENST7lI/LjzY
         aHWVK1wrVQ6MNGnTCujNLJqXyKDs3oMwee7LanqGNrY01uamQVMylNf0exvZ3WdWwdn0
         mIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242373; x=1761847173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAhNnAyRlJ+k8SadU3zB3G7wfuMMC4IwP0K85LfBSkY=;
        b=F/AUcvO09GCB8H3A08gYMqoRHXAPNRNYLbvfj2qOJYmolwHlLNxRwN/2FSFKuIiXb8
         9KrJLS/Pank17jydSdyIEom11a8CCP6NyMkK08wJF+OxntCwIWG70ajjpnT0pBW3Rhwh
         TTFrm9q9lm4kurHV+VCnCrZGL9Hbhjbhmr8OCD735VBAQexcHNguFPVQJxlBL+cONW4A
         twiJaW5klu9wpoWeAqK62JROHiEpv+MSydD+JtvmKJif5KWy7Wg47ZwILISf1LJ2VsMX
         YePv1CLOI6FIhdqDEuJdLaVeFllz3fD9hHX2Wo40dMSmSdo4jVVzKTHI0vUm69hyseWL
         ZIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO/ghKVelQKTd741+4slrEPaOZXskcFAaOYcKlLwl/e8/Y+QXTMcpenE1JSXhvWzYMlYRTNXPzwMfn7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoQk+tx1LiqrCcjBdNPy1LRsdfRMApif5/aBtZlTrsljOWwJXv
	gxasKKUsT1c9b8TlV+ZPNjYTpNrnTmvJ7ek9xHdaqSLC07DT1WVNsw9ogSYmWwMoa1s=
X-Gm-Gg: ASbGncu5v9PHvF6B8/B6roS4quq1Unp9BrOBNAWYfnjyZy498jLzor2WWs2czdj4I+6
	ewYL4VnlipZ4EbGSosWgi7Yp4AawYO1+da6CX7QMFPfJnwnDbS6gNX/W66RrxWUXeHR7uH+BI+0
	9dO6gN0Q34U/h9TAjo3ci8Fw9pTUB/iF8kn4Ib9oSbgmAmPYuDtQHS7wlB4hKQRtSL93TjvF91M
	kavNHpT5LFUQuA7cdQXhxIBQAZy4rFszRP2Mp0/XzqEtRuODaKsdP/t1zyN69xrPk9aSozNYdRw
	z+2ig7SGca1cCxBWaSvGn6nEMEgiBOq7N5pcV93IjYTo7pq0xFP+I9Hf3esU4Eq2O6uZ3mfjq2I
	r9dFh0u4mw4Jb2YY5zlhmZKHq2WHMSjz4ZImr2suCUZWOk/Iu21YK7l9TXj+WJzqZlFHaL29UH+
	btT/HYL+rL8SLGujSccacFJfM=
X-Google-Smtp-Source: AGHT+IFxReVTv/oRMBHe2/GGbvb5RBCKr3lQm/bLqjIeSeFbGb+ib3c+ylwSGN6jx8ccpilEbhjGQw==
X-Received: by 2002:a17:90b:4cce:b0:335:2b15:7f46 with SMTP id 98e67ed59e1d1-33bcf8f75b2mr32365987a91.21.1761242373019;
        Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	han.xu@nxp.com
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Thu, 23 Oct 2025 12:59:19 -0500
Message-ID: <20251023175922.528868-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105933_630473_6E1C9CE3 
X-CRM114-Status: GOOD (  12.93  )
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

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if ARCH_SPACEMIT
enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver by
defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - A continued line the Kconfig file is now aligned

 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..592d46c9998bb 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+		   ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index a474d1b341b6a..d4b007e8172b2 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -268,6 +268,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -1003,6 +1012,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

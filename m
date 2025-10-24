Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE40CCF9EC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6QSzBjvxS4T4ZN3vrLSmr4hCJWc9tcn5IC29vZg4Yo=; b=iOug0UT67isfEl
	mm4QVchqLMY9Wzj8GOEYLVxhpYTql8j4GPYwfGAMbGQAQvZh4gsPuE8xW6Ql3x9VtzFKqlfUHcBi2
	bNyUFYzYVVUOSlJfV93Jtc2vq+n1akLCuqPPDSPnPNU1xqj8ZAgDOw+wIInhXqx8/oIVOSEw72vXu
	3LLgjNWe7qyxieXlbmN/FVjOyepDRSgXiAZ7tzp7KTSWKCwP5w0ZOma882cEPSUyKXnBld/sRmR5Z
	c0rBdIDaGwXUIwrOO1g5be1xhMCoMcOrR3I792vy3I05o6wIz770RhtDZxcRrUWyWSVUp3pNPbkJT
	O43Ct/GcTQuGkU0s7KEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGh-0000000ALBf-3bPP;
	Fri, 24 Oct 2025 19:16:07 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGd-0000000AL7f-1t2o
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:04 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-940d327df21so120721139f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333363; x=1761938163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=iR3EDkTtpkcaIfiNf+Ixw0Q+BqFpdltPnH2m8gwhHENdyutDXKJtX9L+Ac6WU/AZJw
         WAA5M6BYLV/IlXMh8Jo85xnyNPd77EWtObbPB+Ozaecog9P+OT09iqTaIGaP1DKqAs1s
         ZH4HoU/kdcGB1v3X6BJ2Df+IkBRtS5lcHrjqan4ZvmYguOCcfMGJgyG8qu8IpKv+Qzxi
         wyb/hp2TtXASDOfEj/kfpnQ9qexdl0mLMkvOAnej9zBMrAHvbtNhVXcfRK4irAAgG5pt
         otoh1ic7dkokINb0x783Wcrei/pmrhayFKhq1zg0qhDz3XpO5L3EP9TDljNci4TGxUA3
         C9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333363; x=1761938163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPf7dJcoXU9s785ZftOfTSEvtOpAo2Z85GYUpq2DxVw=;
        b=btj8wdyHaibEFWNROlLHBexO+EIpGcnPnTPAII0Wt98a5ixGQXoMQKZoiTXaUlmh3+
         RmETHgpl85XvbOf2TyXL4DgfJFlVdx8v9H1LcSNojCQ8Kgov1AYM30pqfuBCrxQAP0f4
         LmRvO/uUWtvrmjdOO2XPsVZ+80qopNxQfV7v/3HA0Bwt3zNzHxMXpbBGglFDw0Q/lLqd
         E81ATbMFl2LfTggp7Rv8xkt57i9v4XdDKAUDQhE6+k9njDthNNBVvxLTnclTNTEJIr0h
         UuAz4u//06yP0jBUWrGBnSVVy/7gCOLbCronKXd1wVNcg4HlkS1wYkhAo/cKY8yuYzFL
         lRMw==
X-Forwarded-Encrypted: i=1; AJvYcCUiJfv8XWX+Ud8S9RMq1pu4HoRys3yFUNFTp559oFQhh5LlivWXzryPr7E5ynUG8VCyFDFDWwHg8pMxZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaT7hjMLAzilJ0GL0xgopsJT7DGAxLA6x+48yfw4NOuXqYHPwg
	akN3aUvVFykO7KDVAVqhmzxKDaxq3MbQ9UAlnKW3Sd2kIebBWeLf7ihaU/hE5rVmoYQ=
X-Gm-Gg: ASbGnctzaWirOZPzJlJ5PEJEq6JHzEbVuBsEOouQ8xK7lFxvpG2C1nYABRF3YlZ3rRL
	lRjUN4sAXG74eCIWxWcDnK4llaWVVAwU0k+R2dIEEZ5f+6OF96xXebNUFAFWpQzvFUkXzIA2I1R
	E8iuibrgAR7YO5ovhukJnBpjXSYWaApKLSr3reNlALr3cscC+tbXD4Yw4It9Mckv5zGiVp5gn0q
	gfZuENTT4G8mfdBbkdlDc6JQK+DKzVkD2/kTUsSeUQ0xCADMjv6mjNrGthGaTJ/OvAj7s2jG6VP
	DPYo7voVLFejFx/D/rgLo2AqOc37hv9MP3LMJwgqM4EsIUWOTpxkesgnL+nCfhJvshqUVZt8FLj
	rZPwqyF10I+zEfidjqPGWDP+lCGZJKhcimnoGPom0isYQvh3ad/1lbNcb8JDOo4vgsl4t/PyW5B
	1PeotTIzVdFou967gA6C9NqNRxbIo/08psnamMxLGzD2OuA1p7B10Iqg==
X-Google-Smtp-Source: AGHT+IE7iOHD5RLmA2kk1MvUlsZ0DBgSjQiI4X5X30Jlm6cwRYZovCXte2pXzgLa3TLg4hmhyFE+dg==
X-Received: by 2002:a92:cda3:0:b0:430:b4ca:2696 with SMTP id e9e14a558f8ab-430c514e290mr430965745ab.0.1761333362623;
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
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
Subject: [PATCH v3 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Fri, 24 Oct 2025 14:15:47 -0500
Message-ID: <20251024191550.194946-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121603_492195_69865C9F 
X-CRM114-Status: GOOD (  12.43  )
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
v3: The sfa_size field in spacemit_k1_data is now assigned to be SZ_1K

 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

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
index 46a3187b33548..a223b4bc6e637 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -268,6 +268,16 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.sfa_size = SZ_1K,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -1003,6 +1013,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
+	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

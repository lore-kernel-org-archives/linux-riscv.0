Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B90BCCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBP0aX/BLEm7Qhnvo5eR97/a7RN/w1xVNf0yTBsYz9A=; b=Ok9fNSoHZHxCRx
	pxg2JF1b28O7aVruMgX8XZpf86u5WE9g8KHBrgzXnEpnVrKv/r9skbQDu0PqWxLUut55RwFBo88Se
	bsrMaS+CNLI1yk3a/KzMnRBEOttYdhNOtlrXjW5UjWM0A9YS1bg7z8QpangbsfLcbSaPUnSRwroFe
	n82WL3YUDOTaM4r+j9J2jhAMVlwKWIwJrVPqXf3BC55Fm3ET2YrBJFGjh2g2astpsOkqLbci0HJSh
	1XQkjiablJq/lRijUk/WI/kIjFAMBpXbT75XdrAsV/utCw2px6lu4HocfdMVj+FdpD51CRiUzjkTZ
	kI2DDUYDXW3ToXZDiPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt7A-0000000ENEl-3zVx;
	Mon, 20 Oct 2025 16:52:08 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt77-0000000ENCL-2Wlf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:06 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-430c6eef4b9so16059115ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979125; x=1761583925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=IGYc/LRS9CXPtWByhl4FS8GtWH6RfPmQHQ+EwLJhVg/crBIhxxbFy1klMXuaKYzTTQ
         PAQ7SuhxgQ1ej7qynB9HhR4PA9XIV2ui9S1PYtjNvCZ8msOh2Sd7RIzgazwhZXTzlIFT
         dyb5QO0jEQMPnXvXuDBB5usOARHeMEGWONUeOJ3LGeCLJfx2Z9bUTJWOOJfs/LfUTz5v
         b1FL4Wrb4Ppo4vhF2lQAVLIRDaZND3bu9tRl7LR3+1R2S9Hi2rQLO8LClBB1g4YPKN61
         cwqGwzj9K1b+nURNv7T4mZLbBIW1KDorSwH4w2Pxn2SIbyd6QNi5Xx8i4T5bN9Jv1r1v
         vC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979125; x=1761583925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbkGMRUd18xqKrBxXTdlQugMN1AFOTBEWC3fjv7PzZo=;
        b=R+xHggvfCGOCo3HiSb5hcosR6r+y+3d7DwmoxapbIHJ1C2teIMar/JxDLTfI8xGT15
         SiiQKYmXvFFNoimJBZhI68sDNUyCwEmiuzX+35BLPWu20mz/9gWUA5fBRyitLaVy2Hdk
         nM/l9rTJrXi9uFTw5rbZO/5MZ+HFxYzgWecPEd4Gy+nJdhnPlXidJ70/bCppuiI0h9Ah
         PQywc6D1Cr+aZld/VxvgoUSEN3P8ZlTrkDermNEC6kb1dwCXGjqE9AN2Vk+FZPFw8bR5
         GTLLavbKy9fg0xFSF297AO/EG9Ee1Ot1wTrz6x9tGcjBCuwDrq93oNEj+P4fzMocnPnn
         yegg==
X-Forwarded-Encrypted: i=1; AJvYcCWDkadE5vXbjfEI9een7VzcwDa1GN7gCFd84qiK5sWXKdKoPB/1I6tqgjNxBN4WRnRllPeeXcjeNbJgBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHb3M5xy/7JHqb8KMLPw7SbtrOp9c21JLZqp4cDVA8dHrztAD9
	JhDKUYfHkAnnlNvzVDOGcgrCT+xmcaA+OHYHibs1KIoNcZElK8knDUNz4BUpGPZJ1xHPTWJrLPV
	1d+NtDnE=
X-Gm-Gg: ASbGncufhtAa1TZSP5gWi9kqKM98DggwxR8dhc9w7a2tIvfSG7xgFORUx1COYd+ZmYD
	NTvC3NMCt5yDFpRCer7Q1QF88iHwrWrZeDpLYOsYpli/qk6cHhnXv3NinxxqeLKI6VpeYaFDdJI
	9lKFV6ad4bhmOMsruW69xjvhz7DkolyAmv0F8EqT4kG6aQJezQLtW+J85fO/tBSMkaaVNp5OaqQ
	q4s2eT58X1awuRZlLYVwhormRMbaK15+XNJVRoNBgdflRhqq0YhV4W1RO0Y71Zv0JvX6tHjB8ks
	6oB6clS8uAqP9Oj+rqsliPgjqM1C/Gc+bAY4ACxGygxC8IUd4oJQW7jhf0N4kgpBAIIvZYdXpHL
	ho7Z6Dw+a+JbPFL/k+8Hh4cUw6T6jyo39nXcKhyNRZ/1JIQFiNjIwNNWGeWoRb9QidjubNMTTnz
	RgkS2INCixOWsKSpb20sD2ImK5TwFLeOixHxaswyQNhLQ=
X-Google-Smtp-Source: AGHT+IHCCXKGX40QH2SOOPyUbP1RmuEfte3N63LZWZHm5ASq68QX+HJbW0W+2yUOmNOCzqkQxIE7PQ==
X-Received: by 2002:a05:6e02:154a:b0:426:e20b:f5d4 with SMTP id e9e14a558f8ab-430c52200admr217203785ab.10.1760979124829;
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org
Cc: guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Mon, 20 Oct 2025 11:51:49 -0500
Message-ID: <20251020165152.666221-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095205_649884_4F98B903 
X-CRM114-Status: GOOD (  12.83  )
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

Allow the SPI_FSL_QUADSPI Kconfig option to be selected if
ARCH_SPACEMIT enabled.

Add support for the SpacemiT K1 SoC in the Freescale QSPI driver
by defining the device type data for its QSPI implementation.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/Kconfig        |  3 ++-
 drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 4d8f00c850c14..2e3d8bd06ceb2 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale QSPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
+			ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 9ecb756b33dba..f4f9cf127d3fe 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -267,6 +267,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 	.little_endian = true,
 };
 
+static const struct fsl_qspi_devtype_data spacemit_k1_data = {
+	.rxfifo = SZ_128,
+	.txfifo = SZ_256,
+	.ahb_buf_size = SZ_512,
+	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
+	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_NO_CLK_DISABLE,
+	.little_endian = true,
+};
+
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
@@ -998,6 +1007,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
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

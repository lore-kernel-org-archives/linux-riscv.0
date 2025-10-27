Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2347CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZO/9l+314Sd/ifud/rg1AkWxj0dys9wc2oBqDecZac=; b=Wcai/wahJoueAH
	JkLB9jb3/vyAG+ujlRZ5d+RCHcE3nHVFWci8KWsv+FF77lmUU6MFTXfjpSjWDwC+5N6KMFiXSUrSK
	9S7ZhHIX1uQFtpbthi6h+9HonmndoR0eEjMiuAniET8SE19PO4g1GsDAg6U0O+muSC758mATEq4zh
	MnIf2UaVkMDEO/QxSXQlmCOYx4U4He4l3RF7c+5EF+o/ZoiJ4eZNreQoE2gW5lL5xjSGB14X0OHlx
	8d9WniaFRCj1t3SlPc7AKOAdfJfppKv6AqK1ske1OafmO60uFdnfqGYpYPBVuJLvlr8CTRxkPxm7g
	U3yId2m39LqzmAEMRc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIs-0000000E27d-14QW;
	Mon, 27 Oct 2025 13:30:30 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIq-0000000E24P-0Utl
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:29 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-430c180d829so20649745ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571827; x=1762176627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Sro30bK07ZDN2ex4WerPYEtaKK8tB8dVPj/Yht/kY4=;
        b=lsTbA7gu1cmLSGwSuA8IIcsGZKesDHU2BP6BRmqZOdFsp/u0R8QGyQLpKq1A5qnJvn
         LhlLloBd2h1xIM0tVbldqc8hU/YdZVtTiwPNjcS6I3Lojkeq9WF3rv6fCmFenxSt33wx
         AZvMOIXeVvTaGHUItZhezEZZzHFMetHl181rbG3pADL8HeJ8yBLWp2OZxXPRm2ttJXUQ
         7kAHqxNtHlRxp3ZV2ymJCQaCo0Rlf8LRA+k05QFwXqYlo3Of3QeZhGrWh/2aUo+1HKcS
         51HNPydKIBlxuTrTh/AWcjhAkltgjjyq1OhgXvIJLZPe5E5vdGHvMxVVYjoTtFUbQiHk
         wa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571827; x=1762176627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Sro30bK07ZDN2ex4WerPYEtaKK8tB8dVPj/Yht/kY4=;
        b=QWh/7gOsY+kuRtsmWlThDyLUmx+I3uQDC5GJZifbnRpq8Ub/WforZR71QJKUNSm5S/
         KdR/A6uQK5EhpRSJDuUXMvV/JbQMxuZvGyj2Fj5MRd5lpToOpT3h3celt4z+5CO5DykV
         CCQ4NwbNgGc0AH/vqdi6YTFsABfah0q/tDnF8RPjU71mQAJXvQzBb/c1I+7kCme2cjZd
         SEI1ivfBIXSBMvRQuxZENyKV2Jr2zf7x6xjMHcHclDBXwgteKA/l35u6yd4Ry45hgJhf
         wZc5EprPiUMD5nc0bI4ON5cDU8vYguoWE3/nS6u8/JYCfSJgNwiNQ1FHsC864Uq9GY+z
         rh3w==
X-Forwarded-Encrypted: i=1; AJvYcCUAj5UdKd53qL0yCKp5lksU6jcIACjYy9rXCSNVXXDzTVgFa9WlkkfL+VFS9Ib/yZoTU6kW0vPWl7nXEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGXXwpLKTf4tuFutwSTxDxP6ASm1UznKNpH8+XcTPjVjS1KmE2
	ORFcR1Zm191/6+nEcWRuJo6CMaJn0oHYdUDMnPAIMM0VOz/zyOc9IhWJ4M4QnwOTwwI=
X-Gm-Gg: ASbGncvaTKueqKTjWuuQNAZnAKGGDUg/ooLuzVqODgbmgcdnvBqx1dhE8Li+XeSXBdK
	6K15kQC/vTU8X+tpwn7MkyNpZLi5/6eL3rE/lOrjs9xReJ6I2gub/s09E73r2qAApcEQsHrzVwn
	RhbZiQJVKmkwQFVHj36+yVkrHm24zqwOXGpTH9HJDdY2mh8RcyFoyCz+BrHer6jRcDjcOb1LpDr
	1ykFxR5RADCi/Hmmc42oVywyCiaP5rFzeD4vPzSRSJqr3RZW/u7anwzKxZ/hBaYep7StlsOjLI6
	q5PS+QJzb1L0EKrTZt2O43f1/5LSLciAadaEvk1MhD/L6pX2qDho5yMOAA8dlYlhdKaRIr6FQWy
	5sut8JzyN20R+WsaG4dKxjXhlxgPrWMXBVjuJTg284Znu2N75ziHQsx6c+xE91/IvItTltiVe6m
	17ZQHDrhawqYHskSS7BG/YDOGeXPZK0IBWJqkFOlytFMlTUaY4rgCSaQ==
X-Google-Smtp-Source: AGHT+IE/dyb28DRdvs9oMw6bZQwYlyqE3BQFW88FuQ4+GtxGKYPnc6qBw31lrQ++KNgKjicl1u85uw==
X-Received: by 2002:a05:6e02:1c2e:b0:42f:a60a:8538 with SMTP id e9e14a558f8ab-4320f778af8mr1256935ab.16.1761571826897;
        Mon, 27 Oct 2025 06:30:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
Date: Mon, 27 Oct 2025 08:30:05 -0500
Message-ID: <20251027133008.360237-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063028_192498_1BF68F7B 
X-CRM114-Status: GOOD (  12.75  )
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

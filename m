Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6905CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwnWaadRdy/5yqmDuYok0p8nSiKSQVozXnnSp9+KCaQ=; b=4oF3io8lVImbHp
	MffioAOu0YZZgEv9fn6Yy7h2ReySQlaNhhEHoV38V8EdQYeEOh7/1PQUNPSUIcQKrYIJ0VAIA3Eu2
	9XroWrm3x0ZO0iSBsxMV2IouBN2qlxSRu3EORbTntfQGMXKjq+9YUvbOCwZgTeN8IfLez0Mao5bZb
	VsizMlCEpnh5Aw1Eb3e2YmTE8Y1EnAtGLgH8hSO4hsDSQOFxCEngw3zCeYiSIdNx0SoeQVIgmE1n/
	DIB7FW9ZjgFWft+amWkn+v/p5sIYqNUjKtB/93vhij5XSQbIdQTuQIv5JylH7gcTWTXsqQ6JhUvQK
	eXC/GZk23LnFhicSbFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGh-0000000ALBC-28F9;
	Fri, 24 Oct 2025 19:16:07 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGc-0000000AL6C-2rIg
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:03 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-430d7638d27so24082535ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333362; x=1761938162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=zCBDXWcbYYShzGJcU8/khgd1HVM8zQ7q56WgYFLiWfhq9NDozPjEVsYNIMePQnSP1O
         Ay4HVdW51v5vQLx34EHH/dvrRE98XpfrVfnW3FFh5pMKkeNdr8FisAAmKGsMS5k+68oE
         S/gUN45ZofEyirO23ZHybr4B+kHwACGsDkcFfUmG6bP+6px7qqTQKamhpauRpIpNXq8A
         jaQeGJ0wW8SNZSwUqBc0zowY+hggkNnfPp1A94Bp2/x0JLcKmf59veE2KHGooGBA8Lls
         XYyQROoRp4sm9joSr33VfmvVTcArLORIkWBk2Am6DUYBykKtfAD2XcVExV1/RgUOHadM
         Nj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333362; x=1761938162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9XwB4LXCLiaym4oip8K88EQHxoBTQxTfCvmH5+Ipi8=;
        b=c1HoSyTn1UH0iV8DC51dEpeZkZGwUYU+BT4r50zLbmIYh4Kk+ikJWFk1BSOqq52Acu
         L+z7mTqPzyGQ4gi3dKX8zKq3Ps3+0O5Gh+W40pRV6CGLU0rU3+VVG+o63umGJ4V5ucpS
         s22YByVpHZZ6y+pyQ157NebVyF0R/ZFVs1vJ0DlHPJLBI+aK0WSWOPRVvee1NxzMTBGX
         ZjHY1u2P0jolPThr3aO2TXBkovSHW03LFXY7paEVzw1c82uDaBI5jHMeTfSfzaeJsLUn
         TpRTblvcBgvUPQicirnY5p9YpUpFR+k+p2YOhAC5hmS2fxeB237sPcYYP3cLoVwFht1O
         Ss7w==
X-Forwarded-Encrypted: i=1; AJvYcCXvEqa52SII/C/vtdN6GHw1UJmzNv5Kzk0cn7Ql9PQknP5fBVeVp9E+xag+cDV2yw+FrQVX/Vu8pUOCmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGAAgG3c1Ol1q8gWoLCE9P/ilJFTPkkrHz9thHXcKTPUxKklqj
	3TinTB6S8J2+yBhvh/2+d0jT48eopMFB4gGpOW3d5YjrxhpUp2wKFkuNeU3eso0fRGA=
X-Gm-Gg: ASbGnct3emdn3sSEs4soi+iIUZ75XeRtjNqj9jDLUsO5DyFDkxMXi9wMo2MdN4I5B21
	DK7bqTfa2cpfow1LTn1204IMAplWrrfHBDGJGKYc8lRcKyyglVw2QXDrCgPs2fe/Nko/7E3ICM6
	bkiCbuEFbx5iofrl65ylyd0jAeaisj5hGWLDKSE2sg7SCc7f+8JHcZ+tQzLtT/BSo8N+cEBLxUt
	69n7Ct6+bKfwzLyKcC7X2Im/AXQwxflx/hQC6UN1ALNyEws2DrsBpv4C2vxSxhYCI5WUWdIms6w
	wJrCxUMkdStzMFTHsv9MEvJZFWYoexFmL6O5yUSzlC31Ytag0P0mLjfzMgXiTWDBoy+KdBjbMoC
	NndL2HbOmcxZLybFpKy0u+bxmDDy9uHMvQ13uB50eKq2NxLFevMQVVwOYHYH72q57FYoCkzW7WU
	1wFz1IuCOq4jQMn7EMhRduvSQBuyAGrN2d2Uaulo6VWio=
X-Google-Smtp-Source: AGHT+IGDjCZrbwlwcYCrEqEaKTTyt1rgAZl540PN69Agvv1E5bOXHHhIHceJWXZ0grnxWP0ubmH72w==
X-Received: by 2002:a05:6e02:3712:b0:430:ccc7:68f1 with SMTP id e9e14a558f8ab-431ebf6dc57mr41093245ab.28.1761333361639;
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 6/9] spi: fsl-qspi: introduce sfa_size devtype data
Date: Fri, 24 Oct 2025 14:15:46 -0500
Message-ID: <20251024191550.194946-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121602_752433_CF7CE366 
X-CRM114-Status: GOOD (  14.84  )
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

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size.

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The variable used in fsl_qspi_default_setup() is now "sfa_size"
    - Changed the subject line

 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 2c030dd6facc7..46a3187b33548 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 sfa_size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	sfa_size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * sfa_size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * sfa_size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * sfa_size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * sfa_size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

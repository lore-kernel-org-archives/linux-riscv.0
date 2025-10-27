Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA590CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pA63ncltnLZELNNBMRzbw/wyUoFCaN63Wzk9Fqz3Jxk=; b=gF7acCbRbfP6zF
	XnTx9tEx5ybnppcYn4tRA9AktrCXYc7Tpw3fx8esnTL6xnI8BuwBFnU+YFvRPogKXsJ2CKfdtGRFk
	u3jxN4t9eGMuMFUDTCwQ+ft9/uKTUOGWNCbVqk6cX1lUhKF/3j47jcTpFnD7t06WYQ8udc+kyL4J/
	PuEp4ajiEf0gbRwucfKWJeBjOTWaV1D7qoaGefD0bVFIdpIYUPTNJjlPGjst2HfVSHdafHL3mNqpU
	XFWUkyaZTHk1WHRBgQ16T/lq+ef2vAvdiXLFqoOqP2YIcQPacyk/Ur2dlAPHVP6vVuwDpi3HDP2o2
	ngtUbpAaJ7ag/Cb/Iaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIr-0000000E27A-3td9;
	Mon, 27 Oct 2025 13:30:29 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIo-0000000E22J-15cA
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:27 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-945a5a42f1eso59919939f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571825; x=1762176625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPbR25sftlpl2ir5v+hHNY+KLBX0TEvDp8d/P1ZTVnE=;
        b=uxsORtPeJcI5psX/hlqRk4VQpzeAHmbnvtX+RlJK4lARrtGM4jCmeto8hQKHPPviIW
         /NnWsx+sl8Pxk/K4H1iCnHFfZYQsfpK1bBJd0j6fvrEOZt+RK94BXmZEMCmYB/ln54Om
         P1sxyVO0BaUSmq/DDDBObo0XH6II/JVSH1sZbQKw5B33t7NafkPdQVj2dCGevXbz63zd
         pCfvLVLLst6W4DMrh2JKRbJrAjTPhzFTNop84eoClrFcfbPh3189RPBNIpIWMYkeR7KN
         e2E7FDGwOnGqgvuJh16NSRY+g9Pcoy8SbvU1MdcVN/hTBASyobrbUthBbNpP+T9zov4k
         7qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571825; x=1762176625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPbR25sftlpl2ir5v+hHNY+KLBX0TEvDp8d/P1ZTVnE=;
        b=Ug+DNWrNMjbcBy+4yRBwmRCDfFp620ji1ZkBB4dsAnEsDr+p1E8Vk9bptSA38Hk0OG
         hQRzxokZKgesiBfk/WmXrNJJewPks+pbxvOciBqckYsZwqZFE2+ALChcJt0NLt9YsK5J
         q8sRrCgSjrNepG6tJGStZaLWX1oCESJxwgjCLXtH/wyYENHTwFzPcPXe3UilCu0Yqkmu
         +js0pjB8nb36EO9u0cZBpfI5iaqUammUmtW7AJdfumV5iB3zWG0SrpHdBlCD56a+RHSi
         MQ2M5BoMbr/mapTdAnEOY333xY2X3S4WEru5mJF0eimWhBSZ9mxTLYE2BloHOPYBGkwr
         Y16g==
X-Forwarded-Encrypted: i=1; AJvYcCUNpQrC80JDd6qcdKtqnSkv2DdDtyByJQ6ZmJVYuAp5XOHML+ksatLNm6NKWiiN3TXe9ExWhkHccLOiAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSnkB/mK16sCZKJ3mJCpXtCPT9XV8uCR/e69UA1MC+bKcNq7d/
	A1WoWnrYtUdcLm+K5mDyZiOj0VGTiFK0oiSo0iEyrE29F6kAsWg+d6v+xkup+UECnWU=
X-Gm-Gg: ASbGncsVcDMNkrVUbqBdbwEPksGrvEJqAQrHPFRy34LhnHHbnG4+0meOnMvE5r9n+VB
	KuTS3jjt+Ukt5unCuRVYuTTbDeouuxVntAlRAAB8a0WyxPeC14YAJsYHy6IBhF+4owgtN7KDpWW
	nOlvf0CLDy6tckbX4yCubq6w+w+SzHmvRPG1fKBKzl9biHW4MlBK1rw4vGFg+3uXFlurlA6lTXK
	77UVaWmDPrtYegIdr0NPGVRiNaTWVr2E5LNPRydouMiBNhDP9UfTewzgPTX/tD7d8Vdou7kU3vo
	RMdwh3lfCxrWeInsVod40dHupTkNIb4s3VCx0WY+IUdGhvtMvEs3n0qyoR5vZfFJ7xzs3iEULbK
	S2qjIloJo5fVfNm3YMGB8llvjZ+s5LD/1IxaRtS7sOkY5tRvqZafaRMyDeiAFkTE3J3pqp78RlX
	wzS2PBLeHIJSpILbX8DihmKJmHR++9GTVCPstr6VNjOG4=
X-Google-Smtp-Source: AGHT+IE4vZfshbOMDVZNKh1eoFq+Ds25y5NT2j8sGmj2MHLjX5lybRWfL/HsmrZ3kz3tWd7cuHz3wQ==
X-Received: by 2002:a05:6e02:16c6:b0:430:a7d5:235f with SMTP id e9e14a558f8ab-4320f77378dmr1192385ab.15.1761571825149;
        Mon, 27 Oct 2025 06:30:25 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:22 -0700 (PDT)
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
Subject: [PATCH v4 6/9] spi: fsl-qspi: introduce sfa_size devtype data
Date: Mon, 27 Oct 2025 08:30:04 -0500
Message-ID: <20251027133008.360237-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063026_322785_C318A36E 
X-CRM114-Status: GOOD (  14.94  )
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

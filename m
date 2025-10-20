Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360ECCD1A7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heQMqjwS0YIhQ5yI26I0ucs7XMQh0fbX0T4iZP5EIQA=; b=wiFQ6cifzgfL/2
	t5xRQI+KWOX23K+IwrBXgRQLT6BxnEfXnu81CwxJkRKSu/XrMoPwaWL2mUkresrW0IzTcxgVrIy8j
	4sdIrua2TP/74EkQz1tDVedskzMYf7ZHmBzAqbyIOCTVOPKtPBtJf/qi8WbXgror+mN4bNdtmevpL
	Y8pqWDS96OAx/9Jb6hYQLlRcEUWjtRSGuiJ0ScHpshtt58zI9AFU6bfpNclRZ+umn+YxwjV72Mhsr
	soUbOCcsWkCgkAJ9SpmwVwxwvzspG8HHJrwfPWW5+LcwdaWyMSGuuJSUhav+l825Dj3+Iw6qS0p9B
	Y9gAXyhW2Es9CbFKWLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt77-0000000ENC5-0AWJ;
	Mon, 20 Oct 2025 16:52:05 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt74-0000000EN9Y-0H1i
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:03 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso3501235ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979121; x=1761583921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=y3uAorkO+525yWY2XOXN6KvvYFxUr3OAiFYb2Gvz/oPS1dCnX2zjL1iibSUWKLTqm2
         LX9rdhqQ7Bnz0c8lCMfA1H2SrfNbUxUTCFWKEfBm7skDqZA0BJCJquMYY04WoxEho/y0
         wQVhWWRN6B3GeKuLmtEXXCBMzQ6k1X3eNrOeZarbJJzAT1RtWTfkfuLiDA8C3++sIH/3
         /SoiHlUwAwpjh64Pus2pKevwIGojjxmLW2n2xfLK46Sz0FipW3LWnvIeE4w6OEN01MdX
         7Y9SuN4CHGk197SrCUxOjYIQYUw7FnEG1pCSxERCbZuarFWaxHgvU8bu2llzg7EMN4Uc
         fckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979121; x=1761583921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=F2l+ty7JahpRRKoiMve7DOu3mSYmLTPoxhN8RNk0Ua1g9WChysZNwPW8Vvu2LDPpiC
         t+e1ewm9sev9spXcxKvM5T2De373gXCfAbX2gntOPlOnbV9hwIS/dV8KFMi9A5cZ3rUO
         w8/KK5barZRfaUuq0yxtmhKpeY9IfFOLqm8bBTUACBkBzBeVoDlxNn0nspYwwvW82iXs
         oWVDHVLgh8fqHlh08Fkq8EzO/XZ72Rsgup5prBw+/WRmhjvdipS4v8hXQnb3dGKC+cD+
         AjgI2eLP09OXuh+isXcRxJZm0Gd6Abyi/ye5oF0FY6BIqQo/ZyFrnsLmMSo1iHZjWj3C
         S1EA==
X-Forwarded-Encrypted: i=1; AJvYcCWNji8ABHLmdJEpFbGhwBWg/BrKY7kTNswmkGJ5TNvNGnyCCHC/rKYllZBVhP4FDcFaTC59Vw2qvoLG2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi9I9ROwazmad3+AMcSUgQPl99fCTYpGBXeHpJ4dWTbOEDsANp
	dxNFkR460cZQ1WGq1di8T4sRHHAsEA73Qhb2kxLSEW+mREfNuvxAhmd9W2gT9vt5ulW7hMTKXAo
	h4bSFEPA=
X-Gm-Gg: ASbGnctGMY00vesA3g7qxPZDn97p4tRqQgNByGU0eRtYTzN6lRihNycv5gy/zSxPOVj
	cprTyXTntejbXF75uShJrgobiYlFVsTWRsneY5TBqhn2HLk0pHCNCJiGul/xeOyUPrAgClbNY1d
	x+BkfonognHFWJ4eJMfi9qxfBKzIAla/s49BjvurpCFmPkk7RCq86sqjbKqLfo6tbHhiW/cZpeC
	HYMw/jSeCh3bEIV8nSEmJccPZKG+/GtawBrY0pLvy4GYuVMlC2GWRNBughh18dKornbcKNP1lQR
	g/6BNv1IAwXYZR/yjx2zavfhLO1G+AYGu9A0klnx8pgYYU0K+LAZHSyrZEAL8z1kH3+pP0Rg1cm
	1fbdHOtbiy6uiyOP91bomI+fmZOKNegAF+0NJ3fqqVfaRn6GQAPs6SMm10x+J3ImRQgoECYLjFV
	G9JiNu/RxTOYkVb/SWKw0skxuyLg/TGSJWsNBei/Qx9BiWPaXK98h0Vw==
X-Google-Smtp-Source: AGHT+IFtVH7UjM/87oCHJ6DUbsAetp8PBWDPda8ZOgIZ6EU4bkSIEhABKs7/sgWo14aF9mEKEUu9sg==
X-Received: by 2002:a05:6e02:1745:b0:430:e5a4:6f26 with SMTP id e9e14a558f8ab-430e5a4724emr31688155ab.6.1760979121057;
        Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] spi: fsl-qspi: add optional reset support
Date: Mon, 20 Oct 2025 11:51:46 -0500
Message-ID: <20251020165152.666221-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095202_106503_D739CA06 
X-CRM114-Status: GOOD (  14.32  )
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

Add support for one or more optional exclusive resets.  These
simply need to be deasserted at probe time, and can remain that
way for the life of the device.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

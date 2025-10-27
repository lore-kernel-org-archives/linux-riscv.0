Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B516CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj5Hgg8n9131M8Vnunl8LhlzfWONoXAIfk6R/su0oSU=; b=BGMRqfm3Rx4T5b
	eS3GnLqYy8aJUNXWrqVK24IQAef3igZITn2giLQwLFwEOQPlxD9dMTGT00eYHiZKMV3LGlY3v6Owx
	rP0RHJZ3HCnGk4WJiI2a8tQ5ek2u+j6+nZNa9+QQQnKj7CRPvE8MKY8xBDx/slxcAifS27a/ayU5o
	HBar/eKvAog1ex10BdTXDut6rFKwu+Py/AtXvLdWGaITfErrGD7hBI7sxoOi5HUc3g7OEqah/RJq8
	1RtaXYQUClZCCq5hynoiVztUCS/RS0mFrErQFkOI+YS7BBdqUPOJKQMYcUriHW8HPNSHe60uEc2Dp
	9D9R28pnBEsgPwdUDFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIk-0000000E1yk-2UaH;
	Mon, 27 Oct 2025 13:30:22 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIh-0000000E1vi-2HAg
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:20 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-92aee734585so200342639f.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571818; x=1762176618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=kXbe8+5IUqFEpBKwzIYckc+nBsIzRJsNPWsLSPnPtIAnHhlNsNkb8UmBkM0fJ1sxLR
         lEZ2pGXSrqJ4CfUM1DWNpwYudYN3NLUWRn1MCYq6ZGlzp7HTepTJk1ePpoaqSQIsnqwy
         DTr6EGvz1rQ48VxepZaMNHEkUtng+w2C3chx5gAl3p9AkDUToV8GefW9TPPiCEdfUShJ
         WbCpL7an9IWBFxbraQjGBIj9W9V9lQQvSLUxUDifd0aLaqqHp48FhmLVEJhKnYailiIG
         yKZlxN8Spwlb1SpLseh50kYr6Rle+Ak7C1N5YcSTBFc8TGKGt/qzE8LXhoDEWwDZRmWF
         k8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571818; x=1762176618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=BfDrfrEwse9U2UVoZP8kfa5EmqB9VqcOffurNcU0T1MskCkaQryGWJval/66NKmw76
         ObVf1pUwk/JnCbXFMTMfER2kespY8uSLtzRHjq98iVztD3AbapYuma3wAMWRk5EZxMQY
         zZ7rRt349aF8j2ZOVhMag5MFjuVoXUDgH8ptx+BfdIAZ6HcolsVFeajHB8vLfE6yFPwr
         /Jh3vAlGbT8boHAEAXi9VIvMVo8zm5pZv3NQBzpJbwHcFiQ1Bxh3TSawMtA7ZpVk90Rd
         15nWUnPMTPn2SnDgodktUDJiydLKB+XjL6jiS445RnDX6UNfL9qK4nsmNSUnQAirOy3W
         3gvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVumjz5LtNK9j1fQ38f8jhaOtBDcJUrPousn+cOGHboNsOy/We5xMplNXRvDpYNGh8kNxx6J/HURqohsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5YHI+5GfHamQ/zBsk5bWTgUl7iPhDJMTarJ1cvxSBoGhiDte
	+R6g41MqPJbVPXeMeBbqpO8QHkgBnelgGU3Y/in3k1SRve21pmnJTAX7fskMeLd+Dmc=
X-Gm-Gg: ASbGncs0GEj+YN2BSze9FyeTOdPYRVGyvt21lv+6jdGa9aSVvUMZW7F0h9OJnY+gTec
	1619J3IVfhbFCATIqi/okS0UCxaab0lV5QHFipXta5AM0bYhXhZnJtmONqHSpkNiw+pzxh4oZF3
	y5TPcm25R24d6adUAvriTFk9pCC9kgUgAyzl+p9Hbxr3PyZBNmm5d6FZT2mb1Hhhed/oz3yjuAT
	iY60ax8mmwDZ7QSQ04R/s5t+mD1JSIn/qvD/+NzHCAzFQmZZ3URS3zjHkhxIXO2R1OyihKcxjrl
	oY+WBr39kS94yF8GbRBGGRl1Gh1wc/TWqtjYrrShNzNMVeyurIRYHhoNKHKEaqwOTShdahDy30C
	lxE/WRBjkyTTryl6+6sAdN24K96rt32o5t2OV3TsQZ2PNbjlz73ZxkpORzWFKZvr4Rcs6uxEjjQ
	UF36QXwetBcmvR/rUrdYcvOD/THJK4Zg07JRdxZvhqLhk=
X-Google-Smtp-Source: AGHT+IH0glKysst9aA3Dl1hO2CkWup00aLcqDqNV6Kijix8yVXf6s0ExlLzii7wtaTpwbQLaOSZlgw==
X-Received: by 2002:a05:6e02:2689:b0:430:aea6:833f with SMTP id e9e14a558f8ab-4320f6c7f59mr1567415ab.8.1761571818580;
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 3/9] spi: fsl-qspi: add optional reset support
Date: Mon, 27 Oct 2025 08:30:01 -0500
Message-ID: <20251027133008.360237-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063019_582453_CD998643 
X-CRM114-Status: GOOD (  14.12  )
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

Add support for one or more optional exclusive resets.  These simply need
to be deasserted at probe time, and can remain that way for the life of the
device.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

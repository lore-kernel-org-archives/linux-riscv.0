Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F310CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBFy8up7SwwpnkPsegv3XpB9zsKDd77nJ6WJX2OTYXk=; b=usnTn3nc9+gELN
	XRynvxOvZ9UfNiBDgc1TvxVlAGQflu0JVfDsAO6bVu9ZVBfV9vhYf2pq5I0sGYsTqtu7vmNyp600x
	ZK5x65+NRndvY883ciUD0q4jYuaaqMfd3WrApt4VrWS38RmpsojAdv7C/e/j4hOdDOCd66RgNo26S
	oO1Pu+9nD0VZSjUQAxnRTPthwE/ZzfqcCa/dBiF8mYlAXTA/JyWYBYjevq3Ykw4rUeja52v79H3G0
	EyZh3/86ebAHzHLGBzBx8s/o+lhI3Z4v9NU+5jIpFYxg5mVGKRWBHGu8Z+8+/ojgTs+t64mQrP//Y
	XdoTfW8EJxfu5KGqKPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb6-000000078Aj-1lyL;
	Thu, 23 Oct 2025 17:59:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzaz-0000000788A-1oN7
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso1375760a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242369; x=1761847169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On265SWIIsjj6cFhkQLuouFdBySNyVnfLyhJagcyMrU=;
        b=x2tOva9BGu3B/1zeIsRAjHBKX+RtM8/lI4LF19I4b1lYzcgTyA+/hZqLNg0oHyynbe
         kkBZRe4IY2UlbO7R/gSd86zue4ojLpxQ6z+Jjf1xcpbEv3NujcQ79nQdzUP7KPCbzjdf
         fruKQ36fSlzqxRgqAlMLYwBNRaXT3wgvLYu7qd8ufRPgDEf0bLKkKmN4OST1p0jGC6ER
         /dmJdK20Q2bI5GqxyOV72alTQiCI2tMrc1blTp4AZ5J7PST7dS6YDMe0FsE++xVDjqLo
         TR0q59HzV1gooS3zACx0Tf7FuN0xlcDPnQnMXUlAm0SoWbyluuhSUisKk58wM8Yl36Jr
         zHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242369; x=1761847169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On265SWIIsjj6cFhkQLuouFdBySNyVnfLyhJagcyMrU=;
        b=Mp18jYQepR9RoOl4MoQLgNiirrkWhI6A6baXjal9CHSjrHwgMFDu8Yl64By/sDXElb
         n7XRqB6+zgY1RtDIA8sEYVmKwgUhQ2jhM7hpmD/Dl2XJW02OWdhr6zeS6IHFpV5spTGM
         FhdgKT4k0vlrV5mcx8o8/Pef6BwKkqM20dELA8XRpfe4BLKVp0+T09+JJS3un1+GcDkk
         VJYO5PTubffj+yPWL8S18CHKa4QiOlmYC0pbhVIJ2FMuIo1QazbcOkrE8r+v9SsSa+WI
         ujV72s5VGRT6Actlo8onhKH/xOiC+CIWWy2nINLRRF7HjH5tWjMguf4UxSGcvaikCWV/
         njUA==
X-Forwarded-Encrypted: i=1; AJvYcCUeOe8bBQeoYWzbIi1xF4Igm6zDn9CD4w0ihTeXOdn7csKBk9THAwPwi+4Xt1rtR77zx1mSIBeEyKgshw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAuFo9ffj63IldyxUoaa0UBa7in7eearoSmemTsVocTvb9aGky
	RgcAvdHV6WeLIvve8yr5wdNYnv1ui+hVoTdJf1e86rZolfA5zkaYzOvYAXhFPdx6Qq8=
X-Gm-Gg: ASbGncui2DTWntTjQr6rXSDn4p8r2FvuVpBVxxS+9aU2VxzG2Rld41yjgGJqo/kMY3M
	40w1nhBwBXHDmW8Koi9UxztOO4g/nfdApqOWdAHTwDsuLSSLmi2+j0sQHfj0i5kpaZJGDpquP+Q
	3BUIKt0PKmtoWJh1MwyqNZWcAPmXqoyOk9IMFrQgWC2AZWcN5LskCeQ0AGvdGs2E6+qo8sn8f81
	6lyBMewfP00Bg90+jMVCcUf/NFA6bFbAD6qtFn6KMx0moIWHm8PstTCFktg+sVUY3WeNb0DL+s2
	o2I3Fbo9SR5qaOQVXO2OlCjXHtNS1AA32ASA4NtqzCKTCOPSzE6PJLyqjSj53YS6zoFAYXoFRi4
	1+oO+bEsfjqtxNnvLvbU8odLGtx4MgsMgRJrpXa1nSVf/d7QVnrCZY4JI2p8cUX9GwNzP0i6yZy
	8BsihhuTW7fzKoWo8LcSplBIg=
X-Google-Smtp-Source: AGHT+IHMRWTLOcYt9GF5JwdHPs17n3sdItQgiLvosy748nQ99rSr70fD9GfdnC6xjLJTc4YsYnnuZA==
X-Received: by 2002:a17:90b:248f:b0:33b:cfae:3621 with SMTP id 98e67ed59e1d1-33bcfae47d8mr20130607a91.32.1761242368668;
        Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
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
Subject: [PATCH v2 3/9] spi: fsl-qspi: add optional reset support
Date: Thu, 23 Oct 2025 12:59:15 -0500
Message-ID: <20251023175922.528868-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105932_825095_6B7671AD 
X-CRM114-Status: GOOD (  13.81  )
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
v2: - Added Frank Li's Reviewed-by

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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

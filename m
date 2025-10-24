Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E3CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj5Hgg8n9131M8Vnunl8LhlzfWONoXAIfk6R/su0oSU=; b=2C6PRzo5CbAWYz
	N0OjDtfPdzoSQGMhNuzfkXt6dpdftZhwObOdCxi51kbE50g3rzQnkFjzm7A7xbgPERiW+iL2BwuVY
	6g525nBxmmpediy1cNxvRVzHRkzO4/4cpIXxjUDBIVbIiVg/a8lJvpAJKQGGzDHIFacQeYBiF8GIG
	SgwrC7FEJcnnbIUWY+aSbL4GBMjvy7/dcnQE32+y33Z7t9RjJRqHdtHML4IcCi3E+i5IJz/hhGz8y
	Qkb6+PxmJFyly1cUQCeH8aPGSHKgTW77lJm0mc1em01lhExDW+bPOPXvSLJX9S1C3XYYqKGJEq7t5
	ENCZrBGPiM80wKS8HYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGc-0000000AL6d-27m5;
	Fri, 24 Oct 2025 19:16:02 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGZ-0000000AL4V-25NN
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:00 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-430d0cad0deso11795055ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333358; x=1761938158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=Nh1PxA3A+GxSgVkxpFp+62oMEYwvdyw59yite6Hc9BZlE+gBglRuWS9HPWDUM9xRV6
         8BA6sDRBhKSgJYzfGZRW81CSkGvMImBveZ/V1FmoIDYJn+RQWYhM6IWv3b+CDtIWM7lZ
         o5Xb+NahvfAnrZ5A5x1WlUAsnzz2QVtZJYr7sszVW0lU5C9IEaIWzVlskD8SkI330QSQ
         TGDtkTGlgO3RHDXGrSJLUVNaLZJAvWjyiJZQg5jPxZJK6G/o6HxAhzAkvwlZJjT6vPml
         3gf+521pPHXCgoT3+j5F7aGCuinUeCy1dUaRa4oZxIgfTxYB+toXzKsSnkj08KqnlyF2
         5p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333358; x=1761938158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=ONGWNil78sSc/kEJ3LUi5EUsfundjDH3/2P+gywz0OeN5dOLygURjxCklaVtLZO4U2
         uk/vaeK1loaSvaU2QL2992P7AYZ2QF6G8GBh9H4/gK2Kfx2U1pmxoSip2cBj19/qmW64
         8aDItp85A/ZSiC6qVY6W2hi/CUyLnRl6fsz41UXu6EWHOe9Pc/ehi8M9i3z9jf3rXpXq
         hrz2Fm02F5X7Ms72IljC7+BBdWimtWlEzdmZOXcx2q7Ka+cr1m4/KF72gYaFkM2pf/Zx
         KxcntuI6Hodkj5tNKWShlgpXUdp5yvlKc9+MbcbuxCPcv5d62sARCgIQXgH4KFue79sg
         RLdg==
X-Forwarded-Encrypted: i=1; AJvYcCX8SOHxqiHtVd7dXrvcm2fUljekkpU4dV4eGLJ4z1gaM/YIpfiKBDrMwlPzz1aCZISSAVriqo+6U7Xi0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcN19N4QXCrF1k9C5cNkq4s76AeT8E/CiV0hgrkxUe05nMN31i
	djkXR98czPjIg0SSdTp+iOxT06mKo6SY1mKSQj6juF5bSW4RgbQ5zIzkIb/C+mju8d0=
X-Gm-Gg: ASbGnctjtbC3jrCo0At3BAX2HVDq0Z7XHOL5fxFGE2HfMa6bqi1dRnLg6K0Q8S4vaFR
	js8WyVMMljnDCPg7Eov5D41J+RO0ZfTuk+C1zzGha7/6FCJl0Eyf88ztMk8wgYsX1mpdcn1bHSI
	y5jsqhaLGvw9srv8u5Iys9ZD4ynuiBd2drDt9FYLbjflua6vIndXlFLX9kxAGd7pq106oWCWq13
	SwjvcM6f9sFBI0u1HoWtv3WLT2FkqwWfTIAGbxyKV71OdKj9Fxz152ptQo9lNKApra8wd7h2fGX
	mdCAzBCWxrfza9kCLWPUIJY6oeAoBwQhaerRYpL8s0lZuh7lRohWBEZ6osZ4qkr/dsQIp1p8md7
	yFO7PyyiUB64MftaGKYjyVbYLublBFgHScdWMEpKJkQDxSRLY2ym5cs3D67lkpwL7G19XJoQ52A
	CMlkM7qLOgGw853Wa7c9gpfWJWTbU9+vNfwzSwv5Hl0i8=
X-Google-Smtp-Source: AGHT+IEtD+Cr8mACF/K0NonNKa9lBHI7Tp+o5Vfp1juGLlBk90z7fTUTAMVH9dichKlDp3Ypt60Lnw==
X-Received: by 2002:a05:6e02:148d:b0:42d:bb9d:5358 with SMTP id e9e14a558f8ab-430c527f7a5mr415578465ab.27.1761333358489;
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
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
	Frank.Li@nxp.com
Subject: [PATCH v3 3/9] spi: fsl-qspi: add optional reset support
Date: Fri, 24 Oct 2025 14:15:43 -0500
Message-ID: <20251024191550.194946-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121559_537068_E0090793 
X-CRM114-Status: GOOD (  13.87  )
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

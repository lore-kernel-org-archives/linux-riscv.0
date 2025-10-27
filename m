Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A0CCF9EC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzWYwD3/XyTE+ZGQLAOvSaJlMqNHZbK9JxJbNhBHHzI=; b=iUTAd4vv3vLXyg
	SMJ7GFSlxswky7OL5fnE/qCAlUW8qcFVpZJxxkI/c1GRjctn9g0P6c1D1yCzcPGUl1TnGeeyFwni9
	fNZFa5fQ1iUIqgsoyncslXQ5cX8As7GaAUHM+TQODDa3RRUmnRt+HthPJHlYlLeV4aMULX7SuypYp
	RBgI9SXu9ngbnBeQNAjLYCjWCcrH4pAiK7UcQ832SgA67qKJuCpGDFI+2ljwDptSiclI7+5B0ME/M
	RHt9Rmuo0FdpkHCi9xfgSAe3Tvi8I4XJt+6/sBG6JCRxsV+sYUFPTSkJqraaVxP5NBJIeBW99ZneB
	kNJPiS/H6aU4rclSnAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIn-0000000E227-2Q9E;
	Mon, 27 Oct 2025 13:30:25 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIk-0000000E1yu-4AwU
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:24 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-945a4bfd8c6so141047839f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571822; x=1762176622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwBrji1LVVqX5QLhYIQg8MHPDU19g5B0S1hpvpp4hEc=;
        b=rKuzQ5DbMiFZ2HIGi8IDyIlVCNDLiFxtFzeP5ktkmH3zj4bjS/Xe0IVNrf7vuLNSCU
         m/+gPVJTuH9QF+BHelF3JjWJsCfnrcKx3CDmC00FqMOVuy+pi2w7JYWgxwiVHlHw5KJG
         Z1ZyMmoeRDEWiHmy0Xncd5DH4zwUs6rD7dauv72QhdYay+Un5x2D0U3MX5NkZ5TXFCP2
         0b83l/wvuwbQbbQihrgPV0lGPjFqQSmewc9XLyCMYlD4AZhkKbhayR8s0j8e8UIpVevl
         UjxwHYiP8qWtJmBCLPRCkmxxB4vezc9T5helzb6dcaAdBX7CFcnhmxUFjSFSdfvZpssK
         cviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571822; x=1762176622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwBrji1LVVqX5QLhYIQg8MHPDU19g5B0S1hpvpp4hEc=;
        b=Np5zymQxe8LdOGt/ERoMV9WDlXQlnB92f9gtHsdq96OxJE4TFHxetB8zniqR72eUzs
         mL7ZqpXynqvfJjN3q6FIFKDh/VNPOaTIJ6/iU+4tcDPJ97zEYZ6IxslxqsgPm4/AzlXO
         G8/LnWF6p87Sue/gYFNHX52T3Z3Q9ex66IQy1LnafusIaiCzh+T6Lm5m0rRVDbRYr2XQ
         6GgBjy7ixA6hz5VlJCOfRJbUwQ4Uk3uqFqSXr+Yy5aFqXP2QQ+oUGkYe7EDv5oAjXESs
         MqqPhn2t0zoiJVq/ec4nnafJMcMBWzFuOjnm0EQI4aA04e7ic5smAXhjhNVtAHOpi/Oq
         4p5w==
X-Forwarded-Encrypted: i=1; AJvYcCVCg/EzxJAEbx6tW3IqbRIfM6hGMp5TqLWxYPVHOOq8oqwVMlTwkiExBZNtn+nJYJKHY8/ssXe1SyVXRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDDk2NmNsw0sPHNkrL/kABgHGXyh6p0MF1x0JgWYdH/IAUeaBD
	NVsfEfVy738mYxK2sIm1kq9y2nrqlUuiMC3tYHatLTE81bWGVV7R/GdA95wjSg6wRgo=
X-Gm-Gg: ASbGncuQNxHrDk2mvEoMgu9PCck/4Bf5+Kd7Ywb+T1aC341yhNy7fAW7Xn0K3H1vDeK
	8GE1nPGqNLwCrcaRamRukp35RpPVa3Q11jZ34pYHgSx+Bq6VUzNvginrTTWRdU5cn86CaTiQ8ED
	p3Xz8oZ/jAhVnKXcZomBS1XiRTtcliyk1/XXm3Tk0vV5gXcG5FxHo4mhWYywQZW5oKYNuI8Kbmk
	WT5CRcuX4gvSovLC/j/40f5SmcBJ82RsYr1iHwOU5YKsEdFy7SXwkSgnHMqyLlz0k1bd39gcaOa
	9cphW3+kIT4ff+Dv2Hw7AJ3RBv1KEd9ow/rnRSoWJaY69FGhsKiITpfTubhf0yxUgp+7Y34OLTN
	O6BImawArgQsfhserpiyI2lY/5A0D8WGLdyp/URIV7duZs7JKproW4zHcGWv7FyJ32B1ngvY/0A
	Mw14xIfLGcab6pOmv3LzlmB1JZ0c0jqZ2cuMp1u3SCQGDXU3cCUfUsc8snGEvAaQCV
X-Google-Smtp-Source: AGHT+IEea/t006sDIUwyJirb8lhRy1y9vqvFLUYDpT5bn8joxV7TPLkwITOKKA0xlex/9Fj770b8Lw==
X-Received: by 2002:a05:6602:1687:b0:93e:8c1e:cc5d with SMTP id ca18e2360f4ac-945b819d91amr15227739f.5.1761571821923;
        Mon, 27 Oct 2025 06:30:21 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:21 -0700 (PDT)
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
Subject: [PATCH v4 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Mon, 27 Oct 2025 08:30:03 -0500
Message-ID: <20251027133008.360237-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063023_049177_A1A250F5 
X-CRM114-Status: GOOD (  12.02  )
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added Frank Li's Reviewed-by

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..2c030dd6facc7 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
 	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
+static bool needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
+}
+
 /*
  * An IC bug makes it necessary to rearrange the 32-bit data.
  * Later chips, such as IMX6SLX, have fixed this bug.
@@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
 	if (needs_4x_clock(q))
 		rate *= 4;
 
-	fsl_qspi_clk_disable_unprep(q);
+	if (needs_clk_disable(q))
+		fsl_qspi_clk_disable_unprep(q);
 
 	ret = clk_set_rate(q->clk, rate);
 	if (ret)
 		return;
 
-	ret = fsl_qspi_clk_prep_enable(q);
-	if (ret)
-		return;
+	if (needs_clk_disable(q)) {
+		ret = fsl_qspi_clk_prep_enable(q);
+		if (ret)
+			return;
+	}
 
 	q->selected = spi_get_chipselect(spi, 0);
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

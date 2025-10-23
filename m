Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2C0CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMK7jo84CkSM6wCf19sYv8LtdhuWfG6oDqA8OanO28Q=; b=C0q19ttUPrrCEm
	VPFdhKsDdnX6kka4gkyXWfSmCFMJsGJkVoI6h/pEQawjCFfofk7Y6JPUpXdJlKdXYbqfOeYnd70vA
	2mbpbRl33LLaJX4xMyH2L2eBCdc9pRMkRcnfJIvaXngotF1FwvG2KzPgqq8tFkssE+lP9DfPE324y
	dTJBPXo39bxnwmyjBi32OV7Br0Y4zwCZHRrTe7I6D0Gmn/BiYyVzz4B6ebVrJp7FwLdcZDM3pNKRH
	EoYeL4euykMYayBZ7GZnMYFOh2mSbpHcUAn3NKYEfRFRUr4ovgNydVH96/0UPxN6erRSnnTIshytj
	tcf36eYdCta4zmomDOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb7-000000078BB-05ai;
	Thu, 23 Oct 2025 17:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb5-0000000789z-2lfK
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I05R5wxHah0tP+5XjRF9CvuJmtSK0+imsUvDjfvNbmE=; b=KTfv1qN1z9fD18YD4XnmO5GF2S
	WPjfCfo2Py5Rqs8sMD2bcuX9PwzAy6aJnPTB644kxyl5dl1XKMccPTqoRRhPNnEdgiIHalR5Bxbd7
	ughNKQDT1iqrsMmuruRoDmqnx1qDCEecF06xV2lExuIS8lJViaPjsFAheGmbCRBnGpR1Q4bIeV6Tt
	h+d243tYy4LNnAXkNmQlNhIqSCoDW353wKmGKewQ4OXBRk7Yro/SrGxaoIvejZ5k38a0mBbJhCs5K
	ortuOSSzFazEfE9g7vMbmHlvc468v+kqI6x/STOGACaWAOAbIe/4UBBKqAAPSknaghcjbHJ75JUuV
	jsvtS3jA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByjN-00000001ZRl-46N7
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:04:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7a26b9a936aso740227b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242371; x=1761847171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I05R5wxHah0tP+5XjRF9CvuJmtSK0+imsUvDjfvNbmE=;
        b=FuixpzixmmkJ2+DckPAud24gPWf9g+trtCKubQESpiIvTKvw+0hhj9eXTrsEA3sigp
         Ee12lMe/gXJQpAg+/r7UighfW5HbBKVC24XCwAgTzGl3NZ+L7zBZ89jiSPoAakMy20g3
         eWPvDS7XbTl3oBqf/Kd5S7NSMJ4+z+Dc+wGPbmLvG05iYxytpj9qxYjavWUOdOwN8P94
         v6WjfhPHy+Ag7kmgR9sMwPas6mDy5+/DLBhAqhFSSU3MVUxNj6ZcPFUWzy+hN/H8Oa2s
         GoaNtPSzKCmTnkzSlEZSxiR1K7aqa6Y7Ff2BIRUgplysAOM1729z0kmXnqoGcly8ss96
         dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242371; x=1761847171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I05R5wxHah0tP+5XjRF9CvuJmtSK0+imsUvDjfvNbmE=;
        b=GbHASqeEVEpII0ZOawY9CTJWfnEpI7URYJrvofVIrQUT7V9c/Wysygs4CLew0aUKCi
         2CF4pxLg7dW3AqLyKXUMPKwQC5BLWH/6xr+2Vw/p76CVW71p9l3x5E6rRKEC/Kn4VRY4
         ufHPp8C5C6IupnrZh/RcOJXigcMt0hVNW5osRMhVRK3daNhY5BjomI3AhgAQGAoRN3OH
         MHQnCFFC0d0utkHfj5OdlrevtiSvlV9WgRX7FG+YiHw6CDGN0wUuR2GMiM5IPK1y/pfM
         kTeVLei/Tv3j1R8z8rSmabF/K/Ys4U6crJ6ss0CF7Sp41kQgJn3bbumSjh2dgvfgxwVk
         2CLw==
X-Forwarded-Encrypted: i=1; AJvYcCV5jDIjqMOz/B2vYgvetbN4tqYUtlc4K2Y7dLLUjOsNCrHVGvgoF/ULFJzheWqdF577CkmbSbISLQhtFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgpRahV0hhtZGsAKvZdfMAXDCHj8UX1BG0cjutD8sfKvV0BruY
	JbKFIxSWUsFgZ0Le39bUkbjdxMi6SHcyAB8vyP45xyg/7Yi/EwokkNSXXy7fOY1VDZ0=
X-Gm-Gg: ASbGncuA1mXqxi2QgcPN+XATQsuW0vetVz75fu7XCn4CSDSfighhRydx9U75pQOHdHk
	ZkC1Whqt/ukiFSi/huZOS1FTqFYJpRiyJiXQrfNF1ntCJyqImCKIkT7HT8i2Yc4PY9gXVCokN/r
	GkLLMbkQqMIkMFlFhBMcx0fNBqyD7cJHLvXU8se3Z/2DXu8jaTJxROaqISZtzK3K9eBHy7wPKtd
	Xt89PnTYZufBjYqdqmh07T2S7fIBs+EkOmxJFpbRz5pqhZq1XEU9ix79roAkDlgByrldx7Oz2Zz
	kb6g91AbzVsxjJL3qlwrjkshKbTN0dvDb/n7Vy1k68d1Kf5Wpp2kUbU0DCq8BltdocUcbGTWJcz
	ubnh2YMeMCEcNxVxB//OtvSidzILOXhNDd5NnRprXgNyBgtO1d9Z/TMZ79EZJVw5Hldf13K293w
	toGdqULOwCAp7NnzMwy+pu+zw=
X-Google-Smtp-Source: AGHT+IGoCA5eG9vMTRsnrdRnkF5/ZgcCIYMlzlQVHh845VGO6X+2euBU7KRA6snytjs6NQ8wnUF2RQ==
X-Received: by 2002:a05:6a21:3086:b0:334:a250:5774 with SMTP id adf61e73a8af0-334a852285emr29903456637.11.1761242370937;
        Thu, 23 Oct 2025 10:59:30 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:30 -0700 (PDT)
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
Subject: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Thu, 23 Oct 2025 12:59:17 -0500
Message-ID: <20251023175922.528868-6-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_180406_151143_A68E122C 
X-CRM114-Status: GOOD (  12.80  )
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
and enabling the clock should be skipped when changing its rate for
operations.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
    - The predicate now returns bool and is not inline

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..c21e3804cb032 100644
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
 
+static inline bool needs_clk_disable(struct fsl_qspi *q)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

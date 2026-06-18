Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7723CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JYN46NRNTG4SFYeTvO5OwKjL9J9mkbSy1VHfauBN9E8=; b=D/E2dYoIUf+Jcc
	VVlH+ql5VOOIIt86735VVZz44OeFgmMbnWu/BOqiyze0IhAX3BSvUFuQ7tryYrd+taN98lOxs3aoA
	8x8VRjaFjMEoOYXS0gNZi6EZR6w4iUMamcY6qbeP1ww03N+UKcdbhsuaQlgD7kiHakmeQKdcZ7EUw
	82AVfe1Y2geukRX00fu0sGLVEfjR23t0QGzpObj3Lrjm60ty2ZVtefCzs/js5BodKHjp7lUDCU0eG
	XrMu0czIhNOjHbVpA4dq1ybIxTfQUD4FdYXRh78fuDmVTw9urmLWMZ+3dMDtaMoaDCgnJL+T6Nh5R
	4pLIO496g3a2NDX9v10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDVB-00000001Pv7-0TLW;
	Thu, 18 Jun 2026 14:13:53 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDV8-00000001Puh-3KTE
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 14:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781792030; x=1813328030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c35aNIkV5X0e2CdvOHzOzzA2KKJcqxXs0jF4rkgX65Y=;
  b=UPg7Or6Y8N98Bw1rzOahlx3RJrPkZirEoKWe9+BqccSvTsRIwh1tIiCd
   yvGyL+M1jLwuQ/0yi8kWH2RJBq6ExwpcIPN/Du5bpniucAPYqk8WA8sel
   zBQWJGNXJ5HValUrLtxinfuv0yYYALj4RG/Qc6sAbbmTY3m74kdCRt0Qo
   8kmQtVd2TKqtEMjqfikUpy4E2DETLVrc1DVY8l09APCbSCUjnYWg5anUr
   uzFfP6G+TodozN4wSfMs7seDjl+LWcHPxvUKCk0upgMB/BGdkS9MwmBlr
   uUGC7prmfQTT0j5GNIbpSWEmlNKKldjdGWTzzzipYOBssv+7J91kybNby
   g==;
X-CSE-ConnectionGUID: 1CA0U8/7Th2PbEmIRtJjow==
X-CSE-MsgGUID: /8/tQGtUSResgjfSLDJRzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82719419"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82719419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:13:49 -0700
X-CSE-ConnectionGUID: F7y8i78zS2mHJ93NEJ+6iQ==
X-CSE-MsgGUID: fc7aJJkhQfGFgedu5qILvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="272456743"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2026 07:13:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1E15F98; Thu, 18 Jun 2026 16:13:47 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: microchip-corei2c: Use generic definitions for bus frequencies
Date: Thu, 18 Jun 2026 16:13:46 +0200
Message-ID: <20260618141346.3241286-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_071350_874967_E56A827D 
X-CRM114-Status: GOOD (  10.38  )
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

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index c8599733633e..330e150ef6d5 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -565,10 +565,10 @@ static int mchp_corei2c_probe(struct platform_device *pdev)
 				       &idev->bus_clk_rate);
 	if (ret || !idev->bus_clk_rate) {
 		dev_info(&pdev->dev, "default to 100kHz\n");
-		idev->bus_clk_rate = 100000;
+		idev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	if (idev->bus_clk_rate > 400000)
+	if (idev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "clock-frequency too high: %d\n",
 				     idev->bus_clk_rate);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

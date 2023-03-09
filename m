Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB4C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isgp7rPISERKijyC+3YedoBPomax2BD4H1JLO4EyOaU=; b=0p7u3QC+k3kBCJ
	TQ4vRB/OZqDuwgomVlMRZJfVwtTKxt55mxA1huDt02upl6EME5yXOcYgvZiy/p5rrebYX5lo9daRZ
	5r6CvEDx2yO/4HmTp1vgMeL/RGtQmdeGqQP/xGwz/MvuBrCUGqm6Aoj1xEABWyxoGiZXpRJSFj3nj
	waTRDV3sJx6G8WFQvSLHHJlDKc0hmYY9GI6i9SVctgR6Lhat98TDxQLaoVbv0sthw7mYxrfIAJVKL
	SyHaZq2j2j9f5P8sBuEN2U007ySakHrWLJ1yqslRCITXkjS5rSvQOUDvYi1LYhm5383y778knG1E0
	w82ZV3E7s/Yn+ws6b5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8c-00Bnwa-Kq; Thu, 09 Mar 2023 20:45:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8a-00BnvG-AK
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF5DAB82088;
	Thu,  9 Mar 2023 20:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0991EC433EF;
	Thu,  9 Mar 2023 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394717;
	bh=EqM4N+uahcUA8b1+1yYauk84ymvGggxZFX8ZE/rCH9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZn0fByttXZuee6z1n2ArTUuSQdH+WLLSyJwXGczq0hKTjc3X1wGoqyituiUK2E/V
	 uJmXSy3F2x+YJ7X3Yfrba42Jdfo1hcosI4VOKZCkPaFepzI/I1ANb3ZFVyIGExlonn
	 9xWGd7op2Q+r2XLY3Qg6YBuT4U4xBlqZwFen/ImEdobIsq87Y2HtjjGz5iPQ5gpzAa
	 eYuWJZDsMzcIlZybaYYf4gMEPu5TdnXvft8DaPDQJLVNpVTjNa0bvNq0vyn4QvFC/G
	 VOPGBvq5r/9l1It0qnRTYxVO0kmP5HteHGmRDCmrvSjzvJF1Z4Ju7NvyxDytYf4Bbh
	 XXNw8V0qJorwA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 4/5] rtc: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:51 +0000
Message-Id: <20230309204452.969574-5-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=conor.dooley@microchip.com; h=from:subject; bh=QXBAn8m/iPA0EANCEPLU1qNAdCRUvWn9mLls1w6rYNk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs7e235f4PGXdW/Z8L7ZKPmu7eyDaRL60y6cLjTIy 2swePa6o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOJy2FkeHu0xS3vw5qd/785 HPre3zX/Y94xp7WuO55396j7n5r1+SXDH14Fu3X/9vinK6bXbaiwsr113Si8a7eOZeeZXIuDCpM EGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124520_518272_30277927 
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

From: Conor Dooley <conor.dooley@microchip.com>

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the Microchip FPGA
RTC driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 5a71579af0a1..753872408615 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1970,7 +1970,7 @@ config RTC_DRV_MSC313
 
 config RTC_DRV_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC built-in RTC"
-	depends on SOC_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP_POLARFIRE
 	help
 	  If you say yes here you will get support for the
 	  built-in RTC on Polarfire SoC.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

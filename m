Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10CCC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sKx+o6W/ih3vgXd8lTCvfIroxyWDLD/2I+JmUYiLQQ=; b=zZcc0cn+S7PALl
	p+WUVpIkxaDA18W3RnB56rvZV44E0jcYglhmIRlz3jvQ/iyO1usUFWO7fxitn0gmNuiNwe37KbFDN
	Bkg6WlESeEX1IFT/Z9tTF2tRwaZ8ah86vhiPYz5FeCmvr8KKVCnEXD4FrNAM6P9nNYhKY4R9Tf29E
	V+TvkQZLQDbMwjHUqEm8rDGjiFUSMFS28jxCDih9NBhv2k4rZX2v8aCFUTHjG7ddsy1Gc9qQoveCA
	agVK4HWxXfd8hgQTzNTv1k/owbVuSKT9CuI1iG7TQWcAw0IWNSbVIBDFGHPy33MfanhGxGBKjaOhf
	2G7Ozg1As7/A3Zu8uxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obntH-005S1n-2P; Fri, 23 Sep 2022 18:59:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsF-005R0g-Iu
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5C5F9CE2595;
	Fri, 23 Sep 2022 18:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E919AC433D6;
	Fri, 23 Sep 2022 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959481;
	bh=3kdcXGPgpNlKK41eSGyVlBiMPnu5nTKwTk8IwT/Z6r4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LntYzsBi3WB0Ujd+25k8/CaHJZNgFR8vSsAIXAXyhj8HSwZEougGl7XWRkLCFKHTE
	 6hI4WDTbHyzsy0RLffIpy1OZM50GTxUoopWZ564B+pa0mI9q9PGrK9cyzSFDhbqZoT
	 phcljll8075Y+kMojHnMTcMf+RmhBE6fa82hBZrifBkI2XvFe6gVRI55pdrhA12uyk
	 5oEOdEGvYWyfEx2s03FYjX2L/2Wh7Lx3t09CaPS3Bg3ARr+6NUtGcbORXntfK0sKdu
	 432RkmjyFCEpRM9w/LrszDGlkOkkTOxq4tl6lXBkBRagSlabEz55VVlJgtKCEQ64f+
	 1Zj9jn05Mla6Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 24/27] soc: k210: convert SOC_CANAAN to ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:03 +0100
Message-Id: <20220923185605.1900083-25-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115807_858910_B71555EA 
X-CRM114-Status: GOOD (  10.80  )
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

As per the discussions at LPC, the SOC_ symbols in Kconfig.socs are to
be converted to ARCH_ for consistency between "incumbent" and incoming
vendors who have a legacy in other architectures.

Convert the SOC_CANAAN dependancy to ARCH_CANAAN. Since ARCH_CANAAN is
only defined on RISC-V, the Kconfig dependancy on RISCV can be dropped.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/Makefile       | 2 +-
 drivers/soc/canaan/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 534669840858..2a3504c9d21f 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -8,7 +8,7 @@ obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
-obj-$(CONFIG_SOC_CANAAN)	+= canaan/
+obj-$(CONFIG_ARCH_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 2527cf5757ec..cdeade6040b4 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -2,8 +2,8 @@
 
 config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	depends on RISCV && SOC_CANAAN && OF
-	default SOC_CANAAN
+	depends on ARCH_CANAAN && OF
+	default ARCH_CANAAN
         select PM
         select MFD_SYSCON
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

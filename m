Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED140C04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gREtHlBcqOOMcNQUNH0OigmgJNAFzX0WHOZGX7zigNY=; b=XmIWlaJGiTwOWN
	8DMCIHKPRL9OOCbygxzYld11IjC1bgcyO+YX81d5Wm1NQAFsTzpdyxZSEmUPbjZ3zehs/eZ65NILx
	5jAD0KAy0oJMk4QckuKLJ9LeWfKMDvMoxazf0/FgmIXR4/6Ou+IitAjU+zTIb5jGd/UWg+7+aXtrn
	itsy8xgBp6ZvenW+YP/xqnwWHzz4Srt1/viclt+enSUkyzA9fqMfLw0e+OtLcJm3sJ3bOJ7+XpRYs
	Gc7fbZJvLsZoRNU/IGF13B2GhI03iFcFaViOtG9BA53kmOQL8bt99+gWv3WvjM4aXBGwNsmqtjBIw
	xEo8hzHUROybJhmWIcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnt2-005RoH-3T; Fri, 23 Sep 2022 18:58:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns9-005Qxt-0H
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46C7A61018;
	Fri, 23 Sep 2022 18:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C995FC433D7;
	Fri, 23 Sep 2022 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959479;
	bh=KH9q3ieBcl2ym6CAxSSw7n2kqoxX3+TtQQ/wxSnvd+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HHTnctrqtQgtD5L92a/CqUcAwZEbyckUKgxDm5cVUMChOxYXpVLhvmsKjENn0wN+5
	 g9PeZL6TyVHfHbe9GQEN1oTHJaNsGeQ8611tUGXFqIChHUHXA38H5LNbH8G6zCNkFd
	 6+GAe4t7Bgr9udxZiY9ji7S7Dttfwk2HDJq7yqPDY5qtAG1URtDNVf/NCKqrUgGbEk
	 APv09o53sY8u1MqLC9x7+i5rDoDRiwZJUmkIBehufs/VMkuVvSSMDAUkLybGlbOnxm
	 A+lqKU3BbbBPuRRgv1YQppyEOvc7yHDJswRYN6RGRlJlzVAP6JaUd1is2TS6gpeJmG
	 9CeOSW/y6lPYA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 23/27] pinctrl: k210: convert SOC_CANAAN to ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:02 +0100
Message-Id: <20220923185605.1900083-24-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115801_143038_6049759E 
X-CRM114-Status: GOOD (  11.32  )
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
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8862a71de8af..82dfc8c208e1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -217,13 +217,13 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on ARCH_CANAAN && OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select OF_GPIO
 	select REGMAP_MMIO
-	default SOC_CANAAN
+	default ARCH_CANAAN
 	help
 	  Add support for the Canaan Kendryte K210 RISC-V SOC Field
 	  Programmable IO Array (FPIOA) controller.
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

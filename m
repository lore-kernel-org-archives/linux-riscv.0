Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573E5C56202
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 16:03:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16592463D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 16:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xf5RVCVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16592463D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7W8uW2ce8OPH5AgGiHJusVqr7LnPjjNA95VdHtWPMA=; b=Xf5RVCVQYtsP8OE4f7cQItC+tG
	hgLtNz1A+fqQ4OSeTJv+dRglbQdPzC7999oPZghHxUN0eVOn9ZOXHyT7uBUyilRReZMCibNlxcWGW
	Wdh5S2phrTlWz34MHDqCzmnfEZDUL9HlvVCras/6TUDmpPmf5weMnsTBhDBWu7aYpikVe3Nyvejor
	1u/gmSvINmDyQSpMOkBr+TcRwYJne806Ca0Ao6cybnASCn2T9Ilbl36ggDksRAO+fTd3wewDa1wVJ
	JVBPvR92MECYebKoSf3yOY6HrvNLt85l0tCMI2WbGRWsZse+MrnG+EjxOqXWDMXA7Vu1eR1nN6rkx
	P1jCdo8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf3Rq-0007BB-PK; Tue, 17 Nov 2020 16:03:14 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf3Ro-0007Ai-3j
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 16:03:13 +0000
Received: from orion.localdomain ([95.118.38.12]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MOiLp-1kueNm03x9-00QFEO; Tue, 17 Nov 2020 17:03:09 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] (v2) drivers: clk: make gpio-gated clock support optional
Date: Tue, 17 Nov 2020 17:03:06 +0100
Message-Id: <20201117160306.21760-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:DHjCkcHF4JV+D/H9vn6hiuerLHesxxqjWv+whhAPfXYe3PLpd2f
 vXBSTvFcEOJoptHYXN42T0LP8oGsscHMyzkbICW0N1y6d5gI2P3j7mHyNXEoUktsQAfWJFT
 vlgr3I9uFKbNCpsj+nvAom90IuQSdLIL5y2NuGAro/Y49GwCRY126YfpBnmMSZDcMn8UA9Y
 5eum4UEVwEBWfGqSvPcPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nuDhTfKWFYQ=:TLnx//cNjXuEVcQGeldan1
 YRkSUqyJoC67kUo7o0/z3cOzQTttBcG712R6qRps4U4tNVNKsqQSJlce+baUrDJYDATI7NzsH
 h9lhTFJ9252aXls1GYDxSx1VNRow5IIbAFMAfllvno6w/U2eDRoG+Gd2W6uBRfTtO9e4kxvud
 GAlMc9zTIwfL1RVKgWtBXIeL+evKjbBWsnngwS9flzrVQajfwybvW/EfAXmMp/4UT1v797EE2
 dZB710fmq5fFSiGkYFFKHgq6fytbUZHFJoVr70Nvd2TAFlFqXqAOD+QyR7NGfQHYm2LDUa4wG
 t/JyWAPRSnoIEzWrhrL4S2uvDiBVPRH3LwAQc04x/OxA7niHiRi6uaSgGcMor8Rs/ziUl1E67
 CDJQ4Dc8a0rFqBaeuxr/M0dcYn/lCy4meVvUraz/51eiRiLEpGoSIlKR4u66m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_110312_379820_87C18967 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The gpio-gate-clock / gpio-mux-clock driver isn't used much,
just by a few ARM SoCs, so there's no need to always include
it unconditionally.

Thus make it optional, but keep it enabled by default.

fixes v2: added missing dependency on gpiolib

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/clk/Kconfig  | 8 ++++++++
 drivers/clk/Makefile | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..99e0188a15be 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -38,6 +38,14 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_GPIO
+	tristate "GPIO gated clock support"
+	default y
+	select gpiolib
+	help
+	  Supports gpio gated clocks, which can be enabled/disabled via
+	  gpio output.
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index da8fcf147eb1..0692ab5abc6d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-multiplier.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-composite.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fractional-divider.o
-obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
+obj-$(CONFIG_COMMON_CLK_GPIO)	+= clk-gpio.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
 endif
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

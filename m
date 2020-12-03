Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D406DC3526D
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C06222B2
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C06222B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15qJfY/MT0a8NgasIDxlpoXELb48AFt2FrJI8NORYZ0=; b=ZXrNrRZQRKW4EUKh0USaQfaJwx
	6boSOd9H332082tQmN8XdWJJ7TzdN5CD8ShOtc4TP+9j2K8j3k+RVlctR1c4PnYbWwn0m3rgVcEj9
	Fy+ZzWUDSj5WD0WTlyMrkKPJu4UbH/23OqBI8qbUVbbIGuFz7dXNT/vPxweYPf+NGt1wQ16jGNhiO
	xaebjTsX5da65D/u9Z7iDrDdlkzekT4wl2AodNQRuqer4HR9p299XVyC54eZrlRnN8o9E6bEcbTWi
	0EqWXGgFtkoU3kaAGlRM0Hpz0GVLqUcAlZE8V8NxZUcncGFfsuqskR0owBpeqZFKSybt0kh5OmU1z
	ORWGQqzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpiL-00019M-Ul; Thu, 03 Dec 2020 14:36:09 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpiE-00016i-1C
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 14:36:08 +0000
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N5FQJ-1k3xq12KJB-011BDE; Thu, 03 Dec 2020 15:35:52 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers: clk: make gpio-gated clock support optional
Date: Thu,  3 Dec 2020 15:35:51 +0100
Message-Id: <20201203143551.5482-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:lrjZSZO++TFuXVbnJJDgAvcXp/I+VeQY/3cXAxev1HCLVLq3xz+
 DrogOwTBhvcrHsn6mk7zXZCQQuPAXUMTr5uLVZw68FevVEvZLPLDT+Oe0bRGTEHAqx4nBGb
 mgeWVrvTnk7pY1BbJgKumhZ379SlMpXh0R4ahSixqhE2JqrTp/wyRYpnO8kgZvbiigw6wnX
 8cD1OSpGr5DwDlFKqUbkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yGqkFXJK1c4=:cV4c49wuMDcGfa/pPJ5sAO
 trdoyPkWEa7icfF/iMbO0PhgjeM5Ynif5LhwRHZUPFNA7WAPzbsTzGbJq4u0c5lQHkBAaPpyO
 st+uDGRtbTWh49T/R9yLYnDbRceVd9BM8X3duiEzKw2wqjz/dvA1X1yr7mkcclb5o6SFwbYE4
 aO4uQib9fjh0ML3Ohc6nLhtIuQ8EezYeOqRp/OE0tahjoXuytU+8yZ9WjZn2weFhBr1uwdZnf
 NGwLijMJ9PMCAYo0Gm6Q2ikEQjO5DzzkZfRotUstPOJSM2rzmRmJoX480pLcXeSAQyJ5xX6mO
 Hu1dYgZIJ2a5iztaREXCMeQx7l4s1wPiZlfihuS+yl0updnIExMBpBnL9R2wLFZ76EG9wdLQV
 VwU20oZb6If1RZ4l9jcGSupSssP1iHQkLqNuD50Nu08FPL5gc/8rVgfxQ2QHW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_093602_309646_7C7616B1 
X-CRM114-Status: GOOD (  12.11  )
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

changes v2: fixed meanwhile removed '---help---'

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/clk/Kconfig  | 7 +++++++
 drivers/clk/Makefile | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..ec5b3a75bcf4 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -38,6 +38,13 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_GPIO
+	tristate "GPIO gated clock support"
+	default y
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

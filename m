Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD4DC2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:49:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 272B0238E6
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 15:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="myjBGLbQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 272B0238E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ifvlFy5FnrmlJbFZsIjDMZC6n6I55oqLLclxOQq5ZcI=; b=myjBGLbQZBlhTm98yDsLPXThFH
	7rBWGyd4ayFkVjKmQ+l/JKkgKcf7nZymnrleLoy0JliHueaa+dpkLYTFFYDbBXqJRMp4ZbONokZFD
	mTfc96usZc1Ad1J2Y+Xhy4EqI0/ZoupdHQgLILonCykCD+m3FLqMLijygdeIFGwdudz7zJxySPU1F
	RSIctqmNwEjLWbTiXwJgFnfsQdTsm5npn2z8cmODodUubSblzsw1uz1QvtEvMtgYSXdiqVDrqcwJo
	QzJcrBk4BwpA0crUrOzSv8rl+m+WZs41l9hJJJwHjmcN3E+vMQI+Ev9Z5QO1tNqJfDgJSpYYpYrzP
	Jbbxx+RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf3EU-0004wQ-CJ; Tue, 17 Nov 2020 15:49:26 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf3ES-0004v1-33
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 15:49:25 +0000
Received: from orion.localdomain ([95.118.38.12]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDeAZ-1kWV2Z1QJj-00AjEx; Tue, 17 Nov 2020 16:49:16 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: clk: make gpio-gated clock support optional
Date: Tue, 17 Nov 2020 16:49:15 +0100
Message-Id: <20201117154915.19951-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:PbXwhxgZEHmBSuv2/cxNCEqWXKG8HNRUpU5VDyHQtaeNY2Q3q53
 emv4MJ03ToWKfXlnHO0lBgf6YnxAqhGMwat2O2xWssDus2zJwPXISE3s/90UsQJTo/hX82M
 7I82cTnzgeupAnPOCvoXgXjuWiZu5r1X3FN5f34r7KEmL3LqANbe18yOIFsTb2AGUOCm//r
 c0oemH+sYEj7AD7oAab5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0R1qHjUzETc=:SjUN+Br12J7imWezXdxNi7
 5d1wBxcHv134q1wVsopfeUPHxvbWDv7torQVGiB9OiZBd5+RPP3t7UpXxkA6GeeFP65wPjpiA
 jvAwRo6LS/HHCYdmCN2K+cBAqYt1oXXCerAqrIUMfby9kDVUr1FnJYWCP67m+lrvre9osu2QC
 PAsimuwCNtFXfjzCteljXYI8JsuElSxdSCyNztzLEw2yjW52N8e1xeesd1pcgdWPk9M8MFevQ
 3ijmUaiYROZsA5ZomixqGQsUN67EFYZYllZ8wz+ITGQxAKGKufUKhVFFatG0h8Q7Yesj7m5Gq
 6YGw6RVx7dO7fSiyBz+K9VVJEEYlAetdzi4upwW2T1GHStJQi9lCqGvFWIhj7aIXx/R2+CUlx
 Xw2YuTTjcaon8TelJTYWNcwLXqpJWjgt3MPlBMLEk067chgNIF3qz8AoYETZN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_104924_406936_C8386624 
X-CRM114-Status: GOOD (  11.00  )
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

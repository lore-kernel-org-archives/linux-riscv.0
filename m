Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADE2C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 12:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77159221FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 12:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77159221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ED82bhqzUDD654wnAYJCpIjbJEYjE0CKqCQqCItIQFg=; b=RphgGxQvzsESMKd4Svm5eABsEg
	nD4JVSTwwGWWrsGgvBYVJRgNdA8t8uAqvjbHnqnpgZqoFI9bKXixb5k+K4JTPEQTFR2HOB7qNH+du
	w/UHuKmy3YGOsgUo8X8mGvRO6sOsAdYL5uzM1+XOWNpxuHuXpHlt34dxUogKLqne/NoOkmqgOp08R
	wFEAOSuysJTtSYLPNzSKMKGty/CD47C+YLU44W0Uca0U8fKc0C19ApaQM4tg86CmS+gcgHK1hUb6/
	/tG5iKmlHGA0zYgEu5vkxqGOCdEDXKTNhupb4KC2Im/DJh9klzGMCNInrvr1H+oFOAA7v/DjEmFNc
	ZdnaO8XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkRLY-0008Bl-QC; Wed, 02 Dec 2020 12:35:00 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkRLV-0008Av-Ao
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 12:34:58 +0000
Received: from orion.localdomain ([77.7.48.174]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5VTm-1k8T4d24fC-016ugz; Wed, 02 Dec 2020 13:34:49 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers: clk: make gpio-gated clock support optional
Date: Wed,  2 Dec 2020 13:34:46 +0100
Message-Id: <20201202123446.21902-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:WbLU9N2ykb1bYLaEdCmR6BikyMatnPo3jN3uCRNNZTmRVZT6YSO
 ArUF2XqM8GfeFIm/UHqsHgJ42Bk+dCKEwI2RSbd7XXs5rvHAPYuPq3w8X+ZnEM2VOXMLfTR
 2Lwgt6M4fVeJhI+5vr4B6J7cb3iLuJJjbJ1OaGgCpJpJbDB14qUU/zXCK5XMRD36Nyx5MIA
 jBnFgo78BpzGQj2lBo/7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zY3qHVWMGdc=:p6t0Vho9tx8xhvpEim4SZ4
 cyh0lNXAnLhP4zrruMA3DnvEBg0XuMS59pa50R/WUIogP/BKm+uCCcSHa4l4iyRVAsQaIFr0q
 1nYmk8HO8EiCkmjfb7gXRmFWKHU0Gc515k+kmphY99YlrgSg7gMVAjOdNwXKbK6YFTqZuna9Z
 7x5f3FOdZK9OudpF3+6G+d3yCG2J0Umoh4ktWNTfeRycqHyb/ob5Dk89voDtfar+NhSBY+UFF
 1bSZAbZi6Eg0hjLuIf8clqmup+noDjFd+zc2h/YAGEnXmDzxduoHthNTctgMF0blgz/GSuDeT
 kmwGATo9voiizH4sV4Wn4A51GbRVxgHDQmeQTl7w4O5NZzL/poZOvSgihMikeq3xCpv2YREPg
 KR6zze1YkhB7KbiTfmJ8j1aUUb0GKthYUV67HziDmaa2JAyH7+Wz84JoeEJbY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_073457_606775_8D16BCA6 
X-CRM114-Status: GOOD (  11.80  )
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

changes v3: default to y when gpiolib enabled
            fix depends on gpiolib to uppercase

changes v2: added missing dependency on gpiolib

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/clk/Kconfig  | 8 ++++++++
 drivers/clk/Makefile | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..e4fe406c4e7d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -38,6 +38,14 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_GPIO
+	tristate "GPIO gated clock support"
+	default y if GPIOLIB
+	depends on GPIOLIB
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

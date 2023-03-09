Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91539C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7LZNRp/ZJ1bVNW8ubfavRkNaIgmvokyntRwEOgrvRQ=; b=b53/rbVD7sLkPC
	5Mco4y3l16GaKthKCvxX9o7SwYMCLXt4mdniOexxSiX1Q/jgifUzqk1IA+LLEd4zJznWosNB1g/yn
	bE2hj8ezDrHkkR1Rb2hsWp2mMD/Nz9AinEmBGMNhi0EqFQSz0dnVGXp4t+Fa7Vi2km0SlnmshUIme
	dqN/ioxBfEuAiMIOWaew2Ft4BSarpDXTd+PrOPubPxAmLC//akaitpN/Wq9/tJ3cU9gGT9mGdpCht
	rwhE43CGop5MJpxO8jwmAPLceH5HVPk8W/c/PpPD6jS6pocjKbtc1HyLLK2mDIDkbSu/G5U3bukkt
	D8KOAkKOfeqEFknE0oww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8T-00BntG-9D; Thu, 09 Mar 2023 20:45:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8Q-00Bnsf-LN
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 453C561CE6;
	Thu,  9 Mar 2023 20:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CABC4339B;
	Thu,  9 Mar 2023 20:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394709;
	bh=HsFTEd+4CiDfECqFQk8kXUcjRJImRoE7fMRjjaDmibM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fl44tUFNVaRpFEDDYTLSBygqDRH01I09ZWmPXKS164eBuZ89FlprKvhK1aF4hHiAQ
	 dZExTiSYIHWLwxmqy4lyDf8KP2hxKugYsIquGyPZ43Twu3E8m+HSLA1gqlmpMM9k1r
	 wgDeHmqc2vIHBcbvzSwzL5EMwzslvTbgPyocFflDWkiXBMo10L8NwXXHUGuhDS0Zmt
	 sUWMKCCIWY9LQr7mnRB1nCQ5+VR6y5eGUzpsJ8gAjK22Cju27w+N/zftYn61HgWLJj
	 y4D2TxEfptH0I7m4zzFY9/az0qQSErYKlKqgNF6Z+7wHyEB6NyoED8yeAoUeaZ7qYI
	 xa4QZSPfwNTUQ==
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
Subject: [PATCH v1 2/5] i2c: microchip-core: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:49 +0000
Message-Id: <20230309204452.969574-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=conor.dooley@microchip.com; h=from:subject; bh=hwharPwRsHrvTL39HSSbppqDJfB2r7S5Li90f2LrzlI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs46c8pFn0y2Ocp+7O5L00P3b1SFsRa19GlYv6w38 OQ8YKXTUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl86mdkOD93xeT0XO+Tx09k JhlOWLXRMyiMff5OvYylck7rTt//c4rhn3nVG12e59rqez/o/Dd436f1mOP8y9WnC9PrRG7O+h3 8gg8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124510_760856_7A9EE3A8 
X-CRM114-Status: GOOD (  13.22  )
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
i2c drivers to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 25eb4e8fd22f..9fa4a7bb5c8b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -804,7 +804,7 @@ config I2C_MESON
 
 config I2C_MICROCHIP_CORE
 	tristate "Microchip FPGA I2C controller"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on OF
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

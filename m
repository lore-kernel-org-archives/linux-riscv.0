Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF684C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TM3n9f5Ur6fgMPMKevgT3ZyztkLbxUwHQCdzGFbKbxk=; b=Z/27y5x2P9IacU
	9r1ymLPypE1EDT/0gDf+HOUTfL6DnhUygqUZJk5jWDC7XJTo6n2cFnQNXXtQJnP0WmG6idd5nINDZ
	0kOVxh/faBrUNV5zkkCaWZFcPlRhniYnGZuMoD+ivpHQhhTFTgGCi7J05Fz/qXktl8DlnJXzHd1k3
	+1RdE2ZBmd37Mgm7ufYpJmpvdqqkMdPEP7QL4zL3aS+NJqmtZ6022ZKuQ9/XaUI8EZbajyqwLcVMD
	EExnNfyvZEocK4thEHwnWj69dMjnrgR08GGiEd1iBZmrLL10y8phYkIv17Orh0CNDVPyI0UsXzWQN
	5DUv51sdp7fQOep2IPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8P-00BnsR-4N; Thu, 09 Mar 2023 20:45:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8M-00Bnrg-SG
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD1B61CE5;
	Thu,  9 Mar 2023 20:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD14C4339E;
	Thu,  9 Mar 2023 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394705;
	bh=4IfoY/bbroiP53DxnZ4NNZvrfCSorep2t6Qs0c/sebU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c4Yhr/ZNbaRVfUI7lGwd7L24ItwpYq9Fr8sgkGLb0YwqrqAhFmA2isyafBmoDNUV+
	 4oGJQrQdID49/2AgDEli4k2WWpwIyj0WFNwQCB41GwIS4VwvpTaxMRtkgDjuH9jr7o
	 R5/GhH6HusIDuunoIHR3CZsHjWaCM7EdGfVUmu18+PJlRwoBSqlviL8sfcQfgqqjNF
	 dSJH6EM0O/4aDAyQuN8Wok2s8il9L9kuraP5efamv0i3qVdXjJ3BEMbF/lI/BPVeeB
	 KZt65J+CLtJuXm7+xF6OHkhlb+FyisskbvKrFrH/ocpOZaGNRsdt1TmbDKjIHpdmAZ
	 JnL4rBlwk744g==
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
Subject: [PATCH v1 1/5] clk: microchip: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:48 +0000
Message-Id: <20230309204452.969574-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=conor.dooley@microchip.com; h=from:subject; bh=GLo98GdmfUkBToAEl5LLBzwXzoe49NY0BWaVOVDKKCk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcrs5aoZWqWxYXpSrenh1SsebEvB9XW9WvSzS+794QI 9ZXfSCio5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMRDGdkaL3rN1n5bb9loa+z ZdBVl1Oy8futXfjnHckMrbDa8PB0NcP/MnVz+/P3Fq9M3LZj6trNWRN2b1FS9Jznsd2d/+vxy88 j+AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124506_971066_44DA48B4 
X-CRM114-Status: GOOD (  13.60  )
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
clock drivers to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index e33e51978938..0724ce65898f 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default SOC_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
+	default ARCH_MICROCHIP_POLARFIRE
 	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

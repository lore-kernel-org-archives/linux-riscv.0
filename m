Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F1BC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9u/AQ/vFTL4Agt0sG/d0K4gGKBJIA5bK15Kwb2Gv4P0=; b=HmrW1BNTLH5baG
	M7ny4ZM/Y4f9JuS5Yzydru/OFljNTQzFrGfEI3Cwxg04RIw6lIivjclm6TjKXJa7CAXlCd8YqRUMD
	0VM1yj/72O55PZtVTwb5knqHMw8i57za5X/quVqwRIlmCfjljKNpkDbTrjQMQP5Xpuaqnt26H4cy0
	SY5Cny9b8Fng25gTilX3hBg1A/UHZXBDG+A6uKGzD0RRF9gfprXWJxZ4fUHRPrBGgbeO1sf+Z9VKD
	IBdVUaXsIGY+nGIIVPJn7THy1vngVwTJvGMdrWB1J/UmC5hc3yfDjuN5m7LVuDZ7nEQFZP2+fAnEC
	tkfEX2ePkTDv/G+IIEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrY-005QNN-Cf; Fri, 23 Sep 2022 18:57:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrV-005QLQ-FA
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A771B8239A;
	Fri, 23 Sep 2022 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B501C433D6;
	Fri, 23 Sep 2022 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959438;
	bh=8WU5uOKDxOgmQ4hicls3QM6XfBQ3YJLkpJ1TkC7ckfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJGk2yuAqFv6rii43j7tArbDFSz4kE8LbCsT0Z19gqRd3MRdiTtBA9nSuvchb5Ccx
	 7KnD7KX2D0QuWDcRxDkUEcR0OWqpBdU308hqLmacvqGpxpL+xUUwe7BUVOobiOWCes
	 ZOq1ydQVCco8i33aYZaTl3y1skMDvxXywtFRhPIsHgLGTTT7bMix4gVTcmiwD7uDA1
	 4WWFWkdTNeFbFQDonobomHNGsmsANqWX5ZOvxQVufpXC/OlSQgVLzR1uBMrbqRM+wt
	 bEk+GVcvINpY13RrkA1EDGO1Pfh988D4B6stZwTnoId50SGGQEii4FohjFT5rnLfqO
	 NsKlQYmkJYV6g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 04/27] usb: musb: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
Date: Fri, 23 Sep 2022 19:55:43 +0100
Message-Id: <20220923185605.1900083-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115721_676649_B0543A45 
X-CRM114-Status: GOOD (  11.49  )
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

At LPC, we decided that for the sake of consistency the SOC_FOO symbols
in arch/riscv should be replaced with ARCH_FOO so that we could have a
consistent policy regardless of whether a vendor had ARM legacy or was
a RISC-V "incumbent".

The PolarFire SoC musb driver depends on the SOC symbol, so convert it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 6c8f7763e75e..8304709e490c 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -125,7 +125,7 @@ config USB_MUSB_MEDIATEK
 
 config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on NOP_USB_XCEIV
 	select USB_MUSB_DUAL_ROLE
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

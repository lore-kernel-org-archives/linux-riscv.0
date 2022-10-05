Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2287BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY9zDNepLvaiqT6wH43ATwI3lE/28xS6m1RJaI3vyAI=; b=qcPSsym9DQ+bTx
	aos/q9NqEDfSXpv67MTUnR85jhlcbwmEexyqHErEIpZ/lOGfTdtA0hcNGzwVRtVvadDWWxvOMiT6R
	IPv9wk+7CEz4DrSz8VQf1u4VpAo4w38mECqYJVtx3jCRMYwutLHJ/P8EcE5ZRDBfGupr/D6A4A7ps
	hbRC0MlQKMeYwGTBdXLGi2fQ3OMci1sFs7xUhHvyk77Jefsoz1/NoiN5jvWVG9ixHDYxtgvh2qSbD
	t5U2zHZY5GpvDX+LHaHbv+NdhaglQNJ7vjXQpuVWFzoC/nnrxioUBxiSN+AJCOWvYduLGWqpSpgvW
	QvVbMyMq+vmXNU9YF40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yf-00FNfn-CV; Wed, 05 Oct 2022 17:14:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yc-00FNdB-6u
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 929D56156F;
	Wed,  5 Oct 2022 17:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E61C43470;
	Wed,  5 Oct 2022 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990073;
	bh=8Xp7kAM5LFTUlTIW2fFuG237a9Rp9DQyu+qIH5FHc8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AvKcXrht676yYvQGDJdFCIUTXKRsGrYCoZPMTheAR/Bp+QIOs2kxqDHMCXVe+qQ0X
	 zjh1I627d0plUQfjSNnXCn9ZVw6rKjgLpDV/aQGFJ4agaMlhfFi8KBEUUP2xRRZpLp
	 8xi0SCil0nsoVHlqm2Z5BkI8/WQr0pej4QQKD0mN9nlH2ilsIkUrkJWagS69e6Ob8A
	 yJgBl2kgh/hXjE29IM5hYrobHOOXH7FPowVtL5upSr3XSVxu+eBzWppbvceKBmOQm1
	 7aZns+2xJljwJb4Bw0yE3dOb2kKSkUdAc6MHc2HF8Gr+Od2itxfP71Bu85vX79ViCs
	 3UPQ1eLM+TFoA==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 4/6] riscv: stop selecting the PolarFire SoC clock driver
Date: Wed,  5 Oct 2022 18:13:47 +0100
Message-Id: <20221005171348.167476-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101434_318553_9DFC93DB 
X-CRM114-Status: GOOD (  11.35  )
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

The driver is now enabled by default if SOC_MICROCHIP so there is no
longer a need to select it in Kconfig.socs

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..83f14afd4086 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -2,7 +2,6 @@ menu "SoC selection"
 
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
-	select MCHP_CLK_MPFS
 	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

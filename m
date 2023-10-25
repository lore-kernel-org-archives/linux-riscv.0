Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0C9C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+SCMyKPEIv5zKGkbGi329cqi6s2FKRuWBrrBy4iGAU=; b=YQsBt6IYUUgzOz
	+FVVAYjZOOvYVnqIs2R9Z8i/INY4ygoC8JOUFlrg5saAQlgfWW7Y5/OIoSs2IGSH9YwrwkC9HXfCx
	7IvEdfaM3cNnws3kQgg3h1Qh2hxsaw/p4leVHdCBwHjkAYF1rdI7KyHrMZUar6gIoxxVq/+2i9vvV
	Q54zN5b66xkC6ScTIlScDoLBWUP4nGTZUNLFHaRPggJ8Ow1PsR4wv/ibgJfoH3CEUzo6M41jtxAgw
	/rjKgeSF0HdC9+hqh2J1cVugxJvfqziXa4I0yEGnIVHvF7sA3RHH06gnHaPCZoG3K9oEbqPtukLu6
	Z5IVBmUHffntxqdsBfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb1i-00BzGO-0Z;
	Wed, 25 Oct 2023 10:22:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb1d-00Bz6N-2E
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698229329; x=1729765329;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OEqpmk4Rf7hTy4IOBR0uXJkKGevdbN2bduorTuh8R4g=;
  b=Aq+EbOCdu2L9H/BOsrwTH7rx+jSnbJ3rqLW0IKkOjVS2BwdtzWgYOc6r
   z5lhKRgpitS7k6WFDhzfUTHaZRoan9/ft4YCk3/Cq9UL4aUsJ6nF0dZ/k
   YTG/QdegYpmQFwsV2vdFqagzvRCvz4Z5g8YVSjynd5YYrdsYAxT4FSipa
   XIjd9io5vYoDm1aGexE2aSLEYut+il/89RMWa4ssqbY7W8rGKmdVRpC0t
   wY+5rHtycNQqUDiytseuHYP6InlTQRLCEhYuKPpDkxAUuh91TumpMFapr
   6a2je9sHW7mBRJGqXsmlZvG7drXHCWbXBD2LGXXj93IsNXt9oFotpzkSx
   g==;
X-CSE-ConnectionGUID: n2gHDv4RQiGeWJLvoo2UlQ==
X-CSE-MsgGUID: fNoVADcPSE2Br6PiaoZNMg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="10829880"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2023 03:21:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 25 Oct 2023 03:21:39 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 25 Oct 2023 03:21:34 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v3 0/4] dma: sf-pdma: various sf-pdma updates for the mpfs platform
Date: Wed, 25 Oct 2023 15:52:47 +0530
Message-ID: <20231025102251.3369472-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_032209_817727_D0A9139F 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Changes from V2 -> V3:

Removed whitespace
Change naming convention of the macros (modified code as per new macros)
updated with new API device_get_match_data()
modified dt-bindings as per the commmets from v2
modified compatible name string for mpfs platform

Changes from V1 -> V2:

Removed internal review tags
Commit massages modified.
Added devicetree patch with new compatible name for mpfs platform
Added of_dma_controller_free() clenup call in sf_pdma_remove() function


V1:

This series does the following
1. Adds a PolarFire SoC specific compatible and code to support for
out-of-order dma transfers 

2. Adds generic device tree bindings support by using 
of_dma_controller_register()


Shravan Chippa (4):
  dmaengine: sf-pdma: Support of_dma_controller_register()
  dt-bindings: dma: sf-pdma: add new compatible name
  dmaengine: sf-pdma: add mpfs-pdma compatible name
  riscv: dts: microchip: add specific compatible for mpfs' pdma

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  2 +-
 drivers/dma/sf-pdma/sf-pdma.c                 | 71 ++++++++++++++++++-
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-
 4 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

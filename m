Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCJpW4Xg1fbhk7AG9dPM+I6iiV2WcTJEf3UZgCQr6EQ=; b=x2IAVUZntJAFo8
	1FclR7j0FE0/MFL4UiZaM3IU1MRjR8jfKxMKfwaV/t7RfH33Yiw5ocVj09OD7sQsgh+jkPPjVcpi4
	uaUQY/3B8A2wbBb4Dvxpfq8JRphjTGNWotLVXqy9wIVpLaH583MdJjTXc9fxQDPbL7UlCf2zVrqMb
	qhMKifCoav3wCCNksjrZn4L5+b4GFzV5L0XhrsQyMGfVCDUxbZBlggZmj0IkTuY21WQtblzQj/jlv
	MH4w76b5snVceVdVElCtXxAw+jEh4JL5fE7D7hIBJvH807a/FGTvsE3lzIP+s+l6yji3gAqvEr1K4
	1Id8g27W1W5H9nikndRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFA-00FH4d-1n;
	Fri, 08 Dec 2023 10:38:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYF7-00FH2V-0s
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702031881; x=1733567881;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7TMZPFXosBz7PqjBl5YlGhmPAW3iNWnMHeI86fag7dg=;
  b=RFp51HYz4inBoJ0nrXbZXoP0KrUvbMW/NqIkNZhVpvZy43p1VMX3Szbz
   XbTgtY6W64rpxhQse/+adZAj/7LgpQDh99cXJDTNzZ8b5PB9PBW2EBL37
   4oVEwt9g/djJUSR9UTKubU9rtyCYLWNoeI0YREErMrdmt8fK2pf5o3X1o
   FDirN8uit6KHZ3EJrFiP/RbxMW0qcmOhDfYuibkFHoneI8ndM9h80/Ak1
   qg+q724fedRcG5dsk+3hXM2TLRb8rWwan1HXV3NUwlHEKyqQrRj6gcYyo
   1BsfEK5lZB63eotyklA8SY8msLB1tgc7AyT2cp0IRJJyg8lRbTsN4puu9
   A==;
X-CSE-ConnectionGUID: H3XQVRBZQ2qxsVmz7vJ8Sw==
X-CSE-MsgGUID: vh62aFwNTVOODghp70fLHA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="13315272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2023 03:37:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 03:37:44 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 03:37:39 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v5 0/4] dma: sf-pdma: various sf-pdma updates for the mpfs platform
Date: Fri, 8 Dec 2023 16:08:52 +0530
Message-ID: <20231208103856.3732998-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_023801_397089_2DE2CE0A 
X-CRM114-Status: UNSURE (   8.17  )
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

Changes from V4 -> V5:

Modified commit msg
Replaced the sf_pdma_of_xlate() function with 
of_dma_xlate_by_chan_id() 

Changes from V3 -> V4:

Removed unnecessary parentheses and extra space Added review tags

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
  riscv: dts: microchip: add specific compatible for mpfs pdma

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  |  1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  2 +-
 drivers/dma/sf-pdma/sf-pdma.c                 | 44 +++++++++++++++++--
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 +++-
 4 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

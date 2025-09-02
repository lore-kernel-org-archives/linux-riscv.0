Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18EFCA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFN8hwElZPCjdLXaFLZJO0c1td42py0PiQw7HpHNzVQ=; b=cfT2zhkbagn3GX
	bWPsZZ3OXIuIiEjgQpn6aSU1ewEgcjKBckiG9rOzO0xIlPSGeeMjf7d1+fJCqtAzlMPGwyX2KoTLM
	qjO1SaDivZfKTUUYLp30A/V1KSP5mx52Ut2568XjjOL37+DFhcrRmQwvYcN2rE95IJKiUEVuTEJwu
	LgdWZrwLv/aduZj+73jImg/sGm2WB33xgtFPpSOOudGaNvEwklem+rkZaR63Lsy2EAcrAyLbM8gli
	3FyvXP0SCpDMtx4SySrnDg+z301PnaYTM2x7AzhMv+VYsJ+G5k4TcztoaFEwIgTuEkNIUeiApeS2D
	PHMRL5Hcc6tgDWw88WFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLxP-0000000FtOK-17dK;
	Tue, 02 Sep 2025 08:01:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsP-0000000FrNS-2Uus
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756799785; x=1788335785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EC93Sb135F1xNZElTaZSyyXghE/horvxRlKCzCtaL/g=;
  b=eIqzuUdaJBxqGJGd5Dbv3fu5oCZ89l8vwMiPatjxp0+ORXxjDGPd35by
   Lz4Zt24/7vfMvxAvHJHwug4WZNZHAyLhsCL+ols4SRjM0xDbkKLa/0v52
   aTq54loO7gey8VwtTVI95aOTwulSlgFZQEkQRB1BIlyj7hkXa0rWceN+d
   VpB0lfzz/oL4/Sv/dX3FV5dOljFEn6S4UyL5wF+Fd4u1kre9OjFs1yTdq
   MY4BD7UvOxfZizHGLttnIyAegxDpDg9B+7X+Jv5yHdKHSX0Ho5kBLMV/A
   7PTrGVl6KhhrCep3FaTayrOcN1dtpImWjsqIK859OCX07kMmP7g1KsUKz
   w==;
X-CSE-ConnectionGUID: Oo81X4TNRaaQSutmf5DBgg==
X-CSE-MsgGUID: AbNInbwWREO2jvUj5x6Z8g==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46488625"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Sep 2025 00:56:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 2 Sep 2025 00:56:08 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 2 Sep 2025 00:56:06 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 0/5] Icicle Kit with prod device and Discovery Kit support
Date: Tue, 2 Sep 2025 08:55:43 +0100
Message-ID: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005625_865132_98096C89 
X-CRM114-Status: GOOD (  13.12  )
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

Hi all,

With the introduction of the Icicle Kit with the production device
(MPFS250T) to the market, it's necessary to distinguish it from the
engineering sample (-es) variant. This is because engineering samples
cannot write to flash from the MSS, as noted in the PolarFire SoC
FPGA ES errata.

This series adds a common board DTSI for the Icicle Kit, containing
hardware shared by both the engineering sample and production
versions, as well as a DTS for each Icicle Kit variant.

The last two patches add support for the PolarFire SoC Discovery Kit
board.

Changes since v1:
 - fix order of properties in mailbox nodes
 - drop redundant status property from ddrc_cache nodes
 - fix lowecase hex in reserved memory regions

Thanks,
Valentina

Valentina Fernandez (5):
  riscv: dts: microchip: add common board dtsi for icicle kit variants
  dt-bindings: riscv: microchip: document icicle kit with production
    device
  riscv: dts: microchip: add icicle kit with production device
  dt-bindings: riscv: microchip: document Discovery Kit
  riscv: dts: microchip: add a device tree for Discovery Kit

 .../devicetree/bindings/riscv/microchip.yaml  |  13 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++
 .../boot/dts/microchip/mpfs-disco-kit.dts     | 190 +++++++++++++
 .../dts/microchip/mpfs-icicle-kit-common.dtsi | 249 ++++++++++++++++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  23 +-
 .../dts/microchip/mpfs-icicle-kit-prod.dts    |  23 ++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 244 +----------------
 8 files changed, 558 insertions(+), 244 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

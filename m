Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F7ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZNhjohN+v7u7pxL1y0PFoHiKbEf6YCnMqfCLMTeHfE=; b=lPhLWKFVFi5jVd
	JM5JTe/psCKcgsUzatUBryoONQyyxm+mLq+HeZVSG8EK7ev/ALk1oCMy31P6RzenG1+ZiYeqRYGN9
	oDjONqdRjz+C14Xv9o8J6FiIyouQiOtUOD2XPQB+mUosZSR+j6kgt0uZOYq6W6fSO3AGz+yJERd1y
	IIh4HsgM2oAZAO2YLC2E7uUupx3+IwZze1Uu+eMh06pSDEP581wpjoBKOzDb0UK75fs0UxDiUJmIO
	UNxflkCuLtGs8eCR/e15zUfQINXWxmLOY+98ppPMTAQbF6h+kF6KN6kj43J9YPg4h9UarS34mE6Vj
	O1y2gs781Aq5fDSp04pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0N2-00GpqG-8T; Tue, 30 Aug 2022 12:29:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0Mz-00GppL-Od
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661862570; x=1693398570;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lMLf1aqqIFgOxzgozsPwTfQbYVnam9wTvijjocKUJKs=;
  b=ErAjxwLONPLEX67eHRuCyOAYjqOH2P0s6w7i5f88nYwR30xLSiwdjgV8
   ldIvHhytxZQ+esgfwxHx235Z2f9SldWU3yungzIZK/+6+JuFNd0VZyySk
   /m2U4jls1+bMAvwkoF2I9MrCTNI5NrxGD2EU3yg7eF3sh+9RAFhO8Mixu
   CTyZCpzIQo23jL4i25MFRr3ArGK2gFlHfGgaMQB0c/tbe3/KFR8h7iB+p
   PoqXFHQvDR1MGy9zDSWpk0+gLyiqd/fGAbO2adE9IS12l3M1LulAf2Vl1
   kd02bfJB+/VBSq4/LY7KforTozhPLyurh3q5MA3GOSIzlNS4HAcCawqbf
   g==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="178290369"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:29:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:29:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:29:22 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Hugh Breslin <hugh.breslin@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 0/5] Add PolarFire SoC Fabric Clock Conditioning Circuitry Support
Date: Tue, 30 Aug 2022 13:28:51 +0100
Message-ID: <20220830122855.2207752-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_052929_821749_B6C0DFC0 
X-CRM114-Status: GOOD (  14.55  )
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

Hey all,

PolarFire SoC has 4 clock source blocks, each with 2 PLLs and 2 DLLs,
in the corners of the FPGA fabric. Add bindings, a driver supporting
the PLLs and the requisite changes to the devicetrees for PolarFire
SoC based boards. These clocks were already in use, but which clock
specifically was chosen was decided by the synthesis tool. In our
end-of-September release of our FPGA reference design, constraints will
be added to force the synthesis tool to pick the "north west" CCC,
making it possible to read the configuration from the CCC's registers.

There are no maintainers changes in this series, but they are required
due to the binding rename. I am waiting for some changes queued in the
soc tree before rebasing on a later -rc before including that patch.

The dts patch conflicts with some other dts patches I have submitted,
so I will take the final patch myself once the rest of this is
applied.

Thanks,
Conor.

Changes since v3:
- return devm_of_clk_add_hw_provider() directly in probe
- add a `hw_data.num = num_clks` that got lost along the way somewhere
- mark all output clocks as CLK_DIVIDER_ONE_BASED

Changes since v2:
- Removed the unintentionaly leftover clock-output-names
- Dropped the riscv/microchip dt-binding update. I am moving it to
  another series so that another series for the dts, which is likely to
  be applied first would not depend on this series.

Changes since v1:
- Stopped using the dt node name to generate the clk name. Rather than
  use clock-output-names etc, I just opted to call each PLL after it's
  individual base address:
  cccrefclk
    ccc@38100000_pll0
      ccc@38100000_pll0_out3
      ccc@38100000_pll0_out2
      ccc@38100000_pll0_out1
      ccc@38100000_pll0_out0
- dt nodes are now all called "clock-controller"

Conor Dooley (5):
  dt-bindings: clk: rename mpfs-clkcfg binding
  dt-bindings: clk: document PolarFire SoC fabric clocks
  dt-bindings: clk: add PolarFire SoC fabric clock ids
  clk: microchip: add PolarFire SoC fabric clock support
  riscv: dts: microchip: add the mpfs' fabric clock control

 .../bindings/clock/microchip,mpfs-ccc.yaml    |  80 +++++
 ...p,mpfs.yaml => microchip,mpfs-clkcfg.yaml} |   2 +-
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  27 +-
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   4 +
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |   5 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  34 +-
 drivers/clk/microchip/Makefile                |   1 +
 drivers/clk/microchip/clk-mpfs-ccc.c          | 290 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  23 ++
 9 files changed, 453 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
 rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (96%)
 create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c


base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118BC6FA86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/fFr8DSqyVx0FanX2nJdI7wL304EotwoQRVQWhmK2n4=; b=soCrXgSr2ZOs8w
	H/1y4VSZ9nzu8D8L+ofF+dOfrgRtJYKba481eUIPZMAzI1QgU7NHbMe59CjPL5xgIblfvXLb6paiX
	i5URrbip2XHdDbZdFNhK1rAXyR3ScREaEc7uGZze/IA22664hsDdkIW00HqBuMZ/EREH9LZFQCgQH
	/E7PgQjtzk9WdZlkANrmxTKPT0evvytschG5uCCbUIAi5UnEJpUHHoraN8oslEYeguVxoASGN6zSO
	I1Ayy2YiVKnjTJ6k4oJRgs1Uw6XTNjcGp/8WwtVHlc6SVeTgO/vEnNwp+EAGPSKuwX8vhGWob5HLt
	oBL/qZEahytmuuia8/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIeu-004mDL-TU; Thu, 08 Sep 2022 14:37:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIen-004m90-HM
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662647850; x=1694183850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T3xJtNPHqr8WdakAV8lZkaxZQYCt2Hw3WcUDKGualCk=;
  b=oqNzdHRiF42nXTaMDjqC9K3YqR/NlzeoxfhonEeXDQFHyQq7as1mgC+5
   pL/4SDozvVQOC7JGAjrkZH0ZBhM1AWLA3aMFTanO+Xcn8d4WIb1ByRJcO
   k5pnaQcl+i2WlPFcGBdheF8zGznn1ocvg5yBuzZNbUlkT6CdIss6VF6tR
   cMBRPQOvFcZM10sftWLboVgBjY7OPV/enQrh4ncxJnqB8LUVC+2eQrn8w
   p12JZlDIZU4EKpwdt/mRlnNmKVfMGBq5EAutZHAKJIsa1SWD1liBQtnKZ
   e6w7zhAuwG/RyXFTMycQanu3nB6jaGJ3eoyzVUG3SgnTSfXWkggeYYMr6
   A==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="189986843"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 07:37:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 07:37:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 07:37:23 -0700
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
Subject: [PATCH v5 0/5] Add PolarFire SoC Fabric Clock Conditioning Circuitry Support
Date: Thu, 8 Sep 2022 15:36:47 +0100
Message-ID: <20220908143651.1252601-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_073729_597910_27A72B01 
X-CRM114-Status: GOOD (  15.12  )
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

Changes since v4:
- Fix some alignment issues, per Claudiu

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

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

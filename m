Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C93C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1SRB2qMNA5Xvd//tS2uaHQHmb0G6O+2GGHdSSm5M5U=; b=UFXoBfyjvO4MVa
	/DhEGGlcSdiaEzpCCKK6ZNyrxnfT6IYXeQt3r1StOmp0ag12/8sbxX3DYNLvDmMk8knvMIgQ83q9T
	Qcy70l0Q5L7mXCsM2jsHbAwoqm1PiKbvL2u5Hv1hEazYUiWJ4kffgrNlaMH/LPuRGar6xOnHrx2Wf
	7Qdb/wW0IW2QAIN8vM8FmSqwZ6hJw1NBBGZ5syrxOEI5cRNQuha9xDYcyV8rGByJ9sS5B/qBP9lyP
	bHxjM1dSJyiJ15qAYiFmxFQ+WfZHMJPU4nzKk4GvB1Fw3et+CZQzWpc9nVnudITLql7SgXJFF58sm
	swO46xKzkIA80062ORVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmmG-00BmOV-49; Wed, 24 Aug 2022 09:34:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQmmC-00BmNE-NZ
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 09:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661333661; x=1692869661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6/9bHIY/hzWRwp2EdYp1b9h1WrFSvYNmvafvDtchgVc=;
  b=o/e+2acQk/p8uVfownXUEMAJYyM10e3nE8CcQrrbrQRJYhRBRdFysYzn
   WEimU2FOgk2K5a9IREWsLMO27/5EG4CkyUCs5iwS0v/rv212/gz9TcnX9
   7ClKHxEEDNO21Rpq4S2HtqWJjr+Y3cn3g52bJ+egTtWyf6QT06L7wmsxj
   LmorzEkBwmshIZaAYlO8z8tQ8Xu08hi75jpxrOl3TZqGCxqSeDIgbF6ZM
   VAdbH4RzLIutvYUaTnf5POQkV/QA2EsC/4JgFJ7DL6RiMfYtvB1xPzK4m
   sBc7tOu/GnM5/qRXT1swgiEvzuaAOvToRaNpsp4EP1+C8un27kPFDNMHx
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="170697507"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 02:34:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 02:34:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 02:34:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Hugh Breslin <hugh.breslin@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/5] Add PolarFire SoC Fabric Clock Conditioning Circuitry Support
Date: Wed, 24 Aug 2022 10:33:38 +0100
Message-ID: <20220824093342.187844-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_023420_847008_0080F2E5 
X-CRM114-Status: GOOD (  15.07  )
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

I am mainly looking for feedback on the dt-bindings on this version,
so that if something dt-abi related needs to change it can be done in
advance.

There are no maintainers changes in this series, but they are required
due to the binding rename. I am waiting for some changes queued in the
soc tree before rebasing on a later -rc before including that patch.

Thanks,
Conor.

Changes since v2:
- Removed the unintentionaly leftover clock-output-names
- Dropped the riscv/microchip dt-binding update. I am moving it to
  another series for the dts, which is likely to be applied first
  so it does not depend on this series.

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
 drivers/clk/microchip/clk-mpfs-ccc.c          | 293 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  23 ++
 9 files changed, 456 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
 rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (96%)
 create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

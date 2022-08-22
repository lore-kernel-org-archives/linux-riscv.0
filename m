Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A914C32772
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vn1WRtd6pYBxF01QUR3mDPDyvef/ZIG8OgLjK7rjEoo=; b=xdEOQAWzn/MbC8
	xjetQUERnIF7yRdFTSkUNc4aXBVxGpRDQrirBZI4pNrNPAu4Dr/+g6RlVc5FqdMGKEOdFlLeeFcBS
	h7JfczEeeRwhPpJ5yF3G0D0OUSMZ3qd4X8lpyV3lA4p52PbUeHpcrAXYunLoAJxzEEh+WIxplKV1+
	I2uQsyfwnBpmp1N3Emw3CmLMIrXe4s36NMoSFK9eSIs87tCqg5FBkR2wuTgnqQROy4DqdasyweJi9
	wWmdmsNIoUIx5PwHe7HKL4yOdggDd2Nj289W+Dtt3zpWdiZHKfBNmGIflQoABffIZE3eDJs1lSJM4
	Cqzh1tH8OQ9MVq5qNeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5dA-008FYy-57; Mon, 22 Aug 2022 11:30:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5d6-008FTI-2O
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 11:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661167803; x=1692703803;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RJ04Kh5e1eZ1WoCexWG+Naw0DQ2en6wdmxTB7LzJfB4=;
  b=2QeZe/g7UBlz0X1fDnv2jOexXZvNxGP5g7QhKmI8Cj1rsacoC+0ssJzz
   WSKsSlgMc5GIiWU0S6yf231R1n7AodjQ4RmgGREM51u3VR89mI4Cht7np
   YepzvJjBmcuXIZzjUvdMlC1yZcQ3zG5J61OGjuQCf4Ib2QqVcOwAhiboK
   ffDvEnnKHB2no56KhzDQEjFX9GY0QEVABItqKE9QaqhPoq5Yd1A8oKMDf
   ymAcZF8GFMrYP9Bn13M6FTWMTpl25RqPwp1AKmNbTSiIsUdaR2YYA+eYp
   u1pKrXzmndpRR/KAkFcIiRCPmO9xzmLnpi57xfjPhYlvKzt609J6c2YO7
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="110092089"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 04:29:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 04:29:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 04:29:51 -0700
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
Subject: [PATCH v2 0/6] Add PolarFire SoC Fabric Clock Conditioning Circuitry Support
Date: Mon, 22 Aug 2022 12:29:23 +0100
Message-ID: <20220822112928.2727437-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_043004_296421_0C15C966 
X-CRM114-Status: GOOD (  12.16  )
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

Conor Dooley (6):
  dt-bindings: clk: rename mpfs-clkcfg binding
  dt-bindings: clk: document PolarFire SoC fabric clocks
  dt-bindings: clk: add PolarFire SoC fabric clock ids
  clk: microchip: add PolarFire SoC fabric clock support
  dt-bindings: riscv: microchip: document icicle reference design
  riscv: dts: microchip: add the mpfs' fabric clock control

 .../bindings/clock/microchip,mpfs-ccc.yaml    |  81 +++++
 ...p,mpfs.yaml => microchip,mpfs-clkcfg.yaml} |   2 +-
 .../devicetree/bindings/riscv/microchip.yaml  |   1 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  27 +-
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   4 +
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |   5 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  34 +-
 drivers/clk/microchip/Makefile                |   1 +
 drivers/clk/microchip/clk-mpfs-ccc.c          | 293 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  23 ++
 10 files changed, 458 insertions(+), 13 deletions(-)
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

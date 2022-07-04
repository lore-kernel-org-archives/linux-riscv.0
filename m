Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E2DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K5gn9AlonmivccA6vjUGE/PZEITp/9SfhEtAECJ+Ec0=; b=0YU3tDtb+nP4NZ
	ikBQI4DvPm86LoHhbkc/+ADnpP8rWYacxoNqCqPstK88AxofgoS4Qou53yg2FcaZX+zkESLvp7xpO
	LM9iYlD6Jw0nDe5WyA4iX9v8HaXsdULagyFeE7qp+1k73SnLqxLnsm3Rmirld10LgkgsmEPBeVArY
	Xg/KhooWCEEV+9pcGCV7b5rm8V4CcsH6IgfM2/KmY/QLaCLdAfPvhEraZ+HWZBJCKASrlR+tSxaVS
	faiBFhRHmLsxUc+9BzTl5baBv5TAVla4Fbv2+2m9FPkfhBndaPMvW90hpGmfQOfRq0rUdh/LvPn8N
	/3OrLGyDy9yhfF11713Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L09-008fAz-9C; Mon, 04 Jul 2022 12:16:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8L00-008f76-7w
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 12:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656936980; x=1688472980;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UOXPiZdv2rmnkPsrp5Jw7thiJz4uNIawvmKSzDwY0tk=;
  b=r2ydiu8aqXe5POKYJaLH3rAmd21luaxrA6lezZPx0MhN4c/SHSXnkpJe
   pm2rP15YYA81BV6ow+QRTxwFn/WpMVOuP9yQTwTfumWsna+ZtjVHaADC+
   BO3IJ83aBLQAY6N4SC2+3k5EQkN58hChFcbWfsyP/zTkf6lkyZ7W/zmJl
   RHUIUO4gfBH146d96z4iDhGxnjb4HC1Z6+5iru5vOxN+92hhdqoLrDJ6F
   LooUn3Yl0Tp9WVuMCaBcb9iKNghT6DbcRmGBMctgtjwaz/mbDLdqk+nQb
   bgP+ENLak8aWUexz6xCUsZbPtFDxIk5jrsgcTX+Uux+nCyOQy3X4Mzqqv
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="170953245"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 05:16:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 05:16:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 05:16:16 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Date: Mon, 4 Jul 2022 13:15:47 +0100
Message-ID: <20220704121558.2088698-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_051620_360151_77667250 
X-CRM114-Status: GOOD (  14.59  )
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
I know I have not sat on the RFC I sent about the aux. bus parts
for too long, but figured I'd just send the whole thing anyway to all
lists etc.

Kinda two things happening in this series, but I sent it together to
ensure the second part would apply correctly.

The first is the reset controller that I promised after discovering the
issue triggered by CONFIG_PM & the phy not coming up correctly. I have
now removed all the messing with resets from clock enable/disable
functions & now use the aux bus to set up a reset controller driver.
Since I needed something to test it, I hooked up the reset for the
Cadence MACB on PolarFire SoC. This has been split into a second series
for v2:
https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/

The second part adds rate control for the MSS PLL clock, followed by
some simplifications to the driver & conversions of some custom structs
to the corresponding structs in the framework.

Thanks,
Conor.

Changes since v1:
- split off the net patches
- clk: actually pass the spinlock to the converted dividers & gates
- reset: added a spinlock around RMW access to registers
- reset: switched to BIT(i) macros
- reset: used local copies of some variables as pointed out by Philipp
- reset: dropped the success printout

Conor Dooley (12):
  dt-bindings: clk: microchip: mpfs: add reset controller support
  clk: microchip: mpfs: add reset controller
  reset: add polarfire soc reset support
  MAINTAINERS: add polarfire soc reset controller
  riscv: dts: microchip: add mpfs specific macb reset support
  clk: microchip: mpfs: add module_authors entries
  clk: microchip: mpfs: add MSS pll's set & round rate
  clk: microchip: mpfs: move id & offset out of clock structs
  clk: microchip: mpfs: simplify control reg access
  clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
  clk: microchip: mpfs: convert cfg_clk to clk_divider
  clk: microchip: mpfs: convert periph_clk to clk_gate

 .../bindings/clock/microchip,mpfs.yaml        |  17 +-
 MAINTAINERS                                   |   1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
 drivers/clk/microchip/Kconfig                 |   1 +
 drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++---------
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-mpfs.c                    | 157 ++++++++
 include/soc/microchip/mpfs.h                  |   8 +
 9 files changed, 386 insertions(+), 193 deletions(-)
 create mode 100644 drivers/reset/reset-mpfs.c


base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

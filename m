Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E7C4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3n5jVOcJx0Gkz9jLvGgjjCY4my9U2zpBDiKdKngL4Ks=; b=SIV70I8IfRe8m7
	l0gDYWVKjnf8+uwcgaVkPfZFlNs4twILjKNbn1ASTefBmKCzpljXFhKldE5lxtFDBQgpXPNi+jfQ4
	UDrjS6k8uh2zj7h9Q1Ksivn5m5j7NVsEseE6woZVTasE+fpDfhYOctrp4zsIaJEGTT1R9CJqcBaZq
	Q2tVYT4Ru9eeKEl9Se1Sv+ojJyASj/FT79valmjyPZRaKN+dc6ek2suIiiEeuafmJWM0443bggbLb
	UyaoNYsjay6jFlgEHdqW8gQw7BFbJpubUSgUPpP8i9Q/Yrtcci6QBxyPK2UmGcwc7tFmFqWgux8pP
	Fr/3dufr/DgP6R+pyfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpuP-007hXo-E6; Mon, 11 Apr 2022 09:00:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuD-007hOY-Cd
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667617; x=1681203617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T06nj3C4zK53ubNESpfjuEmkjYS5wovCXqlWWYBK/yc=;
 b=WcHtTHAdABOBuAVhIz5Kv+SZXN89P9H8Ckgqa5s5ieBxHE9mxZq98wQQ
 baUwcgjW/JS2mT8/yN4Bo5UQc9ssyspqOqX5ACmGAqWZb0b+xvcIva2nY
 7YcqMVRGvh4wOsdTJGtR8Cb4mzQ7bXF/ibQ9+D87wgBE3JzLR2NgMD7Jy
 V0k+NRG+M/pZuW54BOLoJNP0Hg//n2lbkV5cB+9EqiNmxVwRkOyVlgGq5
 NtEhwxKFXUP9QkS0ddI6il9xL1S+Tt6u1zEAzbqmZRsMefjBOJ/01uI0q
 Ke5G+MM3K4ndxNSkhtICnRuNR/xtlPINNziMmCS0CKNcIkch7UugthUQv A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="159622642"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 0/9] More PolarFire SoC Fixes for 5.18
Date: Mon, 11 Apr 2022 09:59:08 +0100
Message-ID: <20220411085916.941433-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020017_476351_959679A4 
X-CRM114-Status: GOOD (  19.94  )
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
After the clock driver for the PolarFire SoC was accepted I started work
on the onboard RTC & found out that the reference clock for the rtc was
actually missing from the clock driver.

While restructuring the clock driver to add support for the rtc
reference, I also noticed that there were some problems with how the FIC
clocks were being used. The FIC clocks are the cpu side inputs to the
AXI fabric interconnections & are not the clocks for any peripherals.

This first three patches in this series fixes the problems with the FICs:
- the fic clocks incorrectly had the AHB clock as their parents
- the last fic, named differently to the others, had not been set as
  a critical clock
- some peripherals on the fabric side were incorrectly using the cpu
  side fic clocks, resulting in incorrect rates.

The second part of the series fixes the missing rtc reference clock.
There are three main changes:
- Changing the reference clock in the dt to the external 125 MHz
  oscillator rather than using the output of an internal pll. This has
  the added benefit of not requiring changes to the device tree if this
  part of the bitstream changes.
- Adding a new clock into the driver that sits above the existing
  configurable clocks & has the external reference as a parent. The new
  clock provides the parent for the AHB/AXI clocks which formerly came
  from the device tree.
- Adding the rtc reference clock to the dt bindings, device tree and
  clock driver at the configurable clock level, alongside AXI and AHB.

I kept series separate from [0] since that's tied to the CONFIG_PM stuff
& fixes a specific problem.

Changes since v1:
After speaking with Krzysztof, I have merged the rtc reference changes
[1] with these fixes for 5.18. This was done since the relevant drivers
and bindings only arrived in v5.18 & there'll now be no issue with
breaking the ABI.
Backwards compatiblity with the device tree from before 5.18 will be
broken by these changes, but the board did not boot then anyway... If
that is not okay, please lmk.

The patch renaming sys_base was dropped since that's not a fix.

Version 1 would not apply without [0] & that should be fixed too.

Thanks,
Conor.

[0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
[1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com


Conor Dooley (9):
  clk: microchip: mpfs: fix parents for FIC clocks
  clk: microchip: mpfs: mark CLK_ATHENA as critical
  riscv: dts: microchip: fix usage of fic clocks on mpfs
  dt-bindings: clk: mpfs document msspll dri registers
  dt-bindings: clk: mpfs: add defines for two new clocks
  dt-bindings: rtc: add refclk to mpfs-rtc
  clk: microchip: mpfs: re-parent the configurable clocks
  clk: microchip: mpfs: add RTCREF clock control
  riscv: dts: microchip: reparent mpfs clocks

 .../bindings/clock/microchip,mpfs.yaml        |  11 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  14 +-
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
 .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
 drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
 7 files changed, 208 insertions(+), 41 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93498C6FA8D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n4sQFgaSC+7y1yP/X5x/7Q9K403vGUlAe07cwKUAn9E=; b=unMbe2lYEh8aAj
	m1FNlaDf02NVJUdyTguH0lhsSECTHqqU+htuLj8JqEhxpWCilAxR6XqZyTVKb+eb2OiJK9k7LaNcD
	cV+02S76fTiQk6vFjR8uo5Ww8YvW4nBeO2b+Dbx72NCkv+YSXJtTwdr2vyVvlyUScGlv1VcWCaIu/
	/4GJel9lFARkJu+nFAaMADBio2yhidxb0ex+uwYyFN+Ie7T9eNW03GHz3dOYGmmfdowmPI92iSEdK
	7m2+T8MPZbGFM+2kQ4Bq94raXxw7zDBWg5FLKrpoSqJdMEDZJZ2WO51V22bb5sdtL9OjXLGtihMIH
	oNfsVO5yauxN1w8nvAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWdB2-00G29l-F5; Fri, 09 Sep 2022 12:32:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWdAy-00G25X-S7
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 12:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662726724; x=1694262724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HX/acfokj679TW0p8JjwsB6cH8hSfz79iHSDR58YKNY=;
  b=brsLWTLwwysu4GjoTtlXGcKI/Rz44ZnpeutA2Y5MdHEFM4SOn8tpx/z8
   SO9Fxd9b/nm2SnzCNFcADPttwpyD5sdQz4BsSqKjWDfrwQe9CLlFeDVlZ
   Fv8l+uW+SNzt2EYCliKrm5xeIr5uh8znmatNuPO86pQtoj4akKd9+gSJN
   2Q5DDmWmxQMb3oeeYd6Y0nTv8EpetzwILAKVWpcNWj5DfVXH+GCeXz2HA
   lWs7p2Q7nU4Y0oJRylMGKYrYxvbg1PFZIoVgHcZ4MwgN89kgOZyllZsWd
   r//1mcUwyi6+2vUpjjJb6bRXwew7cOFjDO25PLNXytTP4CJxZ25c0UBYi
   w==;
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="176399083"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Sep 2022 05:31:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 9 Sep 2022 05:31:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 9 Sep 2022 05:31:43 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 00/14] PolarFire SoC reset controller & clock cleanups
Date: Fri, 9 Sep 2022 13:31:09 +0100
Message-ID: <20220909123123.2699583-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_053204_990151_8754EA70 
X-CRM114-Status: GOOD (  18.82  )
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

@Stephen, even if you do not take the rest of the series for v6.1, the
first patch is a bugfix for boot failures that can be trigged with v6.0
so even if you have reservations about the aux device stuff, I would
appreciate if you would take the first patch.

Unfortunately, the rest of the series does have a conflict with/depends
on the fix - so if you do take it on -fixes could you do it as a commit
on top of -rc1 so the rest of the series will apply?

Thanks,
Conor.

Original Cover:
Hey all,

Kinda two things happening in this series, but I sent it together to
ensure the second part would apply correctly.

The first is the reset controller that I promised after discovering the
issue triggered by CONFIG_PM & the phy not coming up correctly. I have
now removed all the messing with resets from clock enable/disable
functions & now use the aux bus to set up a reset controller driver.
Since I needed something to test it, I hooked up the reset for the
Cadence MACB on PolarFire SoC. This has been split into a second series
for v2 (and is now in v6.0-rcN):
https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/

The second part adds rate control for the MSS PLL clock, followed by
some simplifications to the driver & conversions of some custom structs
to the corresponding structs in the framework.

I'll take the dts patch myself when the rest of this is okay-ed.
Thanks,
Conor.

Changes since v4:
- use the alternative macro Claudiu suggested for patch 1
- drop a ~useless intermediate variable in mpfs_deassert()

Changes since v3:
- return results directly in probe() & reset_controller_register()

Changes since v2:
- reorder reset Makefile/Kconfig entries
- fix a pre-existing bug exposed by clang with this series applied
- add Padmarao who co-authored the original driver to the authors

Conor Dooley (14):
  clk: microchip: mpfs: fix clk_cfg array bounds violation
  clk: microchip: mpfs: make the rtc's ahb clock critical
  dt-bindings: clk: microchip: mpfs: add reset controller support
  clk: microchip: mpfs: add reset controller
  reset: add polarfire soc reset support
  MAINTAINERS: add polarfire soc reset controller
  riscv: dts: microchip: add mpfs specific macb reset support
  clk: microchip: mpfs: add MSS pll's set & round rate
  clk: microchip: mpfs: move id & offset out of clock structs
  clk: microchip: mpfs: simplify control reg access
  clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
  clk: microchip: mpfs: convert cfg_clk to clk_divider
  clk: microchip: mpfs: convert periph_clk to clk_gate
  clk: microchip: mpfs: update module authorship & licencing

 .../bindings/clock/microchip,mpfs.yaml        |  17 +-
 MAINTAINERS                                   |   1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
 drivers/clk/microchip/Kconfig                 |   1 +
 drivers/clk/microchip/clk-mpfs.c              | 384 +++++++++---------
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-mpfs.c                    | 157 +++++++
 include/soc/microchip/mpfs.h                  |   8 +
 9 files changed, 388 insertions(+), 196 deletions(-)
 create mode 100644 drivers/reset/reset-mpfs.c


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

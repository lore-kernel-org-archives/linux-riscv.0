Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E428FC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eEY0As/+SfT7+2USVS5/Vk13mUPLte51Z64WkjfhLxE=; b=BlsDJf/Io5kZT2
	eJeIbO3mS97AMckqhTBJDx285YThmc9lIB59XpOEf/5jCH9IAh9iHJHgca0eFUFpS6qF6FSV2/NPv
	i1G+1Jzwvom36AqoIjmgwZacdNi6VvUqkHKmN+gufcWUQNj31U+8UFx/1ycBJNnQstwhpr+kCq9/+
	HKzYmc6sXY4XdkJUsqWPkNMWt742CJ8B44lvff72iXn99aDt8cS/y7n26pBlCs8asaBno5Ee1xuYy
	7zjnW+91klJ2GFcgHhvpg61tkbYM6d+INyaBtKjKo0iQgUPRNqs16kGQGn6kE0TD7MNraV4Q2dqRs
	7FWX6677XWniVobJR3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiI-005J2N-Kz; Fri, 19 Aug 2022 09:54:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiF-005Ir3-TW
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660902887; x=1692438887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LHd+4+ztyLleLhRkBC+IDhKqnrDiduTJ+MVOjUQ9LfU=;
  b=XhQU+3lAmHug6/grZVpKwR6dFz+A46AVV0bvk5e8aA+lGwcfKd418Jio
   zlamwi1WN4NGf4e/QiVGoaOXAIrXANWsR/OQd5dqm2SxA4t4qloXiOfge
   rh5bv+9S5liy/LnMpNTvcU6mVXflS8EikqCzfEibbvdDlkshXEWNc898v
   S1+ndI5Sn9c6TGbQJxYfPRcbaRTgLfJfpAMwlEVcVt99eNNJW/zT5C4UQ
   2k4DlMt3qRzmV9PUTTKhgNl/L3QHH8dEGBP7Uvvpwsg09KkUcvF4ZFyiX
   JUgkxZKNI2UBxJzRwA51lTPn5WiyRlvnB6vZshe8YYIIcsWDAXj2j4QEA
   w==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="187175524"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 02:54:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 02:54:32 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 02:54:30 -0700
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
Subject: [PATCH v3 00/13] PolarFire SoC reset controller & clock cleanups
Date: Fri, 19 Aug 2022 10:53:08 +0100
Message-ID: <20220819095320.40006-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025448_005627_4FEE7D6A 
X-CRM114-Status: GOOD (  13.77  )
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

Kinda two things happening in this series, but I sent it together to
ensure the second part would apply correctly.

The first is the reset controller that I promised after discovering the
issue triggered by CONFIG_PM & the phy not coming up correctly. I have
now removed all the messing with resets from clock enable/disable
functions & now use the aux bus to set up a reset controller driver.
Since I needed something to test it, I hooked up the reset for the
Cadence MACB on PolarFire SoC. This was been split into a second series
for v2 (and is now in v6.0-rcN):
https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/

The second part adds rate control for the MSS PLL clock, followed by
some simplifications to the driver & conversions of some custom structs
to the corresponding structs in the framework.

I'll take the dts patch myself when the rest of this is accepted.
Thanks,
Conor.

Changes since v2:
- reorder reset Makefile/Kconfig entries
- fix a pre-existing bug exposed by clang with this series applied
- add Padmarao who co-authored the original driver to the authors

Conor Dooley (13):
  clk: microchip: mpfs: fix clk_cfg array bounds violation
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
 drivers/clk/microchip/clk-mpfs.c              | 386 +++++++++---------
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   2 +-
 drivers/reset/reset-mpfs.c                    | 157 +++++++
 include/soc/microchip/mpfs.h                  |   8 +
 9 files changed, 391 insertions(+), 195 deletions(-)
 create mode 100644 drivers/reset/reset-mpfs.c


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

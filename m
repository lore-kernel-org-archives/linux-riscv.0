Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BED5C7EE30
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dFYqlaeBgEuQXXTfjyJG7sw/v4bxN3vDhin49q9sqJc=; b=38uP+AUI9g0+m9
	ISZGzTfrH+ynQtTjpnrDDjEXj5LTI4lH5y+HROkFxf3a72fQtMDjQgUNwovraN5L4T/s9jTTm8V+s
	MXniTc4nl95KA+QJR6426RwnHplSEkZBmKujk7zmO3vJMJc860DJkiYb6wDy+fUEZxbWTjWRXCWup
	vOE16mKcumnHHOCA4rytcmijvdkqO0GnyqzpxpvzH2s5r/oVnjbp1Zpb7SejVew7Zaysy3zXeBd8j
	zF+bq5XHt1kIy3zvZa6sMOtXKyYiGtIDpLXSe1dXmgZiVfbKKlJytzb+t5+jeaBV3ern5dxJLyBjW
	gEqzYrPhDLLYPUhO+eVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1Gd-005Ylc-C9; Fri, 03 Mar 2023 08:59:55 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1GY-005YiO-9M
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 08:59:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 823B024E25C;
	Fri,  3 Mar 2023 16:59:30 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:59:30 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 3 Mar 2023 16:59:29 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>
Subject: [PATCH v5 00/12] Add Ethernet driver for StarFive JH7110 SoC
Date: Fri, 3 Mar 2023 16:59:16 +0800
Message-ID: <20230303085928.4535-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_005950_649935_5FCD759F 
X-CRM114-Status: GOOD (  19.34  )
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

This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
The series includes MAC driver. The MAC version is dwmac-5.20 (from
Synopsys DesignWare). For more information and support, you can visit
RVspace wiki[1].

You can simply review or test the patches at the link [2].

This patchset should be applied after the patchset [3], [4], [5].
[1]: https://wiki.rvspace.org/
[2]: https://github.com/SaminGuo/linux/tree/vf2-6.2-gmac
[3]: https://lore.kernel.org/all/20230221024645.127922-1-hal.feng@starfivetech.com/
[4]: https://lore.kernel.org/all/20230202030037.9075-1-Frank.Sae@motor-comm.com/
[5]: https://lore.kernel.org/all/20230215113249.47727-5-william.qiu@starfivetech.com/

Changes since v4:
- Supported both visionfive 2 v1.2A and visionfive 2 v1.3B.
- Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.
- Suggested by Emil, dropped the _PLAT/_plat from the config/function/struct/file names.
- Suggested by Emil, added MODULE_DEVICE_TABLE().
- Suggested by Emil, dropped clk_gtxclk and use clk_tx_inv to set the clock frequency.
- Added phy interface mode configuration function.
- Rebased on tag v6.2.

Patch 12:
- No update
Patch 11:
- Configuration of gmac and phy for visionfive 2 v1.2A.
Patch 10:
- Configuration of gmac and phy for visionfive 2 v1.3B.
Patch 9:
- Added starfive,syscon for gmac nodes in jh7110.dtsi.
Patch 8:
- Added starfive_dwmac_set_mode to set PHY interface mode.
Patch 7:
- Added starfive,syscon item in StarFive-dwmac dt-bindings.
Patch 6:
- Moved SOC_STARFIVE to ARCH_STARFIVE in Kconfig.
- Dropped the _PLAT/_plat from the config/function/struct names. (by Emil)
- Added MODULE_DEVICE_TABLE() and udev will load the module automatically. (by Emil)
- Used { /* sentinel */ } for the last entry of starfive_eth_match. (by Emil)
- Added 'tx_use_rgmii_rxin_clk' to struct starfive_dwmac, to mark the clk_tx'parent is rgmii.
- Suggested by Emil, dropped clk_gtxclk and use clk_tx_inv to set the clock frequency.
Patch 5:
- Suggested by Emil, dropped mdio0/1 labels because there is no reference elsewhere.
Patch 4:
- Removed GTXC clk in StarFive-dwmac dt-bindings.
- Added starfive,tx-use-rgmii-clk item in StarFive-dwmac dt-bindings.
Patch 3:
- Added an optional reset single 'ahb' in 'snps,dwmac.yaml', according to
  stmmac_probe_config_dt/stmmac_dvr_probe.
Patch 2:
- No update
Patch 1:
- No update

Changes since v3:
- Reworded the maxitems number of resets property in 'snps,dwmac.yaml'
- Removed the unused code in 'dwmac-starfive-plat.c'.
- Reworded the return statement in 'starfive_eth_plat_fix_mac_speed' function.

Changes since v2:
- Renamed the dt-bindings 'starfive,jh71x0-dwmac.yaml' to 'starfive,jh7110-dwmac.yaml'.
- Reworded the commit messages.
- Reworded the example context in the dt-binding 'starfive,jh7110-dwmac.yaml'.
- Removed "starfive,jh7100-dwmac" compatible string and special initialization of jh7100.
- Removed the parts of YT8531,so dropped patch 5 and 6.
- Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.

Changes since v1:
- Recovered the author of the 1st and 3rd patches back to Emil Renner Berthing.
- Added a new patch to update maxitems number of resets property in 'snps,dwmac.yaml'.
- Fixed the check errors reported by "make dt_binding_check".
- Renamed the dt-binding 'starfive,dwmac-plat.yaml' to 'starfive,jh71x0-dwmac.yaml'.
- Updated the example context in the dt-binding 'starfive,jh71x0-dwmac.yaml'.
- Added new dt-binding 'motorcomm,yt8531.yaml' to describe details of phy clock
  delay configuration parameters.
- Added more comments for PHY driver setting. For more details, see
  'motorcomm,yt8531.yaml'.
- Moved mdio device tree node from 'jh7110-starfive-visionfive-v2.dts' to 'jh7110.dtsi'.
- Re-worded the commit message of several patches.
- Renamed all the functions with starfive_eth_plat prefix in 'dwmac-starfive-plat.c'.
- Added "starfive,jh7100-dwmac" compatible string and special init to support JH7100.

Previous versions:
v1 - https://patchwork.kernel.org/project/linux-riscv/cover/20221201090242.2381-1-yanhong.wang@starfivetech.com/
v2 - https://patchwork.kernel.org/project/linux-riscv/cover/20221216070632.11444-1-yanhong.wang@starfivetech.com/
v3 - https://patchwork.kernel.org/project/linux-riscv/cover/20230106030001.1952-1-yanhong.wang@starfivetech.com/
v4 - https://patchwork.kernel.org/project/linux-riscv/cover/20230118061701.30047-1-yanhong.wang@starfivetech.com/

Emil Renner Berthing (2):
  dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
  net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string

Samin Guo (8):
  dt-bindings: net: snps,dwmac: Add an optional resets single 'ahb'
  riscv: dts: starfive: jh7110: Add ethernet device nodes
  net: stmmac: Add glue layer for StarFive JH7110 SoC
  dt-bindings: net: starfive,jh7110-dwmac: Add starfive,syscon
  net: stmmac: starfive_dmac: Add phy interface settings
  riscv: dts: starfive: jh7110: Add syscon to support phy interface
    settings
  riscv: dts: starfive: visionfive-2-v1.3b: Add gmac+phy's delay
    configuration
  riscv: dts: starfive: visionfive-2-v1.2a: Add gmac+phy's delay
    configuration

Yanhong Wang (2):
  dt-bindings: net: Add support StarFive dwmac
  riscv: dts: starfive: visionfive 2: Enable gmac device tree node

 .../devicetree/bindings/net/snps,dwmac.yaml   |  19 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 130 +++++++++++++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
 .../jh7110-starfive-visionfive-2-v1.3b.dts    |  27 +++
 .../jh7110-starfive-visionfive-2.dtsi         |  10 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  93 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 171 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 11 files changed, 481 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c


base-commit: 11934a315b671ddb09bc7ac5f505649e9f2623c7
prerequisite-patch-id: ad56ef54d3f2a18025abc9e27321c25beda16422
prerequisite-patch-id: 1be0fb49e0fbe293ca8fa94601e191b13c8c67d9
prerequisite-patch-id: 8b402a8d97294a9b568595816b0dc96afc5e6f5d
prerequisite-patch-id: 5c149662674f9e7dd888e2028fd8c9772948273f
prerequisite-patch-id: 0caf8a313a9f161447e0480a93b42467378b2164
prerequisite-patch-id: b2422f7a12f1e86e38c563139f3c1dbafc158efd
prerequisite-patch-id: be612664eca7049e987bfae15bb460caa82eb211
prerequisite-patch-id: 8300965cc6c55cad69f009da7916cf9e8ce628e7
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27DC6FD19
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngtkJG5Btf50fT1iIywXAEVy+Gpg6p4LJ9JMLnu79X0=; b=k8jk0VenVaz2vi
	TjwxTnFgFftyDa3D6gEqp9IJC3A0ikPc3xxTz+5+oQnFIFemwQsbekwzwVx+xkGtc/naM95oW7qm6
	CazSw8HZFKRID51Fvms23ubWxWMYkrHDMj512Qktusf1bDKqazGVJp6PtBKkBKSMs+qRwcIdJ5kOp
	wYH5g8ju6YUhFSruD4GLDj3Wnt+HxLzzfQygsIzysqZCV4vtVBcNSEL/5mZvc2ZFvnmWai1mkjU3w
	pfG4MeG+FqyTCuV3wYU1Rq05Vb5HSTdy8eq9DMWtFL6r83rsbR9nP73tH1abRp5SXlkdG9npbgBfb
	EwjFNBXUdSvvyBnJLFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbZ9i-004CXr-TA; Mon, 13 Mar 2023 03:47:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbZ9X-004CKo-A5
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:47:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5280D24E1BD;
	Mon, 13 Mar 2023 11:46:47 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 11:46:47 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 13 Mar 2023 11:46:46 +0800
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
Subject: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
Date: Mon, 13 Mar 2023 11:46:37 +0800
Message-ID: <20230313034645.5469-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_204715_668212_390A75B5 
X-CRM114-Status: GOOD (  18.77  )
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

This patchset should be applied after the patchset [3] [4].
[1]: https://wiki.rvspace.org/
[2]: https://github.com/SaminGuo/linux/tree/vf2-6.3rc1-gmac
[3]: https://patchwork.kernel.org/project/linux-riscv/cover/20230311090733.56918-1-hal.feng@starfivetech.com
[4]: https://github.com/SaminGuo/linux/commit/fa57aaedb3c195bab99ac351a8e44664ae819bf2

Changes since v5:
- Droped "depends on STMMAC_ETH" and compiled DWMAC_STARFIVE to m by default (by Emil)
- Removed clk_gtx in struct starfive_dwmac due to this pointer is only set, but never read. (by Emil)
- Only setting the plat_dat->fix_mac_speed callback when it is needed (by Emil)
- Moved mdio/phy nodes from SOC .dtsi into board .dtsi (by Andrew)
- Modified the parameters passed by starfive,syscon (by Andrew && Emil)
    <syscon, offset, mask>  ==>  <syscon, offset, shift>
- Optimized the patchs(Fewer patches from 12 to 8)
    1)merged patch-7 into patch-4 (by Rob)
    2)merged patch-9 into patch-5
    2)merged patch-11,12 into patch-10
    3)Adjusted the patchs order
- Fixed the unevaluatedProperties property from true to false (by Rob)
- Replaced contains:enum with items:const for reset-names in snps,dwmac.yaml (by Rob)
- Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
- Rebased on tag v6.3-rc1

Changes history:

Changes since v4:
- Supported both visionfive 2 v1.2A and visionfive 2 v1.3B.
- Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.
- Suggested by Emil, dropped the _PLAT/_plat from the config/function/struct/file names.
- Suggested by Emil, added MODULE_DEVICE_TABLE().
- Suggested by Emil, dropped clk_gtxclk and use clk_tx_inv to set the clock frequency.
- Added phy interface mode configuration function.
- Rebased on tag v6.2.

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
v5 - https://patchwork.kernel.org/project/netdevbpf/cover/20230303085928.4535-1-samin.guo@starfivetech.com/


Emil Renner Berthing (2):
  dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
  net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string

Samin Guo (5):
  dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
  net: stmmac: Add glue layer for StarFive JH7110 SoC
  net: stmmac: starfive_dmac: Add phy interface settings
  riscv: dts: starfive: jh7110: Add ethernet device nodes
  riscv: dts: starfive: visionfive 2: Add configuration of gmac and phy

Yanhong Wang (1):
  dt-bindings: net: Add support StarFive dwmac

 .../devicetree/bindings/net/snps,dwmac.yaml   |  17 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 130 ++++++++++++++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
 .../jh7110-starfive-visionfive-2-v1.3b.dts    |  27 +++
 .../jh7110-starfive-visionfive-2.dtsi         |  32 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  69 +++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 168 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 11 files changed, 474 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c


base-commit: 8ca09d5fa3549d142c2080a72a4c70ce389163cd
prerequisite-patch-id: 46cc850aa0e9e03ccf5ed23d8458babfca3d71af
prerequisite-patch-id: a6975e61ee5803fbd74b1c21ab925fd81c3c0eab
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: 044263ef2fb9f1e5a586edbf85d5f67814a28430
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: 9f3dbc9073eee89134e68977e941e457593c2757
prerequisite-patch-id: 8600b156a235be2b3db53be3f834e7a370e2cfb9
prerequisite-patch-id: 1b2d0982b18da060c82134f05bf3ce16425bac8d
prerequisite-patch-id: 090ba4b78d47bc19204916e76fdbc70021785388
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: 4c12d958e3a3d629d86dddb1e4f099d8909393e0
prerequisite-patch-id: bb939c0c7c26b08addfccd890f9d3974b6eaec53
prerequisite-patch-id: 8f5c66dfb14403424044192f6fa05b347ad356a7
prerequisite-patch-id: fd93763b95469912bde9bdfa4cd827c8d5dba9c6
prerequisite-patch-id: 6987950c2eb4b3773b2df8f7934eff434244aeab
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: e7773c977a7b37692e9792b21cc4f17fa58f9215
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 9f911969d0a550648493952c99096d26e05d4d83
prerequisite-patch-id: 1be0fb49e0fbe293ca8fa94601e191b13c8c67d9
prerequisite-patch-id: a8340aa3403658e8275d0da0038c2d49bc79843a
--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

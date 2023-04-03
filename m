Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97437C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EEzFSyT+tgz7KTOlQfpdVFkgo0NeIXo6l/LRE2KUnBI=; b=0oFzW/F0SZqXXw
	2OOVLo5mulywxD/VXpRErHa19h/I5hamvENhxBhjwNfzhH6BCT67sZXCnF+PQzRwCtxpfbn+IElwE
	zErwue1u5cc9dxJaGl9WxsHmRmrf8YOp61LjmjEvpZR7Ztv6E0LTMobGt80VZZ71yeHAqRl2tg14/
	WgtOC2kmuKF0kAvRxdR3KUT90sr3dA03TPnSqnBYmzYI5dQxbvH5TRI4dB0e3Knl/2OIDz8AWJxqU
	GVAQUfA/BHN6gcAQjGALYvUOBQtdIFjyPSzKfOpGNYM4rCC533hig+tT8oZLQi9A2WxdXqI5Kom5g
	ZsTxk7xpQsTiHeVf+8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEAs-00EJPX-0S;
	Mon, 03 Apr 2023 07:00:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEAn-00EJHp-0k
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 07:00:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B5EDA24E195;
	Mon,  3 Apr 2023 14:59:34 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 14:59:34 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 3 Apr 2023 14:59:33 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [-net-next v10 0/6] Add Ethernet driver for StarFive JH7110 SoC
Date: Mon, 3 Apr 2023 14:59:26 +0800
Message-ID: <20230403065932.7187-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_000014_041968_F7EF36E5 
X-CRM114-Status: GOOD (  20.27  )
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

This series adds ethernet support for the StarFive JH7110 RISC-V SoC,
which includes a dwmac-5.20 MAC driver (from Synopsys DesignWare).
This series has been tested and works fine on VisionFive-2 v1.2A and
v1.3B SBC boards.

For more information and support, you can visit RVspace wiki[1].
You can simply review or test the patches at the link [2].
This patchset should be applied after the patchset [3] [4].

[1]: https://wiki.rvspace.org/
[2]: https://github.com/saminGuo/linux/tree/vf2-6.3rc4-gmac-net-next
[3]: https://patchwork.kernel.org/project/linux-riscv/cover/20230401111934.130844-1-hal.feng@starfivetech.com
[4]: https://patchwork.kernel.org/project/linux-riscv/cover/20230315055813.94740-1-william.qiu@starfivetech.com


Changes since v9:
- Rebased on tag v6.3-rc4.
Patch 5:
- Cleaned up all the error handling code by dev_err_probe (by Emil).
- Fixed the warning that clang uses W=1 because 'rate' may not be initialized (by Jakub Kicinski)


Changes history:
Changes since v8:
Patch 4:
- Dropped irrelevant MAINTAINERS context (by Jakub Kicinski)
Patch 6:
- Moved error messages to starfive_dwmac_set_mode function to avoid getting error
  messages twice when syscon_regmap_lookup_by_phandle_args fails. (by Emil)
- Renamed patch header to "net: stmmac: dwmac-starfive:xxx" (by Emil)

Changes since v7:
Patch 4:
- Constrained the reg/interrupts/interrupt-names properties (by Krzysztof Kozlowski)

Changes since v6:
- Sended network patches[patch 1,2,3,4,5,6] and riscv trees patches[patch 7,8] separately (by Jakub Kicinski)

Changes since v5:
- Dropped "depends on STMMAC_ETH" and compiled DWMAC_STARFIVE to m by default (by Emil)
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
v6 - https://patchwork.kernel.org/project/netdevbpf/cover/20230313034645.5469-1-samin.guo@starfivetech.com/
v7 - https://patchwork.kernel.org/project/netdevbpf/cover/20230316043714.24279-1-samin.guo@starfivetech.com/
v8 - https://patchwork.kernel.org/project/linux-riscv/cover/20230324022819.2324-1-samin.guo@starfivetech.com/
v9 - https://patchwork.kernel.org/project/linux-riscv/cover/20230328062009.25454-1-samin.guo@starfivetech.com/

Emil Renner Berthing (2):
  dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
  net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string

Samin Guo (3):
  dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
  net: stmmac: Add glue layer for StarFive JH7110 SoC
  net: stmmac: starfive-dmac: Add phy interface settings

Yanhong Wang (1):
  dt-bindings: net: Add support StarFive dwmac

 .../devicetree/bindings/net/snps,dwmac.yaml   |  17 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 144 +++++++++++++++
 MAINTAINERS                                   |   7 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 171 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 7 files changed, 350 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
prerequisite-patch-id: 55390537360f25c8b9cbfdc30b73ade004f436f7
prerequisite-patch-id: bb939c0c7c26b08addfccd890f9d3974b6eaec53
prerequisite-patch-id: 8a6f135bcabdad4a4bfb21f0c6a0ffd2bb57efe7
prerequisite-patch-id: c2366f993a9d85e28c06d8d09f064dd5e8b29a61
prerequisite-patch-id: 50d53a21f91f4087fc80b6f1f72864adfb0002b9
prerequisite-patch-id: 0df3703af91c30f1ca2c47f5609012f2d7200028
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: 551fae54377090044c3612fca9740a9b359abdd2
prerequisite-patch-id: c7fdf904f398d478f0ed6d57eb878982bc73329d
prerequisite-patch-id: 1b2d0982b18da060c82134f05bf3ce16425bac8d
prerequisite-patch-id: 090ba4b78d47bc19204916e76fdbc70021785388
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: 4637a8fa2334a45fa6b64351f4e9e28d3e2d60d3
prerequisite-patch-id: 32647ec60a3b614e1c59ec8e54cb511ae832c22f
prerequisite-patch-id: aa06658ecf89c92d0dfdd6a4ba6d9e6e67532971
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: e7773c977a7b37692e9792b21cc4f17fa58f9215
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 9f911969d0a550648493952c99096d26e05d4d83
prerequisite-patch-id: 41eddeabff082d08a76d8da523f90da4b5218d28
prerequisite-patch-id: 999c243dca89d56d452aa52ea3e181358b5c1d80
prerequisite-patch-id: 1be0fb49e0fbe293ca8fa94601e191b13c8c67d9
--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

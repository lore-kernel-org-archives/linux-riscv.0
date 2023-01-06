Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD87C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7QQ3I8SKaqg/2+jEewIY1h22Chp8K/M6RW/R6Qy0WRk=; b=g7bLqS+2DIy5qM
	wzm5Tp5ScHistt56pOHx28T5CQn4JOdM1QavxNum+cGyW0pdjN7sTI6vP3jFpWn5l/CkKcbewV9/I
	SINpR5GtjH88kVQ4izvPzQcQ3D7h0V5oDeRIdJ8RAos3+QFfwPt7RAvCj407RG55NiHY2kS1RnLxs
	sHyVsswc5qvmkVe2CsJi1hbad6ALf9QcjGg2+2LIPfzsRKKLUxhGOmrNLgaU+QyKwSlKdlou9GjHF
	+DIOuuKwSjDUlzwvAuezcmPDhFym6eDE3BM4x8ZPY2eXG63Wj1KcdNj4Y5JhSAl8J5lsz/pfM/6JH
	69YffCbsSCEffCtPZR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyk-00HMsT-Ty; Fri, 06 Jan 2023 03:01:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyU-00HMOy-QK
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 03:00:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DC94F24DDB2;
	Fri,  6 Jan 2023 11:00:03 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 11:00:03 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 6 Jan 2023 11:00:02 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v3 0/7] Add Ethernet driver for StarFive JH7110 SoC
Date: Fri, 6 Jan 2023 10:59:54 +0800
Message-ID: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_190055_245699_550A03CF 
X-CRM114-Status: GOOD (  13.28  )
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

This series adds ethernet support for the StarFive JH7110 RISC-V SoC. The series
includes MAC driver. The MAC version is dwmac-5.20 (from Synopsys DesignWare).
For more information and support, you can visit RVspace wiki[1].
	
This patchset should be applied after the patchset [2], [3], [4].
[1] https://wiki.rvspace.org/
[2] https://lore.kernel.org/all/20221118010627.70576-1-hal.feng@starfivetech.com/
[3] https://lore.kernel.org/all/20221118011108.70715-1-hal.feng@starfivetech.com/
[4] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/

Changes in v3:
- Renamed the dt-bindings 'starfive,jh71x0-dwmac.yaml' to 'starfive,jh7110-dwmac.yaml'.
- Reworded the commit messages.
- Reworded the example context in the dt-binding 'starfive,jh7110-dwmac.yaml'.
- Removed "starfive,jh7100-dwmac" compatible string and special initialization of jh7100.
- Removed the parts of YT8531,so dropped patch 5 and 6.
- Reworded the maxitems number of resets property in 'snps,dwmac.yaml'.

Previous versions:
v1 - https://patchwork.kernel.org/project/linux-riscv/cover/20221201090242.2381-1-yanhong.wang@starfivetech.com/
v2 - https://patchwork.kernel.org/project/linux-riscv/cover/20221216070632.11444-1-yanhong.wang@starfivetech.com/

Emil Renner Berthing (2):
  dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
  net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string

Yanhong Wang (5):
  dt-bindings: net: snps,dwmac: Update the maxitems number of resets and
    reset-names
  dt-bindings: net: Add support StarFive dwmac
  net: stmmac: Add glue layer for StarFive JH7110 SoCs
  riscv: dts: starfive: jh7110: Add ethernet device node
  riscv: dts: starfive: visionfive-v2: Enable gmac device tree node

 .../devicetree/bindings/net/snps,dwmac.yaml   |  41 ++++--
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 113 ++++++++++++++++
 MAINTAINERS                                   |   6 +
 .../jh7110-starfive-visionfive-v2.dts         |  10 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  93 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-starfive-plat.c      | 123 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 9 files changed, 393 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
prerequisite-patch-id: 8ebfffa09b478904bf7c516f76e2d824ddb60140
prerequisite-patch-id: e8dd8258a4c4062eee2cf07c4607d52baea71f3a
prerequisite-patch-id: d050d884d7b091ff30508a70f5ce5164bb3b72e5
prerequisite-patch-id: 0e41f8cfd4861fcbf6f2e6a2559ce28f0450299e
prerequisite-patch-id: 6e1652501859b85f101ff3b15ced585d43c71c1b
prerequisite-patch-id: 587628a67adad5c655e5f998bf6c4a368ec07d3c
prerequisite-patch-id: 596490c0e397df6c0249c1306fbb1d5bf00b5b83
prerequisite-patch-id: dc873317826b50364344b25ac5cd74e811403f3d
prerequisite-patch-id: a50150f41d8e874553023187e22eb24dffae8d16
prerequisite-patch-id: 735e62255c75801bdc4c0b4107850bce821ff7f5
prerequisite-patch-id: 9d2e83a2dd43e193f534283fab73e90b4f435043
prerequisite-patch-id: 7a43e0849a9afa3c6f83547fd16d9271b07619e5
prerequisite-patch-id: e7aa6fb05314bad6d94c465f3f59969871bf3d2e
prerequisite-patch-id: 6276b2a23818c65ff2ad3d65b562615690cffee9
prerequisite-patch-id: d834ece14ffb525b8c3e661e78736692f33fca9b
prerequisite-patch-id: 4c17a3ce4dae9b788795d915bf775630f5c43c53
prerequisite-patch-id: dabb913fd478e97593e45c23fee4be9fd807f851
prerequisite-patch-id: ba61df106fbe2ada21e8f22c3d2cfaf7809c84b6
prerequisite-patch-id: 287572fb64f83f5d931034f7c75674907584a087
prerequisite-patch-id: 536114f0732646095ef5302a165672b3290d4c75
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: e09e995700a814a763aa304ad3881a7222acf556
prerequisite-patch-id: 841cd71b556b480d6a5a5e332eeca70d6a76ec3f
prerequisite-patch-id: d074c7ffa2917a9f754d5801e3f67bc980f9de4c
prerequisite-patch-id: 5f59bc7cbbf1230e5ff4761fa7c1116d4e6e5d71
prerequisite-patch-id: d5da3475c6a3588e11a1678feb565bdd459b548e
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

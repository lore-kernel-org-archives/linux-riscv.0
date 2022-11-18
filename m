Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yD4Go5hVf6eFJ7XTcRaJBBUlPq99i8wzzYFA8jcrvt4=; b=NrWvRx3PMYD9fo
	DaaF9s28A6fcl/DzM/DuQ9Z4Wm+JGZl+3k53d+Nr+Qnd6gkfEoJQHpcSZdchTPOTpZadmBJ55DY6K
	95zZRzlXl3KjJYN8EVh/vp1mQX4/PSPg7wRP0TZ9BVSI9nGVucCp3MBMoMDUE+JBloKoYS4yDsnyt
	xVmiwSYOte/CK+e5EMTFLo0fiRneBShBqn0CsSatN7FpzPbxlcHrgM+X15SICa2MRn9alkSz3iZfa
	qEmVe2CyDGW3l3+KUcMbc7RZzOUCk6T8sVxMMi8QIb09FjoCaLrHYgTkp+djY/Z62e5GFtiw1V8Kk
	MlphgLrKeE7DRHBk/gUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovq0d-0019rC-T2; Fri, 18 Nov 2022 01:17:35 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovq0Y-0019pl-VV
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:17:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8E6EB24E20C;
	Fri, 18 Nov 2022 09:17:18 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:17:17 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:17:16 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/8] Basic device tree support for StarFive JH7110 RISC-V SoC
Date: Fri, 18 Nov 2022 09:17:06 +0800
Message-ID: <20221118011714.70877-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_171731_325960_BEEB0334 
X-CRM114-Status: GOOD (  14.29  )
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

The original patch series "Basic StarFive JH7110 RISC-V SoC support" [1]
is split into 3 patch series. They respectively add basic clock&reset,
pinctrl and device tree support for StarFive JH7110 SoC. These patch
series are independent, but the Visionfive2 board can boot up successfully
only if all these patches series applied. This one adds basic device
tree support. This patch series is pulled out from the patch 1~6 and
patch 27~30 of v1 [1]. You can simply get or review the patches at the
link [2].

[1]: https://lore.kernel.org/all/20220929143225.17907-1-hal.feng@linux.starfivetech.com/
[2]: https://github.com/hal-feng/linux/commits/visionfive2-minimal

Changes since v1:
- Rebased on tag v6.1-rc5.
- Added blank line in patch 1. (by Krzysztof)
- Rebased patch 4 and 6 on the newest code. (by Conor)
- Dropped patch 5. (by Conor)
- Removed the quirk of JH7100 in patch 6, considering this patch series
  should only add support for JH7110.
- For patch 27, added Co-developed-by tag for Jianlong and me. Renamed
  cpu labels to "S76_0", "U74_*" instead of "cpu*" following the style
  of jh7100.dtsi. Moved all "clock-frequency" properties to the board dts.
  Rewrote clock-controller nodes and deleted reset-controller nodes for
  using auxiliary bus. Rewrote gpio nodes following generic pinctrl
  bindings. Removed the redundant second reset entry of uart nodes.
- For patch 28, added Co-developed-by tag for Jianlong and me. Added a
  chosen node. Removed reserved-memory node. Added fixed frequency clock
  nodes for overriding the "clock-frequency" properties. Rewrote the gpio
  nodes following generic pinctrl bindings.
- Dropped patch 30. (by Conor)
- Reworded the commit messages.

  v1: https://lore.kernel.org/all/20220929143225.17907-1-hal.feng@linux.starfivetech.com/

Emil Renner Berthing (7):
  dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive2 board
  dt-bindings: timer: Add StarFive JH7110 clint
  dt-bindings: interrupt-controller: Add StarFive JH7110 plic
  dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
  soc: sifive: ccache: Add StarFive JH7110 support
  riscv: dts: starfive: Add initial StarFive JH7110 device tree
  riscv: dts: starfive: Add StarFive JH7110 VisionFive2 board device
    tree

Hal Feng (1):
  RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../bindings/riscv/sifive,ccache0.yaml        |   7 +-
 .../devicetree/bindings/riscv/starfive.yaml   |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 .../jh7110-starfive-visionfive-v2.dts         | 116 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 437 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/sifive/Kconfig                    |   2 +-
 drivers/soc/sifive/sifive_ccache.c            |   1 +
 12 files changed, 571 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
prerequisite-patch-id: 6b1b43a55b9773bec61ab6c1bbaa54dccbac0837
prerequisite-patch-id: 09c98554df52d17ba5fd604125f8cdd62cbe80d1
prerequisite-patch-id: 29fe0b0c19b6f0cd31114ee9fe17fe9732047f33
prerequisite-patch-id: c59d9908de90e09ba2b9a81aadbf9fb9f00c8f04
prerequisite-patch-id: 94ac03d518993921bcfc9cc9f58d7da0c3528b51
prerequisite-patch-id: 694f7400375f5b85581fc1821e427334507826f2
prerequisite-patch-id: 699d49c4439dadb4b7cf900857f027d050cd6093
prerequisite-patch-id: 40d773f5a19912f731ee5fd4739ed2e3c2157b07
prerequisite-patch-id: 2bc3fd6df5dda116efe882045863d6c88aa81b3a
prerequisite-patch-id: 735e62255c75801bdc4c0b4107850bce821ff7f5
prerequisite-patch-id: b2a923b922e661fa6085185f33c1f1e733db9110
prerequisite-patch-id: b2bbc28354075432f059344eba5a127a653475cf
prerequisite-patch-id: 70eab7b7eee728afcd90e40f6743d1356f6d81ab
prerequisite-patch-id: 6276b2a23818c65ff2ad3d65b562615690cffee9
prerequisite-patch-id: d834ece14ffb525b8c3e661e78736692f33fca9b
prerequisite-patch-id: 4c17a3ce4dae9b788795d915bf775630f5c43c53
prerequisite-patch-id: dabb913fd478e97593e45c23fee4be9fd807f851
prerequisite-patch-id: 22fa141f7f0f80a5d619e9f3f4cf161ad06f108e
prerequisite-patch-id: f306819c257ea73aff8e06b17b5731053cdddfc8
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

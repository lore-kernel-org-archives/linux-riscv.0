Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E1C63705
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXpbTUCxiFon1bLa9WgZqLj/BXecFx8NSq0L50wJx5E=; b=BMHgyTeybRRKlU
	UOARwH/XTXJtQS0zzfuWPWpxJ1O0uS+FVU/AaUYHfqgKpK4S4yAXeXQyIxkL2YqhtmFmNx9wuArof
	eKZ7rk/m0jv2Q8XS4BX4BqLfkXpmbCYkv3biv3GvFtYUEn21CwiBnaeXm+EZCO89GgnAnm9cvyYPT
	zaRDbHtrV5HvC595/VXlr2+x6hUi9b081GMY6qjHsXB4kCIufE425ZnKUKDZ7Lm6741hKs9Aexwp9
	M1dq1jrSDbbQ00kM0oSTeb7fUhYwq9ikaXwF96FbzOFk7SyLrYSicOpYJucqCvpeqbGLFyH+BAL8H
	LzZj/KSX48FqmC+Lw2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CJD-009ovO-L6; Thu, 08 Dec 2022 08:31:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CJ9-009nGx-12
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:31:09 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 85A6624DFD7;
	Thu,  8 Dec 2022 16:30:07 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:30:07 +0800
Received: from localhost.localdomain (113.72.146.33) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:30:06 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] JH7110 PMU Support
Date: Thu, 8 Dec 2022 16:29:52 +0800
Message-ID: <20221208082955.10653-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [113.72.146.33]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_003107_406683_E5213E2F 
X-CRM114-Status: GOOD (  17.27  )
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

Hello,

This patchset adds PMU (Power Management Unit) controller driver for the
StarFive JH7110 SoC. In order to meet low power requirements, PMU is
designed for including multiple PM domains that can be used for power
gating of selected IP blocks for power saving by reduced leakage
current. The first patch adds device tree binding for PM domain provider
and consumer. The second patch adds pmu driver and support JH7110 SoC.
The last patch adds device node about pmu to JH7110 dts. 

The series has been tested on the VisionFive 2 boards which equip with
JH7110 SoC and works normally.

The last patch should be applied after the following patchset:
https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/

Changes in v2:
- Squashed 1st patch (dt-bindings header) into 2nd which is related to
  dt-bindings stuff.
- Renamed the dt-bindings header 'jh7110-power.h' to
  'starfive,jh7110-pmu.h' and used dual license for it.
- Renamed the dt-bindings 'starfive,jh71xx-power.yaml' to
  'starfive,jh71xx-pmu.yaml', dropped items from properties.
- Change of MAINTAINERS: added the entry of 'starfive soc drivers';
  changed status to 'Supported' for the entry of
  'STARFIVE JH71XX PMU CONTROLLER DRIVER' and sorted the lines alphabetically.
- Dropped the header file 'include/soc/starfive/pm_domains.h'.
- Dropped starfive_pmu_hw_event_turn_on() and starfive_pmu_hw_event_turn_off().
- Added 'default SOC_STARFIVE' and expanded help text in the Kconfig.
- Added a JH71XX_PMU_ prefix to those macro definitions in driver.
- Replaced the data type 'uint8_t / uint32_t' with 'u8 / u32'.
- Fixed some complains by using checkpatch.pl
- Added spinlock to jh71xx_pmu_int_enable().
- Dropped spinlock from jh71xx_pmu_interrupt().
- Used jh71xx_pmu_ as prefix to all functions.
- Replaced io accessors '__raw_readl / __raw_writel' with 'readl / writel'.
- Added jh71xx_pmu_get_state() to the beginning of jh71xx_pmu_set_state().
- Added more detailed comment about controlling power domain.
- Simplified the usage of loop when performing pm_genpd_init() to register
  power domain.
- Added more detailed description about the features of power domain
  hardware to commit message in 2nd patch.
- Replaced dev_info() with dev_dbg() in jh71xx_pmu_set_state().
- Decreased the timeout numbers of polling power status when switching
  power mode.

Previous versions:
v1 - https://lore.kernel.org/all/20221118133216.17037-1-walker.chen@starfivetech.com/

Best regards,
Walker

Walker Chen (3):
  dt-bindings: power: Add starfive,jh71xx-pmu
  soc: starfive: Add StarFive JH71XX pmu driver
  riscv: dts: starfive: add pmu controller node

 .../bindings/power/starfive,jh71xx-pmu.yaml   |  45 ++
 MAINTAINERS                                   |  14 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   7 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |  11 +
 drivers/soc/starfive/Makefile                 |   3 +
 drivers/soc/starfive/jh71xx_pmu.c             | 396 ++++++++++++++++++
 .../dt-bindings/power/starfive,jh7110-pmu.h   |  17 +
 9 files changed, 495 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
 create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h


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

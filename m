Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4987C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W/sz8YUFYa1OVunbLvnZ1612qFFUTxDL41dZVymiFro=; b=32zv7PF2h9J/Kk
	Nylh4SK3hqPvRdTrVT31iNIQaQ5WF8fTe19GkuXiFMYYpLeYGuPv/hbWWt+yX1Oa+7ewBqZIVk9FI
	V1y631KIbsU8yoIJHOmY7EAXgBBPEl+4jDHdwwpCbJRMF7AKroEiUmXafViaZKAkVpEIpnd2a3b5Q
	2GyFDidmQ15E23Tua2AgLTo3ury3o9kukD+LhznX5J75uu+OPJXRaf8KyseABKabj4BwQshIxY3Ig
	OPEy+yQgKeCAD64l+G6gUNC5kC3SV1OcjbdSYkf7ClNzNMVpdwHUJraifl3enuLvpSuMTjK0v01Hc
	np7Al9KmTOyMU3f28AhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKA4-0091ZS-6O; Mon, 16 Jan 2023 07:44:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK9v-0091QR-52
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 07:44:01 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C05EA24E13F;
	Mon, 16 Jan 2023 15:43:10 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:10 +0800
Received: from localhost.localdomain (113.72.144.207) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:09 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] JH7110 PMU Support
Date: Mon, 16 Jan 2023 15:42:56 +0800
Message-ID: <20230116074259.22874-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_234359_531515_176B5A45 
X-CRM114-Status: GOOD (  20.01  )
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
https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/

Changes in v3:
- Rebased on tag v6.1.
- Renamed the dt-bindings 'starfive,jh71xx-power.yaml' to
  'starfive,jh7110-pmu.yaml' which is matching compatible.
- Fixed wrong indentation and error when running 'make dt_binding_check'
  in dt-bindings.
- Changed the license of the dt-bindings header to be same with
  dt-bindings.
- Changed a little bit on dependency conditions in Kconfig of driver.
- Dropped some macros that are temporarily useless.
- Simplified the definition of macro 'JH71XX_PMU_INT_ALL_MASK'.
- Changed the sorting of structure members, such as 'struct
  jh71xx_domain_info', 'struct jh71xx_pmu', etc.
- Modified detailed comment about controlling power domain.
- Dropped useless comment when running 'platform_get_irq'.

v2 - https://lore.kernel.org/all/20221208084523.9733-1-walker.chen@starfivetech.com/

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

v1 - https://lore.kernel.org/all/20221118133216.17037-1-walker.chen@starfivetech.com/

Best regards,
Walker

Walker Chen (3):
  dt-bindings: power: Add starfive,jh7110-pmu
  soc: starfive: Add StarFive JH71XX pmu driver
  riscv: dts: starfive: add pmu controller node

 .../bindings/power/starfive,jh7110-pmu.yaml   |  45 ++
 MAINTAINERS                                   |  14 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   7 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |  12 +
 drivers/soc/starfive/Makefile                 |   3 +
 drivers/soc/starfive/jh71xx_pmu.c             | 384 ++++++++++++++++++
 .../dt-bindings/power/starfive,jh7110-pmu.h   |  17 +
 9 files changed, 484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
 create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
prerequisite-patch-id: 54ce870d6ea747466474b5d4105cfbc05e1b01ab
prerequisite-patch-id: e8dd8258a4c4062eee2cf07c4607d52baea71f3a
prerequisite-patch-id: 057fa35870d8d7d22a57c13362588ffb9e9df316
prerequisite-patch-id: 102368a6ff799c4cb639aed513deff09c1839161
prerequisite-patch-id: 7c1a50a37919fedbbd336ca5dec295ac63c2a89d
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: 87cb528acd9a7f1ffe7475d7261553f6a4de5753
prerequisite-patch-id: 417736eb958e1158c60a5ed74bc2350394321a80
prerequisite-patch-id: a137312ca162b5712e28719f77d0da78e9fdd778
prerequisite-patch-id: f7c548b4619f491ce27f319242c4e3685c76173b
prerequisite-patch-id: 4d90febab2fb7928f50a73104e7454312b9ce6c8
prerequisite-patch-id: 645a807d50e0e56593ffdc6c3b50ea54a230827a
prerequisite-patch-id: 165f8cd740ae60585d22c95b99a0689084d468e3
prerequisite-patch-id: 480d910deccadc2947b3318c3c13dfa0882c8e0d
prerequisite-patch-id: 1d1cb90ec12dfc9312e448759c7cab89f2bc6394
prerequisite-patch-id: 5f539ac7c96023b36489c6da7c70c31eaf64a25b
prerequisite-patch-id: 6bb9a780c62af3bcc2368dfd20303c7b1bc91e23
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: e3b986b9c60b2b93b7812ec174c9e1b4cfb14c97
prerequisite-patch-id: 2e03eeb766aefd5d38f132d091618e9fa19a37b6
prerequisite-patch-id: e0ba7af0f8d3d41844da9fbcba14b548cbc18f55
prerequisite-patch-id: c1f8603e58c64828d0f36deac9b93c24289d8e05
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

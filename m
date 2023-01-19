Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD92C00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H7KCB+wN2QYK0gb5Xou+Atn3kWF5wC76REWZrbCclAE=; b=pV0J3EZKZWIdvr
	qwzauyi+qc44xqob3U33bjVDqBxxw9Zv89CnUjiEFkA0eNv9IIqWRKhooFRwd1pqI2eKupBKC2W1K
	8XCW5Hh2WRUJ/iySinFFNQeWVOtAEU6wyBfRTNwhqav6VU8g7X1S5jKu+KtlolgWYbB89p9jGM5U6
	WY53TcpsLa1mhPU9swF5UxfYyLnsDUU++tXAvUF3Y8QanCM0UHIA9PiTNHEqj4zNS05qlWcuIxB7q
	EVey1ErxQEgeHCOaHuieFq7hZv4afPEEfjGOAmiBB6uKTNG9Y517BDqkT3xPTv7C07p+ZOx0eG7Gb
	oRJzHFO8HLw8dlmn4nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRUQ-004J6b-9L; Thu, 19 Jan 2023 09:45:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRUN-004J0A-AZ
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 09:45:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4267B24DBCE;
	Thu, 19 Jan 2023 17:44:59 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 17:44:59 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 17:44:57 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?=
	<heiko@sntech.de>, "Rafael J . Wysocki" <rafael@kernel.org>, Walker Chen
	<walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] JH7110 PMU Support
Date: Thu, 19 Jan 2023 17:44:45 +0800
Message-ID: <20230119094447.21939-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_014543_671156_4AB4EFD2 
X-CRM114-Status: GOOD (  20.09  )
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

The series has been tested on the VisionFive 2 boards which equip with
JH7110 SoC and works normally.

Changes since v3:
- Rebased on Linux 6.2-rc4.
- Dropped the statement that 'is_on' is set in error case in
  jh71xx_pmu_get_state().
- Replaced dev_info() with dev_dbg() at the bottom of
  jh71xx_pmu_probe().
- Added '.suppress_bind_attrs = true,' for jh71xx_pmu_driver structure.
- Dropped patch 3, which is about device tree node of pmu for jh7110.
  Because it depends on the submission of others, it will be upstream
separately later.

  v3: https://lore.kernel.org/all/20230116074259.22874-1-walker.chen@starfivetech.com/

Changes since v2:
- Rebased on Linux 6.1.
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

  v2: https://lore.kernel.org/all/20221208084523.9733-1-walker.chen@starfivetech.com/

Changes since v1:
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

  v1: https://lore.kernel.org/all/20221118133216.17037-1-walker.chen@starfivetech.com/

Best regards,
Walker

Walker Chen (2):
  dt-bindings: power: Add starfive,jh7110-pmu
  soc: starfive: Add StarFive JH71XX pmu driver

 .../bindings/power/starfive,jh7110-pmu.yaml   |  45 ++
 MAINTAINERS                                   |  14 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |  12 +
 drivers/soc/starfive/Makefile                 |   3 +
 drivers/soc/starfive/jh71xx_pmu.c             | 383 ++++++++++++++++++
 .../dt-bindings/power/starfive,jh7110-pmu.h   |  17 +
 8 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
 create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h


base-commit: 5dc4c995db9eb45f6373a956eb1f69460e69e6d4
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

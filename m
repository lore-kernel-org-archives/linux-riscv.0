Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6713FC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RppSy54ieNptf/oCMiAAH2PHNNVpeplt1vI6WI2Guvo=; b=wLEZHfEs0ZSB/N
	vvVQj56NEmWrDJ9pcb8zEGmNB0PsX3mHLV/OQILZb2I2uVe1Yx5J0SscXhnAJxOi68xkOdAd+Yt6v
	P/IvGBXC2UabcmNjWh6+r6Q0r4NP7hTDYNvCuDtAFo3B2C6p93atiBD+IPR53Hf5u3NmCRm0j2vnm
	Zo35qS4gUcnwDh04pj5limtl4SWi2YFeKK/2jdSSKuII6WP1JDzUwxPWDBnOr2lwnZDh4ILaUv/ue
	8Tc2fRh45TyW0Ei7ecUNhVhuTBPqAxnh23abh2j0KfWwxI7I0OrAy6heScb8koDIWL9t2E0muEBxJ
	fgROyPxk12EufxXgeWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1e-004ifS-2e;
	Wed, 10 May 2023 01:53:54 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1c-004iaQ-1M
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 01:53:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 066CF24E199;
	Wed, 10 May 2023 09:53:14 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:13 +0800
Received: from ubuntu.localdomain (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:12 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/5] Add JH7110 AON PMU support
Date: Tue, 9 May 2023 18:53:06 -0700
Message-ID: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_185352_635909_D01AB75E 
X-CRM114-Status: GOOD (  10.83  )
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

This patchset adds aon power domain driver for the StarFive JH7110 SoC.
It is used to turn on/off dphy rx/tx power switch. It also can use syscon
operation. The series has been tested on the VisionFive 2 board.

This patchset should be applied after the patchset [1]:
[1] https://lore.kernel.org/all/20230401111934.130844-1-hal.feng@starfivetech.com/

changes since v2:
- Updated commit message.
- Changed "starfive,jh7110-aon-pmu" to "starfive,jh7110-aon-syscon".
- Dropped patch 3: Modify ioremap to regmap.
- Changed "pmu_parse_dt" to "pmu_parse_irq".
- Dropped "pmu_parse_dt" function in aon pmu.
- Changed copyright to "2022-2023" in "starfive,jh7110-pmu.h".
- Replaced regread/regwrite operation with io_read/io_write operation.

v2: https://lore.kernel.org/all/20230419035646.43702-1-changhuang.liang@starfivetech.com/

changes since v1:
- Updated commit message.
- Changed "starfive,jh7110-pmu-dphy" to "starfive,jh7110-aon-pmu".
- Put if condition under allOf in .yaml file.
- Updated spelling error.
- Dropped patch 4: Add pmu type operation.
- Changed "jh71xx_pmu_general_set_state" to "jh7110_pmu_set_state" and moved it in call back.
- Changed "jh7110_pmu_general_parse_dt" to "jh7110_pmu_parse_dt" and moved it in call back.
- Used pmu_status save the pmu status offset.
- Changed "JH71XX_PMU_DPHY_SWITCH" to "JH71XX_AON_PMU_SWITCH"
- Changed copyright to "2022-2023"

v1: https://lore.kernel.org/all/20230411064743.273388-1-changhuang.liang@starfivetech.com/


Changhuang Liang (5):
  dt-bindings: power: Add JH7110 AON PMU support
  soc: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
  soc: starfive: Extract JH7110 pmu private operations
  soc: starfive: Add JH7110 AON PMU support
  riscv: dts: starfive: jh7110: Add AON PMU node

 .../bindings/power/starfive,jh7110-pmu.yaml   |  28 +++-
 MAINTAINERS                                   |   1 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   6 +
 drivers/soc/starfive/Kconfig                  |   4 +-
 drivers/soc/starfive/jh71xx_pmu.c             | 138 ++++++++++++++----
 .../dt-bindings/power/starfive,jh7110-pmu.h   |   5 +-
 6 files changed, 148 insertions(+), 34 deletions(-)


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C3EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ol8p55lEdSL7/6S/nsgkX02TH2zqs4weFnjAlFuARFI=; b=OJEIDEfuizBLSp
	zylcHDIvvtUSM0FfBtpjJjkg/Lc9wwPxZSyZRtmX4HtY66gNQhiKlrXiXg2n9cThalmqjx56NSqCR
	SDNYriCCPYElUhhbQbm3elj/umuu+tLr6yb1dd5FpG6ku0qeLwiSPKBO/U+H0EGGO/QUAjpmsPEHp
	d+rGBsVJEzVReFpIciVRipVW0J6arVurwyj55vChdcR7CJLmVTbwntAKht3YwrmJsucNKbJcN5k24
	OfFhUxfbEEQvh0i5wenc3z7/2Bmz+Or8XhhtfyAsoLbHF8lzMpKxR90H7PpnFiVXtALhKt/PI7VrY
	RVkTUXK62u+H0TwhMY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1o-00H1La-0w;
	Wed, 12 Jul 2023 09:20:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJW1k-00H19W-2l
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:20:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AB1068327;
	Wed, 12 Jul 2023 17:20:08 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:08 +0800
Received: from localhost.localdomain (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 17:20:07 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v7 0/9] Add STG/ISP/VOUT clock and reset drivers for StarFive JH7110
Date: Wed, 12 Jul 2023 17:19:58 +0800
Message-ID: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_022053_255002_986E3CA5 
X-CRM114-Status: GOOD (  18.96  )
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

This patch serises are base on the basic JH7110 SYSCRG/AONCRG
drivers and add new partial clock drivers and reset supports
about System-Top-Group(STG), Image-Signal-Process(ISP)
and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
clocks and resets could be used by DMA, VIN and Display modules.

Patches 1 and 2 are about the System-Top-Group clock and reset
generator(STGCRG) part. The first patch adds docunmentation to
describe STG bindings, and the second patch adds clock driver to
support STG clocks and resets as auxiliary device for JH7110.

Patches 3 and 4 are about the Image-Signal-Process clock and reset
gennerator(ISPCRG) part. The first patch adds docunmentation to
describe ISP bindings, and the second patch adds clock driver to
support ISP clocks and resets as auxiliary device for JH7110.
And ISP clocks should power on and enable the SYSCRG clocks first
before registering.

Patches 5 and 6 are about the Video-Output clock and reset
generator(VOUTCRG) part. The first patch adds docunmentation to
describe VOUT bindings, and the second patch adds clock driver to
support VOUT clocks and resets as auxiliary device for JH7110.
And VOUT clocks also should power on and enable the SYSCRG clocks
first before registering.

Patch 7 adds struct members to support STG/ISP/VOUT resets.
Patch 8 adds external clocks which ISP and VOUT clock driver need.
Patch 9 adds device node about STGCRG, ISPCRG and VOUTCRG to JH7110 dts.

Changes since v6:
- Rebased on the Linux 6.5-rc1.
- Dropped the unnecessary selections in the Kconfig.
- Dropped the patches about the PMU node and MAINTIANERS.
- Add the reviews.

v6: https://lore.kernel.org/all/20230518101234.143748-1-xingyu.wu@starfivetech.com/

Changes since v5: 
- Rebased on the Linux 6.4-rc2.
- Modified the reset name about VOUTCRG to fix the error with
  CONFIG_FORTIFY_SOURCE=y
- Added the patch about pmu node.

v5: https://lore.kernel.org/all/20230424135409.6648-1-xingyu.wu@starfivetech.com/

Changes since v4: 
- Rebased on the lastest patches about fixing the basic clock and reset drivers.
- Dropped the 'dev_set_drvdata()' in STG clock driver.
- Modified the data with 'dev_set_drvdata()' in ISP/VOUT clock driver
  and move the struct about the data to JH7110 header file, which both
  ISP and VOUT clock drivers will use.

v4: https://lore.kernel.org/all/20230411135558.44282-1-xingyu.wu@starfivetech.com/

Changes since v3: 
- Rebased on the lastest JH71X0 clock and reset driver of patchset[1]
  and modified the parameters of the register reset functions.
- The patch 1 combined three commits on STG/ISP/VOUT resets into one.
  And Changed the auxiliary_device_id name from
  "clk_starfive_jh71x0.reset-*" to "clk_starfive_jh7110_sys.rst-*".
- Added a maintainer in STARFIVE JH71X0 CLOCK DRIVERS.

v3: https://lore.kernel.org/all/20230314124404.117592-1-xingyu.wu@starfivetech.com/

Changes since v2:
Patch 1:
- Dropped the modification of maintainers.
- Modified clock and reset names in the dt-bindings header files.
Patch 3:
- Added 'Emil Renner Berthing' as the author.
- Used 'default m' in Kconfig file.
- Changed the flags of 'CLK_IGNORE_UNUSED' to 0 or 'CLK_IS_CRITICAL'.
Patch 4:
- Dropped the 'reset-names' property.
- Shortened the clock and reset names in the dt-bindings header files.
Pacth 6:
- Used 'default m' in Kconfig file.
- Changed the flags of 'CLK_IGNORE_UNUSED' to 0.
- Set reset_control struct to a local variable because it just is used
  one time in probe.
Pacth 7:
- Dropped the 'reset-names' property.
Patch 9:
- Used 'default m' in Kconfig file.
- Set reset_control struct to a local variable because it just is used
  one time in probe.
Patch 10:
- Changed the order of externel clock in alphanumerical order.
Patch 11:
- Dropped the 'reset-names' property in ispcrg and voutcrg node.

v2: https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/

Changes since v1:
- Modified the binding and dropped the indentation.
- Removed the useless header files in the drivers.
- Used an array lookup instead of a pile of conditions about parent
  clocks' name.
- Added clocks operation on driver remove.

v1: https://lore.kernel.org/all/20230120024445.244345-1-xingyu.wu@starfivetech.com/

Emil Renner Berthing (1):
  clk: starfive: Add StarFive JH7110 System-Top-Group clock driver

Xingyu Wu (8):
  dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and
    reset generator
  dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and
    reset generator
  clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver
  dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset
    generator
  clk: starfive: Add StarFive JH7110 Video-Output clock driver
  reset: starfive: jh7110: Add StarFive STG/ISP/VOUT resets support
  riscv: dts: starfive: jh7110: Add DVP and HDMI TX pixel external
    clocks
  riscv: dts: starfive: jh7110: Add STGCRG/ISPCRG/VOUTCRG nodes

 .../clock/starfive,jh7110-ispcrg.yaml         |  87 +++++++
 .../clock/starfive,jh7110-stgcrg.yaml         |  82 ++++++
 .../clock/starfive,jh7110-voutcrg.yaml        |  90 +++++++
 .../jh7110-starfive-visionfive-2.dtsi         |   8 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 +++++
 drivers/clk/starfive/Kconfig                  |  24 ++
 drivers/clk/starfive/Makefile                 |   3 +
 .../clk/starfive/clk-starfive-jh7110-isp.c    | 232 +++++++++++++++++
 .../clk/starfive/clk-starfive-jh7110-stg.c    | 173 +++++++++++++
 .../clk/starfive/clk-starfive-jh7110-vout.c   | 239 ++++++++++++++++++
 drivers/clk/starfive/clk-starfive-jh7110.h    |   6 +
 .../reset/starfive/reset-starfive-jh7110.c    |  30 +++
 .../dt-bindings/clock/starfive,jh7110-crg.h   |  74 ++++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   |  60 +++++
 14 files changed, 1175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-isp.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

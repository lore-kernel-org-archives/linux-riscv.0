Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F47C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 03:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U4ag3bUiVCCBnD6Cafsh55FKnx6fUyubIq+PezNqCrg=; b=O5jhu6y17Hrrz1
	mZgymKQ6WMFLXPx462yLs6piisfy2o0v3UPus60JZv1L2JxvBN3GFVG+OlISxPbmrFjJCT5MIxs8s
	a7cExQ0/1Jt8/Aop781oZ6q9wn1Dqmw/KpUwfsR8gl2K0VaTC6aohQcr3qU0yInbL86tn++/ViQSg
	7OdcyuMPiyOSehYB5G9QdCUSUKfa+1lfOhBG87mxkOCPS8OZM9OGakOBN7BhJCtpboV03u3HZnztD
	9Z7wm5awGIZMotglx1tbkHg0QAjwYZlfg0KTOtLB/8wPlfqe+kfjEF9RDcF+FPUCd2egrXdN/tyzv
	Pyp2XSYW+P7cYKX3jjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdw1-00F3GI-2k;
	Thu, 16 Mar 2023 03:05:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdvz-00F3AV-0j
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 03:05:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5DC2524E201;
	Thu, 16 Mar 2023 11:05:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:16 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:15 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2 0/6] Add PLL clocks driver for StarFive JH7110 SoC
Date: Thu, 16 Mar 2023 11:05:08 +0800
Message-ID: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_200543_581268_138EDE3D 
X-CRM114-Status: GOOD (  13.29  )
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

This patch serises are to add PLL clocks driver and providers by writing
and reading syscon registers for the StarFive JH7110 RISC-V SoC.

PLL are high speed, low jitter frequency synthesizers in JH7110.
Each PLL clocks work in integer mode or fraction mode by some dividers,
and the dividers are set in several syscon registers.
The formula for calculating frequency is:
Fvco = Fref * (NI + NF) / M / Q1

The first patch adds docunmentation to describe PLL clock bindings,
and the second patch adds driver to support PLL clocks for JH7110.
The patch 3 modifies the syscon dt-bindings and adds optional
pateerProperties about PLL clock controller. The patch 4 modifies the
SYSCRG dibindings and adds PLL clock inputs. The patch 5 modifies the
system clock driver and changes PLL clock source from PLL clock
controller instead of the fixed factor clocks. The last patch adds PLL
clock node and modifies the syscrg node in dts file.

This patchset should be applied after these patchset about JH7110 clock
driver[1] and syscon dt-bindings[2].
[1] https://lore.kernel.org/all/20230221024645.127922-1-hal.feng@starfivetech.com/
[2] https://lore.kernel.org/all/20230315055813.94740-1-william.qiu@starfivetech.com/

Changes since v1:
- Changed PLL clock node to be child of syscon node in dts.
- Modifed the definitions and names of function in PLL clock driver.
- Added commit to update syscon and syscrg dt-bindings.

Xingyu Wu (6):
  dt-bindings: clock: Add StarFive JH7110 PLL clock generator
  clk: starfive: Add StarFive JH7110 PLL clock driver
  dt-bindings: soc: starfive: syscon: Add optional patternProperties
  dt-bindings: clock: jh7110-syscrg: Add PLL clock inputs
  clk: starfive: jh7110-sys: Modify PLL clocks source
  riscv: dts: starfive: jh7110: Add PLL clock node and modify syscrg
    node

 .../bindings/clock/starfive,jh7110-pll.yaml   |  46 ++
 .../clock/starfive,jh7110-syscrg.yaml         |  20 +-
 .../soc/starfive/starfive,jh7110-syscon.yaml  |  39 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  16 +-
 drivers/clk/starfive/Kconfig                  |   9 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh7110-pll.c    | 420 ++++++++++++++++++
 .../clk/starfive/clk-starfive-jh7110-pll.h    | 293 ++++++++++++
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  35 +-
 .../dt-bindings/clock/starfive,jh7110-crg.h   |   6 +
 10 files changed, 845 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.h


base-commit: 8ca09d5fa3549d142c2080a72a4c70ce389163cd
prerequisite-patch-id: ebaead89601acf604e83224f4df8d57a7f4331b8
prerequisite-patch-id: 609d5d7c55b0b8e2967966673dab8f62a6fceab9
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: a4255724d4698f1238663443024de56de38d717b
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: dfb8d5a1fb262127d7a8e1ef3e97f455aaa19509
prerequisite-patch-id: 11b0f5746bbfbf8aa5c5746dcd7b0dce62e7f922
prerequisite-patch-id: 315303931e4b6499de7127a88113763f86e97e16
prerequisite-patch-id: 40cb8212ddb024c20593f73d8b87d9894877e172
prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
prerequisite-patch-id: 189a0f41ba4eecd4f3f35c503baac8aed8ccd7de
prerequisite-patch-id: 1117ecaa40a353c667b71802ab34ecf9568d8bb2
prerequisite-patch-id: 25923a0c77e92631ed3cd8a163d789daad35f0f8
prerequisite-patch-id: 6a6f6215f09932e68fdfd294df2e813ec9d2481f
prerequisite-patch-id: 2cc95b47cad25fd9b875d27f4e8e3d84eb70274b
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: e7773c977a7b37692e9792b21cc4f17fa58f9215
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 0a0ac5a8a90655b415f6b62e324f3db083cdaaee
prerequisite-patch-id: 2ffbced093555055b5796c0c0572b3b0216f8938
prerequisite-patch-id: 1be0fb49e0fbe293ca8fa94601e191b13c8c67d9
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

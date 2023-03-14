Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565F7C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CdXjwFQ4VnCpNzVAjDR7JpiJEPSf4tB0rW8GFGsePr8=; b=IH5ROoDE6rn0ug
	x3g28OJdBkvyj/S1YIO1h0pF5L+tMTFpdGGlA+HeoYKTnk5dY4DdzjcpOCDwGgz9BCXoz4VNlSmM1
	QI8llm4YSd+4k4tWZlKUFJo8HPO7tpImhdgWOiZ83a236wOiAX9SEEqge2WzBp+MT1DqWuLBPIwxm
	v/qkryM2sIv99JNpnVGvqZmE7gBZGXnhSJRbFwb1GU+J5nd6ech1/WTgNDMLzuvj7STuOeP8Dxumc
	R2+j4u3Q73Ja7uwZTPyt2VcREJHzeP/mbZ9Hntr4JkpSKhR7LnSGZf8OMfqhdNy8MHVmW6kycbFob
	rvzDvvjknhMnJRGkcoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41g-00AAWs-1Y;
	Tue, 14 Mar 2023 12:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41c-00AATe-2z
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Mar 2023 12:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2BE7huc/ojPtm76I5PJQwSCr8Z8SoG4UnWO2L23IlKw=; b=eL+Usuq66YGRkIHtdHNGkMNZwh
	8hKstvZ4zHv5CKsLybRdD7JzvEY/fxP6JFV14bEkHyzSj/N7QEzrfT33M+2Lc1VOCsxwSmDaBuD+N
	1Uz4nobiRUIO2HxZp0hAYHD6CR6m8lSVewFpHWRIH+hvNKbU5eoRwfeAIRTSsq/EwcWytmjX5oDvT
	ftDGfb6n7JdDruI52mZGiBvL0gBLRgfd6v0QOUWNK1wi7EQnZtAHhenfpog/Glq22NNBXVDxg7cOb
	HDO7L3kVb6npKUt5rOonUGEacy5hVsyMH+Uch0gfpmMKlbnMKRlc11bG8hbA9qLYgHBYuukjW5UBi
	gqk6cOZw==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc41X-001mgi-2b
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 12:45:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 51E5924E1D3;
	Tue, 14 Mar 2023 20:44:06 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:06 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 20:44:05 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v3 00/11] Add new partial clock and reset drivers for StarFive JH7110
Date: Tue, 14 Mar 2023 20:43:53 +0800
Message-ID: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_124504_522339_1AA166D1 
X-CRM114-Status: GOOD (  15.35  )
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

This patch serises are to add new partial clock drivers and reset
supports about System-Top-Group(STG), Image-Signal-Process(ISP)
and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.

Patches 1 to 3 are about the System-Top-Group clock and reset
generator(STGCRG) part.
The first patch adds docunmentation to describe STG bindings, and 
the second patch adds support about STG resets. The last patch adds
clock driver to support STG clocks for JH7110.

Patches 4 to 6 are about the Image-Signal-Process clock and reset
gennerator(ISPCRG) part.
The first patch adds docunmentation to describe ISP bindings, and 
the second patch adds support about ISP resets. The last patch adds
clock driver to support ISP clocks for JH7110.

Patches 7 to 9 are about the Video-Output clock and reset
generator(VOUTCRG) part.
The first patch adds docunmentation to describe VOUT bindings, and 
the second patch adds support about VOUT resets. The last patch adds
clock driver to support VOUT clocks for JH7110.

Patch 10 adds external clocks which ISP and VOUT clock driver need.
Patch 11 adds device node about STGCRG, ISPCRG and VOUTCRG to JH7110 dts.

Patches 2, 3, 5, 6, 8 and 9 are dependent on the patchset [1] which
is about JH71x0 clock and reset driver.
Patchdes 10 and 11 are dependent on the patchset [1] and [2] which is
about JH7110 device tree and PMU node.
This patchset should be applied after the patchset [1], [2]:
[1] https://lore.kernel.org/all/20230311090733.56918-1-hal.feng@starfivetech.com/
[2] https://lore.kernel.org/all/20230116074259.22874-4-walker.chen@starfivetech.com/

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

v2:https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/

Changes since v1:
- Modified the binding and dropped the indentation.
- Removed the useless header files in the drivers.
- Used an array lookup instead of a pile of conditions about parent
  clocks' name.
- Added clocks operation on driver remove.

v1: https://lore.kernel.org/all/20230120024445.244345-1-xingyu.wu@starfivetech.com/

Emil Renner Berthing (1):
  clk: starfive: Add StarFive JH7110 System-Top-Group clock driver

Xingyu Wu (10):
  dt-bindings: clock: Add StarFive JH7110 System-Top-Group clock and
    reset generator
  reset: starfive: jh7110: Add StarFive System-Top-Group reset support
  dt-bindings: clock: Add StarFive JH7110 Image-Signal-Process clock and
    reset generator
  reset: starfive: jh7110: Add StarFive Image-Signal-Process reset
    support
  clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver
  dt-bindings: clock: Add StarFive JH7110 Video-Output clock and reset
    generator
  reset: starfive: jh7110: Add StarFive Video-Output reset support
  clk: starfive: Add StarFive JH7110 Video-Output clock driver
  riscv: dts: starfive: jh7110: Add DVP and HDMI TX pixel external
    clocks
  riscv: dts: starfive: jh7110: Add STGCRG/ISPCRG/VOUTCRG nodes

 .../clock/starfive,jh7110-ispcrg.yaml         |  87 +++++++
 .../clock/starfive,jh7110-stgcrg.yaml         |  82 ++++++
 .../clock/starfive,jh7110-voutcrg.yaml        |  90 +++++++
 .../jh7110-starfive-visionfive-2.dtsi         |   8 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 +++++
 drivers/clk/starfive/Kconfig                  |  33 +++
 drivers/clk/starfive/Makefile                 |   3 +
 .../clk/starfive/clk-starfive-jh7110-isp.c    | 233 +++++++++++++++++
 .../clk/starfive/clk-starfive-jh7110-stg.c    | 176 +++++++++++++
 .../clk/starfive/clk-starfive-jh7110-vout.c   | 240 ++++++++++++++++++
 .../reset/starfive/reset-starfive-jh7110.c    |  30 +++
 .../dt-bindings/clock/starfive,jh7110-crg.h   |  74 ++++++
 .../dt-bindings/reset/starfive,jh7110-crg.h   |  60 +++++
 13 files changed, 1183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-isp.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-stg.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-vout.c


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
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81DCC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IB408/4HVpBSIiSp3iOuywR+mAya4GOKUUy0iuLjvFY=; b=0fkHnbcUKHPp0i
	0xoy4XqD7ljCUUCamik2eQnAkgvj/6bYG1MUtQUuq/YNX0xGX+Kw/6B1PDJQFH8cjS6JpEOUVtd/7
	mmrfeYwXRfL4KVaGbjGENEElB1iYmsm+sRcQDKoPoPhnQoPzqO+H6yOtmZn7RGbMCNzNbBJM4CxWH
	iNA4AfQZDtmUu6teK2pcfvkZTgZMa/ImEZ6txXCsdyWIdgW12GX/affJcqnf6P70bmcYWl1+eEm54
	nAnw/DrQFwxSGCFnSgDW7DLRdwyHB3nWMce6Y910HJu3cp06EDHE4O8LQi/3lhz0G+bTdEiJsGr+C
	XhsxydGeIesyHgwHA4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTNJ-008SHt-2j; Tue, 21 Feb 2023 14:12:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTNE-008SFn-Oc
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 14:12:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id F0ADC24E01A;
	Tue, 21 Feb 2023 22:11:51 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 22:11:51 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 22:11:50 +0800
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
Subject: [PATCH v1 0/3] Add PLL clocks driver for StarFive JH7110
Date: Tue, 21 Feb 2023 22:11:44 +0800
Message-ID: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_061205_517554_A3682F93 
X-CRM114-Status: GOOD (  12.68  )
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

This patch serises are to add PLL clocks driver and modify
the system clock driver to depend on PLL clocks driver for the 
StarFive JH7110 RISC-V SoC.

PLL are high speed, low jitter frequency synthesizers in JH7110.
Each PLL clocks work in integer mode or fraction mode by some dividers,
and the dividers are set in several syscon registers.
The formula for calculating frequency is: 
Fvco = Fref * (NI + NF) / M / Q1

The first patch adds docunmentation to describe PLL clock bindings,
and the second patch adds driver to support PLL clocks for JH7110 and 
modifies the system clock driver.

This patchset should be applied after this patchset about JH71x0 clock
driver:
https://lore.kernel.org/all/20230221024645.127922-1-hal.feng@starfivetech.com/

Xingyu Wu (3):
  dt-bindings: clock: Add StarFive JH7110 PLL clock generator
  clk: starfive: Add StarFive JH7110 PLL clock driver
  riscv: dts: starfive: jh7110: Add PLL clock node

 .../bindings/clock/starfive,jh7110-pll.yaml   |  45 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  15 +-
 drivers/clk/starfive/Kconfig                  |   9 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jh7110-pll.c    | 433 ++++++++++++++++++
 .../clk/starfive/clk-starfive-jh7110-pll.h    | 286 ++++++++++++
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  40 +-
 .../dt-bindings/clock/starfive,jh7110-crg.h   |  12 +-
 8 files changed, 807 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7110-pll.h


base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
prerequisite-patch-id: 4dc515731ce237184553c1606ffb3afaeb51c3d8
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: a4255724d4698f1238663443024de56de38d717b
prerequisite-patch-id: a798370d170dc2bcc79ed86f741c21c1e6d87c78
prerequisite-patch-id: 203d2500cadc112bd20fefc56eabf1470d3d2d2d
prerequisite-patch-id: 315303931e4b6499de7127a88113763f86e97e16
prerequisite-patch-id: 40cb8212ddb024c20593f73d8b87d9894877e172
prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
prerequisite-patch-id: 94860423c7acc9025249d4bb36652a585bd0a797
prerequisite-patch-id: b5084253283929d9a6d0e66c350400c7c85d034d
prerequisite-patch-id: a428ed7a2aa45abab86923dc467e1e6b08427e85
prerequisite-patch-id: d4f80829fca7ce370a6fad766593cdcb502fa245
prerequisite-patch-id: e3490e19e089fe284334db300ee189b619a61628
prerequisite-patch-id: 34298e3882261bc2d72955b1570cc9612ab7d662
prerequisite-patch-id: 377c5c282a0776feee9acd10b565adbd5275a67e
prerequisite-patch-id: 3ccee718de0750adbf8d0b77d553a2778a344f64
prerequisite-patch-id: 4710f2ac22dca0bdd9ff5d744d2c37cab3c74515
prerequisite-patch-id: 65f2aed865d88e6fa468d2923527b523d4313857
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: e3b986b9c60b2b93b7812ec174c9e1b4cfb14c97
prerequisite-patch-id: a2b3a9cff8a683422eb0ccf3a0850091401812d4
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: ea9a6d0313dd3936c8de0239dc2072c3360a2f6b
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 29aab7148bf56a20acddcb8a11f290705fcc97f6
prerequisite-patch-id: 8adbb4af2c71fde6b8c795bde028157a69c51c31
prerequisite-patch-id: a4689a8a4cc56984b5845b59f5a84e5214d91543
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

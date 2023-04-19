Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED117C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mzuJLjZMewwgBqZyHefrdOLvVdEscnlGgwu9nLou7FQ=; b=jllrmhmlLHx67x
	oGrXBAdpifFlrhILfyr3qfV0PJQFY6ebHwsXIJ+aKd4vHioNQq60BwdPvbim5tgrtNp8MAFQVbLwb
	MrnzuV2Ols9i9RWbEC97RD3NUfjuSR3xms2kPom+Z2fnIrOvjxh+88JxQPzMdXbShQEyeAuYpd10p
	qS9RPSOFeua/HVDycsDSBuSC8onvJpxX+cqzLCu63OTSD1UbaDNffGjSo1X5Sjy3+zPAsR9tW7Y5J
	GaSl7YWmeIoWTUnqPxPtnFkpk1q8cY09wLeePAchP59jGXldMllW/vsisD3MopLE3EbsIPnnE5wrD
	2Rp0htsLWcie3HxrP+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywN-003w08-1Y;
	Wed, 19 Apr 2023 03:57:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywJ-003vxX-00
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:57:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B3E0124E1A4;
	Wed, 19 Apr 2023 11:56:49 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:49 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:48 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [RESEND v2 0/6] Add JH7110 AON PMU support
Date: Tue, 18 Apr 2023 20:56:40 -0700
Message-ID: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_205703_338306_9666643C 
X-CRM114-Status: GOOD (  10.34  )
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
It is used to turn on/off dphy rx/tx power switch. The series has been
tested on the VisionFive 2 board.

This patchset should be applied after the patchset [1]:
[1] https://lore.kernel.org/all/20230414024157.53203-1-xingyu.wu@starfivetech.com/

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

Changhuang Liang (6):
  dt-bindings: power: Add JH7110 AON PMU support
  soc: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
  soc: starfive: Modify ioremap to regmap
  soc: starfive: Extract JH7110 pmu private operations
  soc: starfive: Add JH7110 AON PMU support
  riscv: dts: starfive: jh7110: Add AON PMU node

 .../bindings/power/starfive,jh7110-pmu.yaml   |  15 +-
 MAINTAINERS                                   |   1 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   5 +
 drivers/soc/starfive/Kconfig                  |   4 +-
 drivers/soc/starfive/jh71xx_pmu.c             | 200 +++++++++++++-----
 .../dt-bindings/power/starfive,jh7110-pmu.h   |   3 +
 6 files changed, 174 insertions(+), 54 deletions(-)


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
prerequisite-patch-id: 388b8adbb0fe2daf4d07a21eafd4f1bd50ce2403
prerequisite-patch-id: 1117ecaa40a353c667b71802ab34ecf9568d8bb2
prerequisite-patch-id: b00c6b21fbd0353d88b7c9b09093ba30b765f45b
prerequisite-patch-id: 08ec9027e8a5c6fdf201726833168c7464a9b94d
prerequisite-patch-id: fb5120248e48fe1faf053ae0b490c92507ec2b44
prerequisite-patch-id: 4b93d8d590b0a2abe7b4be5287232c494c35be4a
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: c09c4c68af017b8e5c97b515cb50b70c18a2e705
prerequisite-patch-id: 0df8ccb0e848c2df4c2da95026494bebecede92d
prerequisite-patch-id: 315303931e4b6499de7127a88113763f86e97e16
prerequisite-patch-id: 40cb8212ddb024c20593f73d8b87d9894877e172
prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
prerequisite-patch-id: d57cc467fb036241b9276320ff076c4a30d376d6
prerequisite-patch-id: 6e563d68bc5dbf951d4ced17897f9cc4d56169fe
prerequisite-patch-id: 61ec2caa21fd0fc60e57977f7d16d3f72b135745
prerequisite-patch-id: 1387a7e87b446329dfc21f3e575ceae7ebcf954c
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: 9007c8610fdcd387592475949864edde874c20a2
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 0a0ac5a8a90655b415f6b62e324f3db083cdaaee
prerequisite-patch-id: c9bb2bf387954769731a627a195a2e957506d7c0
prerequisite-patch-id: 3b13e6bd0cb1fede74841bada2a50d30c8049198
prerequisite-patch-id: 3dc2fe994cb83e5bd1faac17b9e40e4d9adf9863
prerequisite-patch-id: 4c4d536c34d6cb607d4d00d4c982175d217832be
prerequisite-patch-id: dd12678b9cdcd6dccdb900c45fe1f6ce11d67fd5
prerequisite-patch-id: 284b5d1b95c6d68bca08db1e82ed14930c98b777
prerequisite-patch-id: 2c2daec388f036ebc8decfaeaa216d979d792c58
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

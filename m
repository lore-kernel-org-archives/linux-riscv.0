Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB210C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWGZ6+cbpijATpFBJiBdwtFizT2f2UWVy5lFxC3srRo=; b=rqJ5YXv/nNgzoK
	VjSLAIZqkK0ZHfGtXKbqbQM/B+Ag56XKcnu6tqbzqLW+dDQJzdXPg96YArfURWHE/nuRu9/oiJ0tE
	sWJjTC/wOwBa1+cv+fQ2G70ugrbJvcCH1iq3plbwhR77EfSOix/t9e7bv7cZep0iGhQuxpGKqEb5j
	PlgKBzKytwz5Nrz3BnZvRNf1fXzygPbWHA9m9ip8/nRDFCyVzOd+OYT1SUrt4VisJJlC6WCcs4qQV
	VmY/jhOl4cn7ypwY2S3V5f56PiB9pEs+MNGT/kOuM8WMsjLGbX6yaMdRkw3TJPf6HTMa6hx0XCgaZ
	1DG5Nouf3OhFc/LuCUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkHR-00GHyc-27;
	Thu, 28 Dec 2023 06:54:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIkHN-00GHtK-2p
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 06:54:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CE72724DBFD;
	Thu, 28 Dec 2023 14:53:30 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 14:53:30 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 14:53:25 +0800
From: Alex Soo <yuklin.soo@starfivetech.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Yangtao Li <frank.li@vivo.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alex Soo <yuklin.soo@starfivetech.com>
Subject: [PATCH 0/3] Add driver for Cadence SD6HC SD/eMMC controller
Date: Thu, 28 Dec 2023 14:53:19 +0800
Message-ID: <20231228065322.1176351-1-yuklin.soo@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_225406_053381_CE6F0B9E 
X-CRM114-Status: GOOD (  10.93  )
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

Starfive JH8100 SoC consists of a Cadence SD/eMMC host controller
(Version 6) with Combo PHY which provides DFI interface to SD/eMMC
removable or embedded devices. This patch adds initial SD/eMMC support
for JH8100 SoC by providing device drivers for Cadence SD/eMMC Version 6
host controller and Combo PHY.  This patch series is depending on the
JH8100 base patch series in [1], [2], and [3].
The relevant dt-bindings documentation has been updated accordingly.

[1] https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
[2] https://lore.kernel.org/lkml/20231206115000.295825-1-jeeheng.sia@starfivetech.com/
[3] https://lore.kernel.org/lkml/20231221083622.3445726-1-yuklin.soo@starfivetech.com/ 

Alex Soo (3):
  dt-bindings: mmc: sdhci-cadence6: add DT bindings documentation
  mmc: sdhci-cadence6: add Cadence SD6HC support
  riscv: dts: starfive: jh8100: Add SD/eMMC device tree nodes

 .../devicetree/bindings/mmc/cdns,sd6hci.yaml  |  65 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/jh8100.dtsi      |  34 ++
 drivers/mmc/host/Kconfig                      |  11 +
 drivers/mmc/host/Makefile                     |   2 +
 drivers/mmc/host/sdhci-cadence6-phy.c         | 384 +++++++++++++
 drivers/mmc/host/sdhci-cadence6.c             | 531 ++++++++++++++++++
 drivers/mmc/host/sdhci-cadence6.h             | 148 +++++
 8 files changed, 1181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/cdns,sd6hci.yaml
 create mode 100644 drivers/mmc/host/sdhci-cadence6-phy.c
 create mode 100644 drivers/mmc/host/sdhci-cadence6.c
 create mode 100644 drivers/mmc/host/sdhci-cadence6.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

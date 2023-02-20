Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4214FC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B7PhknFKgVGRzl7UbW2a2lpNME3XzV1lxXgeTs+zEiE=; b=TIO6bNVZdLQhaG
	D/vP6/roHsFuTj/INvEhYT/WdNPvcMk86cksrQ1kAdSrLVfzLwm124g6ElxqaJ8AqFa/ULmZm/24d
	Swuv92ZU7BZA2Xit6uM/fbdyZai+JWG9FCMinZ3k3sWhybOhdngUO56zsWG4Wlskyb5Hn0EnDqYaa
	4jQCn6T6Orvf5ReTZGQjDah90roXaBPlEcCyQ/r9c7+3q7b0MFXxt9nLrP9olPL5ZEJiS2zsGKGMo
	Li7hroTBftMfcrgugzyW6qAIGQlsjPzC/G4OsPERJES2FIqEVwXI5eES8010RFPREbCyd/5/AWmf7
	Y35/g0vUM2swvwH3Y7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1Qn-003Id9-Om; Mon, 20 Feb 2023 08:21:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1Qj-003IHj-Vi
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 08:21:51 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1832C24E2BC;
	Mon, 20 Feb 2023 16:19:01 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 16:19:01 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Feb
 2023 16:18:59 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: [PATCH v3 0/2] Add watchdog driver for StarFive JH7110 RISC-V SoC
Date: Mon, 20 Feb 2023 16:19:24 +0800
Message-ID: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_002150_334508_5B32855E 
X-CRM114-Status: GOOD (  14.78  )
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

This patch serises are to add watchdog driver for the StarFive JH7110
RISC-V SoC. The first patch adds docunmentation to describe device
tree bindings. The subsequent patch adds watchdog driver and support
JH7110 SoC. And the addition of device tree node will be submitted
after the JH7110 dts merge. This patchset is based on 6.2.

The watchdog driver has been tested on the VisionFive 2 boards which
equip with JH7110 SoC and works normally.

Changes since v2: 
- Added watchdog.yaml and unevaluatedProperties in the dt-binding.
- Removed some unnecessary include files.
- Changed the 'module_param' name and dropped 'soft_noboot'.
- Rrmoved 'CONFIG_OF'.
- Added a check if clock rate is 0.
- Modified the max_timeout calculation formula.
- Removed restart function.
- Removed duplicate checks on the upper and lower bounds of 'count'.
- Removed 'started' variable.
- Added pm_runtime_get_sync() and pm_runtime_put_sync().
- Removed 'firmware_version = 0' variable.
- Drop the device tree node commit.

Changes since v1:
- Renamed the dt-binding 'starfive,wdt.yaml' to 'starfive,jh7110-wdt.yaml'.
- Dropped the '_clk' and 'rst_' about the 'clock-names' and 'reset-names'
  in the dt-binding.
- Updated the example context in the dt-binding 'starfive,jh7110-wdt.yaml'
  to be independent of other patchset.
- Deleted unused macros like 'JH7110_WDOG_INT_EN'.
- Changed the type of 'freq' in the struct from u64 to u32.
- Used 'devm_clk_get_enabled()' instead of 'devm_clk_get()' and
  'clk_prepare_enable()'.
- Removed the operation to get the frequency from the device tree.
- Added watchdog_stop_on_unregister() and watchdog_stop_on_reboot().
- Removed any operations about interrupt.

v2: https://lore.kernel.org/all/20221219094233.179153-1-xingyu.wu@starfivetech.com/
v1: https://lore.kernel.org/all/20221202093943.149674-1-xingyu.wu@starfivetech.com/

Xingyu Wu (2):
  dt-bindings: watchdog: Add watchdog for StarFive JH7110
  drivers: watchdog: Add StarFive Watchdog driver

 .../watchdog/starfive,jh7110-wdt.yaml         |  74 ++
 MAINTAINERS                                   |   7 +
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   2 +
 drivers/watchdog/starfive-wdt.c               | 651 ++++++++++++++++++
 5 files changed, 743 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
 create mode 100644 drivers/watchdog/starfive-wdt.c


base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

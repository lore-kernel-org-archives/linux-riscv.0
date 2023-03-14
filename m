Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEBC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dOYJR160M911Y2+DcqY+uhEK2IucR9i9+VUDeCDH6oI=; b=0vdDqupI0gWf8b
	cfNeugf92M+gMydne5WrivAGTll9qmtDLraD9Bc80Y3j4tRnAGo/EvCDWjdMr6ZHw5mrucu1C5r2u
	XTuMAa3Ix7NByTxPdJBMSl/tY4C3mXv+Hgg5to0V7PMsL05rsMJl4W6uabbtudF2OEcvSlhzFDOV2
	lQwyRvVHxPJAjUa1T1mml+zjjWgSt8oKGwzPH2P1Tbw49HBWXS/4FrFPg/M/CYnbNJ70deGs/JAaN
	OUuLWtiyp9GSvxJN/QxqHn50zo7UtZhyN7qThySfMIZaFm6eY2V7CzJGV5OlXE9jpwDhMwRVDPMUG
	WAiiGUQ9j3xb5hg7gwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4eP-00AHhC-0d;
	Tue, 14 Mar 2023 13:25:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4eJ-00AHd0-2x
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 13:25:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5A1B424E20D;
	Tue, 14 Mar 2023 21:24:39 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 21:24:39 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 21:24:37 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/3] Add watchdog driver for StarFive JH7100/JH7110 RISC-V SoCs
Date: Tue, 14 Mar 2023 21:24:34 +0800
Message-ID: <20230314132437.121534-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_062508_479917_E2FEE12C 
X-CRM114-Status: GOOD (  17.76  )
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

This patch serises are to add watchdog driver for the StarFive
JH7100 and JH7110 RISC-V SoCs. The first patch adds docunmentation to
describe device tree bindings. The subsequent patch adds watchdog driver
and support JH7100/JH7110 SoCs. And the last patch adds watchdog node in
the JH7100 dts. And the addition of JH7110 device tree node will be
submitted after the JH7110 dts merge. This patchset is based on 6.3-rc1.

The watchdog driver has been tested on the VisionFive 1 and VisionFive 2
boards which equip with JH7100 and JH7110 SoCs respectively and both
works normally.

Changes since v4:
Patch 2:
- Dropped the struct device.
- Renamed the struct watchdog_device.
- Modified the struct reset_control to be local variable.
- Fixed the exit error with spinlock.
- Dropped the function of starfive_wdt_is_locked().
- Changed the macro name of 'OPTIONS'.
- Changed the order in probe to do less work if return '-EPROBE_DEFER'.
- Fixed some function that ignored return value.
Patch 3:
- Dropped the label of watchdog node.

Changes since v3:
- Modified the dt-binding, driver and dts to support JH7100 watchdog.
- Modified the register comments.
- Changed the return value and order when getting clock rate.
- Used dev_err_probe() when getting clocks and resets.
- Improved the codes of setting default timeout.
- Moved the watchdog_register_device() after setting WDOG_HW_RUNNING.
- Changed 'SOC_STARFIVE' to 'ARCH_STARFIVE' in Kconfig file.
- Dropped the struct of platform_device_id.
- Used new functions to enable or disable clock.

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

v4:
--- https://lore.kernel.org/all/20230308034036.99213-1-xingyu.wu@starfivetech.com/
v3:
--- https://lore.kernel.org/all/20230220081926.267695-1-xingyu.wu@starfivetech.com/
v2:
--- https://lore.kernel.org/all/20221219094233.179153-1-xingyu.wu@starfivetech.com/
v1:
--- https://lore.kernel.org/all/20221202093943.149674-1-xingyu.wu@starfivetech.com/

Xingyu Wu (3):
  dt-bindings: watchdog: Add watchdog for StarFive JH7100 and JH7110
  drivers: watchdog: Add StarFive Watchdog driver
  riscv: dts: starfive: jh7100: Add watchdog node

 .../watchdog/starfive,jh7100-wdt.yaml         |  71 ++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  10 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   3 +
 drivers/watchdog/starfive-wdt.c               | 606 ++++++++++++++++++
 6 files changed, 708 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
 create mode 100644 drivers/watchdog/starfive-wdt.c


base-commit: 8ca09d5fa3549d142c2080a72a4c70ce389163cd
prerequisite-patch-id: 558a5b43260d13a6f5229b139ccd45f737a4f686
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

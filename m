Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED405CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 05:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Twu3jLnw+YbijRIJ8MqlXV3IThJqHrXeSxfW+qCt38I=; b=1kjzfake6QD7u+
	3H8dNb5Ap0x7pILO96qmjV2m+vETKDLiPrpEbarGRPLlCO+xUjRTjbhZ30Xf8cO2r6oHQIY2sgfuL
	Q2fe8B2hswHKkPYXJJSUmAJufS+zLOJdenVKIvmhy6CZ0eAGNAOjkcfahEngtIpiZCsCiV3Kkf6r9
	kVdg3aLnuFmhOwiLwQLYhxqeptG075jlujnW/5d+lWgROExkkFDVnElYBjFpt4E4Hp3OlfELe8CW5
	qZcBPwZlHr6H5fKPc1lPJuM40jptt3AZbr2UOG0UiS9eVZP1G0srVMQ+Qp1xqATUboc6YbV3+f3ec
	dsehcgDVekDORqR0jCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtLhM-00GM9L-0I;
	Thu, 19 Oct 2023 05:35:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtLhF-00GM3E-36
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 05:35:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D3A7C24E050;
	Thu, 19 Oct 2023 13:35:03 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Oct
 2023 13:35:03 +0800
Received: from localhost.localdomain (183.27.99.123) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Oct
 2023 13:35:02 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	"Samin Guo" <samin.guo@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	"Conor Dooley" <conor@kernel.org>
Subject: [PATCH v7 0/3] Add timer driver for StarFive JH7110 RISC-V SoC
Date: Thu, 19 Oct 2023 13:34:58 +0800
Message-ID: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.99.123]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_223550_339218_2116D1D7 
X-CRM114-Status: GOOD (  17.02  )
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

This patch serises are to add timer driver for the StarFive JH7110
RISC-V SoC. The first patch adds documentation to describe device
tree bindings. The subsequent patch adds timer driver and support
JH7110 SoC. The last patch adds device node about timer in JH7110
dts.

This timer has four free-running 32 bit counters and runs in 24MHz
clock on StarFive JH7110 SoC. And each channel(counter) triggers
an interrupt when timeout. They support one-shot mode and 
continuous-run mode.

Changes since v6: 
- Rebased on 6.6-rc6.
- Used sizeof() instead of the numbers of characters about names.
- Added devm_add_action_or_reset() to release the resets and 
  clocksources in the case of remove or error in the probe.
- Added flags to check each clocksource is suceessfully registered and 
  used in the release function.
- Dropped the variable of irq in the jh7110_clkevt struct.
- Dropped the wrappers and used enum definitions and writel() calls
  directly.

v6: https://lore.kernel.org/all/20231012081015.33121-1-xingyu.wu@starfivetech.com/

Changes since v5: 
- Rebased on 6.6-rc5.
- Changed the number about characters of name.
- Made the clkevt->periodic to a local variable.
- Dropped the variables of device and base.
- Used clkevt->evt.irq directly and dropped the extra copy of irq.

V5: https://lore.kernel.org/all/20230907053742.250444-1-xingyu.wu@starfivetech.com/

Changes since v4: 
- Rebased on 6.5.
- Dropped the useless enum and used value directly when writing
  registers.
- Modified the description in Kconfig.
- Add the reviewed tag in patch 3.

v4: https://lore.kernel.org/all/20230814101603.166951-1-xingyu.wu@starfivetech.com/

Changes since v3: 
- Rebased on 6.5-rc6
- Dropped the useless enum names like 'JH7110_TIMER_CH_0'.
- Dropped the platform data about JH7110 and used the register offsets
  directly.
- Drroped the useless functions of clk_disable_unprepare().

v3: https://lore.kernel.org/all/20230627055313.252519-1-xingyu.wu@starfivetech.com/

Changes since v2: 
- Rebased on 6.4-rc7.
- Merged the header file into the c file.
- Renamed the functions from 'starfive_' to 'jh7110_'
- Used function 'clocksource_register_hz' instead of
  'clocksource_mmio_init'.

v2: https://lore.kernel.org/all/20230320135433.144832-1-xingyu.wu@starfivetech.com/

Changes since v1:
- Added description about timer and modified properties' description
  in dt-bindings.
- Dropped the 'interrupt-names' and 'clock-frequency' in dt-bindings.
- Renamed the functions and added 'starfive_'
- Modified that the driver probe by platform bus.

v1: https://lore.kernel.org/all/20221223094801.181315-1-xingyu.wu@starfivetech.com/

Xingyu Wu (3):
  dt-bindings: timer: Add timer for StarFive JH7110 SoC
  clocksource: Add JH7110 timer driver
  riscv: dts: jh7110: starfive: Add timer node

 .../bindings/timer/starfive,jh7110-timer.yaml |  96 +++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-jh7110.c            | 380 ++++++++++++++++++
 6 files changed, 515 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
 create mode 100644 drivers/clocksource/timer-jh7110.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

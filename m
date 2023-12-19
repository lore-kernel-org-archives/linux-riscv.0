Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2813CC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s0r0Flo1nFJlZV1cz3N1tKYT889+HXb2+6fGfe3HT7A=; b=MFhGtkLPwpWbin
	jGqWMgTkjm9tkiEtoKf/z6LIY3YhAGm5g5FwTn7KDb5giHAEkgjLpMja7MuLSwtLMN1gknHYDXF0B
	9xWcArN6VFkN6yyJtxJATPl6Xlx+OrXuO5753T9T7Bd2ooEUKZ6F4BUd8XvQvyJRyMQroCT7O+LL9
	ejfuUnKnh1H4fvAP35cEk54CVpfquTJww+mtN8DYCNbhjrAtI7CaaZ2Vicdwfy3QdSAbZSgbBiu9f
	3p/96XeF8bMqEq2XOo2zwxu4KY3JcwBgCCzUttax0eJCuTMs9GeoyF+XsI7UeD2AeUCdTTB5WB8e7
	E1XDR8OMqkqsqdHUEXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbUZ-00ERgx-19;
	Tue, 19 Dec 2023 14:54:43 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFbUU-00ERbW-2s
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 14:54:41 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 950F78132;
	Tue, 19 Dec 2023 22:54:03 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 19 Dec
 2023 22:54:03 +0800
Received: from localhost.localdomain (113.72.145.47) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 19 Dec
 2023 22:54:02 +0800
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
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: [PATCH v8 0/3] Add timer driver for StarFive JH7110 RISC-V SoC
Date: Tue, 19 Dec 2023 22:53:59 +0800
Message-ID: <20231219145402.7879-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_065439_309906_12BE0C52 
X-CRM114-Status: GOOD (  19.22  )
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

This timer is used as global timer and register clockevent for each
CPU core after riscv-timer registration on the StarFive JH7110 SoC.

Changes since v7:
- Rebased on 6.7-rc6.
- Modified the Kconfig file and added selection in SOC_STARFIVE.
- Used the timer as a global timer and registered as clockevent
  for each CPU core.
- Dropped the timeout function in the interrupt handler callback.
- Changed the way in the functions of jh7110_timer_tick_resume() and
  jh7110_timer_resume().
- Dropped the registration of clocksource in the probe.

v7: https://lore.kernel.org/all/20231019053501.46899-1-xingyu.wu@starfivetech.com/

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
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +
 drivers/clocksource/Kconfig                   |   9 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-jh7110.c            | 360 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 8 files changed, 495 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
 create mode 100644 drivers/clocksource/timer-jh7110.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

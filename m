Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7FEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BuiEbnTGjHRt7WZCkK2FHDDc7Y3WBdt/zdWW+yURo+8=; b=Ct3Oc/6MwxSBlE
	utrglbeIc6jcfRS/7F1y2vmRMNZVVPhKOXRdmQhaKnNa4jcwdCGDt7kYwGxqYFvBf/10hEPqN34lK
	wfJLb0Wx0A/8ySb6OTN0hR2dJnw88bOtFa58rqtdTfvuwmw28DdhqN47C8uj2Z2IMndPKf+lPOnaG
	a850mSrLEcC9+rrtg+3DCEatj2/ORzT09p78cFDN605Od+TGtXhrxQLL6hpGp1y/GNp+1xUr5FL9n
	r4lOz00B72H+yTovzVzbmQPglqD3yn2+mi8Y8VpO3nXdvRLN7txRMAX1cdhF5soabreOYuQXsZNY/
	qLzORGlXd+p2XIYoPsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1eG-00BzAJ-1x;
	Tue, 27 Jun 2023 05:53:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1eB-00Bytm-1H
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 05:53:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DFF4D808F;
	Tue, 27 Jun 2023 13:53:14 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Jun
 2023 13:53:14 +0800
Received: from localhost.localdomain (183.27.97.206) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Jun
 2023 13:53:13 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/3] Add timer driver for StarFive JH7110 RISC-V SoC
Date: Tue, 27 Jun 2023 13:53:10 +0800
Message-ID: <20230627055313.252519-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_225351_624700_BEA445BB 
X-CRM114-Status: GOOD (  13.72  )
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

 .../bindings/timer/starfive,jh7110-timer.yaml |  96 ++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-jh7110.c            | 485 ++++++++++++++++++
 6 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
 create mode 100644 drivers/clocksource/timer-jh7110.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

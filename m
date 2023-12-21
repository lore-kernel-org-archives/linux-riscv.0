Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0225C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NIYJ3pqKtRp5rdmjKLzMyRMbIzdAeYejbnemjKNK9gU=; b=h2BUJlEiWSZag5
	FzyYSCBQKDJZxYxdVnFd6/LWTLHgjAbLGHqPD/rM4Rc21Et6o8j6Dep4hQWAuBLWqjQYRdZZCy31a
	RzVlxaPIcu1LoNg3Z/3AFGqhuHsCbKDnTMs+GYuwnTwvs9JL2LcQkYckGUp3wIrlwVg1BzDq38M+R
	IQCbaVPi7XoqgO2TY9kQTdGismTp2+fdxPeW8lnhi4MQqTWbLIVrNaz5OgC31xeZ7qwAHRnopZaiP
	nAmsz5Pm6BYZX5SAhN9CzUUaaAPSbnKRYTzYPwkPWs7G0eT7/Swyj8wArdc+JCUN/voEP3WcuQEX+
	NQyYcrpBLl+y8m1EyEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEYq-00233W-28;
	Thu, 21 Dec 2023 08:37:44 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEYj-0022qP-31
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 08:37:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 53DC07FFE;
	Thu, 21 Dec 2023 16:36:32 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:36:32 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:36:25 +0800
From: Alex Soo <yuklin.soo@starfivetech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, "Ley
 Foon Tan" <leyfoon.tan@starfivetech.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Drew Fustini" <drew@beagleboard.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alex Soo <yuklin.soo@starfivetech.com>
Subject: [RFC PATCH 0/6] Add Pinctrl driver for Starfive JH8100 SoC
Date: Thu, 21 Dec 2023 16:36:16 +0800
Message-ID: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_003738_369855_74294252 
X-CRM114-Status: GOOD (  10.79  )
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

Starfive JH8100 SoC consists of 4 pinctrl domains - sys_east,
sys_west, sys_gmac, and aon. This patch series adds pinctrl
drivers for these 4 pinctrl domains and this patch series is
depending on the JH8100 base patch series in [1] and [2].
The relevant dt-binding documentation for each pinctrl domain has
been updated accordingly.

[1] https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
[2] https://lore.kernel.org/lkml/20231206115000.295825-1-jeeheng.sia@starfivetech.com/

Alex Soo (6):
  dt-bindings: pinctrl: starfive: add JH8100 pinctrl bindings
  pinctrl: starfive: jh8100: add pinctrl driver for sys_east domain
  pinctrl: starfive: jh8100: add pinctrl driver for sys_west domain
  pinctrl: starfive: jh8100: add pinctrl driver for sys_gmac domain
  pinctrl: starfive: jh8100: add pinctrl driver for AON domain
  riscv: dts: starfive: jh8100: add pinctrl device tree nodes

 .../pinctrl/starfive,jh8100-aon-pinctrl.yaml  |  183 +++
 .../starfive,jh8100-sys-east-pinctrl.yaml     |  188 +++
 .../starfive,jh8100-sys-gmac-pinctrl.yaml     |  124 ++
 .../starfive,jh8100-sys-west-pinctrl.yaml     |  188 +++
 MAINTAINERS                                   |    7 +
 arch/riscv/boot/dts/starfive/jh8100-evb.dts   |    5 +
 arch/riscv/boot/dts/starfive/jh8100-pinfunc.h |  418 +++++++
 arch/riscv/boot/dts/starfive/jh8100.dtsi      |   44 +
 drivers/pinctrl/starfive/Kconfig              |   57 +
 drivers/pinctrl/starfive/Makefile             |    6 +
 .../starfive/pinctrl-starfive-jh8100-aon.c    |  241 ++++
 .../pinctrl-starfive-jh8100-sys-east.c        |  326 +++++
 .../pinctrl-starfive-jh8100-sys-gmac.c        |  164 +++
 .../pinctrl-starfive-jh8100-sys-west.c        |  264 ++++
 .../starfive/pinctrl-starfive-jh8100.c        | 1090 +++++++++++++++++
 .../starfive/pinctrl-starfive-jh8100.h        |   85 ++
 .../pinctrl/starfive,jh8100-pinctrl.h         |  303 +++++
 17 files changed, 3693 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-pinfunc.h
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-aon.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-east.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-gmac.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-west.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h


base-commit: ddb42e41c0991b443dd6cc97213b478a7324d72b
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

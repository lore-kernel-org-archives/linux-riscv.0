Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A0ECD4F3B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tkEbwHDCgwFFlNxJD4XgIvmMhzU+pITwhiMPlkEUglY=; b=PX9Cve/4o9irU9
	Ydm88EbAKMQCrjpoYKMr9k8lkYsZxWpBwzS+Z0iOY9/ewags3xHvyP0/KXaxGSGmERK18SO1CPlB4
	a4Axjmtkc+HPZWkLQ5YR9tXfX0VbGVW5qmNMsirpDy1GNYp6A/OoQZ/m5ey0lCMAGnrfyd2iEATjB
	GkP7/C+yreI7A8rUIR6dMHtsOJZYX+sAPA+KFxb504HGX3kx9tVUvLDCcRfefiwAkNbhBAJHgb4gI
	1iePN+TuBvn+JAelcctg1J/4RJ3l+dBc2O6/gWbgXm7pd/yXBXZ6WxHuSEXS1fCSdGgaWgFnfNzwD
	DBxPdbs6omWeedNDta2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcTR-008ZkH-37;
	Fri, 22 Sep 2023 09:29:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcTN-008Zg2-3C
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:29:21 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3886317EC1;
	Fri, 22 Sep 2023 17:28:50 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Sep
 2023 17:28:50 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 22 Sep 2023 17:28:49 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v5 0/4] StarFive's Pulse Width Modulation driver support
Date: Fri, 22 Sep 2023 17:28:44 +0800
Message-ID: <20230922092848.72664-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_022918_208127_14C541B3 
X-CRM114-Status: GOOD (  15.30  )
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

Hi,

This patchset adds initial rudimentary support for the StarFive
Pulse Width Modulation controller driver. And this driver will
be used in StarFive's VisionFive 2 board.The first patch add
Documentations for the device and Patch 2 adds device probe for
the module.

Changes v4->v5:
- Rebased to v6.6rc2.
- Updated macro definition indent.
- Replaced the clock initializes the interface.
- Fixed patch description.

Changes v3->v4:
- Rebased to v6.5rc7.
- Sorted the header files in alphabetic order.
- Changed iowrite32() to writel().
- Added a way to turn off.
- Moified polarity inversion implementation.
- Added 7100 support.
- Added dts patches.
- Used the various helpers in linux/math.h.
- Corrected formatting problems.
- Renamed dtbinding  to 'starfive,jh7100-pwm.yaml'.
- Dropped the redundant code.

Changes v2->v3:
- Fixed some formatting issues.

Changes v1->v2:
- Renamed the dt-binding 'pwm-starfive.yaml' to 'starfive,jh7110-pwm.yaml'.
- Dropped the compatible's Items.
- Dropped the unuse defines.
- Modified the code to follow the Linux coding style.
- Changed return value to dev_err_probe.
- Dropped the unnecessary local variable.

The patch series is based on v6.6rc2.

William Qiu (4):
  dt-bindings: pwm: Add StarFive PWM module
  pwm: starfive: Add PWM driver support
  riscv: dts: starfive: jh7110: Add PWM node and pins configuration
  riscv: dts: starfive: jh7100: Add PWM node and pins configuration

 .../bindings/pwm/starfive,jh7100-pwm.yaml     |  55 +++++
 MAINTAINERS                                   |   7 +
 .../boot/dts/starfive/jh7100-common.dtsi      |  24 +++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   9 +
 .../jh7110-starfive-visionfive-2.dtsi         |  22 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   9 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-starfive.c                    | 190 ++++++++++++++++++
 9 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
 create mode 100644 drivers/pwm/pwm-starfive.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

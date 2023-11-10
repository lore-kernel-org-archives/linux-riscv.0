Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51355C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BxZbhXBiTL6sj5IPtBzXZ3ehIkdLDPTybaCbVSaE7is=; b=KtvXRcICCgVHde
	I0AVXUob10tpBFEBdjkNBjc/qUsKcKIDS8RTfz7dUE5+ztRbzDkXpHm6tqK1NlGnGH272brE0pn+g
	m4MA/PWOR0tC1yCBOq2yPUCSkt2p82w70NXxiceSNzca2fuIPdyZ2bHau54/QtPfGw4WQEXYqXotd
	Ws3pc7ADeeFnGhL/U4em7uSHHYbGM/qhsCpAXq4VNEX8bIcnU1csgCENTMIWZ+RiBFtFAPW5gtHwA
	efBzqWDTYNuJjBkL66ke0rERV7OZDWQOTrQOV1z9MDUdavhsSHFaCC2yR8Iw0lc+OP8ze83xy21QO
	AI+vRUTxfxX1xD9tuETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KtN-007wgU-31;
	Fri, 10 Nov 2023 06:21:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KtI-007wch-37
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 06:21:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5852A24DFED;
	Fri, 10 Nov 2023 14:20:41 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Nov
 2023 14:20:41 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 10 Nov 2023 14:20:40 +0800
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
Subject: [PATCH v7 0/4] StarFive's Pulse Width Modulation driver support
Date: Fri, 10 Nov 2023 14:20:35 +0800
Message-ID: <20231110062039.103339-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_222117_310728_95C3B580 
X-CRM114-Status: GOOD (  16.24  )
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

Changes v6->v7:
- Rebased to v6.6.
- Added dependency architecture.
- Adopted new rounding algorithm.
- Added limitation descripton.
- Used function interfaces instead of macro definitions.
- Followed the linux coding style.

Changes v5->v6:
- Rebased to v6.6rc5.
- Changed driver into a generic OpenCores driver.
- Modified dt-bindings description into OpenCores.
- Uesd the StarFive compatible string to parameterize.

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
- Modified polarity inversion implementation.
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

The patch series is based on v6.6.

William Qiu (4):
  dt-bindings: pwm: Add OpenCores PWM module
  pwm: opencores: Add PWM driver support
  riscv: dts: starfive: jh7110: Add PWM node and pins configuration
  riscv: dts: starfive: jh7100: Add PWM node and pins configuration

 .../bindings/pwm/opencores,pwm.yaml           |  56 +++++
 MAINTAINERS                                   |   7 +
 .../boot/dts/starfive/jh7100-common.dtsi      |  24 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   9 +
 .../jh7110-starfive-visionfive-2.dtsi         |  22 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   9 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ocores.c                      | 236 ++++++++++++++++++
 9 files changed, 376 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
 create mode 100644 drivers/pwm/pwm-ocores.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

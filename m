Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB06EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0WGQvxZnN0GqpJ+I6zLMVcGwNiVhYmYvcX1BhTZ6lFA=; b=mkqZMP/TLw4v1s
	ht2dC1VWEgC3c40M/XXoh2e/nwNEo9d7vvMk44NMBDlR+XXYgZEacW9g/QTy5BErgdQPVPyPNATTb
	7HAp+MNmU/c7gH+7s2oP/Zv1qCnQvCyf/xmMfLrMN2jLK729ABZ3TKorHtRauGl7A3YLQVSDICOlj
	Tnh4ixG26IRNPLUl+Yl3YZpVy6igRJp2JljSZyjPNlIL6Q+CAmx65dxVjtJJsQKXOgP8SZ6tf5mwp
	vlvbVclOLgs8MV5gCv5P/tMGUpofwT3o3ncCwRekArvKPebFcUuVslkOg4xY4ArGXQYLYw1vsi10b
	hnYzJfci3ZYsJXB8mceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6V-00A2KG-1D;
	Mon, 26 Jun 2023 11:09:55 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk6Q-00A2E4-24
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:09:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 81E1024E199;
	Mon, 26 Jun 2023 19:09:11 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:11 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:10 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/5] Add PWM-DAC audio support for StarFive JH7110 RISC-V SoC
Date: Mon, 26 Jun 2023 19:09:04 +0800
Message-ID: <20230626110909.38718-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_040951_044764_A8A8BB46 
X-CRM114-Status: GOOD (  10.32  )
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

This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
The PWM-DAC module does not require a hardware codec, so add a dummy codec
driver for it.

The fourth patch depends on the patch [1].
The fifth patch depends on the patchset [2], patch [3].

[1] https://lore.kernel.org/all/20230526145402.450-3-walker.chen@starfivetech.com/
[2] https://lore.kernel.org/all/20230518101234.143748-1-xingyu.wu@starfivetech.com/
[3] https://lore.kernel.org/all/20230322094820.24738-5-walker.chen@starfivetech.com/

Hal Feng (5):
  ASoC: dt-bindings: Add StarFive JH7110 dummy PWM-DAC transmitter
  ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC transmitter driver
  ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
  ASoC: starfive: Add JH7110 PWM-DAC driver
  riscv: dts: starfive: Add JH7110 PWM-DAC support

 .../sound/starfive,jh7110-pwmdac-dit.yaml     |  38 +
 .../sound/starfive,jh7110-pwmdac.yaml         |  76 ++
 MAINTAINERS                                   |   8 +
 .../jh7110-starfive-visionfive-2.dtsi         |  50 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  13 +
 sound/soc/codecs/Kconfig                      |   4 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/jh7110_pwmdac_transmitter.c  |  74 ++
 sound/soc/starfive/Kconfig                    |   9 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh7110_pwmdac.c            | 787 ++++++++++++++++++
 11 files changed, 1062 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c


base-commit: 45a3e24f65e90a047bef86f927ebdc4c710edaa1
prerequisite-patch-id: 8c735dffc6d5388a35a76b16e914a2f9722ad979
prerequisite-patch-id: ffa1f5831e75722c9f41603f009f762c9fd525e2
prerequisite-patch-id: 36e69700dfc0375b950b0e23086ed3b722cb84a4
prerequisite-patch-id: 0b49b996d7a404ea548e1734c12933ec749e92b9
prerequisite-patch-id: 81f7c65712c4901a7a178ddcd98ffc55f3b473ff
prerequisite-patch-id: f342fbf594014b072378528bea94c01fb2186e1a
prerequisite-patch-id: 39e1be2a3d1593577ab997f55f59367cba665aa7
prerequisite-patch-id: 0159f09bb0a1ff711a00ae17ef5b12662c9c7d3d
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: d5abfba63fc07ff97b5023911513c260bb7a53e1
prerequisite-patch-id: b37ac15032973e1fcd918f157c82a0606775c9e9
prerequisite-patch-id: 6abf359fa445f4104432ddee27044dfbfb128417
prerequisite-patch-id: 2f7aca99e714a4c590a91baa015080ac0902814d
prerequisite-patch-id: 32cabbc4e7a97ec14d5c28a477fa483784f86709
prerequisite-patch-id: d449b1957dd77c2537c38585daa75974c94c529a
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

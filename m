Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED6DC04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c3pdBn5yvDgEoN4f61RbQTKJa/CIMfpoC4LPHfzSb18=; b=b4SKDGYLjMCaC2
	cx/MqRHT5QtfDvSn4P6bUzKDoIOTd1vIzhgPbkVtjES88lQNf1S9EQ2KcxSQgPd9rwsv7vGI6oJPl
	0G2lrzA6pusY4829Qy1zzdlA4OwDn5w123evl+dG0mVzXz5V8yP3otRA7+06kXa74XQcCh4EMTb6F
	TB+IPCcJSARfZ7fhoE10QVScgbdTCWs3JmzUGAm/SH4ldmE1lJOgS1QeqMX7E3A7ERhs24kalSDQQ
	7m31flv5+5jUQHAsJ7MSLIPOvAlMDpUfJ1Pz26xcwYG6lN/qFWwfjsiOvqKxeEro8ySNr6Bt5r25R
	B0G+ZtN7bWUDyM7v0zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSbU-00GRBE-05;
	Mon, 14 Aug 2023 08:07:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSbQ-00GR6w-11
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 08:07:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7107C24E211;
	Mon, 14 Aug 2023 16:06:20 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:20 +0800
Received: from ubuntu.localdomain (183.27.98.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:19 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Add PWM-DAC audio support for StarFive JH7110 RISC-V SoC
Date: Mon, 14 Aug 2023 16:06:15 +0800
Message-ID: <20230814080618.10036-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010704_657768_5FFECB66 
X-CRM114-Status: GOOD (  15.33  )
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
The PWM-DAC module does not require a hardware codec, but a dummy codec is
needed for the driver. The dummy spdif codec driver, which is already
upstream, is compatible with the one which JH7110 PWM-DAC needed. So we
use it as the dummy codec driver for the JH7110 PWM-DAC module.

The third patch depends on tag next-20230809 in linux-next branch.

Changes since v2:
- Rebase on tag v6.5-rc6.
- Drop the component controls.
- Use dev_err_probe() instead of dev_err() in some cases.
- Add a new struct jh7110_pwmdac_cfg to save the configuration.
- Add a new function jh7110_pwmdac_init_params() to initialize the
  parameters.

Changes since v1:
- Rebase on tag v6.5-rc3.
- Drop patch 1 and 2.
- Drop the unneeded space and line in patch 3.
- Use the dummy spdif codec driver instead of adding a new one.
- Change "dai_link->stop_dma_first = 1" to
  "dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC" in patch 4.
- Drop the unneeded "status = "okay;" in patch 5.
- Change some node names in patch 5.

---
v2: https://lore.kernel.org/all/20230731032829.127864-1-hal.feng@starfivetech.com/
v1: https://lore.kernel.org/all/20230626110909.38718-1-hal.feng@starfivetech.com/

Hal Feng (3):
  ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
  ASoC: starfive: Add JH7110 PWM-DAC driver
  riscv: dts: starfive: Add JH7110 PWM-DAC support

 .../sound/starfive,jh7110-pwmdac.yaml         |  76 +++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2.dtsi         | 141 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 159 ++++++
 sound/soc/starfive/Kconfig                    |   9 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh7110_pwmdac.c            | 529 ++++++++++++++++++
 7 files changed, 922 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c


base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

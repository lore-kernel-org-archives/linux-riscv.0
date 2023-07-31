Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1556EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 03:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EaXCkGC8sZL6qBA+XpMF8KJ/CNCC3aKsVKlNnXZY2Mc=; b=lR0++/QkGJpa/O
	qo7aaGzGtPWTupUO81Fd64bZLXeT5bsNakYocQus9LWl0eFogjKTpy2iM9oFt9sIutWh2ifSvz3do
	qxVBHDrzg3sRXE710qcL63VG4p5aj9SZQJnKnnM2csdiW1QHL2FDIWO+D46KRzhzmxD7ySTPLzcE2
	7+wpAii1RK1OarGo8t6UEFaL4pgeBXhgJrR3qFzm1M6mP7bhj7fujt+tZ1TpS/uj554SNCKnkG7sU
	N6keUq1Afo4Harcttk85EmFpq1WuaoT4u9P14QaE/FqEsvJIA9hM3gH+3pQALrZl08YZDX0sceJet
	HdW/9KFrl4Fjp5BeC2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQJb2-00DgVQ-0J;
	Mon, 31 Jul 2023 03:29:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQJaz-00DgNo-2P
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 03:29:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6785124E21B;
	Mon, 31 Jul 2023 11:28:32 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:32 +0800
Received: from ubuntu.localdomain (113.72.147.196) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:31 +0800
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
Subject: [PATCH v2 0/3] Add PWM-DAC audio support for StarFive JH7110 RISC-V SoC
Date: Mon, 31 Jul 2023 11:28:26 +0800
Message-ID: <20230731032829.127864-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.147.196]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_202921_966697_3C318E66 
X-CRM114-Status: GOOD (  13.96  )
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

The third patch depends on tag next-20230728 in linux-next branch.

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
v1: https://lore.kernel.org/all/20230626110909.38718-1-hal.feng@starfivetech.com/

Hal Feng (3):
  ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
  ASoC: starfive: Add JH7110 PWM-DAC driver
  riscv: dts: starfive: Add JH7110 PWM-DAC support

 .../sound/starfive,jh7110-pwmdac.yaml         |  76 ++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2.dtsi         |  99 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 156 ++++
 sound/soc/starfive/Kconfig                    |   9 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh7110_pwmdac.c            | 787 ++++++++++++++++++
 7 files changed, 1135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c


base-commit: 6eaae198076080886b9e7d57f4ae06fa782f90ef
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

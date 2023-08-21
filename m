Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF10EE49AF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEzO+yFlhphoHMfGz/KAiH3o2Xa9kyl8vSpd5t3urq4=; b=4bMHsg/sHSsTrD
	MZAOnwGFyL0jXTuJk0SW729P4NPMP0njFgXuR+HErAIeLQyjACQGbmonI1vuW+fqEKyfgZhfKwNh3
	+vhYC9zgQmmqVNXUHat5q4O275twwesBVy3lV5Dn73S18Bhpsdj4unLv3r8251Es7U/ji2e56gelv
	pgGi72FRvyV9eJQneto2Uwk63Jdza1eS0iW+48yrK2yhYRv106Au6KA5qYy/6UE6+ukjJOyydofsQ
	E/xAlEjBiMh7WfBCheOGAcszlHGH2x3ItYuPaTVBYrOGAviQUBAiCG4ZYJWF8Lrz0UYjvFMpdD031
	aGuWVASkeqp/9n6sc9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67P-00ECdq-27;
	Mon, 21 Aug 2023 14:42:59 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67H-00ECPv-2K
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 14:42:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AECE6807C;
	Mon, 21 Aug 2023 22:41:52 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:52 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:51 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/5] Add I2S support for the StarFive JH7110 SoC
Date: Mon, 21 Aug 2023 22:41:46 +0800
Message-ID: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_074252_018734_38FB55C2 
X-CRM114-Status: GOOD (  14.99  )
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

This patch series adds I2S support for the StarFive JH7110 RISC-V
SoC based on Designware I2S controller. There has three I2S channels
(RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and 
two for playback(TX).

The first patch adds support for the StarFive JH7110 SoC in the
Designware I2S bindings.
The second patch adds the ops to get data from platform bus in the 
I2S driver.
The third patch adds support for the StarFive JH7110 SoC in
the Designware I2S driver. 
The fourth patch fixes the name of I2STX1 pinmux.
The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.

This patch series is based on Linux-next(20230818) which is merge
clock, syscon and dma nodes for the StarFive JH7110 SoC. 

The series has been tested and works normally on the VisionFive 2
board by plugging an audio expansion board.

Changes since v1:
- Added the maxItems of clocks, clock-names and resets on each
  I2S controllers in the binding.
- Dropped the useless settings about dma bus width in the I2S driver.
- Used the 'i2s@' instead of 'i2stx@' or 'i2srx@' in the JH7110 dts.

v1: https://lore.kernel.org/all/20230802084301.134122-1-xingyu.wu@starfivetech.com/

Xingyu Wu (5):
  ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC
    support
  ASoC: dwc: Use ops to get platform data
  ASoC: dwc: i2s: Add StarFive JH7110 SoC support
  riscv: dts: starfive: pinfunc: Fix the pins name of I2STX1
  riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1

 .../bindings/sound/snps,designware-i2s.yaml   | 108 ++++++-
 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h |   4 +-
 .../jh7110-starfive-visionfive-2.dtsi         |  58 ++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  65 ++++
 include/sound/designware_i2s.h                |   3 +
 sound/soc/dwc/dwc-i2s.c                       | 306 ++++++++++++++++--
 sound/soc/dwc/local.h                         |   1 +
 7 files changed, 518 insertions(+), 27 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

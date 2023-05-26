Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF16C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D/ioKmcqJ2HV7Hjl+2le6y7jChHqHJitzbOlPd50yOQ=; b=rpilNmOiKMaNht
	KdxfBeaBGfCc8+wMEi2k7lMqwyt1Rr1n8hdxDWG1ASTwnIssehq2hI6jG1K8TChSqtAZ8GU0jITD/
	xSBNZrDCYuRpAs/B9ymdauqfTm33MKkWhZKQuYQ/QKZ1BbWqKv4iZPGyi0c2LTVX2KIifJMoTtDZ5
	/LwNmkas/Z13Hh0DSYmG/5h6eiaA9G/a9jfKrTmK3/JjRrSmOBL1TRXPvqRlxwxyaDpxf+frCBDte
	C/lwyBa048Y2aSODXKhp0L8UMmmlK/VSxmXYFs4mMH+eVgLO7ev/0LqJO2lY1KVDGlmaXsmF5g3Xh
	F/AkU5JsyqHlmZQBqhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YqQ-002sfH-14;
	Fri, 26 May 2023 14:55:06 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YqM-002sYP-1J
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 14:55:04 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 44BF224E1BA;
	Fri, 26 May 2023 22:54:04 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 22:54:04 +0800
Received: from SD-Server.starfivetech.com (183.27.98.143) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 26 May 2023 22:54:03 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 0/3] Add TDM audio on StarFive JH7110
Date: Fri, 26 May 2023 22:53:59 +0800
Message-ID: <20230526145402.450-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_075502_849854_574E6CDB 
X-CRM114-Status: GOOD (  17.23  )
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

This patchset adds TDM audio driver for the StarFive JH7110 SoC. The
first patch adds device tree binding for TDM module. The second patch
adds tdm driver support for JH7110 SoC. The last patch adds device tree
node and pins configuration of tdm to JH7110 dts.

The series has been tested on the VisionFive 2 board by plugging an
audio expansion board. 

For more information of audio expansion board, you can take a look
at the following webpage:
https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/

The last patch should be applied after the following patch:
https://lore.kernel.org/all/20230322094820.24738-5-walker.chen@starfivetech.com/

Changes since v4:
- Rebased on Linux 6.4-rc2.
- Adjusted code indentation in jh7110_tdm_syncdiv().
- Removed '__maybe_unused' for jh7110_tdm_system_suspend() and
  jh7110_tdm_system_resume().
- Removed initialization for variable 'ret' in jh7110_tdm_hw_params().
- Return immedially when entering unsurpported case in
  jh7110_tdm_set_dai_fmt().
- Check the return value with IS_ERR_OR_NULL() for the call to
  devm_reset_control_array_get_exclusive().
- Dropped the jh7110_tdm_clk_enable() in probe and rely on runtime PM
  check if CONFIG_PM is enabled.
- Used RUNTIME_PM_OPS() instead of SET_RUNTIME_PM_OPS() and
  SYSTEM_SLEEP_PM_OPS() instead of SET_SYSTEM_SLEEP_PM_OPS() in
structure jh7110_tdm_pm_ops.

Changes since v3:
- Modified the subject of patch [1/3] to reflect which subsystem it is.
- Use the set of functions with 'clk_bulk_' to get/enable/disable clocks. 
- Dropped the overlay from patch [3/3].
- Dropped the redundant macro 'CONFIG_PM' and 'CONFIG_PM_SLEEP' around
  suspend() and resume().

Changes since v2:
- Use dt-overlay to describe sound card because need to plug the audio
  expansion board into the VisionFive2 board.
- Modified the coding style for driver.
- Moved assignment of stop_dma_first to startup function of dai_driver.
- Dropped some useless macro definition.
- Use loops to get/enable/disable clocks. 

Changes since v1:
- Rebased on Linux 6.3-rc4.
- Added the dts file dedicated to describe audio card.
- Added the item for JH7110 audio board to the dt-binding of StarFive
  SoC-based boards.

---
v4: https://lore.kernel.org/all/20230511091549.28003-1-walker.chen@starfivetech.com/
v3: https://lore.kernel.org/all/20230506090116.9206-1-walker.chen@starfivetech.com/
v2: https://lore.kernel.org/all/20230420024118.22677-1-walker.chen@starfivetech.com/
v1: https://lore.kernel.org/all/20230329153320.31390-1-walker.chen@starfivetech.com/

Walker Chen (3):
  ASoC: dt-bindings: Add TDM controller bindings for StarFive JH7110
  ASoC: starfive: Add JH7110 TDM driver
  riscv: dts: starfive: add the node and pins configuration for tdm

 .../bindings/sound/starfive,jh7110-tdm.yaml   |  98 +++
 MAINTAINERS                                   |   6 +
 .../jh7110-starfive-visionfive-2.dtsi         |  40 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  21 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/starfive/Kconfig                    |  15 +
 sound/soc/starfive/Makefile                   |   2 +
 sound/soc/starfive/jh7110_tdm.c               | 679 ++++++++++++++++++
 9 files changed, 863 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
 create mode 100644 sound/soc/starfive/Kconfig
 create mode 100644 sound/soc/starfive/Makefile
 create mode 100644 sound/soc/starfive/jh7110_tdm.c


base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
prerequisite-patch-id: 398744c61913c76a35754de867c4f820ca7a8d99
prerequisite-patch-id: 07986c6e98ce85d3ee84f38c780e72145f098fc8
prerequisite-patch-id: 1babe83d6bf999bad17584dc595480f9070a5369
prerequisite-patch-id: 63c1f70ca2bcf827429542e60d74411b7666ceff
prerequisite-patch-id: 9fbb7ad1dd258bb8ff5946c4a0e59de4bfd82a04
prerequisite-patch-id: a7f61973ccb6bc425daa8a86c048fd0f5a915b76
prerequisite-patch-id: 39e1be2a3d1593577ab997f55f59367cba665aa7
prerequisite-patch-id: 0159f09bb0a1ff711a00ae17ef5b12662c9c7d3d
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: 584c256c9acb52ee2773d0c81c3f4977fc18155a
prerequisite-patch-id: b37ac15032973e1fcd918f157c82a0606775c9e9
prerequisite-patch-id: 6abf359fa445f4104432ddee27044dfbfb128417
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

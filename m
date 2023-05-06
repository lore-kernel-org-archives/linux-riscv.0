Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B502C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W0qG3f6oDj5ZOxKD/K9zeOymb9kAzfv+1C0uKXUA2s0=; b=Y4kahk3XMmehWO
	gb39B0IlxbGKw9Qoh/jJ3Y/Xik4bDeCJzwflIYa87LsLfWcskjrvsP31Bp/HT4bH0jncdIWpuDWoa
	WdkN/nKNIJrQqa5/053EiJELPBPKnIGbuqBf33SktNHw7D+W9rYQyEZLL0A/NhgjP45XFAHAyyX/c
	gl19d/TneIItJizq8aMQz/Hrmfv4cCxxQVZWEBL7epB1yxr4uFWB6Sm6xrebgehF1Zr5fHUrKGsUf
	9JtVzlN2ttgFS0RzTpaAY4tfaTMWpErCnnZucaHjLRs3nC89Cjmz5QHCM/xfeIczYWleiyiBdXZE0
	14XIXD4OhE0oEzvzh94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDnk-00CwLw-0Z;
	Sat, 06 May 2023 09:02:00 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDng-00CwJW-1n
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 09:01:58 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8569D24DEF0;
	Sat,  6 May 2023 17:01:17 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 6 May
 2023 17:01:17 +0800
Received: from SD-Server.starfivetech.com (183.27.98.219) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Sat, 6 May 2023 17:01:16 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/3]  Add TDM audio on StarFive JH7110
Date: Sat, 6 May 2023 17:01:13 +0800
Message-ID: <20230506090116.9206-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_020156_887668_C4BEB429 
X-CRM114-Status: GOOD (  13.88  )
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
adds tdm driver support for JH7110 SoC. The last patch adds device node
of tdm and sound card to JH7110 dts.

The series has been tested on the VisionFive 2 board by plugging an
audio expansion board. 

For more information of audio expansion board, you can take a look
at the following webpage:
https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/

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
v2: https://lore.kernel.org/all/20230420024118.22677-1-walker.chen@starfivetech.com/
v1: https://lore.kernel.org/all/20230329153320.31390-1-walker.chen@starfivetech.com/

Walker Chen (3):
  dt-bindings: sound: Add TDM for StarFive JH7110
  ASoC: starfive: Add JH7110 TDM driver
  riscv: dts: starfive: add tdm node and sound card

 .../bindings/sound/starfive,jh7110-tdm.yaml   |  98 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/Makefile         |   3 +
 .../jh7110-starfive-visionfive-2-wm8960.dtso  |  70 +++
 .../jh7110-starfive-visionfive-2.dtsi         |  40 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  21 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/starfive/Kconfig                    |  15 +
 sound/soc/starfive/Makefile                   |   2 +
 sound/soc/starfive/jh7110_tdm.c               | 573 ++++++++++++++++++
 sound/soc/starfive/jh7110_tdm.h               | 147 +++++
 12 files changed, 977 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-wm8960.dtso
 create mode 100644 sound/soc/starfive/Kconfig
 create mode 100644 sound/soc/starfive/Makefile
 create mode 100644 sound/soc/starfive/jh7110_tdm.c
 create mode 100644 sound/soc/starfive/jh7110_tdm.h


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
prerequisite-patch-id: 30bec4dba6f250a6edd0c2cbab2ce09442e50e8a
prerequisite-patch-id: bb939c0c7c26b08addfccd890f9d3974b6eaec53
prerequisite-patch-id: 8a6f135bcabdad4a4bfb21f0c6a0ffd2bb57efe7
prerequisite-patch-id: c2366f993a9d85e28c06d8d09f064dd5e8b29a61
prerequisite-patch-id: 50d53a21f91f4087fc80b6f1f72864adfb0002b9
prerequisite-patch-id: 0df3703af91c30f1ca2c47f5609012f2d7200028
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: 551fae54377090044c3612fca9740a9b359abdd2
prerequisite-patch-id: c7fdf904f398d478f0ed6d57eb878982bc73329d
prerequisite-patch-id: 1b2d0982b18da060c82134f05bf3ce16425bac8d
prerequisite-patch-id: 090ba4b78d47bc19204916e76fdbc70021785388
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: 4637a8fa2334a45fa6b64351f4e9e28d3e2d60d3
prerequisite-patch-id: 32647ec60a3b614e1c59ec8e54cb511ae832c22f
prerequisite-patch-id: aa06658ecf89c92d0dfdd6a4ba6d9e6e67532971
prerequisite-patch-id: 1387a7e87b446329dfc21f3e575ceae7ebcf954c
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: 9007c8610fdcd387592475949864edde874c20a2
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 9f911969d0a550648493952c99096d26e05d4d83
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: 80042661ff6156ce577a72e9eb8c0b218b624829
prerequisite-patch-id: 398744c61913c76a35754de867c4f820ca7a8d99
prerequisite-patch-id: f59269382164b5d642a5e10443ca447f5caa595c
prerequisite-patch-id: 1babe83d6bf999bad17584dc595480f9070a5369
prerequisite-patch-id: 77be3d122d66df813f13088141ce27b21107a341
prerequisite-patch-id: 9fbb7ad1dd258bb8ff5946c4a0e59de4bfd82a04
prerequisite-patch-id: 6f6984916dffd0cc66aa733c9b6bd3a55495a50c
prerequisite-patch-id: 39e1be2a3d1593577ab997f55f59367cba665aa7
prerequisite-patch-id: 584c256c9acb52ee2773d0c81c3f4977fc18155a
prerequisite-patch-id: b37ac15032973e1fcd918f157c82a0606775c9e9
prerequisite-patch-id: 32deea16304859842af5c2151bc41d91cf6dfc9b
prerequisite-patch-id: 20ac2450fb93b3f69f83fc720fd4800a95e618a6
prerequisite-patch-id: 6abf359fa445f4104432ddee27044dfbfb128417
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

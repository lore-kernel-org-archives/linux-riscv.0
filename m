Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF43C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pc7tsOleicnnWcHgecsDkTEoFitu83FUTNE8i+MLwbI=; b=t/USAaHT21zB8l
	3AbQBB7USwDa+m327XOkUZ6s9CFePvlAzUBs01rTJ6Idg3n44u65c4zs9+9DTro3jtfB0a2gwQstZ
	6E4vhHDXn8qo3ECI4nQo4IjEvQOQj8yy3mnBCCws6JWplnujXQ7V1+DHKlqJyPDUs6gYKcL33XenM
	eWW3DrPnza+pCoYFBP1SONAMEPLuGzMEp9C+zu1fId6OmvbmLB8Rs5HjuS57Hw2tYbL6OQMVRbWZH
	i/JVC6S6WkdZDUsyN71ypBotuBdqHCtgiGhHPQ/W7TBuw9h76qBO3/V1z0BQCvl1su3Y1YZwqJFOa
	VZnZ/5NumPLPO7INrtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgTS-008Tlv-JK; Sat, 11 Feb 2023 03:22:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPN-008Rhi-Gs; Sat, 11 Feb 2023 03:18:39 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E20ED6602112;
	Sat, 11 Feb 2023 03:18:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085513;
	bh=LNDJxjgOHZY/eKro/BYac5WDP/pGehw2tg2CONtqn2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=HQoyAHzUSYcBTbkOlPiVQHjFJZH8Q1anOFaBK7aWcCdwa+BPuqeNEz8nRgYuf5eLk
	 UIXUYdhWbw2EaE2ndJCMAi7y6MYmhmtBhlq/Qhd9AUZP2SgDVG0wEg82H6PnoiIZ/g
	 P4/fn/t4P+5HGfszaushNeBZj9U4zxx5Vdt2llPbvTZn9uW5sP9JBlqowgqksLP+jG
	 M8vfRqUFzpvwlxEzfVMjp0Fdx4qRzavPAKFKvnlsI9kP8LebVASZD/H3Lv/Fh7Kv9C
	 93aOUEQTb1tt0At6R3yXB3CWh7/+5ThDcz9bA/nMujXCyNnz8+Akd2CYdRUgjUGXLS
	 Aue/+FZSRQboQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 00/12] Enable networking support for StarFive JH7100 SoC
Date: Sat, 11 Feb 2023 05:18:09 +0200
Message-Id: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191837_807929_A3E621CE 
X-CRM114-Status: GOOD (  12.89  )
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

This patch series adds ethernet support for the StarFive JH7100 SoC and 
makes it available for the StarFive VisionFive V1 and BeagleV Starlight 
boards, although I could only validate on the former SBC.

The work is heavily based on the reference implementation [1] and requires 
the non-coherent DMA support provided by Emil via the Sifive Composable 
Cache controller.

Also note there is an overlap in "[PATCH 08/12] net: stmmac: Add glue layer 
for StarFive JH7100 SoC" with the Yanhong Wang's upstreaming attempt [2]:
"[PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs". 

Since I cannot test the JH7110 SoC, I dropped the support for it from Emil's
variant of the stmmac glue layer. Hence, we might need a bit of coordination
in order to get this properly merged.

[1] https://github.com/starfive-tech/linux/commits/visionfive
[2] https://lore.kernel.org/linux-riscv/20230118061701.30047-6-yanhong.wang@starfivetech.com/

Cristian Ciocaltea (7):
  dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100
    SoC
  dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
  dt-bindings: net: Add StarFive JH7100 SoC
  riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
  riscv: dts: starfive: jh7100: Add ccache DT node
  riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
  riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac

Emil Renner Berthing (5):
  soc: sifive: ccache: Add StarFive JH7100 support
  soc: sifive: ccache: Add non-coherent DMA handling
  riscv: Implement non-coherent DMA support via SiFive cache flushing
  dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
  net: stmmac: Add glue layer for StarFive JH7100 SoC

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../devicetree/bindings/net/snps,dwmac.yaml   |  15 +-
 .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++
 .../bindings/riscv/sifive,ccache0.yaml        |  33 +++-
 MAINTAINERS                                   |   6 +
 arch/riscv/Kconfig                            |   6 +-
 .../boot/dts/starfive/jh7100-common.dtsi      |  78 +++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  55 +++++++
 arch/riscv/mm/dma-noncoherent.c               |  37 ++++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
 drivers/soc/sifive/Kconfig                    |   1 +
 drivers/soc/sifive/sifive_ccache.c            |  71 +++++++-
 include/soc/sifive/sifive_ccache.h            |  21 +++
 15 files changed, 587 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

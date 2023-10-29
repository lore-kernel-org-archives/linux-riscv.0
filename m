Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AFEC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yA5jjeccQ798uhB53pLRCOnp42pKkPYoLXKWo049lF8=; b=nWhwE8Owe6SrOR
	7m3fGMzW2q9u2+ZCq4LInalaAdAVNyzHvTUhsGCoxmuzSMTHImC8oZsET3j8pxI/TgqpIuQ0JL+Hx
	xPnz4w/kRa1WB28wUlgoAnDKvaLLC509sL+lJvFW/Q1lsvjI5qlNQgKk5OKJekTkKpsMvbkC6D80J
	lsXaQmv3bs2ud7nk5z2M7DtiEn0kpWJ6HB0FUc9WVNHJHsYvRyWujzGL1Zt0ayP0/UWEQ9fAkGBdl
	5TH6As3uiJyEnLQk0I9Gv+KGTeFIxON5LKthpt9k7PIJuji1rMBjbp8KtTaI9HYKIYGvLZpZhlvnf
	ybBywo6M0W/gDasS3gLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOc-0018vg-1B;
	Sun, 29 Oct 2023 04:27:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOX-0018tT-0Z;
	Sun, 29 Oct 2023 04:27:26 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 93BFF6607332;
	Sun, 29 Oct 2023 04:27:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553637;
	bh=n+ZdkLjYx7BCTMug2pHsJcPM5JrGsyJS0p5MK5HHjEE=;
	h=From:To:Cc:Subject:Date:From;
	b=YGCEXx3lfRjWUCbd2vc4CJYDoWcmz0cympjiLksceK9GI1HYaUyW7t//lstBik5s1
	 HpGJgn6kj7XZdunSkpVWEYWhptEkIxwtHKlAPrhrD3KEvlGxqO7lJeODc0FhbK/3P3
	 mLFj9qNWGjdjUT2MQJkDFEr0gd4pnhPKasLldg9T9ADjHwxO98Vk9+AnKOeGPoz2qj
	 r8SnXUwYhVkRDwD+5ONz2jF8yXsI8JWcnxbgP9NDIr7KYXv6OYL986X2M8hHsgNTUs
	 O0rDkHC89XRAH4oY15VddESeIjQYD1sFgNbCS+IUJoWIKu2xVd2iG7UjfX/Jn/smIT
	 o7v1ijfzkKb1Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] Enable networking support for StarFive JH7100 SoC
Date: Sun, 29 Oct 2023 06:27:00 +0200
Message-ID: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212725_373086_67CE56C9 
X-CRM114-Status: GOOD (  10.08  )
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

The work is heavily based on the reference implementation [1] and depends 
the non-coherent DMA support provided by Emil via the SiFive Composable 
Cache controller [2].

[1] https://github.com/starfive-tech/linux/commits/visionfive
[2] https://lore.kernel.org/all/CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com/

Changes in v2:
 - Dropped ccache PATCH 01-05 reworked by Emil via [2]
 - Dropped already applied PATCH 06/12
 - Added PATCH v2 01 to prepare snps-dwmac binding for JH7100 support
 - Added PATCH v2 02-03 to provide some jh7110-dwmac binding optimizations
 - Handled JH7110 conflicting work in PATCH 07 via PATCH v2 04
 - Reworked PATCH 8 via PATCH v2 05, adding JH7100 quirk and dropped
 - starfive,gtxclk-dlychain DT property, also fixed register naming
 - Added PATCH v2 08 providing DMA coherency related DT changes
 - Updated PATCH 9 commit msg:
   s/OF_DMA_DEFAULT_COHERENT/ARCH_DMA_DEFAULT_COHERENT/
 - Replaced 'uncached-offset' property with 'sifive,cache-ops' 
   in PATCH 10/12 and dropped 'sideband' reg
 - Add new patch providing coherent DMA memory pool (PATCH v2 10)
 - Updated PATCH 11/12 according to the stmmac glue layer changes in
   upstream
 - Split PATCH 12/12 into PATCH v2 10-12 to handle individual gmac setup of
   VisionFive v1 and BeagleV boards as they use different PHYs; also
   switched phy-mode from "rgmii-tx" to "rgmii-id" (requires a reduction of
   rx-internal-delay-ps by ~50%)
 - Rebased series onto next-20231024
 - v1: https://lore.kernel.org/lkml/20230211031821.976408-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (11):
  dt-bindings: net: snps,dwmac: Allow exclusive usage of ahb reset
  dt-bindings: net: starfive,jh7110-dwmac: Drop superfluous select
  dt-bindings: net: starfive,jh7110-dwmac: Drop redundant reset
    description
  dt-bindings: net: starfive,jh7110-dwmac: Add JH7100 SoC compatible
  net: stmmac: dwmac-starfive: Add support for JH7100 SoC
  riscv: dts: starfive: jh7100: Add dma-noncoherent property
  riscv: dts: starfive: jh7100: Add ccache DT node
  riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
  riscv: dts: starfive: jh7100-common: Setup gmac pinmux
  riscv: dts: starfive: visionfive-v1: Enable gmac and setup phy
  [UNTESTED] riscv: dts: starfive: beaglev-starlight: Enable gmac

Emil Renner Berthing (1):
  riscv: dts: starfive: Add pool for coherent DMA memory on JH7100
    boards

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   |  84 +++++++++------
 .../dts/starfive/jh7100-beaglev-starlight.dts |   5 +
 .../boot/dts/starfive/jh7100-common.dtsi      | 100 ++++++++++++++++++
 .../jh7100-starfive-visionfive-v1.dts         |  17 +++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  51 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   6 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  |  32 +++++-
 8 files changed, 259 insertions(+), 39 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

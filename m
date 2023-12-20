Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA5C4706C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 21:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tI9dJ2VJVEkIcZRmRbZJ+UnWjTC/Lrjji97ibg+YobE=; b=n3ErfEU8YOALFJ
	gnXvs+VJsMMKo4SdZ3imljbhj2xDc4axCc+R4gsy9vKOGFiR/vgKYwVmvYYHBaiPMhAlgk70+KiDi
	3R3t8Ojx6gQ/GmzBENWHlH7wRMuPazS6G9n5QsIQdrBA9QiXhfV0sPbcEGYKuM5V4pcf5cUHD5/Uo
	bz53J5hJpyFK+gJrtwlxnm0HAyEYlUAt5lxtSkLe00V1kxdXTXFWfNrWRYJtbPRV5D2ecBIEWv6sJ
	Guu8twzaWd5Vh4MG/uvlLwXvs3YpVBVoCfUafrn2w0i3cGRDsQFEv/HZp9WRqj5ANbct9HQEzSGJZ
	YYyLkq0u/WorqH4TwRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3x2-000uIn-0b;
	Wed, 20 Dec 2023 21:18:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3wx-000uG8-17
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 21:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703107072;
	bh=LToB9O1kzplrx0ArQIKTk3jeG9kcJyhV6Az+MBs4+P4=;
	h=From:To:Cc:Subject:Date:From;
	b=pc5FCFsO5gyBiQjQHGODZnZxvmbSnGUeAvv/QPvQNafZpqWm4yw0w7Pzrce5jdlsz
	 FzEvRVi8uYngZnkSuj6CDcQvVbQz42gh/tD1UT+TAtnwxqu78QqftFsGfn6HvAusVi
	 h8D94spDbe8M1y+Fx9lkKsVmU0kNo6D8NNpi7qRZVPb18hsoM5e/Y4OB43gxqmnzfV
	 83uvJPgpkGxomNALy3kLobv2JAG8i6mG+48zs18gRGHwOSvIYUlchAdCAYPiTCEBOX
	 LDMvX7A+7Dqawpr7CNB/TsuMgYqxPZVI8kG7Wtkjn/Csc1ayMWvxjORIH3DVO4B7FO
	 4npAppxo4v6HA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D335F3781F8C;
	Wed, 20 Dec 2023 21:17:51 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v6 0/4] Enable networking support for StarFive JH7100 SoC
Date: Wed, 20 Dec 2023 23:17:38 +0200
Message-ID: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_131755_588346_BEED5C65 
X-CRM114-Status: GOOD (  12.68  )
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
boards, although I could only validate on the former SBC.  Thank you Emil
and Geert for helping with tests on BeagleV!

The work is heavily based on the reference implementation [1] and depends
on the SiFive Composable Cache controller and non-coherent DMA support
provided by Emil via [2] and [3].

*Update 1*: As of next-20231214, dependencies [2] & [3] have been merged.

*Update 2*: Since v5, the dwmac patches will be handled via [4], while the
            clock patches subset via [5].

[1] https://github.com/starfive-tech/linux/commits/visionfive
[2] https://lore.kernel.org/all/CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com/
[3] https://lore.kernel.org/all/20231130151932.729708-1-emil.renner.berthing@canonical.com/
[4] https://lore.kernel.org/lkml/20231220002824.2462655-1-cristian.ciocaltea@collabora.com/
[5] https://lore.kernel.org/lkml/20231219232442.2460166-1-cristian.ciocaltea@collabora.com/

Changes in v6:
 - Applied alphabetical ordering in PATCH 3 and 4 (Emil)

Changes in v5:
 - Collected R-b tags from Jacob and Andrew
 - Squashed PATCH 2 into PATCH 1 per Krzysztof's review
 - Drop unsupported snps,no-pbl-x8 property from gmac DT node
 - Split series into patch sets per subsystem, as described in "Update 2"
   section above (per Andrew's review)
 - v4:
   https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/

Changes in v4:
 - Restricted double usage of 'ahb' reset name in PATCH 2 (Jessica, Samuel)
 - Moved phy reference from PATCH 5 to both PATCH 6 & 7 where the node is
   actually defined (Emil, Conor)
 - Drop unnecessary gpio include in PATCH 6; also added a DTS comment
   describing the rational behind RX internal delay adjustment (Andrew)
 - v3:
   https://lore.kernel.org/lkml/20231215204050.2296404-1-cristian.ciocaltea@collabora.com/

Changes in v3:
 - Rebased series onto next-20231214 and dropped the ccache & DMA coherency
   related patches (v2 06-08/12) handled by Emil via [3]
 - Squashed PATCH v2 01/12 into PATCH v3 2/9, per Krzysztof's review
 - Dropped incorrect PATCH v2 02/12
 - Incorporated Emil's feedback; also added his Co-developed-by on all dts
   patches
 - Documented the need of adjusting RX internal delay in PATCH v3 8/9, per
   Andrew's request
 - Added clock fixes from Emil (PATCH v3 8-9/9) required to support
   10/100Mb link speeds
 - v2:
   https://lore.kernel.org/lkml/20231029042712.520010-1-cristian.ciocaltea@collabora.com/

Changes in v2:
 - Dropped ccache PATCH 01-05 reworked by Emil via [2]
 - Dropped already applied PATCH 06/12
 - Added PATCH v2 01 to prepare snps-dwmac binding for JH7100 support
 - Added PATCH v2 02-03 to provide some jh7110-dwmac binding optimizations
 - Handled JH7110 conflicting work in PATCH 07 via PATCH v2 04
 - Reworked PATCH 8 via PATCH v2 05, adding JH7100 quirk and dropped
   starfive,gtxclk-dlychain DT property; also fixed register naming
 - Added PATCH v2 08 providing DMA coherency related DT changes
 - Updated PATCH 9 commit msg:
   s/OF_DMA_DEFAULT_COHERENT/ARCH_DMA_DEFAULT_COHERENT/
 - Replaced 'uncached-offset' property with 'sifive,cache-ops' in PATCH
   10/12 and dropped 'sideband' reg
 - Add new patch providing coherent DMA memory pool (PATCH v2 10)
 - Updated PATCH 11/12 according to the stmmac glue layer changes in
   upstream
 - Split PATCH 12/12 into PATCH v2 10-12 to handle individual gmac setup of
   VisionFive v1 and BeagleV boards as they use different PHYs; also
   switched phy-mode from "rgmii-tx" to "rgmii-id" (requires a reduction of
   rx-internal-delay-ps by ~50%)
 - Rebased series onto next-20231024
 - v1:
   https://lore.kernel.org/lkml/20230211031821.976408-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (4):
  riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
  riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
  riscv: dts: starfive: visionfive-v1: Setup ethernet phy
  riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio

 .../dts/starfive/jh7100-beaglev-starlight.dts | 11 +++
 .../boot/dts/starfive/jh7100-common.dtsi      | 84 +++++++++++++++++++
 .../jh7100-starfive-visionfive-v1.dts         | 22 ++++-
 arch/riscv/boot/dts/starfive/jh7100.dtsi      | 36 ++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

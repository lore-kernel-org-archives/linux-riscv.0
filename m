Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C8EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6o+MWZSgscOFUC+TZ1jlc+XM03JwWFOElZoOOM1cvfM=; b=2ZU
	lSwPiaVwV9vYF5IuDuk4O/P9+fqPUOVvdLvpFzFl1MLN333wgOoE1Ch6VibitCatGpVNGLioybImP
	35m1MjloWgKX5iZnafzEXXXzg3mmu/MCmP5JCNu66cv0jZpvRg/d3rr3fSvtgYZ10JtIennMf7cE/
	oqNuljxpZxl2V5rotT5s65T5Y08mvbI50XiGd+YXcUNJu8UhVxLRW+nYXT+ov2przf4VHX32ptJHj
	Ineps7kfX1vWmVECAV5B96ToKP9e5m+trAD4Ar50EVfajy93mRs9SQZOzPiepxGPxK8Bgiz387fMo
	yKwYMN1EQU6GbtEDdH+0oLselzLqRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2um0-0000000H1py-0KFd;
	Fri, 03 May 2024 15:24:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ulx-0000000H1pM-1bnS
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 15:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10AFF61DBD
	for <linux-riscv@lists.infradead.org>; Fri,  3 May 2024 15:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3273C116B1;
	Fri,  3 May 2024 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714749867;
	bh=VzYDjz6Alrh5rc29azegKHfeaIuyDttUXWVT6P1Z5Qc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Bd+hPBjiI2lvqOXQOLp4/KMxCgCWaFSmWc9LMrAkocGUM+UHPNSrgECAjaWwBInpD
	 2IhQMkS2dl8F1M2qRSg07wh9dMmT3S41hvVNNx2pdtztTQRFCqg8Hto00CFE7lbXJv
	 thGGsLF5hqjJ8zCGCcvubLPE68li8wJk9bVLuwgG4gOHCl8iYe8mxQw7wH7xz97Tct
	 RV6CSSBS84y9Z2ntmM8Igrv3j7IIIEKAx3Z+0X53xzNslJ/nV/uZe1lZBhOH4BSCSK
	 4rTLprkrqiVuOeXn5qUVxuJFM4kjtlo0gGr4o1CCP1huCnOVSvLBS82+BiwyWQwiG7
	 a4HS005QTz5zg==
Date: Fri, 3 May 2024 16:24:24 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240503-swimmer-botany-7368a8a17b1a@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_082429_604164_F60072DB 
X-CRM114-Status: GOOD (  20.25  )
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
Content-Type: multipart/mixed; boundary="===============8894395317771687198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8894395317771687198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nt1dKSqlHDLidhSC"
Content-Disposition: inline


--Nt1dKSqlHDLidhSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull some dt updates for v6.10. The diff here is a little bigger
than my tag implies, but I've done this on top of -fixes and wanted to
make this obvious. I've also not really mentioned all the Kconfig stuff
much as you'll get that in another branch.

Cheers,
Conor.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.10

for you to fetch changes up to 8fd63d81a76024fbd8e3fca29a0748bc9ca46161:

  riscv: dts: microchip: add pac1934 power-monitor to icicle (2024-05-02 17:24:09 +0100)

----------------------------------------------------------------
RISC-V Devicetrees for v6.10

Canaan:
Basic support for the k230 from Canaan and two boards based on it.
The k230 is the first SoC we're adding support for that implements the
ratified Vector extension, granted mainline doesn't yet support the
non-ratified extension for the SoCs that have it. Only the "Big" core is
supported right now and in a very basic configuration. The SoC is also
the first we have that support the Zicbom and Zicboz cache
management/zeroing extensions. Despite having T-Head CPU cores, the
non-spec compliant page table bit "erratum" isn't currently used here
either, as the SoC supports the standard Svpbmt extension. Using Svpbmt
requires non-factory m-mode firmware to clear the relevant bit in
CSR.MXSTATUS, but non-factory firmware is required for running mainline
on most (all?) SoCs using a T-Head CPU to date due to other issues.
Commit 5db2c4dc413e ("riscv: dts: add initial canmv-k230 and k230-evb
dts") contains more information on the supported extensions.

Support for the k230 required some re-jiggling of Kconfig options that
previously operated under the assumption that a Canaan SoC meant a
kernel running in m-mode with the MMU disabled.

Microchip:
A simple addition of a power-monitor on the Icicle dev board, as the
binding for it is now in mainline.

StarFive:
Support for the Milk-V Mars. This board is incredibly similar to the
VisionFive v2 that is already supported, with only the really ethernet
configuration being slightly different. Emil requested that a common
dtsi file, so my fixes branch is pulled into for-next to avoid an
annoying conflict between moved content and some erroneously added
nodes that were removed as fixes this cycle.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      RISC-V: Drop unused SOC_CANAAN
      RISC-V: add Milkv Mars board devicetree
      riscv: dts: microchip: add pac1934 power-monitor to icicle

Hannah Peuckmann (2):
      riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
      riscv: dts: starfive: visionfive 2: Remove non-existing I2S hardware

Jisheng Zhang (8):
      riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
      dt-bindings: riscv: starfive: add Milkv Mars board
      riscv: dts: starfive: visionfive 2: update sound and codec dt node name
      riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
      riscv: dts: starfive: visionfive 2: add tf cd-gpios
      riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
      riscv: dts: starfive: introduce a common board dtsi for jh7110 based boards
      riscv: dts: starfive: add Milkv Mars board device tree

Shengyu Qu (1):
      riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board

Thomas Bonnefille (1):
      riscv: dts: thead: Fix node ordering in TH1520 device tree

Yangyu Chen (10):
      riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
      soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
      clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      dt-bindings: riscv: Add T-HEAD C908 compatible
      dt-bindings: add Canaan K230 boards compatible strings
      dt-bindings: timer: Add Canaan K230 CLINT
      dt-bindings: interrupt-controller: Add Canaan K230 PLIC
      riscv: dts: add initial canmv-k230 and k230-evb dts

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/riscv/canaan.yaml          |   8 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/starfive.yaml        |   1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/Kconfig.socs                            |   8 +-
 arch/riscv/Makefile                                |   2 +-
 arch/riscv/boot/dts/canaan/Makefile                |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts          |  24 +
 arch/riscv/boot/dts/canaan/k230-evb.dts            |  24 +
 arch/riscv/boot/dts/canaan/k230.dtsi               | 142 +++++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  32 +
 arch/riscv/boot/dts/starfive/Makefile              |   1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |   2 +-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 599 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts |  30 +
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 683 +--------------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi           |   2 +-
 arch/riscv/boot/dts/thead/th1520.dtsi              |  54 +-
 arch/riscv/configs/nommu_k210_defconfig            |   3 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   3 +-
 drivers/clk/Kconfig                                |   4 +-
 drivers/pinctrl/Kconfig                            |   4 +-
 drivers/reset/Kconfig                              |   4 +-
 drivers/soc/Makefile                               |   2 +-
 drivers/soc/canaan/Kconfig                         |   4 +-
 26 files changed, 914 insertions(+), 727 deletions(-)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts

--Nt1dKSqlHDLidhSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUBqAAKCRB4tDGHoIJi
0nsTAQD1j/ao7NZPHfuXO/jza5QJzPbolfBIuFqm70sCePC/6AEAvzSVrA37RNTt
DySd8hlht5b24XLbV521NQgCaFrShwM=
=hh0Y
-----END PGP SIGNATURE-----

--Nt1dKSqlHDLidhSC--


--===============8894395317771687198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8894395317771687198==--


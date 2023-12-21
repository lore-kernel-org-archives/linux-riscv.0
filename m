Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630B9C46CCD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FLuNjoCXX67Ef4K7BdJ6oGCa5vVaJsvy+AEs2H0vMLU=; b=fQC
	Omc6tCB3D52QITEwJ1RvAMrWm8KxWFKlET2XZzHGuh58BH0k0jjFv5mIBjw4XWlq3+w6k4EWrysae
	ZlOLX7tqsJzEkhxkW962wcgOFW3Gb/g8XkytsFiS5E61DBALTxbS33dsfn4MAg6h8pWrGob9nVW4W
	QFCX16vstjivHwWVBLrz13z9O6QGhO9g1wznpicWTLymt4Jv94ZJ4F8IiixhwfTfgBYywkWhFIdtv
	iERCD1WZx4NSXofBkNRrY2uSbis+Q6K6Nl6+MmouRI5Dt1C5PjhC8G7akb5FNSOjd0aFlgRMEc6j2
	Q3oFi99Y/fKbjcc0m0xT4CUhtW3HRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJ2V-002wL5-28;
	Thu, 21 Dec 2023 13:24:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJ2S-002wII-1M
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17202B81D39;
	Thu, 21 Dec 2023 13:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A2BC433C8;
	Thu, 21 Dec 2023 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703165074;
	bh=7FWVcSzZbrEwSEb8LbF4qRX3FUJBV3gJMuupWAzoceQ=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=IJJnao2idCriu6ysD3D2WnPhXVYVkZbaEvnXQ2Npaibn1G4jtp14eFqf2FA7Fz4ZL
	 B8LSJi5hT8j5rmrR0GitZDT7peRvbDPQW0MnST2bSkmArLrarb8c3is9dkWfkhgCfg
	 oRFHZlubjVO9yu2wPWA3YbeLkme93rFWBaUMozYCFnS30g/AN55WJHsEutN7w+2cx5
	 H2/hmh9+7yRXIbXRWBZBofe7WuSpRMtgv1ELlZgpClXkIqJz0ZVbhlBaPHZAqgYmdE
	 xNXOkGmDCd+GQkejs0glUgia7L8GbjJ7CkzLM3UwuHsZIxKhfyWWphnVi/NPHxeTw/
	 ouKlN8ub/oROg==
Date: Thu, 21 Dec 2023 13:24:30 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.8
Message-ID: <20231221-skimmed-boxy-b78aed8afdc4@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_052436_752732_EDF797F3 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: multipart/mixed; boundary="===============4264821271713111045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4264821271713111045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxKS5Jqh9/jL3T9S"
Content-Disposition: inline


--FxKS5Jqh9/jL3T9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull dt changes for RISC-V. I've got the T-Head SoCs here as
Jisheng has been busy IRL this cycle and not had the time to set up
branches etc yet.

Happy Christmas and all that jazz,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.8

for you to fetch changes up to 56b10953da7e9e92eb1a72860db656ac6a5699a1:

  riscv: dts: starfive: Enable SDIO wifi on JH7100 boards (2023-12-13 15:50:23 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.8

StarFive:
Key peripheral support for the jh7100 that depended on the non-standard
non-coherent DMA operations, namely mmc, sdcard and sdio wifi. This
platform has long been supported out of tree by Emil and Ubuntu etc ship
images for it, so having mainline support for a wider range of
peripherals (at last) is great.

Microchip:
The flash used by Auto Update support and the corresponding QSPI
controller are added. On publicly available Icicle kits this flash is
not usable (engineering sample silicon issues) but in the future Icicle
kits will be available that have production silicon.

T-Head:
Jisheng is busy with RL this cycle and hence T-Head appears here. The
Lichee Pi and BeagleV both grow eMMC and uSD support.

Sopgho:
Support for the Huashan Pi and the cv1812h SoC it uses. The cv1812h is
almost identical to the existing cv1800b SoC. These SoCs are intended
for use in IP camera type systems but also appear on SBCs, with the last
digit denoting the amount integrated DDR3 the device has. The difference
between the cv1812h and the existing cv180x devices appears to be the
addition of video output interfaces.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      Merge patch series "Add Huashan Pi board support"
      riscv: dts: microchip: add the mpfs' system controller qspi & associated flash

Drew Fustini (3):
      riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
      riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
      riscv: dts: thead: Enable LicheePi 4A eMMC and microSD

Emil Renner Berthing (6):
      riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
      riscv: dts: starfive: Add JH7100 cache controller
      riscv: dts: starfive: Add pool for coherent DMA memory on JH7100 boards
      riscv: dts: starfive: Add JH7100 MMC nodes
      riscv: dts: starfive: Enable SD-card on JH7100 boards
      riscv: dts: starfive: Enable SDIO wifi on JH7100 boards

Geert Uytterhoeven (1):
      riscv: dts: starfive: Group tuples in interrupt properties

Inochi Amaoto (7):
      dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
      dt-bindings: timer: Add SOPHGO CV1812H clint
      dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
      riscv: dts: sophgo: Separate compatible specific for CV1800B soc
      riscv: dts: sophgo: cv18xx: Add gpio devices
      riscv: dts: sophgo: add initial CV1812H SoC device tree
      riscv: dts: sophgo: add Huashan Pi board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |   4 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  21 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  17 ++
 arch/riscv/boot/dts/sophgo/Makefile                |   1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            | 123 +------------
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |  48 +++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi            |  24 +++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             | 193 +++++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100-common.dtsi    | 131 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |  48 ++++-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  20 +++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  20 +++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  34 ++++
 15 files changed, 568 insertions(+), 118 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx.dtsi

--FxKS5Jqh9/jL3T9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYQ8jgAKCRB4tDGHoIJi
0j6zAQDYw4UJXtlMCyPcWXiX3EUkP6TbpOlVJyWUyb9ecJH1vAD/b22b+u2cTzUe
Qikxq0vinYqnUqElSYqyvr7p9265Tgc=
=bQtm
-----END PGP SIGNATURE-----

--FxKS5Jqh9/jL3T9S--


--===============4264821271713111045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4264821271713111045==--


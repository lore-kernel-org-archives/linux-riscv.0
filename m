Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2880AC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qo7sg+FEeWCdSlzE9FhEm18H+T85sKx5+ReSPubFDh8=; b=Vrd
	MB+Ru4dRtOUJ/fcetuEQj8GASmOtK/O7I95e4qU15uTH4qrfF5Lz+TeBH8Uxw1nGw1ZH064H/n5GG
	98BQaYma0UFcgp8aB7/TzBu+4gpAz8LS2Ni8U6BXh4rOU+c4NY1ozCEoAnEnlMPz2n3DWtE3/seGG
	wqZQCRf0xkX2OVFagY84wHvu+arI+px4vXZVnMxZ3WF+ZJSbjcjU6IOCAS7oJwgpMjehRJZlyhmGk
	Q5fUg5IizuaLHzTDOheflP/qVKZRSlrDFSMfFTNaVupBAS95m6/Z3kFdaZkt0+bCycbdPciAY8avp
	vR2UIA/sAIS2U4cKbZsy+3OQ2ierftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7dE-00CGKi-2T; Thu, 26 Jan 2023 19:09:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7dA-00CGJd-9G
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 19:09:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 757CBB81EE0;
	Thu, 26 Jan 2023 19:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF2DC433EF;
	Thu, 26 Jan 2023 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674760189;
	bh=yoLqLLh67JPLvT+Xn035YUyJhy4CQyHZoWzJtyOVRb0=;
	h=Date:From:To:List-Id:Cc:Subject:From;
	b=iG2wcs9OQxNGuiF/vg8rxv9xc8xRqWrzz3RWz6Y9cR8pK/rAw5OHnFC2TwBowx6nQ
	 EpoEJ0GjOiIxUu3z+9r5jez422R3m9ZPloP1f75kQq+ThAo+53m5RNJxSHp1h47HgW
	 Y5F3CCzLVWnUA6aWUKIBrqCFuuJ3yZUVevJZHDijTKwUzVL1TsjDmyKcp3PjT6tTKh
	 qRJEGFeVwdZSKzZNUIDZGNCXUWPsZ7QPb1hTtPbjjwQxPjAWgNXXGRBgkDZwULA4eo
	 614wxl8FKpttczI1V53bxkQ77PjYfZRvsRIU6FVXREW+wqZ21unaqf3r2+ofDrhMjC
	 WiILLasfJmB7g==
Date: Thu, 26 Jan 2023 19:09:45 +0000
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.3
Message-ID: <Y9LP+Za1h0fkBa58@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_110952_649892_26696A1A 
X-CRM114-Status: GOOD (  16.14  )
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
Content-Type: multipart/mixed; boundary="===============8899100149448807918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8899100149448807918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dlm5AlAf3VZ5jgOb"
Content-Disposition: inline


--Dlm5AlAf3VZ5jgOb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

DT stuff here for v6.3! I was kinda hoping to have a VisionFive 2 DT
for you, but alas no.
The changelog looks a bit odd since it's filled with un-reviewed
commits of my own, but they went as a PR to Palmer & are in riscv's
for-next too:
https://lore.kernel.org/all/167225428483.14530.3368527680488639805.b4-ty@rivosinc.com/
They might also pop up as part of the Allwinner DT PR, if the D1 stuff
lands for v6.3, which I hope does happen!

Thanks,
Conor.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.3-mw0

for you to fetch changes up to d9c36d016f6112e636f18a49a5f779c7f8667deb:

  Merge patch series "Add a devicetree for the Aldec PolarFire SoC TySoM" (2023-01-25 11:09:32 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.3-mw0

Microchip:
A vendor prefix for Aldec and both a binding and Devicetree for the
Aldec TySoM devkit for PolarFire SoC. This Devicetree corresponds to
what they are shipping in the SDK for rev2 boards.

StarFive:
Just the binding for the new StarFive JH7110 SoC and its first-party
SDC the VisionFive 2.

Other:
I was expecting the Devicetree for the aforementioned board to be ready
for this window, as the pinctrl driver had seem some review prior to
v6.2 and both it & the base clock drivers are heavily based on the
existing drivers for the JH7110.
That didn't come to be.. Christmas, the RISC-V Summit in December and
the Lunar New Year all playing a part perhaps.
Because of that, both Palmer and I have the Kconfig.socs work in our
branches, although in hindsight it probably wasn't needed here as I
only added the TySoM Devicetree & the conflict would've been trivial.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (11):
      RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols
      RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN
      RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
      RISC-V: stop selecting the PolarFire SoC clock driver
      RISC-V: stop selecting SiFive clock and serial drivers directly
      RISC-V: stop directly selecting drivers for SOC_CANAAN
      Merge tag 'soc2arch-immutable' into riscv-dt-for-next
      dt-bindings: vendor-prefixes: Add entry for Aldec
      dt-bindings: riscv: microchip: document the Aldec TySoM
      riscv: dts: microchip: add the Aldec TySoM's devicetree
      Merge patch series "Add a devicetree for the Aldec PolarFire SoC TySoM"

Emil Renner Berthing (1):
      dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board

 .../devicetree/bindings/riscv/microchip.yaml       |   1 +
 .../devicetree/bindings/riscv/starfive.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/riscv/Kconfig.socs                            |  39 +++--
 arch/riscv/Makefile                                |   2 +-
 arch/riscv/boot/dts/Makefile                       |   2 +-
 arch/riscv/boot/dts/canaan/Makefile                |  14 +-
 arch/riscv/boot/dts/microchip/Makefile             |   9 +-
 .../boot/dts/microchip/mpfs-tysom-m-fabric.dtsi    |  18 +++
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     | 165 +++++++++++++++++++++
 arch/riscv/boot/dts/sifive/Makefile                |   4 +-
 arch/riscv/boot/dts/starfive/Makefile              |   2 +-
 12 files changed, 235 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts

--Dlm5AlAf3VZ5jgOb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LP+QAKCRB4tDGHoIJi
0qSqAP9+VLU/tGX89ZeYWbEg7uuqMcN2rNt5KiRgFzmG7P3swAD/TRAvJPKuiV/c
XSEhonnIeOZ3azZmPveEg2x2ULTxiQ4=
=Tw66
-----END PGP SIGNATURE-----

--Dlm5AlAf3VZ5jgOb--


--===============8899100149448807918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8899100149448807918==--


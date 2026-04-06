Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ECEF4ECA
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DgDL3eYScPYF9euDTi3k2SMZJqwaUEDRasmp7Oqvim4=; b=rrx
	q7z4TubQMm6KdWRPIjhbH5NEIDs8YfLm5Xfh5pmmwoXzoTUNVAJ9aQqCfLZfN5y50d6zMwHuo9g1z
	J4DlwePu6VY439255G4Bu0Y2PYT+LLUi1LVwRJAFir4OBZFYnoQinLl8riZz6w+OYgnQYwmkCgP3b
	Glko7fNCG1ZBWZCH0krDkmEAxN5leFdKDqiwViwEEPj/aAL3p1eckIJwk6oYoRasAqK0WbJ6ucJKH
	SnqXR3riaKFEGr9MTPJ0gwf+5d7UAWBOWkOCqTs3oLyiPh/zQdkWGfMRkWek3aw8jo/3OgmHBlLZl
	ZLK0RGazlZpjQhif5cBbBax0axcsw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hAG-000000050Vq-4145;
	Mon, 06 Apr 2026 10:26:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hA4-000000050U3-1poq
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 10:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D73E4600AC
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 10:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9858FC19425;
	Mon,  6 Apr 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471187;
	bh=qS4E0xtxwuKCCBv77om50f74/fK7c/RW5/rBn2tRAqU=;
	h=Date:From:To:Cc:Subject:From;
	b=fI/XNrYu4dGZ6RK+s9C6BXeAgzlDZd6hwa6D5CHGWaAT7WG5c2wXZzPnEgHRJO0Uj
	 JE2+JlGIxl2xBATjD2eUq+NN5/Px61rk5zd9MLZsRH8C6zfXMMdCXl07WBa478aq6v
	 /qtee8/niWBKWVMabrEK/A09swcCGwOHFec+yMn2rEQar9qJvBvgKqgKpspgpgSgK1
	 YcjdhgpSLI7PRNu6vJKRx0Ghx+X34QgBQBhN+5mMUFkGDe4oPrAhs6YfgZinTgvCZu
	 xKT3g1G5Fc+EvjyCJtysmEmPRRfAMAwa+DFzfHQRQuDz3TwUvuomUS95CV3Mx8wEl3
	 58nS9eJU86f3Q==
Date: Mon, 6 Apr 2026 11:26:24 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V devicetrees for v7.1
Message-ID: <20260406-bronze-anemia-a5b3a254f46b@spud>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============2210159006687891103=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2210159006687891103==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yJRrSpeXvnL7gKno"
Content-Disposition: inline


--yJRrSpeXvnL7gKno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Realised as I was tagging this that the tsu clock and gpio interrupts
changes miss the pic64gx and should have been rebased. I'll send another
PR later this week I think, with those two fixes. Nothing is broken by
the two fixes, they just didn't fix the newly added dts, which is why I
still feel comfortable sending this, particularly given I am pretty late
already. My excuse is that I was sick all last week...

Cheers,
Conor.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.1

for you to fetch changes up to b0258f69f1e0ed98e8506706da9ef538389b27ea:

  riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC (2026-03-31 15:51:52 +0100)

----------------------------------------------------------------
RISC-V devicetrees for v7.1

Generic:
Add binding coverage for Supm.

Microchip:
Add support for the picgx64 and its curiosity board. This is a PolarFire
SoC without the FPGA.
Add the missing tsu_clk for ptp on the macb on PolarFire SoC and resolve
a long-running problem with gpio interrupts being incorrectly described
on the platform.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (3):
      riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit
      riscv: dts: microchip: add tsu clock to macb on mpfs
      riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC

Guodong Xu (1):
      dt-bindings: riscv: Add Supm extension description

Pierre-Henry Moussay (4):
      dt-bindings: timer: sifive,clint: add pic64gx compatibility
      dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
      riscv: dts: microchip: add pic64gx and its curiosity kit
      riscv: dts: microchip: remove POLARFIRE mention in Makefile

 .../devicetree/bindings/riscv/extensions.yaml      |  27 +
 .../devicetree/bindings/riscv/microchip.yaml       |   7 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/microchip/Makefile             |  17 +-
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |  29 +
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts   |  43 +-
 .../boot/dts/microchip/mpfs-icicle-kit-common.dtsi |  38 +-
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  63 +++
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |  41 +-
 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi    | 167 ++++++
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |  29 +
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |  37 +-
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |  35 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  59 +-
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts   | 165 ++++++
 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi | 177 ++++++
 arch/riscv/boot/dts/microchip/pic64gx.dtsi         | 630 +++++++++++++++++++++
 17 files changed, 1499 insertions(+), 66 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/pic64gx.dtsi

--yJRrSpeXvnL7gKno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadOKUAAKCRB4tDGHoIJi
0gJFAQDLD09fr2zKu5wpiBq+5+FpuBnzpoAKIWhsiT0Ww0rEagEA21hcUbPGpx5D
paevNIhczg2C50khlvCsQC9TUYt7nwk=
=SqWU
-----END PGP SIGNATURE-----

--yJRrSpeXvnL7gKno--


--===============2210159006687891103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2210159006687891103==--


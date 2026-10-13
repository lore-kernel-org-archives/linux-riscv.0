Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71DCC6B12
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fVfLhKMPv0yIvY/S3ZZvtOLIwbTPZpoi7g6Fp5XqjqY=; b=GyP
	sgUWDjX3xUVGADKSgM/6Fsa7TYcqJ4FQPPdME5jHI8dHaiP/MZ9x6sqWWsEXJbrLHydXmG03DXLOZ
	kufrFSFfF9gMcj1RXwZc4j3Ax1seYYVzTIBKBP0aAuj+OMSOr82cyh28UXFjX2O9HXqCW7YQKjKjf
	8pw34DRq0IlcoZ9w5ACUFhG/O6aRHrK7VgQsxyD8nqo1CQn+V6TrWrrucWPPIOzk6JdvMROlSIJ9K
	JFCGJXHs6n3lb1bdzdjSkzNb0+jtzO76NYuuAqySfWB8b8cgW5UUnhYremKo4/SNl/PgBFPWjJ4oq
	e/SgzTBGaeGF3PgdHNpHdrdR7CBUumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeaH-0000000DNPo-1yXV;
	Tue, 13 Oct 2026 15:38:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeaG-0000000DNPY-1oLF
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 15:38:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C725F60A56
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 15:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893021F000FF;
	Tue, 13 Oct 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905911;
	bh=N5Oj7Rkk38MwzvIcIM8NuJ7v/KOF73abuNQ17LhAzq4=;
	h=Date:From:To:Cc:Subject;
	b=Y5MRWl7qm1PyyvXnY8GILGL4uJXUB7tJICIK7eKfbDsVOewYl8ws1qMNp7/svlJDK
	 5y8EsOnX5a4+6T+Y5txmHhsYqkyRzTUcwVaExN4poswdlpYLtI9QJ6g7UQe5PoKwMo
	 W+lKGNIrQGE59jxm0T8ztiZJ6h7lf1KIwmWKXbpM22cuWMBLz0fRsI30tfYSHwITmW
	 b40v8EWrQXBGhV/KCYd/LTh5belkC/lGbEigMUj9p71P/c/QZVQV5iof0OO1Htmjwl
	 dZ1tAY9PS02KIG56ZJ3N1S6qUpAkjqTyWQb39CUAjJt/pwTsHGFWyd30oJyeHLbl2G
	 wLgq8LO+BXigw==
Date: Tue, 13 Oct 2026 16:38:28 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][3/4] RISC-V soc drivers for v7.4
Message-ID: <20261013-glitter-lingo-dce2f8d724c9@spud>
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
Content-Type: multipart/mixed; boundary="===============4068033020756584262=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4068033020756584262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MitpuVuUhMgl0OnZ"
Content-Disposition: inline

--MitpuVuUhMgl0OnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Diff here contains a lot of clock bindings, so I've provided an explanation
in the tag.

Thanks,
Conor.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.4

for you to fetch changes up to 6f77194e1147d85c10b4964edee7091c701a25c2:

  soc: mpfs: use kref cleanup on probe failure (2026-10-13 15:43:15 +0100)

----------------------------------------------------------------
RISC-V misc. soc drivers for v7.4

StarFive:
Syscon bindings and a socinfo driver for the JHB100. There ended up
being several clock bindings here also because the clock tree needed the
whole lot due to headers and I envisaged this being part of a three-way
shared tag between my soc driver branch, dts branch and the clock tree.
Due to timing, the dts branch didn't get this content, leading to the
slightly odd branch here.

Microchip:
A bugfix for teardown code in the mpfs system controller driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Changhuang Liang (9):
      dt-bindings: clock: Add StarFive JHB100 System-0 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 System-1 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 System-2 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-0 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-1 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-2 clock and reset generator
      dt-bindings: clock: Add StarFive JHB100 Peripheral-3 clock and reset generator
      dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
      soc: starfive: Add socinfo driver for JHB100 SoC

Guangshuo Li (1):
      soc: mpfs: use kref cleanup on probe failure

 .../bindings/clock/starfive,jhb100-per0crg.yaml    |  70 +++
 .../bindings/clock/starfive,jhb100-per1crg.yaml    |  70 +++
 .../bindings/clock/starfive,jhb100-per2crg.yaml    |  76 +++
 .../bindings/clock/starfive,jhb100-per3crg.yaml    |  76 +++
 .../bindings/clock/starfive,jhb100-sys0crg.yaml    |  63 +++
 .../bindings/clock/starfive,jhb100-sys1crg.yaml    |  71 +++
 .../bindings/clock/starfive,jhb100-sys2crg.yaml    |  64 +++
 .../soc/starfive/starfive,jhb100-syscon.yaml       | 115 +++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c        |   7 +-
 drivers/soc/starfive/Kconfig                       |   6 +
 drivers/soc/starfive/Makefile                      |   2 +
 drivers/soc/starfive/socinfo/Kconfig               |  13 +
 drivers/soc/starfive/socinfo/Makefile              |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c      | 105 ++++
 include/dt-bindings/clock/starfive,jhb100-crg.h    | 554 +++++++++++++++++++++
 include/dt-bindings/reset/starfive,jhb100-crg.h    | 189 +++++++
 18 files changed, 1482 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per3crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys0crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys1crg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys2crg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
 create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
 create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h

--MitpuVuUhMgl0OnZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5QdAAKCRB4tDGHoIJi
0jH+AP0aVmvcevkuXqE6dzgDkjyO0XSwMne8cPLhcSO5ptt3egEArnvMedLcdF8Q
oI1swvs1+0c6K14n6Q8ftzqm4wHXMgE=
=35bQ
-----END PGP SIGNATURE-----

--MitpuVuUhMgl0OnZ--


--===============4068033020756584262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4068033020756584262==--


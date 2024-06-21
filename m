Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55173C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3a/lmSEn8tU4Cd9FQeLVlG5nO08A4eMBcECxHRcGyeI=; b=2sR
	ZXWoh/3f6f45HL3wNxYudGBh+x3THK9M0QUd3nbtHvfTtgTHrN4YM0XLWL+bhrB9DGJVD8EV0fA5J
	6eo6W9e5QbDZY0B9szYIeDJ9VEBlQDIKcXNrUHd6UZQ5kOH9+BKkCw87WzfVnSKwH+/Yyze2OwkZc
	/H+nKFKocLcpoGz2Qwjz48evEey65qCVrZazsJuNG6wc2XHqn8FCXOdo7+419E0SvvniofgO6+0K+
	FMIpXhVclulBhct3GqBViWf2rPHGNvjTnN1c1ahkY8MBNVvYyKos411tlVqSGe+NuAjy8m0xtltBi
	0+0D5z6AWa+72qgcl9fFQdfAEk162BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKf01-00000009SM6-03rm;
	Fri, 21 Jun 2024 14:12:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKezx-00000009SLa-3n3o
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 14:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8FE37CE28A9
	for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 14:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51563C2BBFC;
	Fri, 21 Jun 2024 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718979134;
	bh=+3kDtIfwpLdAIGU3kSRUatUM44B6jyfXR2M7KmIHFT8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ZfRk3Xly22i8z8f4gpMhByhLprjhAL1pMv7uceABXvQQiAJUt/ssS7BbU6AoSDU0/
	 a8i1i+fLLVnInU8fSeTsQ2hMIQhERFvGep6ZEYG99Llm6VXzCe5XfvAysi62jVcG4I
	 fVDYVT3P5UhdayPKYe1YVKng+ByH936pB0eM9frRIuMB+Tu8XGDotqP3y/ighAGPwN
	 r6tXC/DC1ktWpvU3KYpuXf0fWit2A9qKaoGB4E7e3vrg5SIo2xdrR0d/MuXEAmpkv0
	 CQO/79bo1X9ejT6ZirK6EPCJT3dZMxedvzHieZFT/5dkem1bO27+46JJuxzaDkdNEK
	 blGKphjuq/vqg==
Date: Fri, 21 Jun 2024 15:12:11 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.10-rc5+
Message-ID: <20240621-clasp-punctured-ee3d595ae581@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_071218_160661_2576B844 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Type: multipart/mixed; boundary="===============0893342902420884300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0893342902420884300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SrZgj29P7TR2JXyO"
Content-Disposition: inline


--SrZgj29P7TR2JXyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a small set of fixes for the various platforms I'm
taking care of.

Thanks,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.10-rc5+

for you to fetch changes up to e21de658f8e808551c2f9702727442980bdc0ad7:

  MAINTAINERS: thead: update Maintainer (2024-06-20 21:53:01 +0100)

----------------------------------------------------------------
RISC-V Devicetree fixes for v6.10-rc5+

T-Head:
Jisheng hasn't got enough time to look after the platform, so Drew
Fustini is going to take over.

StarFive:
A fix for a regulator voltage range that prevented using low performance
SD cards.

Canaan:
Cleanup for some "over eager" aliases for serial ports that did not
exist on some boards and I/O devices disabled on boards where they were
not actually in use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Geert Uytterhoeven (2):
      riscv: dts: canaan: Clean up serial aliases
      riscv: dts: canaan: Disable I/O devices unless used

Jisheng Zhang (1):
      MAINTAINERS: thead: update Maintainer

Shengyu Qu (1):
      riscv: dts: starfive: Set EMMC vqmmc maximum voltage to 3.3V on JH7110 boards

 MAINTAINERS                                     |  2 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     |  7 ++++++-
 arch/riscv/boot/dts/canaan/k210.dtsi            | 23 ++++++++++++++++-------
 arch/riscv/boot/dts/canaan/k210_generic.dts     |  5 ++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  |  9 ++++++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts |  7 ++++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   |  9 ++++++++-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 10 ++++++++--
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi |  2 +-
 9 files changed, 58 insertions(+), 16 deletions(-)

--SrZgj29P7TR2JXyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnWKOwAKCRB4tDGHoIJi
0oPxAQDtf3I/CytdynLYUeFb1qma+xU2B6hpPZRuLWVN9+YMzAEAmq5LNC+vpqi4
oGZ52fFJyVqDjWsZKHTzpDlgeJ20CgE=
=JqD7
-----END PGP SIGNATURE-----

--SrZgj29P7TR2JXyO--


--===============0893342902420884300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0893342902420884300==--


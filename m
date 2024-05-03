Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB055C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wJRX8WSoa5X9eYsF9svaJZymg50WC5inOVTuhDZmtL0=; b=INe
	rtGaa/9r2BiaBT7+skorKoHwXfubS9Ificnm/wkWMI/u0lkx9H+xAced0dxq8XIdp2d7l0qFaX66h
	xlDMn3kz1uWyWz9J8yZlbWa3fVENZdzKOlwAUS7BkAfvbjgq1LF7gw8qSRxJHJ/oGSdRrHleHO/ku
	FgomKeBADZJlb9Fc/DzjMK+dDwN1PQFb2heWGKAYxZzNyi/fnwtm9YNU+7NHPKeZMoiixLNtFHzSb
	rsBGxWQ8wV2rnOmn2NFZpzFBYCeCwbhL7w/8qFJt8Uhns7axo5kh6heQa/WtnbciANiKAz6IX6G9U
	LZrELXpbeqs9NcNu4Xzh1JbM24zJSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vKl-0000000H8Tt-2l8D;
	Fri, 03 May 2024 16:00:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vKj-0000000H8TL-0h5r
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF940CE190E;
	Fri,  3 May 2024 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2168AC116B1;
	Fri,  3 May 2024 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714752021;
	bh=D/hkTPjcZ3XhzhYMbrhX7QYHL46VROSqlyZ0ngn0ErY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=FNQSV3XQRmxOP01zbKwIRelQMTww4h1zgAkrMPo/aSuu/6gp0fBcaZ/7zGXTWA24d
	 Uyx25HMWTVsKPD7P/q5Hm8n7sXNRCP4WyR0+HRyKj3MPYG2nfzMDOZti9KUMOYMeB5
	 CRRHprrASlTFQ4RH6W0wD6/0Bn3bn50u3/rFkqdLbzzy05txk4fF3+AMtaQ1wx/o3W
	 tro5+8TnHDat4f67teqRIHtrZfoLiR6VONnytUMlaYrPqTXp/eiLdLeWtxa8Ij3kjM
	 rxuP4N9iNKOfHn+CLnGBmXqV1RKCNH6lyOW5cZV+GJHMnuNGBjFxKGxIGESCn7vM15
	 mJmEjz79RUJPQ==
Date: Fri, 3 May 2024 17:00:18 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC drivers for v6.10
Message-ID: <20240503-mardi-underling-3d81a9f97329@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_090025_615351_ADC277C8 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Type: multipart/mixed; boundary="===============8573602234717651105=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8573602234717651105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2GaNlXgN7vr+swTG"
Content-Disposition: inline


--2GaNlXgN7vr+swTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

Please pull some SoC-related Kconfig changes for v6.10. LMK if you
think this stuff should really be going through the actual riscv tree
in the future and I'll just harass Palmer about it instead of taking
it myself. That said, Palmer did Ack it all...

Cheers,
Conor.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-co=
nfig-for-v6.10

for you to fetch changes up to cd899f85b1e454188fa2f14c3396a894f440b15f:

  riscv: config: enable ARCH_CANAAN in defconfig (2024-04-10 11:42:13 +0100)

----------------------------------------------------------------
RISC-V SoC Kconfig Updates for v6.10

A few different bits of SoC-related Kconfig work. The first part of
this is shared with the DT updates - the modification of all SOC_CANAAN
users to SOC_CANAAN_K210 to split the existing m-mode nommu k210 away
=66rom the k230 that is able to be used in a "common" kernel.

The other thing here is the removal of most of the SOC_VENDOR options,
with their ARCH_VENDOR equivalents that've been waiting in the wings for
1 year+ now made visible. Due a lapse on my part when originally adding
the ARCH_VENDOR stuff, the Microchip transition isn't complete - the
_POLARFIRE was a mistake to keep as there's gonna be non-PolarFire
RISC-V stuff from Microchip soonTM.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (4):
      RISC-V: Drop unused SOC_CANAAN
      RISC-V: drop SOC_MICROCHIP_POLARFIRE for ARCH_MICROCHIP
      RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
      RISC-V: drop SOC_VIRT for ARCH_VIRT

Yangyu Chen (6):
      riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
      soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
      clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
      riscv: config: enable ARCH_CANAAN in defconfig

 arch/riscv/Kconfig.socs                            | 22 +++++++++---------=
----
 arch/riscv/Makefile                                |  2 +-
 arch/riscv/configs/defconfig                       |  7 ++++---
 arch/riscv/configs/nommu_k210_defconfig            |  3 ++-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |  3 ++-
 arch/riscv/configs/nommu_virt_defconfig            |  2 +-
 drivers/clk/Kconfig                                |  4 ++--
 drivers/pinctrl/Kconfig                            |  4 ++--
 drivers/reset/Kconfig                              |  4 ++--
 drivers/soc/Makefile                               |  2 +-
 drivers/soc/canaan/Kconfig                         |  4 ++--
 tools/testing/kunit/qemu_configs/riscv.py          |  2 +-
 .../selftests/wireguard/qemu/arch/riscv32.config   |  2 +-
 .../selftests/wireguard/qemu/arch/riscv64.config   |  2 +-
 14 files changed, 31 insertions(+), 32 deletions(-)

--2GaNlXgN7vr+swTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUKEQAKCRB4tDGHoIJi
0i2GAQC5OhZf31C5jWXd+7ucb8Je+dskOOnCoIMe4riFlB01zwEA9Xya95A0Q6m0
ngc47qjBWdjchk4soRp5JD3yqolh0AI=
=OTNe
-----END PGP SIGNATURE-----

--2GaNlXgN7vr+swTG--


--===============8573602234717651105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8573602234717651105==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63481C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1luxEfZJXwnEbcJVfxQcQZIwOZ0s3VphmhBzK1VnjeY=; b=JWP
	1mjRnaRFDf+5clnRwKiRKzChsywUirRn8QOV2lNPKsiTd+QMkWKM0Kgw0U0uYfRp8XiCYwALQF9vK
	BcFAGyAA80ejof0Fpiva6ObTdWpS5BxytnbBXwB8CHfx2jvXTBRJAfzzABiUlDs6bAX2jzdXRfD/s
	hBMhMnE32LoYkUkVzJWeKqskb/kzkaX53tvjGgj28ij14gaUUX7w58ajysbdv1nbQ9YAhfFA/jaQB
	Z7DltiQXQY7TNQmyJ3fwbkENVSSa+WouWXLZKKix9nnr5AmxV3QRRjqwvvF9IZ5E4hPyNdS+3q0De
	C1Lf4DbrPe4x7V+L45/moViDByvTMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5it-00000008H9d-0s0U;
	Wed, 16 Jul 2025 17:15:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5iq-00000008H91-1TZb
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 17:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9ACE5C657D
	for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 17:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1DEC4CEE7;
	Wed, 16 Jul 2025 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752686110;
	bh=irLzSsCSYV5e8jDywzJqBUzqNoElbnVbaUSxvmy/N6w=;
	h=Date:From:To:Cc:Subject:From;
	b=e9neS086GERdBhjjHyTrxKGkQJt08A+Y+Xr8QpxOWWjaCbS3Q70D/8M3jjOnvCn/+
	 cvM+mutAi9N39HnOI/EGOxNW2ij6kMMgUwc/Dk5pqdPwzIYd8tmgUIOL+TD5Lhs59G
	 jFRHOKz6rVQ9i6CAtk8cK7176H71BMo34dlD8j/8AGAAa0vGCwYWyxt8ofUIEcAxd/
	 w+ZDCwu2FDLm2pRxLP/hY2EawHqymZhOTHEV/W14LVudalrnFv8Pkpssnhi+a80pJU
	 dYFJ88I/2gKQ4rjawHCaSnxRPqptgSCEYJhmMr+GB3qP3ErHUOrzFo88yx+JCf4+5D
	 S50WDPqeTfe6A==
Date: Wed, 16 Jul 2025 18:15:07 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V SoC defconfig for v6.17
Message-ID: <20250716-defrost-regime-20a55ed925ad@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_101512_434882_F41EB3F8 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3426831311598815217=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3426831311598815217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jp5PSx/13vPMpdjr"
Content-Disposition: inline


--jp5PSx/13vPMpdjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a small defconfig pr. I may have some dts changes in a
later PR if Linus doesn't tag v6.16 this weekend, but if he does then
this is all I have for the v6.17 merge window.

Cheers,
Conor.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-config-for-v6.17

for you to fetch changes up to bd4d5d3faadcdf5d65377f14dcbaa4dbb27ee637:

  riscv: defconfig: spacemit: enable sdhci driver for K1 SoC (2025-07-09 17:13:24 +0100)

----------------------------------------------------------------
RISC-V soc defconfig for v6.17

spacemit:
Enable sdhci and pwm drivers for the k1 soc in defconfig, the former as
a builtin and the latter a module.

starfive:
Remove a no-longer required config for the starfive sound driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Geert Uytterhoeven (1):
      riscv: defconfig: Remove CONFIG_SND_SOC_STARFIVE=m

Guodong Xu (1):
      riscv: defconfig: Enable PWM support for SpacemiT K1 SoC

Yixun Lan (1):
      riscv: defconfig: spacemit: enable sdhci driver for K1 SoC

 arch/riscv/configs/defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--jp5PSx/13vPMpdjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaHfeGwAKCRB4tDGHoIJi
0pHRAQDMikO0BJTDhSxNIrTIXDf1DuNCkxOwSPqW7Ya/OuNRzQEAgXP6jhBo2kdb
K+8FiBu1owP9PUQ2yUF9JK0QwwNs2gs=
=Qodv
-----END PGP SIGNATURE-----

--jp5PSx/13vPMpdjr--


--===============3426831311598815217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3426831311598815217==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB38C5B55B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YEYm3/SjZ+b4w2MPAVZ8fo4qgO8jHEMuqUAJawF/FqU=; b=qJx
	QtEGrbLv7uFiAR6vhXUQIZBCPbk7IZpyVPLFXid2G7DukpunxGLeegBE5/KtYnr0SysuEArvkTG/l
	XwVC4vqQ/bmtEdPHEk9FDmZs/RV2W8b0fpnVIUMyGFjLFRDaYO0DNlOB9j08s9O6N/M4J+AhzKORi
	nV7HLQsopyQgHwXqKmSAmziGECQgndrw75dAJx65cc861I0w6kW/2mPLYseXZAbwrc+9lSE9BrHQB
	2SVNu4DQnd6V+bU81kN8jyoh1buVG+vC+eE7MgtraLqHA7rjmB0IomO+wfD6KHT5Gp4iUzd5B4Ou2
	r1PGhGDuN4uqfDAo1k1F27EbG1qbMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKrV-0000000G3bu-1KD9;
	Wed, 28 Aug 2024 15:45:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKob-0000000G1HW-2FXG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 15:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D632ACE18EF
	for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A30EC51590;
	Wed, 28 Aug 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724858803;
	bh=ZoERSQbjaOWh1gtlRlRypBVPk3FVstEDzvne1n0+4L0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=gXu3J3Q6ji3pcOppqROGFvS52Itk4D2BM/KNtMctMB3kg6X+XrMJDJVVRLNkFyB28
	 l+qcMi97tg0VEJ8lJEC2/aox3OY/8G9xhzcGV4fAJddNWaIVVfUnYuyZcOkp3fLm3A
	 nIicJw+5vpylSqkXelHRUgkYOEGi3XM89RTpdXcOiTauLwjEg9v2bWza15Qqvc5BuA
	 lUm8kdaZw57XO1uLaBS5ezbGvy4iECcF4YQapHoHDxc4HZpyQoL+/LCkJI+Yj1QMKA
	 x4h1pMPhREYP9ovye66yTANtAJFOdJ0ySQWm1BG/oQzIHSclNlQmo0W3n+gd6fietm
	 gjXPC4gmRUUMg==
Date: Wed, 28 Aug 2024 16:26:40 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
Message-ID: <20240828-fidelity-almighty-18d5434aaef0@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_084234_813128_1362FCF5 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: multipart/mixed; boundary="===============6710647945275936982=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6710647945275936982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tkJBe2+XzIuRNfpc"
Content-Disposition: inline


--tkJBe2+XzIuRNfpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix for 6.11, as things have been rather quiet on
this front over the summer.

Cheers,
Conor.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-fixes-for-v6.11-rc6

for you to fetch changes up to 591940e22e287fb64ac07be275e343d860cb72d6:

  firmware: microchip: fix incorrect error report of programming:timeout on success (2024-08-22 20:47:16 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.11-rc6

Prevent an erroneous unconditional report of a timeout during firmware
upload in the mpfs-auto-update driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Steve Wilkins (1):
      firmware: microchip: fix incorrect error report of programming:timeout on success

 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--tkJBe2+XzIuRNfpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs9BsAAKCRB4tDGHoIJi
0gScAP497y8a5x23Y7/lmtqrptUo+066U7NdJ1/pSOB4HTaXAAD+LQRAWkVLxn4K
LG9Ha/nXoCN/9hJaQ3mRnO6VLlRfEgA=
=uRMf
-----END PGP SIGNATURE-----

--tkJBe2+XzIuRNfpc--


--===============6710647945275936982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6710647945275936982==--


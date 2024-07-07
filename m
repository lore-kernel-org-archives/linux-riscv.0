Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BA4C3DA44
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZIzpb4HrkrU1xjEsTMEOLbIQ7jdO3CMfvZ/ZyKVs2F8=; b=Qam
	kLhvTKr9x+4q4WwH77l+es5XCwQwEbSOdmbye1Gx1D2Nq4GuDcD8STJdlc8bXOfYKR+jW7kR0S2vg
	qWn+tGqqA+RhIX6/9z84h+qbvyuyescW2OY0uRu01O8naK6t6mrlUPyskNfYZOdAj4OkAHtSwjqGF
	xZiUHY327arSdNXMXyevEPkbU+CC3Q32pN7LJ5Qbsf11OYtFKraDTZhTBq99rfGSJU5ab1CMckbNs
	GnXqIHRKn/Hyn66lcmf/WpKCVQpzy88xqlCJM1ljrqzZDHZ7owrCiZXjBMc8paN0kx9vMhrD7tZpc
	DnLOe3asLuaoz8cEvNwwZOH5mPCvQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVfy-000000024LK-35WD;
	Sun, 07 Jul 2024 17:27:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQVfv-000000024Kw-42KF
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 17:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2FF23CE09EF
	for <linux-riscv@lists.infradead.org>; Sun,  7 Jul 2024 17:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49713C3277B;
	Sun,  7 Jul 2024 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720373265;
	bh=OFczwIa8qC/88c1+uwlpiovoMIvU0lo/YpTlvmzj9hY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=cNLgJ/JwV3S79jPtWnJIDMz2KRGizDrFFHAXi8Vfkdn9+7s0/t/I8n1YTqubC2K4o
	 vTAh3o32QwTGiupNvvIqSL9DD4JLY+qalFPu8aDsRPEDWrJkNfTSDsaLaQpVLiFNZe
	 hqSefJxJ4sLPkVqFiDJIDoQ7QTGCf6EVTdVJtVtdE19Vz3Brdd9BD/MqCEGSWnj1Lr
	 /fgG8dpuJjxKRoH6cLjGFPip+JZ/EMJRGU7stcSVipZYYa027WmXo83ysskcuAQ0be
	 EHwgkpoFlJOs1HQR5CNZGuvk6AGE4Cxb4XbXBOyUEdyXq0xKTK9eS45L4r4NSEs+7o
	 tz7+AG+hXEe0A==
Date: Sun, 7 Jul 2024 18:27:42 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V cache drivers for v6.11
Message-ID: <20240707-whoever-undesired-c5f6e96ae403@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_102748_201466_0690C9ED 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: multipart/mixed; boundary="===============4772597711155964699=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4772597711155964699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KT7UcFXDAuTnOBPW"
Content-Disposition: inline


--KT7UcFXDAuTnOBPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Another attempt 2 with a fixed $subject.

Please pull the addition of a new cache driver.

There's a wee maintainers update in here too, I put the series on this
branch as one patch is cache related and I have no soc driver patches.

Cheers,
Conor.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.11

for you to fetch changes up to 3d41249c1dee0fa22ebd8d27aa0a280edf943a0e:

  MAINTAINERS: add microchip soc binding directory to microchip soc driver entry (2024-06-27 17:33:06 +0100)

----------------------------------------------------------------
RISC-V cache drivers for v6.11

StarFive:
A new driver for the cache controller on the jh8100, which didn't
implement Zicbom and thus needs an implementation of non-standard cache
management operations.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      MAINTAINERS: add cache binding directory to cache driver entry
      MAINTAINERS: add microchip soc binding directory to microchip soc driver entry

Joshua Yeong (2):
      dt-bindings: cache: Add docs for StarFive Starlink cache controller
      cache: Add StarFive StarLink cache management

 .../cache/starfive,jh8100-starlink-cache.yaml      |  66 +++++++++++
 MAINTAINERS                                        |   2 +
 drivers/cache/Kconfig                              |   9 ++
 drivers/cache/Makefile                             |   5 +-
 drivers/cache/starfive_starlink_cache.c            | 130 +++++++++++++++++++++
 5 files changed, 210 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
 create mode 100644 drivers/cache/starfive_starlink_cache.c

--KT7UcFXDAuTnOBPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZorQDgAKCRB4tDGHoIJi
0iTyAQC6E5jYycKU+W7zDH3Kc7JAcmcrw06+Um3pNJEHi3T+/gEA6V2PtoEkU1Al
cYhBwKBi41JgCH/GmSmCHGT8I8TXkwQ=
=I61w
-----END PGP SIGNATURE-----

--KT7UcFXDAuTnOBPW--


--===============4772597711155964699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4772597711155964699==--


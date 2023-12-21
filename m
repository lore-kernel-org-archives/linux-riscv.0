Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E3C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+z7tDWS+Lgv6HMYLsV8mV+wy14UyHBLxhgcfvXGMy5w=; b=nod
	aGqDOPJe4ds9yUN4L8/X6XvkSvrzrRlF8FJifAciLmBM7/M8rZh+x6j7vKqYM7Qk7aFiql+ys4oLU
	BW2dslrxbdK6uLKjoO0KR+I4DQUHwanZ8bjYPzXfemqTsNvPK8k4sSAY2wIASVhIHmefTpucvawe1
	zymlBs2oB8H2FjK58u+uBo4ZiVpc+2r+kPeX8N9elBD88F0vppHJ7okdkvHKlJWnHLlm1+GDOb3Fw
	ZvTlmL65L4bmihRh8NYAQMxRcEMKZQuP+tzKnQrWG+YWPwJlQ2p0uZsTYwmziwNo97IMq+pYlYpai
	TTzvLTh7ffr6GKu5sTLEoHthqSwIiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIci-002ris-2e;
	Thu, 21 Dec 2023 12:58:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGIcf-002rh7-2n
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 12:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB14F60FF1;
	Thu, 21 Dec 2023 12:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725BAC433C7;
	Thu, 21 Dec 2023 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703163476;
	bh=0gL04RciAH1GJbtSVRyq/UZwV+St7gyPSP7QIFrKX6A=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=KxeDm+XMTbGH/jT4L5Vo4/35ZuW+bfgGwR4YYpbrzRAJ0XHqFV/8280JlBFlAzLFa
	 qOAYZ/6WFcFs+TJ4nPvTWkxr3uJe2TvSemryWxYXUQG+CrgGIeG1hJDxnfJpWQD3KC
	 zd2BPqYonDqgc3rm6oCEczSLRpjg5mrK2fqhUweambE8e8t0jsC5qwMHSZOphH99HO
	 sfyrxy2Dwb0dPMJy2buBewzKsVOrs5yJjQ8KxVigQgVD1b5yLRz5IC7JDqaxWGMCdX
	 TbVkgu7kpMpVxAoG7xiW3dEzZdrb+ljmVidMGScHRZkWkVaRvlgQYxYRjNda0GNDkW
	 2Bir0HpAxUp6A==
Date: Thu, 21 Dec 2023 12:57:53 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
	soc@kernel.org
Subject: [GIT PULL] RISC-V cache drivers for v6.8
Message-ID: <20231221-catatonic-monday-d4c61283b136@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_045757_995013_2B007BC3 
X-CRM114-Status: GOOD (  10.24  )
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
Content-Type: multipart/mixed; boundary="===============1682086535247579884=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1682086535247579884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uVYq/yheRuBdIaKE"
Content-Disposition: inline


--uVYq/yheRuBdIaKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull the move of the ccache driver out of drivers/soc and the
addition of support for the non-standard non-coherent cache operations
on the jh7100. Despite it being an early(ish) SoC and being succeeded by
the jh7110, there's still people actively adding mainline support for
some of the peripherals etc.

Cheers,
Conor.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-cache-for-v6.8

for you to fetch changes up to 9a9e8d8d2b6e61a516cbb8a43c5cec51c065ffa4:

  riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP (2023-12-16 23:37:38 +0000)

----------------------------------------------------------------
RISC-V cache drivers for v6.8

The SiFive composable cache driver moves to the cache driver
subdirectory from the drivers/soc and grows support for non-coherent
cache operations. The immediate user for these is the jh7100 SoC, that
a rake of people have on VisionFive v1 or Beagle-V Starlight boards.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      soc: sifive: shunt ccache driver to drivers/cache

Emil Renner Berthing (4):
      dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
      soc: sifive: ccache: Add StarFive JH7100 support
      riscv: errata: Add StarFive JH7100 errata
      riscv: errata: Make ERRATA_STARFIVE_JH7100 depend on !DMA_DIRECT_REMAP

 .../devicetree/bindings/cache/sifive,ccache0.yaml  |  6 ++-
 MAINTAINERS                                        | 14 ++---
 arch/riscv/Kconfig.errata                          | 19 +++++++
 drivers/cache/Kconfig                              |  6 +++
 drivers/cache/Makefile                             |  3 +-
 drivers/{soc/sifive => cache}/sifive_ccache.c      | 62 +++++++++++++++++++++-
 drivers/soc/Kconfig                                |  1 -
 drivers/soc/Makefile                               |  1 -
 drivers/soc/sifive/Kconfig                         | 10 ----
 drivers/soc/sifive/Makefile                        |  3 --
 10 files changed, 99 insertions(+), 26 deletions(-)
 rename drivers/{soc/sifive => cache}/sifive_ccache.c (81

--uVYq/yheRuBdIaKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYQ2UAAKCRB4tDGHoIJi
0hLcAP9r9ufLZVUIUusGttE1oB6bJTtc0vRjp5TtpaDv3OcwRwEAkUJmIyM5IN9b
gE3FS8lsl5j5GU06/6F15kDT/s5BAwc=
=p52w
-----END PGP SIGNATURE-----

--uVYq/yheRuBdIaKE--


--===============1682086535247579884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1682086535247579884==--


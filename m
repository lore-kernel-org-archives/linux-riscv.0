Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D756CD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/e1E4XeF42n9VkapTsoZMOSEw9D0N/1wk0BkyfX5RO4=; b=YD4
	64tlAMBRdOXvdF8z8prpIV1Uhy491j1/v1YC+sZZ//LQFUVa4TaQ87t0lgmLMoE87N3vfFjt2Q8Sb
	ccASHrk/tbo18ZPlaVbOuctccmiaStnHlo8Z5/8THB8TGnLlvu1QcuvtcQdMzvgD/h3SFFyNGhzlJ
	jSAgvMh3p+bZ3/PG7ku2M2QGCI/hUF5fB0R6i2vo3PRBb1iyJ+P1wsi2pHtTLbAPgJEinrY8JcLK4
	BuI1g1jAFE1Jsp1PFR+CxsFPauBBJJfWvZt+KYTE2QVj9950RyLjvGxHW6xXmdWqoXsuSQxLRqjr4
	pVQ1xWwMIpo1DsnyUOJT5eQSsHwa1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt2wF-0000000A6G9-3diJ;
	Sat, 06 Apr 2024 10:06:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt2wD-0000000A6FZ-1w4X
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 10:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B29ECE0121
	for <linux-riscv@lists.infradead.org>; Sat,  6 Apr 2024 10:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA48CC433C7;
	Sat,  6 Apr 2024 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712397971;
	bh=UswHsrNV9LSeiyLlBYcDPf/vvgGKaBRTaQl35aQpCDc=;
	h=Date:From:List-Id:To:List-Id:Cc:Subject:From;
	b=VZ5uNINX072DB9IKMo3gqFXi/GARYuPvnzBL0E1f6GG12qBhRYesfmgGK4hBsNT7m
	 /43xUhCptY05BfA7pqQ9/xNOpO834aZKAYmTL666o9FjVwa6jmfkWc8GYxRGborA5X
	 nzWE6qQdnJYliBLLBpiljbKph5UpyE4hfrBbUbwmYD0X/dCxN6sT/xK+TVtd7ys9IX
	 tSY55ImhJ6xCTkZ60fyzECiywXSI2d8av3kfJFVGZWFxzhAmgWWscbdtzxrQ6rG1CK
	 37QJC3ow8wBlx0ozLiJ93A1SjGsmWQ7HGrYDw7y7MeQjp7+TVBL2NP5Kb4zLV4BTXb
	 NKd7CXvvubXnA==
Date: Sat, 6 Apr 2024 11:06:08 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org, soc@kernel.org
Subject: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc3
Message-ID: <20240406-botch-disband-efc69b8236be@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_030617_698527_E3743E62 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============1315131314217921306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1315131314217921306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CQ5kpgt9McZtmp49"
Content-Disposition: inline


--CQ5kpgt9McZtmp49
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

A single patch for ya, needed to fix boot on the JH7100.

Cheers,
Conor.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.9-rc3

for you to fetch changes up to c90847bcbfb65d0f1c48fcc73a2b3a2d4ceac6a1:

  cache: sifive_ccache: Partially convert to a platform driver (2024-03-28 22:40:56 +0000)

----------------------------------------------------------------
RISC-V SoC driver fixes for v6.9-rc3

A fix for the ccache driver which no longer probed after the PLIC driver
was converted to a platform driver. The JH7100 SoC depends on this
driver to provide cache management ops that must be registered with an
arch_initcall, so the ccache driver is partly converted to a platform
driver, registering only the cache management ops with the initcall and
the debug/edac register provision features of the driver as a platform
driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Samuel Holland (1):
      cache: sifive_ccache: Partially convert to a platform driver

 drivers/cache/sifive_ccache.c | 72 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 26 deletions(-)

--CQ5kpgt9McZtmp49
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhEekAAKCRB4tDGHoIJi
0i+qAPwKIR498gdGTGLZQ4L7qLVew9wjYsC1q3dMXjNTou1TUwD+OjPKotCFB40/
Rs58J3JDo+b2AefiCoJM/X2myMrP6A8=
=lYoR
-----END PGP SIGNATURE-----

--CQ5kpgt9McZtmp49--


--===============1315131314217921306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1315131314217921306==--


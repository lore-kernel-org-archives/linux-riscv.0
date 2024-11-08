Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8CD5E14A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Wb0lhCk7vWtWIeKIShGlBBy4mepasqJ4EaCezlKu+M4=; b=3DH
	vI1tC+XG8ZvfNjrHsist5tA/9PMCY07FpXqGg1c+tYXO3idCVWXWPrSffpEzPMmE2Tc4+P0te+nbx
	bQUVdVJNApHHl5Th4fMMz5xIGqJfGUQOZXIyhJUsc65XgMArbjXKB4qYIRq8IhF66a70Zjj5vdj9C
	8ffvGIEKvXaCroracXpKMCW/B/lsHKjPfikElUpoqTjTLmojI82dHp8SpWqMKgwDBsWHkO/DDAj0S
	ZtFizlz2dEjYB1PH5WNykmJjhqFzsx2pZf1yvbjLEKEcDrqK+3Xv3JgoGI/rjpM004demrlUVg18I
	+LY7RFgKppyj8P71CChsayedlQUb5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LRb-00000009yws-38X1;
	Fri, 08 Nov 2024 09:38:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LRH-00000009ysn-42Gy
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 09:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE239A4523C
	for <linux-riscv@lists.infradead.org>; Fri,  8 Nov 2024 09:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85282C4CECD;
	Fri,  8 Nov 2024 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731058678;
	bh=/xq32m1EqGR28wC1AgX9th2fAlozUxx1pWbZBTrr/sA=;
	h=Date:From:To:Cc:Subject:From;
	b=uOFhwkpOOQAcm+pAT9+yJZJaN3cd7VsTGNyqmEq0ymk+EpbpkJ9gsM6isRNUH7u+b
	 LRO8Z7qO0F91gt9ENdqCDnzsgZGGaOrNWdOgK2x8dAg6//1J0KAQ0vBDwRwdqqifGt
	 yXJWp7dWxoldOE6SnH/CuguGJLXnaxfB7BMoCYkxXZBJ4pnk1mavpWhkM0luar2f6p
	 Z572qMjQti6sHQpU6uBCL6/h5JOQECJiugOZjiilAYhdKBO5U2kLp8OtJgM0U9HNxc
	 SOK0PF8O1k9F5elIaAnrqGQ+9PuSoUGmnF1OUdoHknviK9VCfkwQfPimNZ5o7keYz0
	 6H6FS7tIari+A==
Date: Fri, 8 Nov 2024 09:37:55 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.13
Message-ID: <20241108-washboard-material-6b9ff196063d@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_013800_155452_16B236DC 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: multipart/mixed; boundary="===============5704879681779840529=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5704879681779840529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FZLg+64WqNyvpcXG"
Content-Disposition: inline


--FZLg+64WqNyvpcXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

Please pull a handful of changes, mostly for StarFive.
Branch is based on rc3 instead of rc1 as I'd usually do, because rc{1,2}
was not booting for me.

Cheers,
Conor.

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.13

for you to fetch changes up to c8b72c301dbe71a7a55298d542dff7b2c3612765:

  riscv: dts: starfive: add DeepComputing FML13V01 board device tree (2024-10-31 12:22:53 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.13

StarFive:
Support for the DeepComputing FML13V01, a Framework laptop compatible
with a JH7110. This board is fairly different to the more standard SBCs
offerings that the kernel already supports, so there's also some
refactoring of jh7110-common.dtsi to move out nodes unused on the new
board.

Spacemit:
A vendor prefix I grabbed from the basic support series, since its
dependencies are not yet ready but peripheral drivers have started being
merged.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Guodong Xu (2):
      riscv: dts: starfive: jh7110-common: revised device node
      riscv: dts: starfive: jh7110-common: move usb0 config to board dts

Sandie Cao (3):
      dt-bindings: vendor: add deepcomputing
      dt-bindings: riscv: starfive: add deepcomputing,fml13v01
      riscv: dts: starfive: add DeepComputing FML13V01 board device tree

Yangyu Chen (1):
      dt-bindings: vendor-prefixes: add spacemit

 .../devicetree/bindings/riscv/starfive.yaml        |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 ++++
 arch/riscv/boot/dts/starfive/Makefile              |  1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 10 ---------
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 17 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 22 +++++++++++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts     | 22 +++++++++++++++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 25 ++++++++++++++++++++++
 8 files changed, 92 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts

--FZLg+64WqNyvpcXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZy3b8wAKCRB4tDGHoIJi
0utQAQCSF9dqJxTjp9MWhEbjOcDFgds1awTrkTDJQgpQbXvkZQEAl2q5mEB0buiI
fchglJX2dd4H/IsV8AY7gR8cJKyRjQU=
=ItIu
-----END PGP SIGNATURE-----

--FZLg+64WqNyvpcXG--


--===============5704879681779840529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5704879681779840529==--


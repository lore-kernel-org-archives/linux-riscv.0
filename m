Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39BC83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2/NU+XEf59pDjYTk8M3cdiBM8V3pBcN5nHAaOEgJ6j4=; b=mVG
	fcjCArtUD++0C2awcQpbg8mzeEHdKZvB3d3dpheUZnFUqLWQdwRMPYA56pjtt9uopwCcilPGznnxt
	ghMRLnyjTVH0MhoDfoUpy/rEsOXplQN7K4AvlvxH5glA5D1xdFe+20w2PZy/jgfK50B/xp3p1OUj1
	sKCkbkhFH/c8OmsXo9DrcdBuGGnPNdPgQmq+lxuY5wWN47o31QT2Zzq30DUg4yfcCGgSp3hkoNGpD
	VQxR2mLwnWc8Ty6CIOM+E6fQxHxt62ZLtuSZMcrTk9N6cgDSi9q/QxqLklTOwxIkjKJisAm8D/paP
	c6BGHm4IMBQwFBZ8Il+2cGyuM758c2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueb5K-00000005KmK-2Wuw;
	Wed, 23 Jul 2025 15:08:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueagA-00000005Ekt-2g2L
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 14:42:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A0CB5C58C9
	for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 14:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BC7C4CEE7;
	Wed, 23 Jul 2025 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753281764;
	bh=R4TxTD7vqNgpLn4WFjTeF2OU0nVam8d8lfKzLvG+H+A=;
	h=Date:From:To:Cc:Subject:From;
	b=dG7Qzn0MGSjMZIKcv9BOFVqz1e8A458pQkakADr8f0WiYJYfNFvQdtV4SPnS5WlXi
	 ocTOzwd6OLtPAlx1yfVwHOXwz8ksJUNpuzOx1lSyv6jjyldwJI/DpHA2vrxwhvMqbO
	 bSn5kKLMKlOH27/X0tn1yjiVCX4TCMj6VXs+x4ybPtCofx1EcV/d73UjzZG6VWrn0d
	 ruoDgHSJkM7NAfPXwTSlbqbgcePQ+AXN0ZmV32+zWTM0peOYQ5f+IBECu5JpYV+MJS
	 RsUicaBgf6zrAFd6ANJxONoRXjwGwo9DGSV7z1n4g6/WzDE1MOfVXqMOIsydB3IdX5
	 ZeUjwSIXoUwwg==
Date: Wed, 23 Jul 2025 15:42:41 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Misc Devicetrees for v6.17
Message-ID: <20250723-postage-skylight-597377b5f8e4@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_074246_715869_32AAE63F 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Type: multipart/mixed; boundary="===============2149668166838292886=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2149668166838292886==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oh9VrmaBMOxopwqN"
Content-Disposition: inline


--oh9VrmaBMOxopwqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Since Linus didn't release v6.17 on Sunday, here's the dts PR I
mentioned. Not too much here, so hopefully not too late to pick it up.

Cheers,
Conor.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.17

for you to fetch changes up to 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1:

  dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible (2025-07-22 21:45:40 +0100)

----------------------------------------------------------------
RISC-V Misc Devicetrees for v6.17

StarFive:
Sort properties on the MilkV Mars and add the power status LED to all
jh7110 boards.

AMD:
Add 64-bit Microblaze V cpu compatible.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (2):
      riscv: dts: starfive: jh7110-milkv-mars sort properties
      riscv: dts: starfive: jh7110-common: add status power led node

Michal Simek (1):
      dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible

 Documentation/devicetree/bindings/riscv/cpus.yaml  |  1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  9 +++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 12 ++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

--oh9VrmaBMOxopwqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaID04QAKCRB4tDGHoIJi
0q7QAPwIGUV/7xxkp/U0km4y5s9VEE8dTgMXY3SmLLo9HvIjxgD/dxAOeeNn1YK4
DBibLFyvnuZODCO4wqZS/vBmEJBqJQ0=
=uzv9
-----END PGP SIGNATURE-----

--oh9VrmaBMOxopwqN--


--===============2149668166838292886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2149668166838292886==--


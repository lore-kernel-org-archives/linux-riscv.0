Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE9C282EC
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ygN80jSaUqEltFp64rh4Yv0tsy750ecZEKKZbe+PyUY=; b=AO6
	9p6R4b1GcDWc7fT2DHwTWcyAV/cYAtglricCWdXKCTAdjXCoD39Eao4sjHocpceWN8KYeiwm6sxv0
	wyg3ShYSMjp3hxklLRbBOu5mwk3RWnNkBvNBxX6ieuy1u1RmWR/v8b96j13rFUwaWji/fBNte1XkL
	x0+ueHWwNmQGpXkqDAhMwkhWm+cXeGmf2oOogEqJkSfHvLexCrkhPfHeB0GABwX1NpChnSJ+V18sL
	IIvwumOXLO6DhBh+0kQcxqsFBOQblQPZNwb5jm3Zxj/TNwn9me4a/PkiBQfm+qGpK7xEBec5HMoFd
	saridiKOu8OLjlbsM1joS8KclRpxixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpp2h-00000008EFt-1UjG;
	Wed, 05 Mar 2025 13:44:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpocf-000000089u3-0ZJr
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 13:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A076E5C4485
	for <linux-riscv@lists.infradead.org>; Wed,  5 Mar 2025 13:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFC3C4CEE9;
	Wed,  5 Mar 2025 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741180636;
	bh=AMygIzE1vjRKH3HQ1Hu0QrxXHQmeaOzjU6mxohILknI=;
	h=Date:From:To:Cc:Subject:From;
	b=gPZDmBOQA9TA7DuaY6VMCs6uQ7xmbXopI04ZVr9UiC6R26+fut/uWPmy//2x8pSEy
	 8GWqRzyETLqG6dYg7VgexsbrO3u/VzGqMwbAIZQjjrEEQIebOlHAU6LNgu9UlID416
	 CYb2DIOomkAvKabpNuSdYWhU4SM7LAm6gEGQga0EqgAHqfccP1QJfxKaiLCMwC7F+X
	 gU1EgjkAvSohONkIlQKk2OQ2tBIXZF93II8Ee9kUHgO38O4jbbcu9/lcKd4gqzDBYz
	 pr4QoR3+dDJdvdXp/wm1j25ajHzSYEzOQhv0LPLDcQOuX5COLoTeTUkmJoZXjlIDoC
	 t2SUnoVs9Fn3Q==
Date: Wed, 5 Mar 2025 13:17:12 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.14-rc6
Message-ID: <20250305-sip-unable-d56ef7dbf86b@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_051717_223387_91ACB02E 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: multipart/mixed; boundary="===============8331458883962040682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8331458883962040682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MUTlGABqi+4r+qFP"
Content-Disposition: inline


--MUTlGABqi+4r+qFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix.

Cheers,
Conor.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.14-rc6

for you to fetch changes up to 1b133129ad6b28186214259af3bd5fc651a85509:

  riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions (2025-02-04 20:31:30 +0000)

----------------------------------------------------------------
RISC-V Devicetree fix for v6.14-rc6

A single fix for an incorrect define in the jh7110 pinctrl header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (1):
      riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions

 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--MUTlGABqi+4r+qFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8hO2AAKCRB4tDGHoIJi
0p8MAQDqe9lHDoQy9MPkfxFlf9wZFQikZ4ZvZTub2KZRx8CDRwEAp78AaohE0U5V
cg61m62REvCJ2Y7PZp8VATqDxOeX+w4=
=xqAj
-----END PGP SIGNATURE-----

--MUTlGABqi+4r+qFP--


--===============8331458883962040682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8331458883962040682==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6108EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GoHKx9ffcOjOPPpp9+g39HATU/XpDwCRCjsu5cw0H0=; b=oTU5hxpAuN9xTrecdqCurn37On
	IdCBgDQY0MxiymnY21+zTh5ZC9EbIz0CNoGaxuUEBlbz7Z+TsTpcWEK81/7Yz6HQCnJ1WRtsHkcL3
	2UNgfqClfZtkR+s+d7BApex1YCe0WGOE9ZyDEV3hubwmbnzstV9NngSkTCLsQzllcGYKy3pC7EcfE
	brDTEPcknYWJNBNZn7o2nJ+DwI0WPV8wAscmG4Anljx9zBB+txugEh/xRvPzTG8TvfMJvjNCfrRQ/
	xT5ogNUYb4yweUABopTMmQC5YZi8YxC88U7O9iE28udJWcScE5MU8EGCpcTWxdsojfmnU91vLmHHJ
	yZFezSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8k0T-00BMSf-2X;
	Thu, 30 Nov 2023 16:35:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8k0R-00BMRT-1J
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64147CE1F29;
	Thu, 30 Nov 2023 16:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2514DC433C7;
	Thu, 30 Nov 2023 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701362112;
	bh=4F84RwjlB9iRgUGGooUK/h51rT4q/jQ9DxBI0GL7X3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1Xe6LdBbc/vXQBJiz1UVPS09eoRnptp4TGoJNsQDsa8FQyHYOVuViYLPfaODNDGT
	 Nsf95+FLT6aCOHk59YMHn+B64fpc5ofQ8Xzm7kcDI0YSe06j8GT+Et7RE0OOpa3sY7
	 d/34yAiYl+XhbNNZm9IlZCIhtYe5kCOBrWRPhE8V005CUiIv8kNuby5r8UPR/r5hfh
	 FsKQAKTLp2JSfoHcqDy0hqCqGIyBVUS5VVRJeoM6pIkZZXhWBs3d/NP2ZhWU1P0tGL
	 2wH9Gg301TjqjQDtVsPKOsoJtjvGGffqw5ugqQkFV/O47w9Bbm3f5wEe6k5UDRtW1x
	 SaqFLAxM3pDqw==
Date: Thu, 30 Nov 2023 16:35:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: linux-next: Tree for Nov 22 (riscv: DMA_GLOBAL_POOL)
Message-ID: <20231130-mothproof-tripod-fe35364591ee@spud>
References: <20231122145257.6f668afa@canb.auug.org.au>
 <24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org>
MIME-Version: 1.0
In-Reply-To: <24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_083515_665761_B3643138 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Type: multipart/mixed; boundary="===============4558311553064543442=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4558311553064543442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Ll85g90yOGMJeXA"
Content-Disposition: inline


--9Ll85g90yOGMJeXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 02:37:43PM -0800, Randy Dunlap wrote:
>=20
>=20
> On 11/21/23 19:52, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20231121:
> >=20
>=20
> on riscv 32-bit:
>=20
> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=3Dn] && !DMA_DIRECT_REMAP =
[=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONPOR=
TABLE [=3Dy] && RISCV_ALTERNATIVE [=3Dy] && !RISCV_ISA_ZICBOM [=3Dn] && RIS=
CV_SBI [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=3Dn] && !DMA_DIRECT_REMAP =
[=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONPOR=
TABLE [=3Dy] && RISCV_ALTERNATIVE [=3Dy] && !RISCV_ISA_ZICBOM [=3Dn] && RIS=
CV_SBI [=3Dy]

DMA_DIRECT_REMAP is selected by the T-HEAD CMO erratum.
DMA_GLOBAL_POOL by the Andes CMO erratum.

We could do

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0071864c2111..d8723fdf1e55 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -339,6 +339,7 @@ if RISCV
=20
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
+	depends on !DMA_DIRECT_REMAP
 	depends on NONPORTABLE
 	depends on RISCV_ALTERNATIVE
 	depends on !RISCV_ISA_ZICBOM


--9Ll85g90yOGMJeXA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWi5vAAKCRB4tDGHoIJi
0hKkAP4yMmlUllauDrHAD3p5t5OnJr8sCXiBdoS+jS+mf2gItQD9G/aFILUv61m/
9xJePo/tRRfXb4+RUXbYpR2KFHHq+A4=
=leVc
-----END PGP SIGNATURE-----

--9Ll85g90yOGMJeXA--


--===============4558311553064543442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4558311553064543442==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFDE95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea7Co0BWVC5qzeU2DejzeaMIheIlv1ThEK6LhYQs0WE=; b=pSEvxI3okbdrlPXW2WTdGf2E0G
	2R6jVRbDS9fQy9/EWMKBMrFbDuHAT9MA/CBBj8JsrC17iOKXO0dyd/coc5Pc1hoivZdGbIW05Zked
	B5LOi0/x0IUwnYCh+x5UlKQEGzRQPKWDn39Z8b3neH6e8lmoPfa69jBskfEyGUzoLC83kQQT3Rqjw
	HQq5fpK4VHuv48tsDcbkuTuhSlCt2w0JQyoeYClNtXqx+Ld2G8PS5OiTfdVhkOqAVumCJZ2vx4epo
	LizbrHm3rrI1KhqvHA4jwXIUoPPsf/mVkdwXnrTLlEDdZlEbRD4G87wiZZrwbGKUobR2tt99v9Mbf
	kyH4tCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4zZ-007THA-11;
	Sat, 07 Oct 2023 10:57:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4zV-007TGS-2z
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 10:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3084560DDF;
	Sat,  7 Oct 2023 10:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9ADC433C8;
	Sat,  7 Oct 2023 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696676220;
	bh=FbDCBpNcB5UA8Pkt82Ea7XaptxlhhJwPIUs8N5p1Y3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPHOeOAjSgipfP1E4/ZSmHjMoLg/VK4jn8AUf5SjmhS5D/fjs07/blfVev+cunNlC
	 hEV8rDSOWcB898Ig04TXWx8V5U5mJnNuwK7iFi54crqVa1+LjCTMVHNL8el4BlwkDb
	 hd4otYl2Meusl5NrydfCzJJu1M4OpD0Z0vY8xWvBu2LAnVHb5YlNo7pJOEvO7/1kq8
	 52K98XE0Hlz7VtObYvd7EghONIef2r15mwpXKuiWYIKWFuYOs0WAE4VU6F6lWKOLjZ
	 prGsLoarVS0wyeoXYguBgdxJ5pUo37HMGuvDKcZLm0h7uBe9RA83hk2sps8SVlM3XF
	 vcRa1z2hVf+3Q==
Date: Sat, 7 Oct 2023 11:56:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: linux-next: Tree for Oct 6 (riscv: andes)
Message-ID: <20231007-poach-refute-b84fe5b7431a@spud>
References: <20231006153809.2054a0f8@canb.auug.org.au>
 <09a6b0f0-76a1-45e3-ab52-329c47393d1d@infradead.org>
MIME-Version: 1.0
In-Reply-To: <09a6b0f0-76a1-45e3-ab52-329c47393d1d@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_035702_032177_6B10D67B 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: multipart/mixed; boundary="===============6235471536549628732=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6235471536549628732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vJKcyeb3DdW70Crt"
Content-Disposition: inline


--vJKcyeb3DdW70Crt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 05:28:27PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 10/5/23 21:38, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20231005:
> >=20
>=20
> on riscv 64bit:
>=20
> WARNING: unmet direct dependencies detected for ERRATA_ANDES
>   Depends on [n]: RISCV_ALTERNATIVE [=3Dn] && RISCV_SBI [=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONPOR=
TABLE [=3Dy] && RISCV_SBI [=3Dy]
>=20
> ../arch/riscv/errata/andes/errata.c:59:54: warning: 'struct alt_entry' de=
clared inside parameter list will not be visible outside of this definition=
 or declaration
>    59 | void __init_or_module andes_errata_patch_func(struct alt_entry *b=
egin, struct alt_entry *end,
>       |                                                      ^~~~~~~~~
>=20
>=20
> Full randconfig file is attached.

Riiight. XIP_KERNEL is enabled, which means no alternatives are
permitted, but that R9A config option selects the Andes errata, which in
turn depends on alternatives.

I suppose we could do something like (untested):
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 7b74de732718..6fe85255e2ce 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -343,7 +343,7 @@ config ARCH_R9A07G043
        select ARCH_RZG2L
        select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
        select DMA_GLOBAL_POOL
-       select ERRATA_ANDES if RISCV_SBI
+       select ERRATA_ANDES if (RISCV_SBI & RISCV_ALTERNATIVE)
        select ERRATA_ANDES_CMO if ERRATA_ANDES
        help
          This enables support for the Renesas RZ/Five SoC.

--vJKcyeb3DdW70Crt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSE5eAAKCRB4tDGHoIJi
0sYXAP4lnHnMabjCni4wbpGFk69frnCb9rSEfcZuCdPQHjzcVwD/Tu5poWLRcoxu
oUkhKLb+7gPk3njdHxW8GTEBJQZTNQc=
=ZG8q
-----END PGP SIGNATURE-----

--vJKcyeb3DdW70Crt--


--===============6235471536549628732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6235471536549628732==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B1C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeGoXb08Cz6gSMCsf4p+eUwseoQqMI4WCkIsxYZnFHA=; b=Zami/fFDrUVNw9CmFZKkyThyif
	yAs0EyDVL4ccQO2kpEpXdRTWOHfU36Lvv71KJYi1EXKGZWrc14ABTyPeWwIooxihUfCw9XzZQuSaP
	06i+YWN2EpBUD9HwlLPIIhkTBGFwQO0JY0y5zPhKDwwj+zIRRHrUbbzLhHFjLpplCoeBLjgpkZJKL
	lYKMEIAx13cQmA2QdKT7DvmamaEOntKoYT9F14OH0Hz/Y/M8QePotBJjs2hkSGNYNKX0m9DPLhAN9
	CfQLCqBxmBQpdQf+u2VLzd/Acl7u0b8JK1f25Teswg+MJfr/SdpfrwkxamF+giAo619uqxQqGxVm1
	GNTI9puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBkC-00000003wMw-3aPV;
	Wed, 31 Jan 2024 14:39:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBkA-00000003wLs-35GF
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35528617B3;
	Wed, 31 Jan 2024 14:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55899C433B2;
	Wed, 31 Jan 2024 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706711954;
	bh=kPVuRNBlbzCQ8svyAWwrt4hdHVJyuCK8Z2Wnf0wDU8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rj4FB7cg6MVpGG4kOsX6275iESuieAs7+JGNjuERRZAWT2Q6HiQna0FS2YsD7/cz6
	 3lqYCRdJLm31w7eMhpb0VHlsz7rmoT4fuQbjQoSzLzj2j+aywq//j3ZxdzacMjZBMB
	 F2t6pzAsNtC9JODfDTVMoyg8XM4Vy3tcDahULpWKbmEZZGPGJuGADyeyvkC1IzuY2I
	 Zoq950v5yYLAu7x4gZwKVEbsbTBxaXV6ckvAoOqjWhegAOEKttwImu0iIonlTw0Ryr
	 jDxithQzDIRpRu8xED5pgIAp//jM6M+SE9kJOjcJhB+ng9fqc3YF8On/oriujnBkeS
	 KZFtD1y49Cvow==
Date: Wed, 31 Jan 2024 14:39:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] MAINTAINERS: Setup proper info for SOPHGO vendor
 support
Message-ID: <20240131-uneven-grinch-79e678a2e995@spud>
References: <IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_063914_837562_D70CFA26 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============1622992291044221110=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1622992291044221110==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4CLUouC3q9dmuLiV"
Content-Disposition: inline


--4CLUouC3q9dmuLiV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 09:40:42AM +0800, Inochi Amaoto wrote:
> Add git tree that maintaines sophgo vendor code.
> Also replace Chao Wei with myself, since he does not have enough time.
> Since sophgo vendor code is maintained, remove itself from
> `RISC-V MISC SOC`
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Acked-by: Chao Wei <chao.wei@sophgo.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

I assume you guys will take this in your tree.

Cheers,
Conor.

> ---
>  MAINTAINERS | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 39219b144c23..125debc7d755 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18848,6 +18848,7 @@ F:	Documentation/devicetree/bindings/riscv/
>  F:	arch/riscv/boot/dts/
>  X:	arch/riscv/boot/dts/allwinner/
>  X:	arch/riscv/boot/dts/renesas/
> +X:	arch/riscv/boot/dts/sophgo/
>=20
>  RISC-V PMU DRIVERS
>  M:	Atish Patra <atishp@atishpatra.org>
> @@ -20446,12 +20447,13 @@ F:	drivers/char/sonypi.c
>  F:	drivers/platform/x86/sony-laptop.c
>  F:	include/linux/sony-laptop.h
>=20
> -SOPHGO DEVICETREES
> -M:	Chao Wei <chao.wei@sophgo.com>
> +SOPHGO DEVICETREES and DRIVERS
>  M:	Chen Wang <unicorn_wang@outlook.com>
> +M:	Inochi Amaoto <inochiama@outlook.com>
> +T:	git https://github.com/sophgo/linux.git
>  S:	Maintained
> -F:	arch/riscv/boot/dts/sophgo/
> -F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
> +N:	sophgo
> +K:	sophgo
>=20
>  SOUND
>  M:	Jaroslav Kysela <perex@perex.cz>
> --
> 2.43.0
>=20

--4CLUouC3q9dmuLiV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbpbjQAKCRB4tDGHoIJi
0jpXAP9uGodd2YeCPx+ouxY8zU/sUXURwKAb9IO8UXPFQDq6SAEAvJFHhGrZ8qai
KQA26Es1UGjNKAgoszwpNmGQqXt4jwY=
=eYUb
-----END PGP SIGNATURE-----

--4CLUouC3q9dmuLiV--


--===============1622992291044221110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1622992291044221110==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801DBEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba1auYjwQgekQgdy8NtA1yzGfM7tGM8ST+7AHDk0FYk=; b=s8u/CHQigTqFyzdq6rGFhFaHz5
	moXoILtLhvHAwRSPl4W+f1Bcx1XoBhoeFpJHjS3mG72EyY0jCZhUBunHH9wf2KHMMV+/s2jT1WKET
	oiuQNk/wzzgZ45WAvqIOcCFHvdHE0B1sR8HC0gibzjwJJrdy8q+NhjxqRBQLOcHxmclxyAf6MzuBr
	C06m9YKNOXQJ9Thii8rTYerhAU2ZoRnXNpFuY90Zm2fnW1yBl6EZRyTyXEZPYgY2FJTP5WCn+uS/A
	RXfEMQ1qJQ5aX7Gd3GaL5YSkFQe0P4eaRSbXizLs4p/wxBDPgmII6czUB2czHGsj2GHjbDRME6fnQ
	QFtwBCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TpY-00CHdb-2T;
	Wed, 14 Jun 2023 16:58:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TpW-00CHcZ-1O
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 16:58:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78311644B8;
	Wed, 14 Jun 2023 16:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A2AC433C8;
	Wed, 14 Jun 2023 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686761924;
	bh=JawmiSBEKOC8TDqGTdeR7nW44hRx2G/VByajxDBcYoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5irh81u/2jEaKr5V3wSgBXtD+6gwCmlrtZmd3qUH6b4HWNwVrzjUMgAFGgwjnQYf
	 UtmsVlLzyqJigA7QvNHeMiFHFX2uQsAMc2buiXNNJ7dChvtK/cWF8p9UrbtjZ9RwLv
	 2Ti++JsfAKvEuqkqeSwwwHDzLJo+yeWezMis/NnVjYZEOnmIGb7w6/P9nq3CCJ8IcV
	 5KkYiuFu73y27hsf6zvWM4aXh4W9epUP8KxUoU7TWCgGJhLFQI5q2kaQIeBZT9Aqqf
	 QrSw7yqkMaXR2g7li8La6FlkyKu7AuASGdjz/b4zUyb2kvtYPqVNKocAIrSiK5T+iy
	 Y3BG/0p7K199g==
Date: Wed, 14 Jun 2023 17:58:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 0/6] Add non-coherent DMA support for AX45MP
Message-ID: <20230614-oncoming-suspense-4104f43912ab@spud>
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_095846_563933_72A0C735 
X-CRM114-Status: GOOD (  25.72  )
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
Content-Type: multipart/mixed; boundary="===============0279424256965683347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0279424256965683347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dWz4qVr6/YdX432b"
Content-Disposition: inline


--dWz4qVr6/YdX432b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 11:47:53AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi All,
>=20
> non-coherent DMA support for AX45MP
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> On the Andes AX45MP core, cache coherency is a specification option so it
> may not be supported. In this case DMA will fail. To get around with this
> issue this patch series does the below:
>=20
> 1] Andes alternative ports is implemented as errata which checks if the I=
OCP
> is missing and only then applies to CMO errata. One vendor specific SBI E=
XT
> (ANDES_SBI_EXT_IOCP_SW_WORKAROUND) is implemented as part of errata.
>=20
> Below are the configs which Andes port provides (and are selected by RZ/F=
ive):
>       - ERRATA_ANDES
>       - ERRATA_ANDES_CMO
>=20
> OpenSBI patch supporting ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI can be foun=
d here,
> https://patchwork.ozlabs.org/project/opensbi/patch/20230317140357.14819-1=
-prabhakar.mahadev-lad.rj@bp.renesas.com/
>=20
> 2] Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> OpenSBI configures the PMA regions as required and creates a reserve memo=
ry
> node and propagates it to the higher boot stack.
>=20
> Currently OpenSBI (upstream) configures the required PMA region and passes
> this a shared DMA pool to Linux.
>=20
>     reserved-memory {
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         ranges;
>=20
>         pma_resv0@58000000 {
>             compatible =3D "shared-dma-pool";
>             reg =3D <0x0 0x58000000 0x0 0x08000000>;
>             no-map;
>             linux,dma-default;
>         };
>     };
>=20
> The above shared DMA pool gets appended to Linux DTB so the DMA memory
> requests go through this region.
>=20
> 3] We provide callbacks to synchronize specific content between memory and
> cache.
>=20
> 4] RZ/Five SoC selects the below configs
>         - AX45MP_L2_CACHE
>         - DMA_GLOBAL_POOL
>         - ERRATA_ANDES
>         - ERRATA_ANDES_CMO
>=20
> ----------x---------------------x--------------------x---------------x---=
-----------
>=20
> Note,
> - Ive used GCC 12.2.0 for compilation
> - Tested all the IP blocks on RZ/Five which use DMA
> - Patch series is dependent on the series from Arnd,
>   https://patchwork.kernel.org/project/linux-riscv/cover/20230327121317.4=
081816-1-arnd@kernel.org/.
>   (Ive rebased Arnd's series on v6.4-rc-1)
> - Patches applies on top of palmer/for-next (255b34d799dd)
> - Ive pushed the complete tree here https://github.com/prabhakarlad/linux=
/tree/rzfive-cmo-v9
> - Previously the function pointer approach was NAKed by Christoph Hellwig=
 but based on the discussion
>   on #riscv Ive implemented this approach.

Last time around you wanted someone to try this on a d1. I have done &
seems to work just as well as it did before. For where it is relevant:
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1

Cheers,
Conor.

--dWz4qVr6/YdX432b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZInxvgAKCRB4tDGHoIJi
0sfzAQCEjbnkO/PstIi3QY0iVd1H9kr/2JAlhfErqEE/L8IxCgEAzAvEFiNamjsn
G75ooY9CoNzd0FPcZl23hphkNQ24xwk=
=GlJW
-----END PGP SIGNATURE-----

--dWz4qVr6/YdX432b--


--===============0279424256965683347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0279424256965683347==--


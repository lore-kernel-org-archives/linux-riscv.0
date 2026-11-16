Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92800606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5E2lYPNW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6zrnKo+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jo5/0jLTdSX0aRXhB+o3mp8nzlOlvQM4O/AVVDHQVkE=; b=5E2lYPNW2rPS2ghooG1s88BKTy
	ectV02Rqi2vVr5qYyIiIWwHe7XPUOkl6xcGDaqluuiRQR16vyOyasOV5K7aGhbTf/uI8BYINzjctU
	KwJRcB2X8hiIOGGlb5A+tbJereFtHhPYzSeVEaxSAAF3eZrT0DLnGBC5HipYVMOI009iqEKhMfVeH
	SwD68f3We+2lfPhvZ7/ET79OPoFPlT3RA49X+hINXGF4n6ki852W3sDWr9idL8ceHpZ89yLJWHzJs
	Bdw3NJSFzzUlGUsfV2VNiyJYsDIUHDv+vpo8WK1n117aGYvf91CrI6mhPxu1kb4eXOK0vpYTtvvwL
	Yw/EK6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0hV-00000003QnS-0Lp8;
	Mon, 16 Nov 2026 17:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0hS-00000003Qn9-2oI2
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 17:41:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0167628A5;
	Mon, 16 Nov 2026 17:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A81F000C9;
	Mon, 16 Nov 2026 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794850861;
	bh=wbM7PObAphnFp29ig3MYdFeHyh+1rC5d4x5j+W0SbqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O6zrnKo+1vIXmFQnUBm1R4U9NxwK1087y+Lng2RIuXFg1i0w1tMIHvLxCQSK/Gs+O
	 LpVoSakcIfjh8msixhP+Om0d8TqzajVwTp+f8aKyOOh9Cm0KRqWMgRQK4pq8pVLHrP
	 KstwU+HcAvT4/LA4CD0nvkzFXWOOFwK7DGPpZooBEi20eLu/AAZ4kNl8VZ9GakU5k5
	 m4fd922WMIKw9dzySH0wJVLE28rtsUhlfIYgdjs4V0bXB5Z+HMsr4p3d5h66cU97iv
	 F+OSg10v62Lu0/oHRxRl5GlpSzCO8hRnugMZpn5fdtgEF2ZfKi6/MH+WjOwZL5eBwR
	 2sx6gn5oB+XJw==
Date: Mon, 16 Nov 2026 17:40:55 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
Message-ID: <20261116-canary-pedometer-9df9d756da82@spud>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
 <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8270570916535184537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8270570916535184537==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XvBLiguEsEm543R"
Content-Disposition: inline

--1XvBLiguEsEm543R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55:14PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
> and the board binding.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918e67=
3c7977d9de91823 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
>  F:	drivers/usb/musb/mpfs.c
>  F:	include/soc/microchip/mpfs.h
> =20
> +RISC-V MIPS SoC SUPPORT
> +M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/riscv/mips.yaml
> +F:	arch/riscv/boot/dts/mips/

Right, so still no git tree here. How are we going to get this applied?

My comment on the last version was:
| You're missing a MAINTAINERS entry for the platform, since someone is
| going to have to pick up the patches for the arch/riscv/boot/dts/gf and
| that someone is neither Palmer nor Paul.
| See Documentation/process/maintainer-soc.rst for more info.
|=20
| I'd apply patches as a very last resort, but even then you'd need an entry
| to make sure that you're CCed on patches for the platform because I
| don't care about the platform and would just apply things that look
| correct if there was no reviews provided.

You have added the entry, which is great, but the absence of a git tree
implies you're not actually intending applying the patches? Ideally you,
someone that cares for this platform, would do that - and the lack of a
tree implies that you're expecting someone else (me?) to do it.

Cheers,
Conor.

> +
>  RISC-V MISC SOC SUPPORT
>  M:	Conor Dooley <conor@kernel.org>
>  L:	linux-riscv@lists.infradead.org
>=20
> --=20
> 2.43.0
>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--1XvBLiguEsEm543R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtAJwAKCRB4tDGHoIJi
0iBkAQCJvGKE3LM6qVP/x7ZRhCNl841gAEn9bwsxQj0K/mhPuAEA1a3Ds1qdqjYO
wJ/wgZaVpxM0yvjQSWXIB9hn1o6WTQg=
=2URi
-----END PGP SIGNATURE-----

--1XvBLiguEsEm543R--


--===============8270570916535184537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8270570916535184537==--


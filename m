Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F814D6CFA2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lEANfO+GyDOmVPKi+X5MMen6pxNbFgUtQO2PVp5E1A=; b=cDrF8YhTGJdSw7BaMbFBwfsmhg
	A5GfGSuDKflXkTN3FfPnjb/UlaBtTm6XNV3933QhX/ll4LG1L/8eCFvKeAkBc3CRpVQnN9n09n/hl
	2+3esYHwoMKsqv5L1+r/RAkFj/U5/tWoQkjAhbJVhxllOUqV08RcUsfcYfYE0Q5UX7bf0lwoCHI2d
	lpgEEHcvucR6m8+QYezVN3zgSFikQ8ixlBZHJI8tybbfiMTGKnyWOLpfdx6IpVZsqqJhLPEEvrBJL
	LX93zxiHGPv/uQn6XS7Ygy88Eg87bbHHNAoypyzX+ji6puLBh5jXdiZuCFg0is75aRipRofocAyz1
	9yFn59Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizrO-00000007fqG-3X7e;
	Thu, 22 Jan 2026 18:56:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizrM-00000007fpt-0bDq
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 18:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A73404409F;
	Thu, 22 Jan 2026 18:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6A3C116D0;
	Thu, 22 Jan 2026 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769108207;
	bh=oCi/oH51C/qp0hpknnsS4CRAoHyQKTcSRvqI35qDL4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlrhcOMWjNGvqkxA4yehKNUJ6D2c/2bi5Go5Tk1Pe2h9MOwIM7GpZLXFhlfZ/r2c6
	 p/OZ6FvP17ClccioURc3O0ZMxSPM1apU4fE50/RPD8mf6Dw4Jukr1iyhusMrY8KX3v
	 d1dcAdigp8DALkB2mNZqaW2scIal8wvc6jzogXLpZYlDgOWpAT4HmMsWaCsdZC2QRL
	 TlYMui+GmjAZeZw5KY/WLr5Uvs47fvYqae9c6oEKZ5hLrMqgV9uunbOAC4eihwp76A
	 8B9r/Cv2QW2SWOduhl40zBbVsEb4653Gs9ZrHpkZKCq5+ImPvoPPm06NUXyERWy7CA
	 PlZNQSfwfcG8A==
Date: Thu, 22 Jan 2026 18:56:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: cpufeature: Clarify ISA spec version for
 canonical order
Message-ID: <20260122-arrive-undertook-413b9b9491fb@spud>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
 <20260116-supm-ext-id-v1-3-5fcf778ba4a6@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260116-supm-ext-id-v1-3-5fcf778ba4a6@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_105648_244079_FE17BB66 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: multipart/mixed; boundary="===============2248361578578585158=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2248361578578585158==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dZQChMsFso20z+6+"
Content-Disposition: inline


--dZQChMsFso20z+6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:10:33AM +0800, Guodong Xu wrote:
> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
>=20
> Historical versions of the RISC-V specification can be found via Link [1].
>=20
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: 8135ade32c0db ("RISC-V: shunt isa_ext_arr to cpufeature.c")

I don't think that's the right fixes tag, if a fixes tag is even
appropriate. If a fixes tag is to be used, it should actually be
Fixes: 99e2266f2460 ("RISC-V: clarify ISA string ordering rules in cpu.c")

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 39680280f858..629984df1e7b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -461,7 +461,8 @@ static const unsigned int riscv_supm_exts[] =3D {
> =20
>  /*
>   * The canonical order of ISA extension names in the ISA string is defin=
ed in
> - * chapter 27 of the unprivileged specification.
> + * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged=
 ISA
> + * (Document Version 20191213).
>   *
>   * Ordinarily, for in-kernel data structures, this order is unimportant =
but
>   * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
>=20
> --=20
> 2.43.0
>=20

--dZQChMsFso20z+6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXJy6gAKCRB4tDGHoIJi
0lTWAP0ag87CQ1VmquoDQR4H77Sy+9Tpxpnx4KhUDZXuEn3VsAEAvfAosr36UrVA
4QZq7Aqn2cTA12oyQdZaQkInlDEtTgk=
=AXpm
-----END PGP SIGNATURE-----

--dZQChMsFso20z+6+--


--===============2248361578578585158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2248361578578585158==--


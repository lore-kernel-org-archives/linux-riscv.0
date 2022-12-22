Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC041C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 22:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnHKAjiJTFJO8MVIN5UonSbrvZiME/3VdAA1eDbWprM=; b=1i9ZCJjafUmC9AmRGItfBZkxPx
	bZNfaaPj8A6MUC2F/uXChWH6bgDofApflIxr2z8wH3hxnl+SwUN1nXtVV9e2EGtqoql1X6Vt4sF1H
	RfzQ/rnyoUFL1/dDYkt5X7bYBgrsVJ+vKlxWO572YfGYLP4jVxtg110SYQtL9g6q7b0oDdBFbv3XQ
	WjvtTmPqzNDQO3xG+anZLTiYAK/F6jbHflhPD27EW30aJpLaHzAKq9Cvz0JeFsRQ4GDdUT1IcYzAx
	Bv2GY4uOoJWHDYL3h+KfjuBaV8FzKqMgNp1k6UdXgJ8A8tbbKEFb33aI42aZaQsd+e9Zpb9t1UGma
	RdJRh9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8US1-000PyV-Rv; Thu, 22 Dec 2022 22:54:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8URx-000Pre-B6
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 22:54:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3CDC61DA6;
	Thu, 22 Dec 2022 22:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE9DC433D2;
	Thu, 22 Dec 2022 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671749639;
	bh=s5/+z460u5sT0eSX4c/3uYgIenADoi++bcHjFQtocSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TN7RMfku+3dmqCys76KGiPjXxgCcC1MoCnh2lOiIEhrckiVFaDP/hzR1N4nZuIJBU
	 NAnft9QvZDwJL5WgfN1rAa4YkZvNYrmJrQvGOgtVD9fK3PN633WAchsijNRAqU5+6s
	 TfFf/98/BBuHSe0keOG4OrlaYb3QKUwTW8tdfuLPwYIDmcrwjdwHGhddgjI7dskVuH
	 7rJz5neQD6k/D6Cba3m6otujkSZwvbgjZUyiY90loEDbhzvZGomwAGtpFNNXuTbTya
	 ndR51vzVc9ODj26RdPOC6Lkm4TAPB9MeGYhztC0fZvaEPxdRowC53Zm8x8Wwl3UGRB
	 wiq1sdThc6NTA==
Date: Thu, 22 Dec 2022 22:53:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux@rivosinc.com
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Message-ID: <Y6TgAxg3csoQqaFr@spud>
References: <20221222224104.3449841-1-vineetg@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20221222224104.3449841-1-vineetg@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_145405_521649_A2E2FC84 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Type: multipart/mixed; boundary="===============5779847966582899988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5779847966582899988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pj+1QXslCdPzNXFa"
Content-Disposition: inline


--pj+1QXslCdPzNXFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
> This allows for using the enum in general to refer to any extension.

What is the point of this patch? It's hard to understand the rationale
without having any user, especially...

>=20
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b22525290073..b861e711e3ac 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -26,16 +26,6 @@ enum {
> =20
>  extern unsigned long elf_hwcap;
> =20
> -#define RISCV_ISA_EXT_a		('a' - 'a')
> -#define RISCV_ISA_EXT_c		('c' - 'a')
> -#define RISCV_ISA_EXT_d		('d' - 'a')
> -#define RISCV_ISA_EXT_f		('f' - 'a')
> -#define RISCV_ISA_EXT_h		('h' - 'a')
> -#define RISCV_ISA_EXT_i		('i' - 'a')
> -#define RISCV_ISA_EXT_m		('m' - 'a')
> -#define RISCV_ISA_EXT_s		('s' - 'a')
> -#define RISCV_ISA_EXT_u		('u' - 'a')
> -
>  /*
>   * Increse this to higher value as kernel support more ISA extensions.
>   */
> @@ -53,6 +43,15 @@ extern unsigned long elf_hwcap;
>   * available logical extension id.
>   */
>  enum riscv_isa_ext_id {
> +	RISCV_ISA_EXT_a =3D ('a' - 'a'),
> +	RISCV_ISA_EXT_c =3D ('c' - 'a'),
> +	RISCV_ISA_EXT_d =3D ('d' - 'a'),
> +	RISCV_ISA_EXT_f =3D ('f' - 'a'),
> +	RISCV_ISA_EXT_h =3D ('h' - 'a'),
> +	RISCV_ISA_EXT_i =3D ('i' - 'a'),
> +	RISCV_ISA_EXT_m =3D ('m' - 'a'),
> +	RISCV_ISA_EXT_s =3D ('s' - 'a'),
> +	RISCV_ISA_EXT_u =3D ('u' - 'a'),

=2E.. as it is diametrically opposed to another patchset which deletes
this enum, with a rationale.
https://lore.kernel.org/linux-riscv/20221204174632.3677-5-jszhang@kernel.or=
g/

+CC Jisheng.

Also, please run get_maintainer.pl, there's a bunch of people touching
this area at the moment & CCing them would be great.

Thanks,
Conor.

btw, is the rivos list intentionally on CC?

>  	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--pj+1QXslCdPzNXFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6TgAwAKCRB4tDGHoIJi
0rreAQCtZcDoIwoWYbmquib4NuwAxixyF2rxyu40Fb7CFnwinwD7Bp2VyOG52wIk
dGt6s7pFjBdgKNTKJm1BQ4DX7uCzawk=
=+Xvb
-----END PGP SIGNATURE-----

--pj+1QXslCdPzNXFa--


--===============5779847966582899988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5779847966582899988==--


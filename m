Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04BAC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1AE6mcJOPr7FFH/1+pR/Syx085XEiETiSDDRv7P8rk=; b=ZRTSltsp2nHB6oHcT9e1VcTKQW
	2Z0n3cB7sc8eWx/x38ulaEK5TRB9SPyp65LQ1/vmhDOEbE81kV1lSF3LpniijyM68UiCQeWcRHuPe
	mYIVjORjZc7yZhO8m+9EYjJfeTCO45g4gKhEV+cloZmIlcCoo7ne1gaPu4/QWVb9Q2ls9RqgBlGZo
	kRkNqrrI9H1BscqAK/wn0I75CxrmLuWC1FfYUTxIton0s9g2VjC/aLRWhEFNmSoeDuL/jWFDDoYUL
	ywSgfjH9OXI9riyxfAEgpXvpRmNSIDthqtbseMyugz+KYDFNJSpL6BgamAvmCFnUX12ui8Kj3ZZzz
	hN8R9dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL809-00CJ0p-L9; Thu, 26 Jan 2023 19:33:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL806-00CIzt-U1; Thu, 26 Jan 2023 19:33:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 428C7617C4;
	Thu, 26 Jan 2023 19:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12630C433EF;
	Thu, 26 Jan 2023 19:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674761613;
	bh=vc1V/Z7elonzdwRvP09P1oJKTw2NjoGYhFuRtgSWD/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSqtLDPDPu1c+MOZCM5VJHtYOpB9srDL4tEUBP0KxZnD0YPFDG4/zSNmJx7qf3j13
	 a4u9rxJ7f1Rp4R89ekkgu88a3tlovoCU5M9rNwXj2FhHy/VWyiT91i+PL+YoKu0L/5
	 4X7WODDbh/Cm7dnzuKZEgOgYSM3iSwGKHlEiaaT/SevbaTPpdWcYQE3LKeBKc/sDht
	 paoSKaHKMRQij0yZe26xc0Kb9FEJosj5zlaIintYRAfCgNPJ/PYGahYPIfVe83Gftf
	 YkKnOQvF4ZOJt8zUvyL0XneWXjTApFUw1bR2Xy9VRiRYnROYdnjw27GFVn3auIWglg
	 n8AsGSqh4IzHw==
Date: Thu, 26 Jan 2023 19:33:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/13] riscv: switch to relative alternative entries
Message-ID: <Y9LViAD0aPSBwi5t@spud>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
 <20230120183418.ngdppppvwzysqtcr@orel>
MIME-Version: 1.0
In-Reply-To: <20230120183418.ngdppppvwzysqtcr@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_113335_068223_078BD124 
X-CRM114-Status: GOOD (  24.33  )
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
Content-Type: multipart/mixed; boundary="===============5390530298552344108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5390530298552344108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pCzcGbmwE1oO9rIP"
Content-Disposition: inline


--pCzcGbmwE1oO9rIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 07:34:18PM +0100, Andrew Jones wrote:
> On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> ...
> >  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
> > -	RISCV_PTR " " oldptr "\n"					\
> > -	RISCV_PTR " " newptr "\n"					\
> > -	REG_ASM " " vendor_id "\n"					\
> > -	REG_ASM " " newlen "\n"						\
> > -	".word " errata_id "\n"
> > +	".4byte	((" oldptr ") - .) \n"					\
> > +	".4byte	((" newptr ") - .) \n"					\
> > +	".2byte	" vendor_id "\n"					\
> > +	".2byte " newlen "\n"						\
> > +	".4byte	" errata_id "\n"
> >
>=20
> Hi Jisheng,
>=20
> This patch breaks loading the KVM module for me. I got "kvm: Unknown
> relocation type 34". My guess is that these 2 byte fields are inspiring
> the compiler to emit 16-bit relocation types. The patch below fixes
> things for me. If you agree with fixing it this way, rather than
> changing something in alternatives, like not using 2 byte fields,
> then please pick the below patch up in your series.
>=20
> Thanks,
> drew
>=20
> From 4d203697aa745a0cd3a9217d547a9fb7fa2a87c7 Mon Sep 17 00:00:00 2001
> From: Andrew Jones <ajones@ventanamicro.com>
> Date: Fri, 20 Jan 2023 19:05:44 +0100
> Subject: [PATCH] riscv: module: Add ADD16 and SUB16 rela types
> Content-type: text/plain
>=20
> To prepare for 16-bit relocation types to be emitted in alternatives
> add support for ADD16 and SUB16.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

For the fixup:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> ---
>  arch/riscv/kernel/module.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 76f4b9c2ec5b..7c651d55fcbd 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *m=
e, u32 *location,
>  	return -EINVAL;
>  }
> =20
> +static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location +=3D (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *m=
e, u32 *location,
>  	return 0;
>  }
> =20
> +static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location -=3D (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *=
me, u32 *location,
>  	[R_RISCV_CALL]			=3D apply_r_riscv_call_rela,
>  	[R_RISCV_RELAX]			=3D apply_r_riscv_relax_rela,
>  	[R_RISCV_ALIGN]			=3D apply_r_riscv_align_rela,
> +	[R_RISCV_ADD16]			=3D apply_r_riscv_add16_rela,
>  	[R_RISCV_ADD32]			=3D apply_r_riscv_add32_rela,
>  	[R_RISCV_ADD64]			=3D apply_r_riscv_add64_rela,
> +	[R_RISCV_SUB16]			=3D apply_r_riscv_sub16_rela,
>  	[R_RISCV_SUB32]			=3D apply_r_riscv_sub32_rela,
>  	[R_RISCV_SUB64]			=3D apply_r_riscv_sub64_rela,
>  };
> --=20
> 2.39.0
>=20

--pCzcGbmwE1oO9rIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LViAAKCRB4tDGHoIJi
0oYcAQClYSueSJDtig3qrqwQobGwxe0T5StqPgiOWqePZrc3xwD/UjmLjjuPj8LR
+jdmg1Xrybx2t2TsXVT06MPkbpsV1wI=
=uhHG
-----END PGP SIGNATURE-----

--pCzcGbmwE1oO9rIP--


--===============5390530298552344108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5390530298552344108==--


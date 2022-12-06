Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303FC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td00aLGdI8aABHm+TOhYE53zJb1DNySWqFZL9hWmSn0=; b=A/5QpETjgnMKd38RmkSfkqAOUG
	pAUO2vLbiydyfD35c708IajExXjItCqpVqdJT6YogNRm0NMLh3TuxlaBLyVp0c8qa0M7CCLZm+s1w
	PaNKGl8sroBAnf1av16/kylp8T9g5i7r2+JcyzeOEUCMrKYfEJyea67g3DM5YgEPI3F4Vqq46CzSG
	Yias4sTdVuCwdcn/bD+25YR+JUEYYzz/GiFrWCOrN4Vx8P7lUdu8LKc4j5XDFNRzvH+uWFI9QScbz
	kOZmyHC1pagtxIidjK2V2ZWU8GulRWdW9k0ENfLp4vbSRlPISJ99UbJ1nyfkbwRagYV5YTlG5ti9q
	e4fV9NUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2eno-002CE4-FH; Tue, 06 Dec 2022 20:44:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2enl-002CAp-8i; Tue, 06 Dec 2022 20:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B368618B4;
	Tue,  6 Dec 2022 20:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D78DC433D6;
	Tue,  6 Dec 2022 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670359468;
	bh=VyFPKDskm09hB3DBPKUEg9fDFjmHc83whLCSf6+IOc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqE4P1ST/kOEAMpHGncY2mQC42fpXvtPwi7fEW4ygWIoFXRBQwuTgi+T4Oj1cPt5U
	 PcjNwTHqkBmsHx/9f43E+84ht/2lDZommmLHFk+mU3z1b9QLM7RJQOx6kV11zhvH3r
	 P5nikwVYyFulq41FCiW40m3CjFGxVG9GoTFMzcCPWle7Ea+HjyVFxQrp4HhjtxEwi/
	 +0uNRruA6Qk6w9CyFMhuXtIQyt0LHEe/dVvePp/0v4RJtT3kfWGs3eidwAFiA38Uv5
	 cG6SSrO4TkMC9CGupB9JjNKVwRsNOqoTu+l8T9neSqXAK5HoiDJgMvjSnEO23A++f9
	 txRPoFxC8sExw==
Date: Tue, 6 Dec 2022 20:44:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/13] riscv: module: move find_section to module.h
Message-ID: <Y4+pp6XEu3GSWCiE@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-9-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_124429_404047_B23501AB 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Type: multipart/mixed; boundary="===============0542170590475855789=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0542170590475855789==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kfeymfl++SYTH9yC"
Content-Disposition: inline


--Kfeymfl++SYTH9yC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 01:46:27AM +0800, Jisheng Zhang wrote:
> Move it to the header so that the implementation can be shared
> by the alternatives code.

I'm not a super big fan of these perfunctory commit messages.
Maybe I'm being a bit ornery, but a few words about why the alternatives
could benefit from this would be nice. Also, s/it/find_section()/ please.

How about:
> Move find_section() to module.h so that the implementation can be shared
> by the alternatives code. This will allow us to use alternatives in
> the vdso.


> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/module.h | 15 +++++++++++++++
>  arch/riscv/kernel/module.c      | 15 ---------------

Silly question maybe, but is module.h the right place to put this?
But I have nothing better to suggest, and I hate bikeshedding stuff when
I have no suggestion to make.

Rationale behind the movement seems grand to me though, so I suppose:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  2 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/mod=
ule.h
> index 76aa96a9fc08..78722a79fc59 100644
> --- a/arch/riscv/include/asm/module.h
> +++ b/arch/riscv/include/asm/module.h
> @@ -111,4 +111,19 @@ static inline struct plt_entry *get_plt_entry(unsign=
ed long val,
> =20
>  #endif /* CONFIG_MODULE_SECTIONS */
> =20
> +static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> +					   const Elf_Shdr *sechdrs,
> +					   const char *name)
> +{
> +	const Elf_Shdr *s, *se;
> +	const char *secstrs =3D (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offse=
t;
> +
> +	for (s =3D sechdrs, se =3D sechdrs + hdr->e_shnum; s < se; s++) {
> +		if (strcmp(name, secstrs + s->sh_name) =3D=3D 0)
> +			return s;
> +	}
> +
> +	return NULL;
> +}
> +
>  #endif /* _ASM_RISCV_MODULE_H */
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 91fe16bfaa07..76f4b9c2ec5b 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -429,21 +429,6 @@ void *module_alloc(unsigned long size)
>  }
>  #endif
> =20
> -static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
> -				    const Elf_Shdr *sechdrs,
> -				    const char *name)
> -{
> -	const Elf_Shdr *s, *se;
> -	const char *secstrs =3D (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offse=
t;
> -
> -	for (s =3D sechdrs, se =3D sechdrs + hdr->e_shnum; s < se; s++) {
> -		if (strcmp(name, secstrs + s->sh_name) =3D=3D 0)
> -			return s;
> -	}
> -
> -	return NULL;
> -}
> -
>  int module_finalize(const Elf_Ehdr *hdr,
>  		    const Elf_Shdr *sechdrs,
>  		    struct module *me)
> --=20
> 2.37.2
>=20

--Kfeymfl++SYTH9yC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+ppwAKCRB4tDGHoIJi
0vdPAPwMCMePiLIxdM2S19748MS5S9G5teWeIfVGdq6nal4HMQD/a2JizR3i5tUB
H5BxI52RGgMvF963Rr0R5Ftrp24+yQw=
=/QTm
-----END PGP SIGNATURE-----

--Kfeymfl++SYTH9yC--


--===============0542170590475855789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0542170590475855789==--


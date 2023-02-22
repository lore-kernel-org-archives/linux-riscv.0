Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31856C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJupI3vFUFORSr5mXg4QmiiK0E9dE5tUSZbhw8bkc8c=; b=HlM9JIA/p2ubN+k7XtEXOy+85G
	7UTj+lMyPyX1EXki+GWktnb5DJHEZN3o4X7aZK2GUaNQEvj8Zfsu17+kEQbpsGs5/LVB+5zEB0Wpd
	YDqoAj38J7x/tvDyFIAM3WQiyRw2pF3ViEyA6GIA+3RdUV8nSpYxIcdOHJXeT1iQELcz0tyAsQGju
	q98NVIx/IO3yIx+HtazRNgCkkLCj8nQuRDJTjUd1p12HJEA7NO6yLGc7ZFU6Opt8VDNY+H91QKU3a
	nrD3tIt6fo1kWYyCj/z/ictYjM82KducKobL2BJthAI6gdBaf+Igiw93ScN7BaupBc/66lEKD5S0D
	w0GkAoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsuY-00DFHL-Vp; Wed, 22 Feb 2023 17:28:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsuS-00DFDl-Ft; Wed, 22 Feb 2023 17:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7PCb/nQ6ECZ4J8VaAk/5mSyJ7jm4dBsoYJUGthXnf7c=; b=BO3p3FFreJTHiS3TuMwoKmYCm5
	Mnh5nwJy4dZBB7F2WodaI7P9AsWmIuExlA5dBw7cyj7wGZ4pF/KChybByM4Ty9p/ed7dhmw4sT6wx
	itfKd6UNv0EEIf7I6B5xByJkoTgDnbLUQTJOLIJ0IvgND1RBxgqEQp9oV+dxVi4jtZTm55k8Rfkfe
	uBsKyv0pwmj90Mv8R1u1gCOVX9KFFkcWhRHJS2rYF7oD8MkFezun7LbrmEQmOrNHyBsdFz9Ng/EaI
	5+v0bYqFW36dBgT+sL3PV/29TG2U2htjf2wrApqQpYAlKziuK5xycVgA9HosBJ+tQw8c+/nJLeZHU
	dscoIonQ==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUsuO-00Cbfl-2S;
	Wed, 22 Feb 2023 17:28:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BFE1B815CF;
	Wed, 22 Feb 2023 17:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B058C433D2;
	Wed, 22 Feb 2023 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677086873;
	bh=GaQWt87pfqWhihgkWvN8V4jqdum+gGbBj2QXnN43Xco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmGVZmNf6jMCxbIEVKkOfdRYDWfmYRNqQJzVKPfG9rfKn3VOryXgjnJhTnGslNMdC
	 RRf/KvBODyLsWBHMMqhO3VwsjMi/Hm9gafrXRZzPSRrBMxc+Kl5tvIMw4V9VFiQFP8
	 rHSXXnfzO+dQsj01XYlOpdW63MNr1vZgIh9qrNa7nm06hA9TekwcIvkauuinyLt/RM
	 ko4QAisxGK276tPWrc7ASm07tGuVxlsgmDbV8+YWMbuJp6K0tQRUnO+kqglPwuWLd9
	 CWjRDeV6tpa34aHZY0qNDv7zJR6w0wRZJ6LQLPll6sewq+2emPNeDsIIxDvS+kjoNH
	 yYOXOsgNx+n/g==
Date: Wed, 22 Feb 2023 17:27:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org, 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: Re: [PATCH v5 5/8] riscv: cpufeatures: Put the upper 16 bits of
 patch ID to work
Message-ID: <Y/ZQk0ifXPEnenoe@spud>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-6-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221190916.572454-6-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_172800_977174_630D732A 
X-CRM114-Status: GOOD (  34.39  )
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
Content-Type: multipart/mixed; boundary="===============3843478683927809725=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3843478683927809725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GqMNVKB/GCgclQiO"
Content-Disposition: inline


--GqMNVKB/GCgclQiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 08:09:13PM +0100, Andrew Jones wrote:
> cpufeature IDs are consecutive integers starting at 26, so a 32-bit
> patch ID allows an aircraft carrier load of feature IDs. Repurposing
> the upper 16 bits still leaves a boat load of feature IDs and gains
> 16 bits which may be used to control patching on a per patch-site
> basis.
>=20
> This will be initially used in Zicboz's application to clear_page(),
> as Zicboz's block size must also be considered. In that case, the
> upper 16-bit value's role will be to convey the maximum block size
> which the Zicboz clear_page() implementation supports.
>=20
> cpufeature patch sites which need to check for the existence or
> absence of other cpufeatures may also be able to make use of this.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative.h |  3 +++
>  arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
>  2 files changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 8f39d4e8598d..f2cb543b0bd2 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -17,6 +17,9 @@
>  #include <linux/stddef.h>
>  #include <asm/hwcap.h>
> =20
> +#define PATCH_ID_CPUFEATURE_ID(p)		((u16)((u32)(p) & 0xffff))
> +#define PATCH_ID_CPUFEATURE_VALUE(p)		((u16)(((u32)(p) >> 16) & 0xffff))

I was just fiddling around a bit with macros, I think these do the same
thing:
#define PATCH_ID_CPUFEATURE_ID(p)		((p) & GENMASK(15, 0))
#define PATCH_ID_CPUFEATURE_VALUE(p)		FIELD_GET(GENMASK(31, 16), (p))
Although without the same care about types - is there a specific reason
you were casting like that?

Either way, I think I prefer this approach to the vendor_id stuffing!
If we do end up needing to fit an aircraft carrier, we can come back and
revisit another parameter in the alternatives I suppose...

I don't really know if the macros do anything to help with
understandability, so with or without trying to use macros:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regula=
r boot */
>  #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during modul=
e-init */
>  #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before m=
mu start */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 6102b6bb5db3..0594989ead63 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -273,12 +273,35 @@ void __init riscv_fill_hwcap(void)
>  }
> =20
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> +/*
> + * Alternative patch sites consider 48 bits when determining when to pat=
ch
> + * the old instruction sequence with the new. These bits are broken into=
 a
> + * 16-bit vendor ID and a 32-bit patch ID. A non-zero vendor ID means the
> + * patch site is for an erratum, identified by the 32-bit patch ID. When
> + * the vendor ID is zero, the patch site is for a cpufeature. cpufeatures
> + * further break down patch ID into two 16-bit numbers. The lower 16 bits
> + * are the cpufeature ID and the upper 16 bits are used for a value spec=
ific
> + * to the cpufeature and patch site. If the upper 16 bits are zero, then=
 it
> + * implies no specific value is specified. cpufeatures that want to cont=
rol
> + * patching on a per-site basis will provide non-zero values and impleme=
nt
> + * checks here. The checks return true when patching should be done, and
> + * false otherwise.
> + */
> +static bool riscv_cpufeature_patch_check(u16 id, u16 value)
> +{
> +	if (!value)
> +		return true;
> +
> +	return false;
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begi=
n,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
>  {
>  	struct alt_entry *alt;
>  	void *oldptr, *altptr;
> +	u16 id, value;
> =20
>  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return;
> @@ -286,13 +309,19 @@ void __init_or_module riscv_cpufeature_patch_func(s=
truct alt_entry *begin,
>  	for (alt =3D begin; alt < end; alt++) {
>  		if (alt->vendor_id !=3D 0)
>  			continue;
> -		if (alt->patch_id >=3D RISCV_ISA_EXT_MAX) {
> -			WARN(1, "This extension id:%d is not in ISA extension list",
> -				alt->patch_id);
> +
> +		id =3D PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> +
> +		if (id >=3D RISCV_ISA_EXT_MAX) {
> +			WARN(1, "This extension id:%d is not in ISA extension list", id);
>  			continue;
>  		}
> =20
> -		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
> +		if (!__riscv_isa_extension_available(NULL, id))
> +			continue;
> +
> +		value =3D PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> +		if (!riscv_cpufeature_patch_check(id, value))
>  			continue;
> =20
>  		oldptr =3D ALT_OLD_PTR(alt);
> --=20
> 2.39.1
>=20

--GqMNVKB/GCgclQiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/ZQkwAKCRB4tDGHoIJi
0k+wAPwIor5ilu4B0RgPKFqm7EtX5MEeyIBYCiI+e43beFThVAD8DO/1X/a4zv0y
P04ldR+yuDJDo4G0/ySBm28E4Kbc1Ac=
=THQn
-----END PGP SIGNATURE-----

--GqMNVKB/GCgclQiO--


--===============3843478683927809725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3843478683927809725==--


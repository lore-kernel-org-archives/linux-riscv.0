Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85061C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcwjr+1tCjDxrm2AhvIP00kIcIfOQiZ10Mfp76VtcOo=; b=11ee96+zUYB+JEDH7PlGxZfxJu
	cp8Te3HR0uDeHodpPev93L3AV5IroelK4c4v2+PEuq5QS5kfS9dfbequVraQzmxXg/zxVYhd3klto
	82wya1DHG0HeJTaEQaw3i1V/q6mWP0No/vkDA3slbdl+5MbgRaq0uIN7MRxwwNzc1cks6e9/CEudX
	v5ivzQYE5wCnrIBe22JD1HtJAh5hXLE8GIT40qsApXpeUc+PnaFVvViJ2sUSCocPWUfGsftTZNykf
	UBfy1wA6wP9c4HF0SBg12Y+LtzbYbmhPXlqr7S3HUgrRT+IlLKzUu7Pe5mlnzuDY7Y62RY/bwSc7y
	NaBmJpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZraR-004WOL-BC; Wed, 08 Mar 2023 11:03:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZra7-004VwC-VD
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 11:03:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75DA861770;
	Wed,  8 Mar 2023 11:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6970DC433EF;
	Wed,  8 Mar 2023 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678273419;
	bh=Zbl3Foqh2H5WwIwrRZv3Jx/V1nZZ5DSGmtKn0Ssa7Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCPp/xktaaV2xYVkQ6nb3+wmXdq29v6wIVE4TfWp+30FZ5oVstNnL9J8aQsf2jks/
	 yB016+p8iFGrBMYjSETJcRSzNqmUj+02ZPVzYN82ZfJLEKnQolJxaopisEBhifU+9G
	 sXEq9mZZpuYgHtILY9JDHrg45+gCXfR6abVO9+SfyJQKqcVgTevQIUEbsP0PKZlYva
	 His5DUYZc3rVxBVkwfEb6fcNuKm6veFDndk6Iv0Z4+DPWv4hTmglznKvWy4leSLozH
	 3+tx4G+GqWLmcHQR4nVsm42jsm8Vsx2cDKHFeLiLvOCWNc6Axa1OujS4Csar2fmJ63
	 2pcurg2AWuJrQ==
Date: Wed, 8 Mar 2023 11:03:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, pierre.gondois@arm.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "riscv: Set more data to cacheinfo"
Message-ID: <511b57ce-476a-4801-8b14-e2a9c180c400@spud>
References: <20230308064734.512457-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230308064734.512457-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_030340_140305_AE162F75 
X-CRM114-Status: GOOD (  28.50  )
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
Content-Type: multipart/mixed; boundary="===============5567328163440908962=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5567328163440908962==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bwR3dAb+Pcs15DVY"
Content-Disposition: inline


--bwR3dAb+Pcs15DVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 02:47:34PM +0800, Song Shuai wrote:
> This reverts commit baf7cbd94b5688f167443a2cc3dcea3300132099.
>=20
> There are some duplicate cache attributes populations executed
> in both ci_leaf_init() and later cache_setup_properties().
>=20
> Revert the commit baf7cbd94b56 ("riscv: Set more data to cacheinfo")
> to setup only the level and type attributes at this early place.
>

I've attempted to do a little bit of history diving to figure out what
commit to "blame" in a fixes tag for this.
My initial thought was to blame 03f11f03dbfe ("RISC-V: Parse cpu topology
during boot."), but baf7cbd94b56 ("riscv: Set more data to cacheinfo")
looks like it came along some months later.
I assume you double checked that the stuff in the aux vector is the same
before/after this revert? Looking on lore, that seems to be why Zong did
it this way in the first place:
https://lore.kernel.org/linux-riscv/b6fed9b4c2a3eacb2a9c353c2570d9dc1d0c1c8=
8.1598859038.git.zong.li@sifive.com/

Cheers,
Conor.

> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 66 ++++++++---------------------------
>  1 file changed, 15 insertions(+), 51 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 3a13113f1b29..305ebbdc780d 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -64,53 +64,12 @@ uintptr_t get_cache_geometry(u32 level, enum cache_ty=
pe type)
>  			   0;
>  }
> =20
> -static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type ty=
pe,
> -			 unsigned int level, unsigned int size,
> -			 unsigned int sets, unsigned int line_size)
> +static void ci_leaf_init(struct cacheinfo *this_leaf,
> +			 struct device_node *node,
> +			 enum cache_type type, unsigned int level)
>  {
>  	this_leaf->level =3D level;
>  	this_leaf->type =3D type;
> -	this_leaf->size =3D size;
> -	this_leaf->number_of_sets =3D sets;
> -	this_leaf->coherency_line_size =3D line_size;
> -
> -	/*
> -	 * If the cache is fully associative, there is no need to
> -	 * check the other properties.
> -	 */
> -	if (sets =3D=3D 1)
> -		return;
> -
> -	/*
> -	 * Set the ways number for n-ways associative, make sure
> -	 * all properties are big than zero.
> -	 */
> -	if (sets > 0 && size > 0 && line_size > 0)
> -		this_leaf->ways_of_associativity =3D (size / sets) / line_size;
> -}
> -
> -static void fill_cacheinfo(struct cacheinfo **this_leaf,
> -			   struct device_node *node, unsigned int level)
> -{
> -	unsigned int size, sets, line_size;
> -
> -	if (!of_property_read_u32(node, "cache-size", &size) &&
> -	    !of_property_read_u32(node, "cache-block-size", &line_size) &&
> -	    !of_property_read_u32(node, "cache-sets", &sets)) {
> -		ci_leaf_init((*this_leaf)++, CACHE_TYPE_UNIFIED, level, size, sets, li=
ne_size);
> -	}
> -
> -	if (!of_property_read_u32(node, "i-cache-size", &size) &&
> -	    !of_property_read_u32(node, "i-cache-sets", &sets) &&
> -	    !of_property_read_u32(node, "i-cache-block-size", &line_size)) {
> -		ci_leaf_init((*this_leaf)++, CACHE_TYPE_INST, level, size, sets, line_=
size);
> -	}
> -
> -	if (!of_property_read_u32(node, "d-cache-size", &size) &&
> -	    !of_property_read_u32(node, "d-cache-sets", &sets) &&
> -	    !of_property_read_u32(node, "d-cache-block-size", &line_size)) {
> -		ci_leaf_init((*this_leaf)++, CACHE_TYPE_DATA, level, size, sets, line_=
size);
> -	}
>  }
> =20
>  int populate_cache_leaves(unsigned int cpu)
> @@ -121,24 +80,29 @@ int populate_cache_leaves(unsigned int cpu)
>  	struct device_node *prev =3D NULL;
>  	int levels =3D 1, level =3D 1;
> =20
> -	/* Level 1 caches in cpu node */
> -	fill_cacheinfo(&this_leaf, np, level);
> +	if (of_property_read_bool(np, "cache-size"))
> +		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> +	if (of_property_read_bool(np, "i-cache-size"))
> +		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> +	if (of_property_read_bool(np, "d-cache-size"))
> +		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
> =20
> -	/* Next level caches in cache nodes */
>  	prev =3D np;
>  	while ((np =3D of_find_next_cache_node(np))) {
>  		of_node_put(prev);
>  		prev =3D np;
> -
>  		if (!of_device_is_compatible(np, "cache"))
>  			break;
>  		if (of_property_read_u32(np, "cache-level", &level))
>  			break;
>  		if (level <=3D levels)
>  			break;
> -
> -		fill_cacheinfo(&this_leaf, np, level);
> -
> +		if (of_property_read_bool(np, "cache-size"))
> +			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> +		if (of_property_read_bool(np, "i-cache-size"))
> +			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> +		if (of_property_read_bool(np, "d-cache-size"))
> +			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
>  		levels =3D level;
>  	}
>  	of_node_put(np);
> --=20
> 2.20.1
>=20

--bwR3dAb+Pcs15DVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAhrhgAKCRB4tDGHoIJi
0vSXAQCvURMcp1bHLxBYLosA+i+WCSNau6J+dyYcyi9vWcVoKwEAySl9aT/Omtzg
gIYgjttNSKJ1istKGeQ2H9TRaomc/A4=
=bvL+
-----END PGP SIGNATURE-----

--bwR3dAb+Pcs15DVY--


--===============5567328163440908962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5567328163440908962==--


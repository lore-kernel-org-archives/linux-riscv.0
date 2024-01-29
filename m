Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B269EC47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5DKp3sIXp46Dutrelpp4eZ7iHm/HlPAGkyiOjBISNs=; b=tzEz0a4SXgSH/rPjE2BBUqOJNr
	UJkUnpFZFfsuR0alRu66M/mrFWlMmR4hjRNHE9foA9CvSLJuSikjT8GD8ty+Zs+QLkg61DkQCLdIY
	K6Bfev4pe9GAfpDbrZOUk4Evv4SO/WmAIUsAX3cfQkahxm7ujixHiytuyyhJWcXn1cG3hy3xmMlkK
	fhmNkxXoPnwngpTxjIK/lCVzHaummIsmQWwR6zftOvx/XbpBzCwqYEirWNLkCkBKDV6T1IYoItbZz
	/QmDm8GIQ7v9ZTtTRRPhL85YSq3u6lc134WnhP9MeYTt+5U79O2UfqCitrauK1mZP2sBm6XNvjyUz
	9GnTuQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQn7-0000000Cc8d-0Eo5;
	Mon, 29 Jan 2024 12:31:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQn3-0000000Cc7S-0jEs
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 12:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1FFC6211E;
	Mon, 29 Jan 2024 12:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8200AC433C7;
	Mon, 29 Jan 2024 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706531463;
	bh=OMjG087pQhKBaSUbWJ01ewqPvsYZPCOIy7ZK/xWIyLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpESaN2AmpfQFQYUKYs+EQbLWFkPPNM+IzD4Jn9kW1zbuPrDWsV+go03/pzx2lFuF
	 r2X09hQBKVNvGDGOs1+Jn+JF1KLoqQ/J5L0aI3h/1p0CxRKVfD2z4m1NfxDlHiFU2h
	 xGCenlPZpg72QOMHycpLzAMC/TzA8H+aScDbhWO4M7zIhh9gisOoIRhGZ8k1ug62rX
	 DRlzGBJqjSv75FCBDIG5xdWJEmhIo2uAKAsKDwtav/ouSgPRfVL3useLSi2i0cxBrL
	 JWX6m2gs0/H8gCAU4Aac91MhjZgp+0KjWEi99pX2j98Wg9YMgWEgQ1GJRh44yWUxp0
	 unmvaNfw68XKw==
Date: Mon, 29 Jan 2024 12:30:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, robh@kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com
Subject: Re: [RFC v1 2/2] riscv: cacheinfo: Refactor populate_cache_leaves()
Message-ID: <20240129-parrot-dropout-c4ece33a98da@spud>
References: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
 <20240129075957.116033-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129075957.116033-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_043105_356784_4B16F32C 
X-CRM114-Status: GOOD (  28.30  )
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
Content-Type: multipart/mixed; boundary="===============3306940459790947479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3306940459790947479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vVQN45TubuFKPBU4"
Content-Disposition: inline


--vVQN45TubuFKPBU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Firstly, the $subject should really mention that the motivation for the
refactoring is ACPI support.

On Sun, Jan 28, 2024 at 11:59:57PM -0800, Sia Jee Heng wrote:
> Refactoring the cache population function to support both DT and
> ACPI-based platforms.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 47 ++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 30a6878287ad..f10e26fb75b6 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -74,36 +74,27 @@ int populate_cache_leaves(unsigned int cpu)
>  {
>  	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>  	struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> -	struct device_node *np =3D of_cpu_device_node_get(cpu);
> -	struct device_node *prev =3D NULL;
> -	int levels =3D 1, level =3D 1;
> -
> -	if (of_property_read_bool(np, "cache-size"))
> -		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> -		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> -		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> -
> -	prev =3D np;
> -	while ((np =3D of_find_next_cache_node(np))) {
> -		of_node_put(prev);
> -		prev =3D np;
> -		if (!of_device_is_compatible(np, "cache"))
> -			break;
> -		if (of_property_read_u32(np, "cache-level", &level))
> -			break;
> -		if (level <=3D levels)
> -			break;
> -		if (of_property_read_bool(np, "cache-size"))
> -			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> -			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +	unsigned int level, idx;
> +
> +	for (idx =3D 0, level =3D 1; level <=3D this_cpu_ci->num_levels &&
> +	     idx < this_cpu_ci->num_leaves; idx++, level++) {
> +		/*
> +		 * Since the RISC-V architecture doesn't provide any register for dete=
cting the
> +		 * Cache Level and Cache type, this assumes that:
> +		 * - There cannot be any split caches (data/instruction) above a unifi=
ed cache.
> +		 * - Data/instruction caches come in pairs.
> +		 * - Significant work is required elsewhere to fully support data/inst=
ruction-only
> +		 *   type caches.
> +		 * - The above assumptions are based on conventional system design and=
 known
> +		 *   examples.

I don't think this comment matches what you are doing.

For example, the comment only requires that split caches cannot be above
unified ones, but the code will always make a level 1 cache be split and
higher level caches unified.

The place you took the comment about the split caches from does not
enforce the type of cache layout that you do where the 1st level is
always split and anything else is unified.

populate_cache_leaves() only gets called in a fallback path when the
information has not already been configured by other means (and as you
probably noticed on things like arm64 it uses some other means to fill
in the data).

Is there a reason why we would not just return -ENOENT for ACPI systems
if this has not been populated earlier in boot and leave the DT code
here alone?

Thanks,
Conor.

> +		 */
> +		if (level =3D=3D 1) {
>  			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
> -		levels =3D level;
> +			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> +		} else {
> +			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> +		}
>  	}
> -	of_node_put(np);
> =20
>  	return 0;
>  }
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--vVQN45TubuFKPBU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbeagwAKCRB4tDGHoIJi
0p2vAP91xqgYKdI5R4E8M2TeUKf7W4MillrhtPoe4A++bU5YagD+NYICS59UguEb
kC/D3NRlCAVajtBJRjiLWpUC77PETws=
=E7YN
-----END PGP SIGNATURE-----

--vVQN45TubuFKPBU4--


--===============3306940459790947479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3306940459790947479==--


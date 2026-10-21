Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F5606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYPv1Iig;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eS7BoYnK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8nBvOJj2xYTf9deiIBaswYuBy1+OexNBu7l9Dqg7yM=; b=vYPv1IigQCBLg7bD0HuomwtAgs
	rqy9n6XspRs/M+3c4o7qeusD7mZ4zELw9MOMsxbkWumGlqgQFr56GP5E27COWwfsb7/lmveRWy74F
	0Q6l0JsYjMkk2VkHR1CVfBsHi3V4hr/ONfVZY6YvhAN3nvjYnL3g3qDIuKxoQyCrMP6sAEyEt2/8a
	Lni0Z2WIIYv1AzddChG4wtMbNQdf4fOUucIgJOyWlKv0OAEnGltBmE0CIljUB+fbgf3CD8AQwRB8F
	gN2AwXq3mN30VRjmDqB5LjWttpDPCiXlJaT6Qa3JDiKTbLj6KC7Gl1ZA5vamjmi5gqiyWgrYhzI+6
	Q087jzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZsa-0000000CWww-2NmZ;
	Wed, 21 Oct 2026 17:13:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZsY-0000000CWwc-3Z2t
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 17:13:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 452B442A2E;
	Wed, 21 Oct 2026 17:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825B11F000C4;
	Wed, 21 Oct 2026 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792602810;
	bh=9wwSfEnRlvirTT8NfoK/jEoyhBc9DNr8DgJsy59lbvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eS7BoYnKTK4fKVGt9OFJ4DszXZVKVCXm9Zi9nQrKsZsM9bsO7sJgpQMP7H5vPuSue
	 6prIPGbDK8PcaZPNaAeCREJwiYmguMSEaTX/HVcISfVgq25n/f1VXfzM+9CZwKM6Ks
	 26cRu+wuRrWhnixjxc90k95nTxh55hCIGfsOnBTBKG2am2ZpQUmJkOtlNDx7ulGCnY
	 dmJAXhr6YmjAtIvnM13eYNLpMAflDteXgTI0vTHmQwEdXCUfzLWc3e0+3kFYbalBJ2
	 slh+agrwEY8apMfOzK6KFVYaD+zbEfVlndjdje8Mi708jn54ntGe7OK2w/+tQN98+W
	 7varzW57ngjaA==
Date: Wed, 21 Oct 2026 18:13:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is
 reserved
Message-ID: <20261021-negation-carol-e42b4ecf3726@spud>
References: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1820232036972719751=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1820232036972719751==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZToIJWlRJsLcJejp"
Content-Disposition: inline

--ZToIJWlRJsLcJejp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 06:39:06PM +0530, Pinkesh Vaghela wrote:
> The composable cache resets with only way 0 enabled, while the remaining
> ways are available as Loosely Integrated Memory (LIM). Systems that do
> not reserve LIM therefore use only one cache way unless software
> increases WayEnable.

This is not true in the general case, firmware may intercede to set the
ways as it pleases.

> When no memory-region property is present, DT describes no LIM
> reservation for the cache controller. Validate the reported way count,
> then enable all cache ways so Linux can use the full cache capacity.
>=20
> When memory-region is present, leave WayEnable unchanged because enabled
> ways cannot be returned to LIM until reset. This may leave more ways
> assigned to LIM than required, but avoids consuming reserved LIM.
>=20
> Apply this policy to all compatibles handled by the driver. Firmware or

I know this is going to cause problems for all the microchip boards,
which maybe should have reserved LIM but never did because the LIM was
never put in the devicetree as memory in the first place.
They also don't suffer from the problem you mention because firmware
sets the ways up.

> DT configurations that require LIM must provide memory-region;
> otherwise, Linux will convert all disabled ways to cache.

I don't like this behavioural change, it's never been mandatory to have
a reserved memory region for the LIM. I'm only in favour of doing this
on devices where we know it is actually required to be done. The eic7700
I assume is one such device.

Cheers,
Conor.

> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  drivers/cache/sifive_ccache.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d5..17b6ba8ab984 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -117,6 +117,22 @@ static void ccache_config_read(void)
>  	pr_info("Index of the largest way enabled: %u\n", cfg);
>  }
> =20
> +static int ccache_enable_all_ways(void)
> +{
> +	u32 config, ways;
> +
> +	config =3D readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> +	ways =3D FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
> +	if (!ways) {
> +		pr_err("Invalid cache configuration: zero ways\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id sifive_ccache_ids[] =3D {
>  	{ .compatible =3D "eswin,eic7700-l3-cache",
>  	  .data =3D (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
> @@ -319,6 +335,12 @@ static int __init sifive_ccache_init(void)
>  		goto err_unmap;
>  	}
> =20
> +	if (!of_property_present(np, "memory-region")) {
> +		rc =3D ccache_enable_all_ways();
> +		if (rc)
> +			goto err_unmap;
> +	}
> +
>  #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
>  	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
>  		riscv_cbom_block_size =3D SIFIVE_CCACHE_LINE_SIZE;
> --=20
> 2.34.1
>=20

--ZToIJWlRJsLcJejp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatjytgAKCRB4tDGHoIJi
0hNmAQCa1KbxNjXTR8FsqH9aExrhAw2xM78b1aMere9VygXI/wD/YYeGkYy8Tv+o
WandSYWPHQjgl0vBB1PwfhROPffs7go=
=0F8P
-----END PGP SIGNATURE-----

--ZToIJWlRJsLcJejp--


--===============1820232036972719751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1820232036972719751==--


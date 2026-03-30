Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF481061B13
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypWHvdFf1tbLwxZCJpNOo8RJgi/57p9w2FxlHWDtKWU=; b=CGZNNlHUfipejFmDKb2wFdK5zK
	1KLYPaYkH5CetUWyTuM7BTJrCKCvwKRHhEz+HGnBx/dPXcwTtTrZ9pvpw76xcHMJoD6STAFDJyGGG
	LsPGDsj/5CMLLCwGJooO9ePgEdatDt3TioBHvcVrhmMI5GHikJ+wgjS0wYUBw/DK3w9/7UD+JbL2R
	egRsZmuhJdnh9sGyuI3kff40EuqDCVvsx6eutjHQLPwgsmcB/qA5T/hz+wBnAdRwYlZ+Fju+37nBV
	q8dGMzTV6+TUrODGR0DF/ZwPXrq1H7SxJykCmhYZ1y4yqHoT4CjwjeUCfZ2MjeH2Ko7v8oJ+ma6QV
	IWIOeFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F7t-0000000Bc5h-1Di2;
	Mon, 30 Mar 2026 16:06:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F7r-0000000Bc5O-3hav
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 16:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E96660127;
	Mon, 30 Mar 2026 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EAAC4CEF7;
	Mon, 30 Mar 2026 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886762;
	bh=3KmiI1lPn7iSBaliwjqcS6nkGR19lrJfQ+T5KRXeUJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtfqK31+p3ceD6qtEJo2zlJwoNdBpD4IShTTmFnLsidWjHJucJl/TTvUjyei7I4XW
	 4I9gYj2w6asg4hjFgQlmHNGPgI8qSmdUFvGJMW+d1cag2vGP8yUu4O8VC1b3nyfie9
	 iTqMv+A9FYP7iOPbqQXWkEWG5SOlQdSqvJED32X0A2XJ3dmJy8dJoa6S7pGnksrR4+
	 ynTPH+62aOX30vuGNqj/u3zTsbwyW0IfY3d4KCCTtoQI1Sjnt9MhcdUtOk5nOHr1Wm
	 dTLnBE84FyCsEiHU43cwVunV9nnFIyfOJG/AmJu66XO34Q4QSzJsWTmI1of+6QZB3Y
	 C9NeEBwkJojTA==
Date: Mon, 30 Mar 2026 17:05:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 2/7] cache: andes_llcache: refactor initialization and
 cache operations
Message-ID: <20260330-profane-blighted-ac25a752164e@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-3-minachou@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20260330102724.1012470-3-minachou@andestech.com>
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
Content-Type: multipart/mixed; boundary="===============5098750870984579002=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5098750870984579002==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZBMHEz/e3KVIxzdl"
Content-Disposition: inline


--ZBMHEz/e3KVIxzdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:19PM +0800, Hui Min Mina Chou wrote:
> This patch cleans up the Andes LLC cache driver:
>  - improved error handling in andes_cache_init() by using goto labels

I don't agree that this is an improvement. There's no meaningful
teardown shared.

>  - updated andes_dma_cache_inv/wback() to check for !size instead of
>    start =3D=3D end
>  - cache-line-size mismatch from an error to a warning
>  - Use ALIGN and ALIGN_DOWN helpers instead of the alignment logic in
>    andes_dma_cache_inv() and andes_dma_cache_wback().
>=20
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  drivers/cache/andes_llcache.c | 56 ++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
> index d5e382f3c801..d318b8009f7f 100644
> --- a/drivers/cache/andes_llcache.c
> +++ b/drivers/cache/andes_llcache.c
> @@ -111,21 +111,17 @@ static void andes_dma_cache_inv(phys_addr_t paddr, =
size_t size)
>  {
>  	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
>  	unsigned long end =3D start + size;
> -	unsigned long line_size;
> +	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	unsigned long flags;
> =20
> -	if (unlikely(start =3D=3D end))
> +	if (unlikely(!size))
>  		return;
> =20
> -	line_size =3D andes_priv.andes_cache_line_size;
> -
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +	start =3D ALIGN_DOWN(start, line_size);
> +	end =3D ALIGN(end, line_size);
> =20
>  	local_irq_save(flags);
> -
>  	andes_cpu_dcache_inval_range(start, end);
> -
>  	local_irq_restore(flags);
>  }
> =20
> @@ -133,15 +129,15 @@ static void andes_dma_cache_wback(phys_addr_t paddr=
, size_t size)
>  {
>  	unsigned long start =3D (unsigned long)phys_to_virt(paddr);
>  	unsigned long end =3D start + size;
> -	unsigned long line_size;
> +	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	unsigned long flags;
> =20
> -	if (unlikely(start =3D=3D end))
> +	if (unlikely(!size))
>  		return;
> =20
> -	line_size =3D andes_priv.andes_cache_line_size;
> -	start =3D start & (~(line_size - 1));
> -	end =3D ((end + line_size - 1) & (~(line_size - 1)));
> +	start =3D ALIGN_DOWN(start, line_size);
> +	end =3D ALIGN(end, line_size);
> +
>  	local_irq_save(flags);
>  	andes_cpu_dcache_wb_range(start, end);
>  	local_irq_restore(flags);
> @@ -159,14 +155,13 @@ static int andes_get_llc_line_size(struct device_no=
de *np)
> =20
>  	ret =3D of_property_read_u32(np, "cache-line-size", &andes_priv.andes_c=
ache_line_size);
>  	if (ret) {
> -		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
> +		pr_err("Cache: Failed to get cache-line-size\n");
>  		return ret;
>  	}
> =20
>  	if (andes_priv.andes_cache_line_size !=3D ANDES_CACHE_LINE_SIZE) {
> -		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
> -		       andes_priv.andes_cache_line_size);
> -		return -EINVAL;
> +		pr_warn("Cache: Expected cache-line-size to be 64 bytes (found:%u)\n",
> +			andes_priv.andes_cache_line_size);
>  	}
> =20
>  	return 0;
> @@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] =
=3D {
>  static int __init andes_cache_init(void)
>  {
>  	struct resource res;
> -	int ret;
> +	int ret =3D 0;
> =20
>  	struct device_node *np __free(device_node) =3D
>  		of_find_matching_node(NULL, andes_cache_ids);
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> +	if (!of_device_is_available(np)) {
> +		ret =3D -ENODEV;
> +		goto err_ret;
> +	}
> =20
>  	ret =3D of_address_to_resource(np, 0, &res);
>  	if (ret)
> -		return ret;
> +		goto err_ret;
> =20
>  	/*
>  	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
> @@ -208,17 +205,22 @@ static int __init andes_cache_init(void)
>  		return 0;
> =20
>  	andes_priv.llc_base =3D ioremap(res.start, resource_size(&res));
> -	if (!andes_priv.llc_base)
> -		return -ENOMEM;
> +	if (!andes_priv.llc_base) {
> +		ret =3D -ENOMEM;
> +		goto err_ret;
> +	}
> =20
>  	ret =3D andes_get_llc_line_size(np);
> -	if (ret) {
> -		iounmap(andes_priv.llc_base);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_unmap;
> =20
>  	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
> =20
>  	return 0;
> +
> +err_unmap:
> +	iounmap(andes_priv.llc_base);
> +err_ret:
> +	return ret;
>  }
>  early_initcall(andes_cache_init);
> --=20
> 2.34.1
>=20

--ZBMHEz/e3KVIxzdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqfZAAKCRB4tDGHoIJi
0kz6AP4/zEmts2e0+M/fAroAyx+sLV51S7xrbbnjNktcQtOHYAEAk4e7IdDPibBJ
S85lySDSCIasXH72w3gC7DVKQ97pWwQ=
=Ys/x
-----END PGP SIGNATURE-----

--ZBMHEz/e3KVIxzdl--


--===============5098750870984579002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5098750870984579002==--


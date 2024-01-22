Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58396C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn6+IU7MluQ087cu2n+5FbXon7qpAgbStBqqcgXCAgU=; b=Pzslxsj6P49B4PFecB/j001Ene
	b5I8Bhw6mdva1zgdRGdw1FCMT2wwb/QTP9EIsS7DZotlZlq4wes3knVXaT3eoqgiL4uIm4Wha582Y
	lrS5MgxC0XhXZErAmCReLx732FvNfyP2dSbos4VpasrfcKvKSE9tLD2H/bErr/HXW3qQ2LsYYDi0O
	tTj5SV8udpgGoTRHsuTl4JXfkfkTiUXEbxK0KqZ/WjjHu7mbFNTX5kQKZmE8RCS1JFYWBQ/Ro8vIH
	yJYX5CdAX8H1Yz+ruoT8bIvkhiMOLyBIZarJkCLS1UIPi/aWNVfyjJMgm02mhE5loiakBy/gAb8DM
	tBxoM4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpN9-00AzGh-25;
	Mon, 22 Jan 2024 08:09:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpN7-00AzG8-0q
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A5600B80B71;
	Mon, 22 Jan 2024 08:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46ECC433C7;
	Mon, 22 Jan 2024 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705910971;
	bh=q6N2S4dWueEuclJ8E7L26oiHyMGXczNOp+gddKDOx9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQwxwU+vfDjLbSU1pEELnZbWyhZivnj2YFtITx2Ph6e4lrgAhmLM3Lx/XOolSx8A0
	 UGT4x+ZtfUkMpKNh2IKRHr1vF4Z7gAy4MvR33XUKHDqP0ZG9RNRteB3xsGvXZbibtr
	 FCpWt715R9JQtZl46kCSTtM1eQH7PjWes2RViD4Hq6FluEN8xLH2Z24qV9yHx97Su1
	 ujUc5kcb1tu6uwmlgncujoKbRoV/lXICRAKwSeFN6KyD4Um3Jdea9aGfvT6f2/XG8F
	 IXSyV1Pm2UdRGMWIix6bjKYtw/LPZ7FFfqngJ6efMfWFTBFo4JPfi+ucYwceYsAzWA
	 dnUopJWNtWqkA==
Date: Mon, 22 Jan 2024 08:09:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, robh@kernel.org, sudeep.holla@arm.com,
	pierre.gondois@arm.com, suagrfillet@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cacheinfo: add init_cache_level()
Message-ID: <20240122-boxcar-conical-c728a709aa5c@spud>
References: <20240122013510.55788-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240122013510.55788-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000933_455670_6F85243F 
X-CRM114-Status: GOOD (  18.13  )
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
Content-Type: multipart/mixed; boundary="===============0079568483346103275=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0079568483346103275==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5pIAgEeErdJqyzj"
Content-Disposition: inline


--s5pIAgEeErdJqyzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 09:35:10AM +0800, Yunhui Cui wrote:
> When cacheinfo_sysfs_init() is executed, the general weak function
> init_cache_level() returns -ENOENT, causing failure to add the "cache"
> node to /sys/devices/system/cpu/cpux/. Implement the init_cache_level()
> function on RISC-V to fix it.

If you recall correctly, I asked you to explain how to reproduce this
when you sent the patch.

Thanks,
Conor.

>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 09e9b88110d1..be9169a38bac 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -71,6 +71,12 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
>  	this_leaf->type =3D type;
>  }
> =20
> +int init_cache_level(unsigned int cpu)
> +{
> +	/* The topology has been parsed by acpi or dt, return true. */
> +	return 0;
> +}
> +
>  int populate_cache_leaves(unsigned int cpu)
>  {
>  	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
> --=20
> 2.20.1
>=20
>=20

--s5pIAgEeErdJqyzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa4itgAKCRB4tDGHoIJi
0kJ9AQCc5GLsmpKQsR1KPqMJPZa55KlWp4yEsTQ+aFc/ANtDPQD/U9CecBvAjmFQ
vXmJGKkZmi6e0YeekCbYJxQ179WMWAU=
=EYgi
-----END PGP SIGNATURE-----

--s5pIAgEeErdJqyzj--


--===============0079568483346103275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0079568483346103275==--


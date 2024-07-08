Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF9AC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kW6Jep0zL352GKddFXrnHSAsD2d2u1AU35xS+zRVac=; b=kKadJ6y8xphpgbHEGVln0qHFwd
	eH5+yD5ripjmQVLG1QGfjyVh8UNeFga+c1Rq58VhN7oUBcVN3hsoAy//GkkY9v+xjRFyWP3SqR+fT
	1XpPtYBKnDT7M2Z/7LW+1Not56HlPdi9FPVbzxzTg2N86WYE+8+DMPYBAkajrJ1cDOcfxSLroBtPV
	+EjPCAJqBe5K4XTdE6E/ZoK+EZ1E94ItwtxnUuxX/1TFenEf9kmijLYSjPZk1Udw5wFqLgyta3zBf
	9srp4miB8tBugwBnooRdVXpEwjqP4ifI41cdxGehVy2R+JUB6dAf+9qv46MfRFFekGYhbd1CAgaCC
	vSSfOQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnNr-00000003laD-1KoN;
	Mon, 08 Jul 2024 12:22:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnNo-00000003lZT-2j2E
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 12:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 661ED6068E;
	Mon,  8 Jul 2024 12:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68728C116B1;
	Mon,  8 Jul 2024 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720441335;
	bh=X4roQGkfbEMgoQwx7NcOhNg9AazWz8+yJwGnXW9aCWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwx6nyjKM9bWLG6JaX3TW8sLv0a4G7zg5FCfhNAlNb72wDjHTGpTeafubKzbH+B1c
	 4OOT+ixMMe+jEH2FXUP2VqAWMva5EBcsO57Y7NfqpPrkfNGltO6dDy0FsE+wnHwT4a
	 faOBE+3UrVW9TRkZN/UZpr4JEFRjdu16jGSgLFhQ51q5DWkMqNpMeovk0A1Gimz0cs
	 G1cPQqmVsSlfJa91Mspl0N6obV7P2DRsxjFDo/lbo6JmtLxqyQ7oQO1TgwktrndpZ/
	 2wgUpVDx8Pb6XzvjmR8IKyuw/GtucCNUd++7M9fSTgswk6feiJvYafO6hPy9y7B1Md
	 C4PkmC6suE9IQ==
Date: Mon, 8 Jul 2024 13:22:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	atishp@atishpatra.org, anup@brainfault.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
Message-ID: <20240708-wildcard-denim-12de7fae795b@spud>
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240708121224.1148154-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_052216_779578_D560259F 
X-CRM114-Status: GOOD (  19.76  )
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
Content-Type: multipart/mixed; boundary="===============2175255488621200211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2175255488621200211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PIFgJoAZoR/7NBLX"
Content-Disposition: inline


--PIFgJoAZoR/7NBLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2024 at 08:12:24PM +0800, Xiao Wang wrote:
> The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c gets
> compiled, so this patch removes the redundant check.

Did you investigate why this define was added? Why do you think that it
is redundant, rather than checking the incorrect config option?

Cheers,
Conor.

>=20
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  drivers/perf/riscv_pmu.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 0a02e85a8951..7644147d50b4 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_event *event,
>  	userpg->cap_user_time_short =3D 0;
>  	userpg->cap_user_rdpmc =3D riscv_perf_user_access(event);
> =20
> -#ifdef CONFIG_RISCV_PMU
>  	/*
>  	 * The counters are 64-bit but the priv spec doesn't mandate all the
>  	 * bits to be implemented: that's why, counter width can vary based on
> @@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_event *event,
>  	 */
>  	if (userpg->cap_user_rdpmc)
>  		userpg->pmc_width =3D to_riscv_pmu(event->pmu)->ctr_get_width(event->h=
w.idx) + 1;
> -#endif
> =20
>  	do {
>  		rd =3D sched_clock_read_begin(&seq);
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--PIFgJoAZoR/7NBLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZovZ8wAKCRB4tDGHoIJi
0tmMAQDnISXypa25FeukbzaHzN5filg8qUtvCfNkk7106XjRuQD/XrET7jAr1U9u
kHGzeO4GrJEQpQt9VyTrG9ZnLZc+uAU=
=scPc
-----END PGP SIGNATURE-----

--PIFgJoAZoR/7NBLX--


--===============2175255488621200211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2175255488621200211==--


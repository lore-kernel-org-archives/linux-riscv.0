Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E533C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0AlVWOspbSx3s2c+3cq9DuScW/lNUn9wjbN5PXumGc=; b=nq0T0FGrsef22Fo4gv+Oaaqdkz
	6az4iL4Ye7yQ13OOMtrpdWeIPAdaID+AcjqFYG+S6o2fN0Cek/+GrsQe0lnH/Apsr675Mz3xT9pF8
	1CzhdAcl/XA0vzbqPAfQgXLXBA/zEaXyREslXnGG5I5J4uF0LafH8KLw3XPAEHekPueAA4yga05w4
	foelmgp4Evnfex5sXFPxFrN7YzLpwUfjvPyuWXgtRqXl5UQ9LQ+k4s8DIxwJUOs6lHpKL9cTAjvwy
	o4ZniMU9dIpJksReotDBepvpSMoJKqTY/rJZoMvySCMg7ZLakygPosulrVmJu9YdDxE1bWC/M+yqy
	S4OlFgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHhK-00000008ZKw-2CRf;
	Tue, 09 Jul 2024 20:44:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRHhI-00000008ZJ2-1Awp
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 20:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 629AFCE0AEE;
	Tue,  9 Jul 2024 20:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFEEC3277B;
	Tue,  9 Jul 2024 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720557861;
	bh=Oaa4M+sxDGqK7apUNjXSK60qxCEtSIZPmxcDfM5l0KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgE3DPbgUx9SLJ1AkIsiAsqMj9KSe9pIZDav/r1Y+iJ86r+yrUeiZwahucIcnwqq3
	 N4WIwbJ2ZqyMyNZV8IAKkXngfZPWbim0BMc2WDEAgc6TpeKA6eSeD2RGHSRhKksThm
	 8xdVV00Cy+UyfoZ09mb9HQdJ+PZZg4QLE4O9ipEpl9cv8cBSxkp/f9Cb5A8SPjsYN1
	 oTi9CnW/7vrp6sxYGZ35l11BWldtdjnaq7nMhNAyfrzd6cMQcsMIDXJ2a4xYrEGMTn
	 +RMcNXOeWxhzK0cyHrKMZwsw0GsYLIeQikydUaQfFZwJ2/CkMuu11bHvm6TMpjJUOL
	 vBPitpOJDh+lg==
Date: Tue, 9 Jul 2024 21:44:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	anup@brainfault.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
Message-ID: <20240709-unengaged-handgrip-56a5c7b3e1d1@spud>
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
 <20240708-wildcard-denim-12de7fae795b@spud>
 <Zo2dtuv0quQ7FwtK@ghost>
MIME-Version: 1.0
In-Reply-To: <Zo2dtuv0quQ7FwtK@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_134424_703559_0F72B512 
X-CRM114-Status: GOOD (  28.81  )
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
Content-Type: multipart/mixed; boundary="===============4196071033693231886=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4196071033693231886==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SFsSWemndNFOZrOJ"
Content-Disposition: inline


--SFsSWemndNFOZrOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 01:29:42PM -0700, Charlie Jenkins wrote:
> On Mon, Jul 08, 2024 at 01:22:11PM +0100, Conor Dooley wrote:
> > On Mon, Jul 08, 2024 at 08:12:24PM +0800, Xiao Wang wrote:
> > > The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c ge=
ts
> > > compiled, so this patch removes the redundant check.
> >=20
> > Did you investigate why this define was added? Why do you think that it
> > is redundant, rather than checking the incorrect config option?
>=20
> This file is only compiled with CONFIG_RISCV_PMU:

I might be ill, but I can still read. I was not disagreeing with Xiao
that the condition is redundant as written - I want to know whether they
made sure that this check was intentionally using CONFIG_RISCV_PMU in the
first place, or if another option should have been here instead.

>=20
> # drivers/perf/Makefile
> obj-$(CONFIG_RISCV_PMU) +=3D riscv_pmu.o
>=20
> So having this check does seem redundant. I am copying Alex as it looks
> like he wrote this.
>=20
> - Charlie
>=20
> >=20
> > Cheers,
> > Conor.
> >=20
> > >=20
> > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > ---
> > >  drivers/perf/riscv_pmu.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > > index 0a02e85a8951..7644147d50b4 100644
> > > --- a/drivers/perf/riscv_pmu.c
> > > +++ b/drivers/perf/riscv_pmu.c
> > > @@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_event *e=
vent,
> > >  	userpg->cap_user_time_short =3D 0;
> > >  	userpg->cap_user_rdpmc =3D riscv_perf_user_access(event);
> > > =20
> > > -#ifdef CONFIG_RISCV_PMU
> > >  	/*
> > >  	 * The counters are 64-bit but the priv spec doesn't mandate all the
> > >  	 * bits to be implemented: that's why, counter width can vary based=
 on
> > > @@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_event *e=
vent,
> > >  	 */
> > >  	if (userpg->cap_user_rdpmc)
> > >  		userpg->pmc_width =3D to_riscv_pmu(event->pmu)->ctr_get_width(even=
t->hw.idx) + 1;
> > > -#endif
> > > =20
> > >  	do {
> > >  		rd =3D sched_clock_read_begin(&seq);
> > > --=20
> > > 2.25.1
> > >=20
> > >=20
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--SFsSWemndNFOZrOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo2hIQAKCRB4tDGHoIJi
0goIAP9c/Mj94icEZeVpEy3/El56Y2q44uO0nYsoF+NrkYUqYwD/WCG54d+gBssi
tgOBiToWtsXJhrh3dFDoL8SEiYrTtQQ=
=YlFZ
-----END PGP SIGNATURE-----

--SFsSWemndNFOZrOJ--


--===============4196071033693231886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4196071033693231886==--


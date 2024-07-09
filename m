Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9FBC3DA42
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkDUOa9ZKM72mKd27Skep281wb7OPJkkku4Bj9kuJs4=; b=DP2ngO8YPvQsj5BgQeTQsuVTwS
	cc6J2caYYtIA4OVSRgwG1XgWMisFVpHmqM2rG1cmZQYUS8pQEPLwyhf34FJkIf/nsKbGRTP9/cDav
	BsRTH+vqUd1AIu+041VyaAtW8uLvIpXyRgraMGrKtfzHmnQKmxRPM2z0uXbpTRZohQGfEYXapLpIb
	egcteYvBnLf3fO56u93IneSWQfkSfoAvyoR8y+zSllReAEStBs5/G0/qwVhmZ1wAd0u5cekmVAXOi
	FDKe/7PjIg2O1GMdeFiatOBcw8N/BCylXgSAQ876NnbBslXWB8KvKNTMORl2z70+Tz0MDQQQWe03n
	bXUGzDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRI1J-00000008bbw-3ei9;
	Tue, 09 Jul 2024 21:05:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRI1G-00000008baS-2PdY
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 21:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF362CE1310;
	Tue,  9 Jul 2024 21:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19620C3277B;
	Tue,  9 Jul 2024 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720559100;
	bh=oKW7jVLQw1Mx3QcWZjh8kQiqVbV3Wyz4nG0qMVcpG2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWiYrgEscpQ/B3iJKc+gf31dfy+NhJlE2m4kBlHXVCu+AaWT/oQq7sDGqWf0wyqd4
	 7uWNGpufMG/yRORpvf6jaXZ8o5tu4J0wXdxjN9rTz5OBlLrAxfMpDxHf2BGgobqsXg
	 2pDJM7AnqbDA/iEp7hz2g4Pz0axMG8bCMgbqC0MOGF/bm4xTt6nK90VkOY8epPwU7I
	 WD+f0VmgIDKeTbtJQ4tI/co+OMsbQ3Sn3x1boWQrmBA1Zv9kdHc10JMbqGqXu0Lx0C
	 Sy3KZBI10/F0HDDUhDN7AOc7HQKPKliMmPjdwQaYSkaFR/Daeg54tNEHCRuyM/CCk0
	 SvfEgBKT8dN3w==
Date: Tue, 9 Jul 2024 22:04:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	anup@brainfault.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
Message-ID: <20240709-fame-uptown-c936014cd66a@spud>
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
 <20240708-wildcard-denim-12de7fae795b@spud>
 <Zo2dtuv0quQ7FwtK@ghost>
 <20240709-unengaged-handgrip-56a5c7b3e1d1@spud>
 <Zo2kSxsJkdkBdBEW@ghost>
MIME-Version: 1.0
In-Reply-To: <Zo2kSxsJkdkBdBEW@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_140503_475239_08EC012C 
X-CRM114-Status: GOOD (  37.30  )
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
Content-Type: multipart/mixed; boundary="===============7952583040500908874=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7952583040500908874==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aWsjKJVk6Ifn6ykO"
Content-Disposition: inline


--aWsjKJVk6Ifn6ykO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 01:57:47PM -0700, Charlie Jenkins wrote:
> On Tue, Jul 09, 2024 at 09:44:17PM +0100, Conor Dooley wrote:
> > On Tue, Jul 09, 2024 at 01:29:42PM -0700, Charlie Jenkins wrote:
> > > On Mon, Jul 08, 2024 at 01:22:11PM +0100, Conor Dooley wrote:
> > > > On Mon, Jul 08, 2024 at 08:12:24PM +0800, Xiao Wang wrote:
> > > > > The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.=
c gets
> > > > > compiled, so this patch removes the redundant check.
> > > >=20
> > > > Did you investigate why this define was added? Why do you think tha=
t it
> > > > is redundant, rather than checking the incorrect config option?
> > >=20
> > > This file is only compiled with CONFIG_RISCV_PMU:
> >=20
> > I might be ill, but I can still read. I was not disagreeing with Xiao
> > that the condition is redundant as written - I want to know whether they
> > made sure that this check was intentionally using CONFIG_RISCV_PMU in t=
he
> > first place, or if another option should have been here instead.
>=20
> Makes sense! Looking through the lists I see this RFC from Atish where
> he introduced a different config option for this
> "CONFIG_RISCV_PMU_COMMON"[1]. I wonder if something got confused in the
> development of these two patches.

Perhaps.. What I was worried about was the wrong option being here
(maybe that it should have been RISCV_PMU_SBI or similar) and depending
on how the kernel is configured, userspace would get the wrong info
here. But maybe it is innocuous your theory would suggest, and there's
nothing to worry about. But that's for someone with a functioning brain
to figure out ;)

Cheers,
Conor.

>=20
> Link:
> https://lore.kernel.org/lkml/20240217005738.3744121-12-atishp@rivosinc.co=
m/
> [1]
>=20
> > > # drivers/perf/Makefile
> > > obj-$(CONFIG_RISCV_PMU) +=3D riscv_pmu.o
> > >=20
> > > So having this check does seem redundant. I am copying Alex as it loo=
ks
> > > like he wrote this.
> > >=20
> > > > >=20
> > > > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > > > ---
> > > > >  drivers/perf/riscv_pmu.c | 2 --
> > > > >  1 file changed, 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > > > > index 0a02e85a8951..7644147d50b4 100644
> > > > > --- a/drivers/perf/riscv_pmu.c
> > > > > +++ b/drivers/perf/riscv_pmu.c
> > > > > @@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_even=
t *event,
> > > > >  	userpg->cap_user_time_short =3D 0;
> > > > >  	userpg->cap_user_rdpmc =3D riscv_perf_user_access(event);
> > > > > =20
> > > > > -#ifdef CONFIG_RISCV_PMU
> > > > >  	/*
> > > > >  	 * The counters are 64-bit but the priv spec doesn't mandate al=
l the
> > > > >  	 * bits to be implemented: that's why, counter width can vary b=
ased on
> > > > > @@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_even=
t *event,
> > > > >  	 */
> > > > >  	if (userpg->cap_user_rdpmc)
> > > > >  		userpg->pmc_width =3D to_riscv_pmu(event->pmu)->ctr_get_width(=
event->hw.idx) + 1;
> > > > > -#endif
> > > > > =20
> > > > >  	do {
> > > > >  		rd =3D sched_clock_read_begin(&seq);
> > > > > --=20
> > > > > 2.25.1
> > > > >=20
> > > > >=20
> > > > > _______________________________________________
> > > > > linux-riscv mailing list
> > > > > linux-riscv@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >=20
>=20
>=20

--aWsjKJVk6Ifn6ykO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo2l9wAKCRB4tDGHoIJi
0gSWAP9oGcirJgLpENEcorthZsiWOHCqqBbqHc6wSFLTEchW2QD8DJ/ZX+McRfqK
23R5kJYKiGo/e1DBdk8hkPKMMfcZEgM=
=t8ej
-----END PGP SIGNATURE-----

--aWsjKJVk6Ifn6ykO--


--===============7952583040500908874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7952583040500908874==--


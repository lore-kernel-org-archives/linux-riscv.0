Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD6C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3447cbSz8aRAZ+bULEbnJKTxXdEtjtWKQZsw4T+IBrs=; b=w2rSQCp+T4CS23nntb1MhslfQu
	rnfVJ9GRVadOIGPtBlFlTrp5p/yF4bLjN5Un1mDZ70KJBg5Q2/q90oHJ0ZmxmieSeZlqkESqylRbf
	jhsfPBS8lnbdnVsGs7mY6GYGd/CxugNE4Q+DiM3SLeloyEuRMnzsZFpaCAoiCgLSN0RKQW5csy0Qi
	yXzPwoNhkYsD7uRTNMczC+M6RS/XxnbRnah86H9IXZAnl1bxYGF2y8FMln1rXJfDDfMR3jJIxhriP
	OKJGRBzx8gwUG0mw9qaCtOBccOeIDPfpNKtGvkadRBQbvbnW00Ulv7PNFZJK5clhCydPT343LBYdM
	j+bWq/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcBD-0000000FxP9-43Ux;
	Tue, 18 Jun 2024 16:59:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcB9-0000000FxO3-3rjm;
	Tue, 18 Jun 2024 16:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AF4CCE13A5;
	Tue, 18 Jun 2024 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8ECFC3277B;
	Tue, 18 Jun 2024 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718729968;
	bh=BN/C5Nb0yygjg5pvCO3p5/z0sIpSGfNqd5GMoHjSu3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFkMJMgT8x9xhuQ94T8ZfKdEeW1QkolIKssBM4fRa8o5fYECfQWLB/5bIP7nbDOQz
	 f1C5DR3kEWTsGZsSj/OybNVh9wt5Ds9J2XQvoPSBLsXE+dhbzVjAlJPq4mrs+bh21O
	 mQ6Pi1QLsGHmBJBLPsVQsnt1jDrJ0riP/H+sdxdbGTlebnLr566HBcyybwjm7yye/T
	 agDGxqBRt4kl2+Pg+VWWJArWaNBLNu1FWFnOmGB2BzzgwkjefaG9eOqXmyVV2pn3pM
	 jA+gr4t51PvPfpHvfkNNqmJq4UXiJ+l9bur2n7v4T5W5Gbi8xKCKM+O/EkQlIl7i0q
	 Tlb6pwSHOEC6g==
Date: Tue, 18 Jun 2024 17:59:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
Message-ID: <20240618-deftly-operation-de4f8ac260d5@spud>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
 <20240618-581fb4c20b4fe05d76eafa44@orel>
MIME-Version: 1.0
In-Reply-To: <20240618-581fb4c20b4fe05d76eafa44@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_095932_423580_96CE2626 
X-CRM114-Status: GOOD (  28.74  )
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
Content-Type: multipart/mixed; boundary="===============8493327066032721246=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8493327066032721246==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IN3S0y2QJ7kRgv7C"
Content-Disposition: inline


--IN3S0y2QJ7kRgv7C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 06:01:04PM +0200, Andrew Jones wrote:
> On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl=E9ment L=E9ger wrote:
> >=20
> >=20
> > On 26/04/2024 12:08, Andrew Jones wrote:
> > > Export Zawrs ISA extension through hwprobe.
> > >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
> > >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> > >  arch/riscv/kernel/sys_hwprobe.c       | 1 +
> > >  3 files changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arc=
h/riscv/hwprobe.rst
> > > index b2bcc9eed9aa..e072ce8285d8 100644
> > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > @@ -188,6 +188,10 @@ The following keys are defined:
> > >         manual starting from commit 95cf1f9 ("Add changes requested b=
y Ved
> > >         during signoff")
> > > =20
> > > +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is suppo=
rted as
> > > +       ratified in commit 98918c844281 ("Merge pull request #1217 fr=
om
> > > +       riscv/zawrs") of riscv-isa-manual.
> > > +
> > >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains pe=
rformance
> > >    information about the selected set of processors.
> > > =20
> > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/inclu=
de/uapi/asm/hwprobe.h
> > > index 9f2a8e3ff204..a5fca3878a32 100644
> > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > @@ -59,6 +59,7 @@ struct riscv_hwprobe {
> > >  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> > >  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> > >  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> > > +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
> > >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> > >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> > >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_=
hwprobe.c
> > > index 8cae41a502dd..b86e3531a45a 100644
> > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> > >  		EXT_KEY(ZTSO);
> > >  		EXT_KEY(ZACAS);
> > >  		EXT_KEY(ZICOND);
> > > +		EXT_KEY(ZAWRS);
> > > =20
> > >  		if (has_vector()) {
> > >  			EXT_KEY(ZVBB);
> >=20
> > AFAIU, when used in userspace, this will actually "stall" the processor
> > until an interrupt/timeout happens, so the current process will keep
> > occupying the processor doing nothing (up to the next interrupt/timeout)
> > right ?
>=20
> Yes, but of course the OS can always preempt the task as well.
>=20
> >=20
> > BTW, the spec also states that "When the TW (Timeout Wait) bit in
> > mstatus is set and WRS.NTO is executed in any privilege mode other than
> > M mode, and it does not complete within an implementation-specific
> > bounded time limit, the WRS.NTO instruction will cause an illegal
> > instruction exception." so I guess the process will be killed in this c=
ase ?
>=20
> We don't expect mstatus.TW to be set. If it is, then wfi would likely kill
> the kernel before wrs.nto gets a chance to, but one or the other will
> certainly ensure usermode never gets a chance to try it :-)
>=20
> We have a handful of these assumptions about how M-mode has configured
> things prior to Linux starting. It'd be good if we documented them all
> somewhere.

Boot.rst :) If you're adding a new assumption, I think it should go
there.

--IN3S0y2QJ7kRgv7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnG86gAKCRB4tDGHoIJi
0u/pAP0Q+XfeJlxsj+b1A0JnFsLS341SCTvQvkNkGu2FE+tTJQEAjE6tjRm5Mgdk
5DGJXtnfPCM6K7TsUvi+tfAJVUeZxgQ=
=s+KC
-----END PGP SIGNATURE-----

--IN3S0y2QJ7kRgv7C--


--===============8493327066032721246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8493327066032721246==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F68CC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UP23tpK9jfzqBe3YwQnWuWckwao3SwPeU/bRCZUEmSw=; b=17MqxWP8nTzCt2MhsWFAgi/ENA
	tRKb2p5FDdwUpaK8BMQB8eRbSOgoQRxruc5c3zenUsejyZd6voCmqRZxcO6+hOEE2iWwSetDKNJkR
	MNwiqYvX1IF37KoLYNaxsG7wa8xc2QMYq/Vv/bAa1WwWVoF4SR9yfkW2gfb4bDFbIOPFkzApzwGYj
	Lv7sdwq74ml5FpbOsAQWp+iQevTAqf6zZ0lsPoezX4KdiHxuLclak89KweCz8ODJvTHhEE+hhDbcs
	8F2WHUpxPMSag1IiapakpMi811OtbnCM+ftwVF+epcFPZrFX65B85I+DOuta8ag5xMg8XGE4+lIYR
	qv68Pqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafUS-009wL4-0n;
	Mon, 28 Aug 2023 16:53:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafUQ-009wKl-07
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 16:53:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C0C061224;
	Mon, 28 Aug 2023 16:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99E6C433C8;
	Mon, 28 Aug 2023 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693241600;
	bh=2xkAGTz0idZHpIs33vvC65PnBaJbc1Fr+Y/VfWwFyo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezf1wcTYRdVSt3bqr6xYHaNkTAxSMy/queeASNUVoCjXPHK3bx5auLzYQNARkEFjK
	 VKxY3cIz9lqo7p+cEd3LN2TSS9HyS1XSjaTjEkCThzk0Wnug92MUlUIdoWaE3N++Nq
	 LL0BtLLwlmsfW57FrQMX4AMUdN77d3VMHzwgPzic3o82P0c3p3/iGpj9DUw/8VFkZJ
	 x2FpDg3p8TW77ZP371cyEKq/ljhpWA9mJ6avygtuAUzz4zrsK8xrLcUVwXfR6tZmAk
	 wjQ6sHFOk71gZVqESI67GFjI56hcdFbKmFfhcxM3V/xFpmRiTn3NHnRHFlF4LFQSTA
	 78PPqjVOC4nOg==
Date: Mon, 28 Aug 2023 17:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230828-dangling-decency-ededaa58d014@spud>
References: <20230825231139.1145522-1-evan@rivosinc.com>
 <20230826-anguished-tutu-81d63b3081a7@spud>
 <20230826-copper-suffocate-5f4f0e67f9a7@spud>
 <CALs-HsvwLpcUMPeKEs3ZW3tOwLGeGRQSe=grxE5L14Tj8b+XHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsvwLpcUMPeKEs3ZW3tOwLGeGRQSe=grxE5L14Tj8b+XHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_095322_185242_3860A048 
X-CRM114-Status: GOOD (  48.86  )
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
Content-Type: multipart/mixed; boundary="===============0818808605588000627=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0818808605588000627==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aCAI2NXGHYe29Jnj"
Content-Disposition: inline


--aCAI2NXGHYe29Jnj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 09:24:03AM -0700, Evan Green wrote:
> On Sat, Aug 26, 2023 at 2:56=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sat, Aug 26, 2023 at 12:26:25AM +0100, Conor Dooley wrote:
> > > On Fri, Aug 25, 2023 at 04:11:38PM -0700, Evan Green wrote:
> > > > In /proc/cpuinfo, most of the information we show for each processo=
r is
> > > > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > > > compatible, and the mmu size. But the ISA string gets filtered thro=
ugh a
> > > > lowest common denominator mask, so that if one CPU is missing an ISA
> > > > extension, no CPUs will show it.
> > > >
> > > > Now that we track the ISA extensions for each hart, let's report ISA
> > > > extension info accurately per-hart in /proc/cpuinfo. We cannot chan=
ge
> > > > the "isa:" line, as usermode may be relying on that line to show on=
ly
> > > > the common set of extensions supported across all harts. Add a new =
"hart
> > > > isa" line instead, which reports the true set of extensions for that
> > > > hart.
> > > >
> > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > >
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Can you drop this if you repost?
>=20
> Will do.
>=20
> > >
> > > > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > > > +------------------------------------------
> > > > +
> > > > +The "isa" line in /proc/cpuinfo describes the lowest common denomi=
nator of
> > > > +RISC-V ISA extensions recognized by the kernel and implemented on =
all harts. The
> > > > +"hart isa" line, in contrast, describes the set of extensions reco=
gnized by the
> > > > +kernel on the particular hart being described, even if those exten=
sions may not
> > > > +be present on all harts in the system.
> > >
> > > > In both cases, the presence of a feature
> > > > +in these lines guarantees only that the hardware has the described=
 capability.
> > > > +Additional kernel support or policy control changes may be require=
d before a
> > > > +feature is fully usable by userspace programs.
> > >
> > > I do not think that "in both cases" matches the expectations of
> > > userspace for the existing line. It's too late at night for me to thi=
nk
> > > properly, but I think our existing implementation does work like you
> > > have documented for FD/V. I think I previously mentioned that it could
> > > misreport things for vector during the review of the vector series but
> > > forgot about it until now.
> >
> > I went and checked, and yes it does currently do that for vector. I
> > don't think that that is what userspace would expect, that Google
> > cpu_features project for example would draw incorrect conclusions.
>=20
> I'm lost, could you explain a little more?

There (may be/)are userspace programs that will interpret the appearance
of extensions in cpuinfo as meaning they can be used without performing
any further checks.

> My goal was to say that
> there's no blanket guarantee that the feature is 100% ready to go for
> userspace just because it's seen here.

Right. I was agreeing that this is true, but it is also not how some
userspace programs have interpreted things. Consider a platform & kernel
that support the V extension but vector has not been enabled by default
or by early userspace. If someone cats cpuinfo, they'll see v there, but
it won't be usable. That Google cpu_features project (or a punter) may
then assume they can use it, as that's been the case so far in general*.

The caveat producing the * being that the same problem actually exists
for F/D too AFAICT, but it's likely that nobody really encountered it
as they didn't build non-FP userspaces & then try to use FP in some
userspace applications.

> For some extensions, it may in
> fact end up meaning just that (hence the "additional ... may be
> required" rather than "is required").

> This is true for FD (maybe,
> depending on history?),

AFAICT, it's not true for FD. The FPU config option not being set, or
either of F and D being missing will lead to unusable extensions
appearing.

> or extensions whose minimal/zero kernel
> support was unconditionally added at the same time as its parsing for
> it. But it's not true solely by virtue of being in /proc/cpuinfo. In
> other words, I'm trying to establish the floor of what /proc/cpuinfo
> guarantees, without fully specifying the ceiling.

> Are you saying that
> we need to spell out the guarantees for each extension?

No, I don't want that!

> Or are you
> saying the floor I've defined in general is incorrect or insufficient?

I think the floor that you have defined is probably misleading to users.
It's also the floor that has existed for quite a while, so this might be
a case of the userspace devs messing up due to an absence of any
explanation of what to do here.
Things will get abhorrently messy if we try to do what these userspace
programs expect, and I don't think we should go there. We just need to
bear in mind that the behaviour we have & the behaviour that you are
documenting flys in the face of what some userspace expects.

> I'm also open to direct suggestions of wording if you've got something
> in mind :)

Someone mentioned it recently, but it really is starting to feel more
and more like lscpu should grow support for hwprobe and funnel people
into using that instead of /proc/cpuinfo when all they want is to see
what their hardware can do.

--aCAI2NXGHYe29Jnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOzQ+wAKCRB4tDGHoIJi
0j1CAQCe8GWS5VD8NFejCRPuSJ6/pP1JUyquNhe39pMWCPiWeAEAn8aUvX+1hEc/
vqfunXKaopveZfu1/fwF0cv2XyTnNw0=
=zgPv
-----END PGP SIGNATURE-----

--aCAI2NXGHYe29Jnj--


--===============0818808605588000627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0818808605588000627==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E405AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbk6eVNIj6W5aZpPpAHF8WGcT8KhlP8KJFTTW7i3/M0=; b=AULIX5ms3D6edY8ZlQwJY/Kqg+
	HguI3WhKHHfqVXz9FTvf1w7i/XooXY6zRAfLJUY78rLPw6YbwwHNHJ2uAzJrM3m+icvtB2aI4zYOB
	LQWXAKZ9sh5tYPkHQ47m4Waw61o4FwLFEjrle3nGj5ET4TKDd0Lnw+ZR7XxS/QX8c0/BAx6Qqf4iO
	am3LeFhPxUzqXe6ubddrLHlD0BCAq+GRs2b775b3SkMn3gDYVcHY3BIgz1yK7g6JaigqBv8rD8dAv
	Zo1+k/JrwR3Xh61vWIc1mRrXWetWhp9p6bqDTcRxq9V9OkiT/EHbJirt06AdfSr7JhZ7CW1KuU+0R
	LsPKV26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoOJ-00AXcj-2J;
	Mon, 26 Jun 2023 15:44:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoOG-00AXbe-32
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:44:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDFED60E65;
	Mon, 26 Jun 2023 15:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526FDC433C8;
	Mon, 26 Jun 2023 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687794270;
	bh=endglZUFDa5UVxov1fiUdyi8iiJQpupgN3VbhtvY7jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShXTGVkuKqheZRx99U0WroPgO0pcw+X2w7U9HYr4IKp+d70djQFf3CycWcpj69+fL
	 D4+QPZeJHakBnl+jU3IZRoVbN/nljWMw9tfC8QSAp22NtBR/iC8olUXC2TTpMc9f47
	 wiiDfNdN/88i0yDdtq7OasmOMswiXxC6PAgFxeF11kdqRx+jUFBeuHMTec3ryo+hyA
	 u5M/vyChBpvx3xpnWG6T/7InDnWYkps7WnETb1F2VBIapIDd1IhmWeZHhsC3BQXbiG
	 AbLcZnhyT5UC/s+IpM++eKylqB4mIr+X47YLWS/vNZkWg9wivv7nusHeizmLEhDd/+
	 u7QZI70p8aTTA==
Date: Mon, 26 Jun 2023 16:44:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, suagrfillet@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, mpe@ellerman.id.au,
	Arnd Bergmann <arnd@arndb.de>, rppt@kernel.org, samuel@sholland.org,
	panqinglin2020@iscas.ac.cn, anup@brainfault.org,
	xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com,
	heiko@sntech.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
Message-ID: <20230626-woozy-banish-7d109f8ab080@spud>
References: <20230626-mousy-latter-ad8088de089f@wendy>
 <mhng-f018e5e3-61f5-47ee-a2ae-95309bbdb208@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-f018e5e3-61f5-47ee-a2ae-95309bbdb208@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_084433_073793_4CEC74CD 
X-CRM114-Status: GOOD (  56.09  )
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
Content-Type: multipart/mixed; boundary="===============6768365937000721397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6768365937000721397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dnqy/bk/NdFp4wAB"
Content-Disposition: inline


--dnqy/bk/NdFp4wAB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 07:43:42AM -0700, Palmer Dabbelt wrote:
> On Mon, 26 Jun 2023 06:34:43 PDT (-0700), Conor Dooley wrote:
> > On Sun, Jun 25, 2023 at 03:36:06PM -0700, Palmer Dabbelt wrote:
> > > On Sun, 25 Jun 2023 15:15:14 PDT (-0700), Conor Dooley wrote:
> > > > On Sun, Jun 25, 2023 at 11:09:21PM +0800, Song Shuai wrote:
> > > > > =E5=9C=A8 2023/6/25 22:18, Conor Dooley =E5=86=99=E9=81=93:
> > > > > > On Sun, Jun 25, 2023 at 10:09:29PM +0800, Song Shuai wrote:
> > > > > > > This reverts commit ed309ce522185583b163bd0c74f0d9f299fe1826.
> > > > > > > > > With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pag=
es
> > > > > for the
> > > > > > > linear mapping") reverted, the MIN_MEMBLOCK_ADDR points the k=
ernel
> > > > > > > load address which was placed at a PMD boundary.
> > > > > > > > And firmware always
> > > > > > > correctly mark resident memory, or memory protected with PMP =
as
> > > > > > > per the devicetree specification and/or the UEFI specificatio=
n.
> > > > > > > But this is not true? The versions of OpenSBI that you mention
> > > > > in your
> > > > > > cover letter do not do this.
> > > > > > Please explain.
> > > > > >
> > > > > > > At this time, OpenSbi [v0.8,v1.3) and edk2(RiscVVirt) indeed
> > > don't obey the
> > > > > DT/UEFI spec. This statement is excerpted from "Reserved memory f=
or resident
> > > > > firmware" part from the upcoming riscv/boot.rst. It isn't accurat=
e for now.
> > > > > How about deleting this one?
> > > > > It is incorrect, so it will need to be removed, yes.
> > > > Unfortunately writing a doc does not fix the existing implementatio=
ns :(
> > > > > > Actually with 3335068f8721 reverted, the change of
> > > MIN_MEMBLOCK_ADDR can
> > > > > avoid the mapping of firmware memory, I will make it clear in the=
 next
> > > > > version.
> > > > > To be honest, I'd like to see this revert as the final commit in
> > > a
> > > > series that deals with the problem by actually reserving the region=
s,
> > > > rather than a set of reverts that go back to how we were.
> > > > I was hoping that someone who cares about hibernation support would=
 be
> > > > interested in working on that - *cough* starfive *cough*, although =
maybe
> > > > they just fixed their OpenSBI and moved on.
> > > > If there were no volunteers, my intention was to add a firmware err=
atum
> > > > that would probe the SBI implementation & version IDs, and add a fi=
rmware
> > > > erratum that'd parse the DT for the offending regions and reserve t=
hem.
> > >=20
> > > Is there any actual use case for hibernation on these boards?  Maybe =
it's
> > > simpler to just add a "reserved regions actually work" sort of proper=
ty and
> > > then have new firmware set it -- that way we can avoid sorting throug=
h all
> > > the old stuff nobody cares about and just get on with fixing the stuff
> > > people use.
> >=20
> > What is "old stuff nobody cares about"? The first version of OpenSBI wi=
th
> > the fix shipped only the other day, so effectively all current stuff has
> > this problem. Certainly everything shipping from vendors at the moment
> > has the problem, and probably whatever downstream, custom versions of
> > OpenSBI also have it.
>=20
> Ya, so "old stuff" is everything -- but that's all already broken, so
> nothing we can do about it.  IIUC there's nothing shipping that functions
> correctly here, so it's just a matter of detecting everything before the
> bug.

g5soc functions correctly, because our HSS (which a small portion of
OpenSBI is built into) doesn't run out of system memory.

> > Also, the problem isn't just limited to hibernation apparently. I
> > think it was mentioned in the cover letter that according to Rob,
> > without being marked as no-map we could also see speculative access &
> > potentially some of the memory debugging stuff walking these regions.
>=20
> We've got a bunch of other problems around speculative accesses to these
> regions in M-mode, so we'll have to deal with it at some point anyway.
>=20
> > I'm not sure how you'd intend communicating "reserved regions actually
> > work", I figure you mean via DT?
>=20
> Somewhere in DT.  I hadn't thought about it a ton, just adding some prope=
rty
> that says "this doesn't have the bug" was roughly the idea.
>=20
> > I don't really see the benefit of adding a property for those who are
> > behaving, if we can detect the versions of the one relevant SBI
> > implementation that are broken at runtime. DT hat on, even less so.
> > Perhaps I am missing your point, and there's another angle (like trying
> > to per firmware code)?
>=20
> If it's easy to figure out which versions are broken that seems fine to m=
e.
> My worry was just that's hard to do (folks forking OpenSBI) and it might =
be
> easier to just

You cut yourself off here :/
If people are forking OpenSBI, but reusing the version/implementation
info, and changing behaviours, I am not really sure what we are supposed
to do in general. I'd vote for apply the erratum to those forks, based on
the version info, until they make changes
That's pretty much the same thing that'd happen under your proposal anyway?
I went and sent a PR last week to get a custom ID for the HSS on g5soc so
that we can be differentiated, everyone else that doesn't want to be
tarred with the same brush probably should too, if they are sufficiently
different.


--dnqy/bk/NdFp4wAB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJmyVwAKCRB4tDGHoIJi
0lcLAQDGbWINuzGHr+8g2JlotnQNG5zgkkMr50f2gjkAamrn0wD/XR9n3KLFtArE
2xd37oPyUzjfpgrFGUbCZ17KW8OnzQI=
=G6Yj
-----END PGP SIGNATURE-----

--dnqy/bk/NdFp4wAB--


--===============6768365937000721397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6768365937000721397==--


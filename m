Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3375C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0/LoleororNvt44s1lE6H/WSFMYhWYHB3vaIDbY8mw=; b=o6PnfUYtg0mDONuwv6UTs2umzf
	n9VNowuyYpc3V5jGEicPJKSWVEOZB4+uoArgNHT6Vlyn0dT/0EccE0/B23WkAvC0rKfAxNQfdLeHF
	1nAz6UFcLOi/bHSL2UuA2QTsoEjaFHi3sbyeoPHWpdIVXPq57lQ5qjITZU0hJ/EpJqs///PKNsbBk
	jAz6dGQCNhjNpA4m5CE5Tk5QZPlyxvYLqefCu5w8lvcOQ5wbJkNu0wWOs2hrrmF20GtFTeXriDbod
	SdpLPozifWcCGn/GFb3jTawVh/xRUKtpXMVgjqNMO/58Bda23S0TyJb+AHQ0hM1bxX7WFWJDkJuRg
	GxQshU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFK37-008EDs-2f; Tue, 10 Jan 2023 19:12:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFK32-008ECr-MV
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 19:12:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA7836183C;
	Tue, 10 Jan 2023 19:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BD4C433EF;
	Tue, 10 Jan 2023 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673377955;
	bh=d1alXB8YUDQBzMrcEjut1r6LFASYy7Rq/4tMxxe4k0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2ov2TW5aVxUpoTR3EDfMgM9qy2IwJyj10AIT5RgHUKD5NQcmt8aMdN/f8dqTkZ4y
	 B+RBPPlYeeaqvbCj2dExiW6ouz1Iv3R4sfdBG9Bskj28p5JcKUB/C+FDMNmeELptOF
	 rIcM7gE9gkhrx47NtAphHxv2bE2O9HNtp1kisqvBjZVmyTnH1Opos+BKy7TMwjz8kf
	 7YvJuzBhaZXmQUkozx+pVen2IIgDh1gdblhzdkhJNan+qUAiz46WohH6w4G22Cf5ch
	 CTU63GmL3JacL9UfyJc0BD8OCH17ZA4R7hlAtXp2KWejrPuEMtf6RtQraYfUIDMddQ
	 7P6MJAAyGbsIQ==
Date: Tue, 10 Jan 2023 19:12:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/5] RISC-V Hardware Probing User Interface
Message-ID: <Y724nziHHjIYMY1K@spud>
References: <20221013163551.6775-1-palmer@rivosinc.com>
 <20221201160614.xpomlqq2fzpzfmcm@kamzik>
 <Y7xhNSmlh6miWuZw@spud>
 <2876870.k3LOHGUjKi@diego>
MIME-Version: 1.0
In-Reply-To: <2876870.k3LOHGUjKi@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_111236_835844_A7C54C37 
X-CRM114-Status: GOOD (  65.91  )
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
Content-Type: multipart/mixed; boundary="===============7060229360799083951=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7060229360799083951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="41MDvgsEYGO/qXa9"
Content-Disposition: inline


--41MDvgsEYGO/qXa9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,
I thought I replied yesterday but obviously not!

On Mon, Jan 09, 2023 at 08:50:36PM +0100, Heiko St=FCbner wrote:
> Hey,
>=20
> Am Montag, 9. Januar 2023, 19:47:17 CET schrieb Conor Dooley:
> > Hey!
> >=20
> > Just bringing this up somewhere a bit more visible than the weekly pw
> > sync-up yoke!
> > I just got my VisionFive2 today & I see Heiko has just posted another
> > version of Zbb support series, right as I had started typing this in
> > fact, so I'm curious where we stand. There's gonna be quite a few
> > people with Zba/Zbb capable hardware soon by the looks of things, so
> > it'd be nice to have something we can point people at that actually
> > applies to recent kernels.
> >=20
> > I know Palmer you said you'd do some work on it over Christmas, but
> > since that didn't materialise - are you still planning on spinning up a
> > v2?
> > Some thoughts on Drew's sysfs suggestion below would probably be useful
> > if you aren't.
>=20
> from my further optimization pov, I just rebased Palmer's v1 forward,
> as I essentially only want the has-fast-unaligned property from it ;-) .

IIRC the v1 didn't build? Did you manage to get it built & test it at
all?

> The series I posted today is essentially the basics for "everyone with zb=
b"
> and I have a second part on top of that and Palmers hw-probing series
> that then does the further case.
>=20
> I do hope to get that finalized tomorrow or wednesday.

I was going to ask what the "second part" was, but I figure if that's
your timeline for it, I'll probably see the answer to that question soon
enough :)

Thanks,
Conor.




> > On Thu, Dec 01, 2022 at 05:06:14PM +0100, Andrew Jones wrote:
> > > On Thu, Oct 13, 2022 at 09:35:46AM -0700, Palmer Dabbelt wrote:
> > > > These are very much up for discussion, as it's a pretty big new user
> > > > interface and it's quite a bit different from how we've historically
> > > > done things: this isn't just providing an ISA string to userspace, =
this
> > > > has its own format for providing information to userspace.
> > > >=20
> > > > There's been a bunch of off-list discussions about this, including =
at
> > > > Plumbers.  The original plan was to do something involving providin=
g an
> > > > ISA string to userspace, but ISA strings just aren't sufficient for=
 a
> > > > stable ABI any more: in order to parse an ISA string users need the
> > > > version of the specifications that the string is written to, the ve=
rsion
> > > > of each extension (sometimes at a finer granularity than the RISC-V
> > > > releases/versions encode), and the expected use case for the ISA st=
ring
> > > > (ie, is it a U-mode or M-mode string).  That's a lot of complexity =
to
> > > > try and keep ABI compatible and it's probably going to continue to =
grow,
> > > > as even if there's no more complexity in the specifications we'll h=
ave
> > > > to deal with the various ISA string parsing oddities that end up all
> > > > over userspace.
> > > >=20
> > > > Instead this patch set takes a very different approach and provides=
 a se
> > > > of key/value pairs that encode various bits about the system.  The =
big
> > > > advantage here is that we can clearly define what these mean so we =
can
> > > > ensure ABI stability, but it also allows us to encode information t=
hat's
> > > > unlikely to ever appear in an ISA string (see the misaligned access
> > > > performance, for example).  The resulting interface looks a lot like
> > > > what arm64 and x86 do, and will hopefully fit well into something l=
ike
> > > > ACPI in the future.
> > > >=20
> > > > The actual user interface is a syscall.  I'm not really sure that's=
 the
> > > > right way to go about this, but it makes for flexible prototying.
> > > > Various other approaches have been talked about like making HWCAP2 a
> > > > pointer, having a VDSO routine, or exposing this via sysfs.=20
> > >=20
> > > Hi Palmer,
> > >=20
> > > To throw my two cents into the penny jar, I'd vote for sysfs. It hand=
les
> > > the heterogeneous CPU case since cpu feature nodes can be hung off ea=
ch
> > > cpu node. It also avoids yet another encoding. If we enumerate extens=
ions
> > > and their properties then we need to maintain that enumeration in both
> > > the kernel space and userspace. If, OTOH, we use sysfs node names for
> > > the encoding, then, when we match the spec naming exactly, e.g.
> > >=20
> > >  .../features/zicbom
> > >  .../features/zihintpause
> > >  .../features/sscofpmf
> > >=20
> > > userspace can look for features by name. Userspace libraries can even
> > > lead the kernel in development, since the encoding (the spec name) is
> > > already agreed.
> > >=20
> > > Properties of extensions are just sub-nodes, some with standard names,
> > > like
> > >=20
> > >  .../features/zicbom/major
> > >  .../features/zicbom/minor
> > >=20
> > > and others, which are cpu feature specific, like
> > >=20
> > >  .../features/zicbom/block_size
> > >=20
> > > I used 'features' in the above examples for the node name, rather than
> > > 'isa', since not all features map to isa extensions, but it should be
> > > possible to fit non-isa features into the same framework.
> > >=20
> > > Thanks,
> > > drew
> > >=20
> > >=20
> > > > Those seem
> > > > like generally reasonable approaches, but I've yet to figure out a =
way
> > > > to get the general case working without a syscall as that's the onl=
y way
> > > > I've come up with to deal with the heterogenous CPU case.  Happy to=
 hear
> > > > if someone has a better idea, though, as I don't really want to add=
 a
> > > > syscall if we can avoid it.
> > > >=20
> > > > I threw this together during the conferences so I would be surprise=
d if
> > > > it's not broken, but I figured it'd be best to just get something o=
n the
> > > > lists sooner rather that later.  Happy to have someone go fix my co=
de,
> > > > but the new uABI is really going to be the tricky bit here.  There's
> > > > some test code included, but I haven't even booted a kernel with th=
ese
> > > > patches so YMMV.
> > > >=20
> > > > These are also up at kernel.org/palmer/linux/riscv-hwprobe-v1 in ca=
se
> > > > that's easier for folks.
> > > >=20
> > > >=20
> > > >=20
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >=20
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >=20
>=20
>=20
>=20
>=20

--41MDvgsEYGO/qXa9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY724nwAKCRB4tDGHoIJi
0mPOAP0UJ9Jm6z0VE1i2nS1DaWOMJYLrm5HAcwwWWydSXXVb+QD/Q6HDtKKZr4YL
OR7qDR9J014n+NJMYMlxkbRuzmJGBwI=
=+uQt
-----END PGP SIGNATURE-----

--41MDvgsEYGO/qXa9--


--===============7060229360799083951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7060229360799083951==--


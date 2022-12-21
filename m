Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB03C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEFXY4N1iE69WQIvKsiSflJiS34SLXAP17dWXPkZfK0=; b=ayOs9OtJrWMSjvmcriK5x1kV++
	dI7fhXDILug/6CdolWdD4nvcoaCPFaRdLzzlVkMKyRmK5fBjFLh4F4uJagI/FB8I/4uWB806MZ4KO
	kEJ+jbBwjzRvJ8Q8SoYsbbeV+Tgcq0y9X80vToiNjgUSgXlKf8GI/dmcp+0H+926PFXDS6Bvr5cOm
	5uV551nd+Sx2vshn6VAP3u1JRovrRIc6g+HwNgYyS366XJRAfGSFLg40C/caDl7fcDAxYkKwspC+c
	w2bWlaM5UGrD8zMxA2elK3Zpvy+oCC0ol75c4WfLWRnyca8E0kTzH/Ru/DaDDUuGUG93QVCzQsUOY
	WrYYQ1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p842V-000gb6-Dn; Wed, 21 Dec 2022 18:42:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p83vK-000cV6-GU
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 18:34:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1E7ACCE186C;
	Wed, 21 Dec 2022 18:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEFEC433D2;
	Wed, 21 Dec 2022 18:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671647674;
	bh=GLQhx6ZsY4SD9oYGE61vA0bMJIWaIN9/Bpd6KhS6yto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5xCodok5Yfi/CZNdnpp0LeTqVEGGhrIm9/txEPfaaLKgZEwMJ9N3LZpOwCzzCnRA
	 3Q2AlW/rwu+GXHbnZIMqfNPBFGzy65XTvqqXe9T1nRmrNo7E+NDbCBh9AIurKIaBGt
	 kbTCA0WmPqfz4fN6Jgh3G3tbAEgmemN/pu7l6dnBGyCMbkxwxJOVHaMQUugOd0kaGR
	 r6eYpWV7UAoWox9H/HhYMUFLtTlTsCvHVKQtgvWE8cW+rBU4Ym9PWRHbhkk1nXOjiu
	 iw5KeULExl/GDN2teDUEghV7CUHQFc7zkTsKDjc442dCUS/aaxEwC9gcpXvFmmBXeo
	 iu55gXOLHXRzA==
Date: Wed, 21 Dec 2022 18:34:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Ruinland Tsai <ruinland.tsai@sifive.com>,
	linux-riscv@lists.infradead.org, greentime.hu@sifive.com,
	kito.cheng@sifive.com, palmer: dabbelt.com@spud, heiko@sntech.de;
Subject: Re: [RFC PATCH 0/1] About adding new Z extensions in ISA realization
Message-ID: <Y6NRtvkmhieBcZYg@spud>
References: <20221220120236.219804-1-ruinland.tsai@sifive.com>
 <Y6GsTZRw3Tu6wAGZ@wendy>
MIME-Version: 1.0
In-Reply-To: <Y6GsTZRw3Tu6wAGZ@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_103438_964012_55A61B5D 
X-CRM114-Status: GOOD (  44.13  )
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
Content-Type: multipart/mixed; boundary="===============0702830359737915275=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0702830359737915275==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3foY3q0mlz2Il6+V"
Content-Disposition: inline


--3foY3q0mlz2Il6+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey again...

+CC Palmer & Heiko like I meant to last time around...

On Tue, Dec 20, 2022 at 12:36:29PM +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 12:02:35PM +0000, Ruinland Tsai wrote:
> > Dear all,
> > I am wondering about what is the policy on adding new multilettered
> > extensions into the ISA realization mechanism ?
>=20
> There's already been a few added, so it's largely a case of
> rinse-and-repeat?
>=20
> > Currently we have plenty ratified exntensions left un-added, and some
> > of them are already being used frequently
>=20
> Which in-the-wild SoCs actually have support for the unsupported
> extensions, out of curiosity? It'd be nice to have one with zbb support
> at the very least.
>=20
> > such as the B extension
> > family - - namely, the zba, zbb, zbc, and zbs.
>=20
> Heiko has been working on incorporating zbb support here:
> https://lore.kernel.org/linux-riscv/20221130225614.1594256-1-heiko@sntech=
=2Ede/#t
>=20
> The first half of this patchset is likely to be applied immediately
> after -rc1. That half has been split out and is here:
> https://lore.kernel.org/all/20221207180821.2479987-1-heiko@sntech.de/
>=20
> Clearly though that's trying to use zbb in the kernel so is not quite
> the same as what you are doing here with just adding them to the various
> structs.
>=20
> There was another patchset in June (ignore my & Samuel's confusion about
> ordering, that's been resolved since) that added some HWCAP stuff for a
> superset of the extensions you've mentioned here:
> https://lore.kernel.org/linux-riscv/YqY0i22SdbHjB%2FMX@Sun/
> That'd need a rebase to apply on current code anyway (and I'd prefer if
> my patches cleaning up the ordering in those structs got applied before
> we add more extensions "out of order" to them!)
>=20
> There's also been discussion about whether it is sustainable to keep
> adding stuff to hwcap like this, but I have not been able to find the
> particular ML posts for that. Palmer spun up a PoC for a syscall & Heiko
> has said he would look into following up on that work after the inital
> zbb stuff was ready.

I didn't find the patches but I also didn't look very intently. It's
here though if you'd like to check it out:
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=3Dr=
iscv-hwprobe-v1
IIRC it doesn't actually compile in that state though.

> The Higher Powers^TM will have to comment on what the policy is with
> adding more extensions in the interim. I'll admit it is a bit odd to
> not at least inform userspace as to what the actual ISA is.
> Heiko or Palmer, perhaps you've got a better idea of what the craic is
> there?

I asked Palmer today and cleared it up a little. He's planning on doing
some more work on the new interface. Until that is ready, we have the
remainder of HWCAP worth of space for adding new extensions.
So not unlimited ability to add new extensions, but certainly not a hard
blocker on adding more.

> > Being unsure about whether I have done it in the right way, hence I
> > wrote this RFC for adding those extensions.
> >=20
> > Also, just as I have inquired on the list before, what about the vendor
> > extensions?
>=20
> Since you didn't link the previous questions, I dunno what they were,
> but...
>=20
> After the discussion at the Plumbers BoF, the policy about vendor
> behaviour has been changed. The new wording is:
> <quote>
> Additionally, the RISC-V specification allows implementers to create
> their own custom extensions.  These custom extensions aren't required
> to go through any review or ratification process by the RISC-V
> Foundation.  To avoid the maintenance complexity and potential
> performance impact of adding kernel code for implementor-specific
> RISC-V extensions, we'll only consider patches for extensions that either:
>=20
> - Have been officially frozen or ratified by the RISC-V Foundation, or
> - Have been implemented in hardware that is widely available, per standard
>   Linux practice.
> <\quote>
>=20
> > If a vendor wants to submit a vendor extensions without
> > reavealing the detailed sepcs, what will be examined ?
>=20
> I can only imagine that this would vary completely depending on what
> that extension is doing? I'm not sure how you would expect anyone to be
> able to review something though if you do not provide any information?
>=20
> Unless the answer is "no vendor extensions without specs", this sounds
> like something that could only be answered once code is available.
>=20
> Not the answers you were looking for perhaps Ruinland, but hopefully I
> was at least somewhat helpful.

Thanks,
Conor.

--3foY3q0mlz2Il6+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6NRtgAKCRB4tDGHoIJi
0h1tAP915G9GfVTIEiPED/PvAEgXxOd+p81AaeoaJeLWYvHctwEA3JEmJzPQyUmq
zKnTt6HykKd5njYVy2/m/iaLcscxHgI=
=HGVC
-----END PGP SIGNATURE-----

--3foY3q0mlz2Il6+V--


--===============0702830359737915275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0702830359737915275==--


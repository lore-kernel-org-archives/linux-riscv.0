Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C409CC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI0SWCBUmisB5Hu5nclUaqaVf8fk/PgBG0bUILzTRws=; b=u/XlAdb5Ip67jG+LfF8tvD4zGS
	LQCNfA4+iKjd78phgT9qzmm29mDfe3OImcUaIy/GNInNLlXe7KZFcPFQpgR9aS8Fy5XceUcfnc3TQ
	+pFUhxIFUbmbGm1lfy2fPh1AoXOK2ZdSjUrO1RMN5AHZsPdvlyYi9sntzSskWt0vNqVkLlVV/W1hq
	4viUpIbKhNK/g3UGYibKpf799NcWghsKigmI6BPHTeswlC8ZripI5tbMF7sEi5XetF/EOeJRm4UyE
	JS0B1wqFFT804YcMwE8cEXWNFj4ilVH9X+VRwq3pLd34NDPc5cGSE4SOq6fAgkJZLOb1MfCBanQSs
	ReBidsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps6MW-007DW6-0F;
	Thu, 27 Apr 2023 18:29:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps6MT-007DVf-01
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 18:28:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F224061495;
	Thu, 27 Apr 2023 18:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390A7C433D2;
	Thu, 27 Apr 2023 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682620135;
	bh=z2nSyuDXMz7IhBSy11hDGq7ssnsSbj8LVzsiNsuuVWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWwECdAolWxzsp6/Qp0gBIQofkMqEsK+Bf2CrluUCI3PfDtiuGYjXrl99HZXrs7qR
	 hjPY9zPSmIbXyq+Sfqc34AYsuAk5MXPHbSeWlk88pS/cVTAacTics4JAmNK8nNKPNd
	 3p9G1wGqGRI7ClZ++xmmY2pwScCbbhTptA7YCGLW5Z7epOmb/oKyYxDfO+ioGxGMWx
	 77yLlLPAM0MkMp3ixKndl2hTzdSXJlhLmXERw6b0TNgKyWcDgOXP2wKZ/crE9OSiVA
	 nMLVdPxfL41wMtwh8YWfCVH4KPf+AzkY5srr9iiz7X5onbXq5X7/dkkKhhUj1zc811
	 VguEnlSgMoArg==
Date: Thu, 27 Apr 2023 19:28:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	kito.cheng@sifive.com, jrtc27@jrtc27.com, matthias.bgg@gmail.com,
	heinrich.schuchardt@canonical.com, greentime.hu@sifive.com,
	nick.knight@sifive.com, christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu, richard.henderson@linaro.org,
	arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] RISC-V: add support for vendor-extensions via
 AT_BASE_PLATFORM and xthead
Message-ID: <20230427-maybe-skier-51e7cf09795c@spud>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-5-heiko.stuebner@vrull.eu>
 <20230426-spirits-ludicrous-a5d8275686e6@wendy>
 <5016896.Mh6RI2rZIc@diego>
MIME-Version: 1.0
In-Reply-To: <5016896.Mh6RI2rZIc@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_112857_146225_E6B80098 
X-CRM114-Status: GOOD (  55.52  )
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
Content-Type: multipart/mixed; boundary="===============4108364218171923567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4108364218171923567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nWo5qTPtEHBQI77d"
Content-Disposition: inline


--nWo5qTPtEHBQI77d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,

On Thu, Apr 27, 2023 at 07:15:58PM +0200, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 26. April 2023, 14:29:16 CEST schrieb Conor Dooley:
> > On Mon, Apr 24, 2023 at 09:49:11PM +0200, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>

> > I'm not entirely sure if this patch is meant to be a demo, but I don't
> > like the idea of using these registers to determine what extensions are
> > reported.
>=20
> It took me a while to grasp the above, but I think you mean determining
> extensions based on mvendor etc, right?

Yes, sorry. Apologies if that was not clear. I suppose the SBI
implementation could (as ours does!) could report something different to
the registers themselves, so using that word is probably not a good idea
anyway.

> > riscv,isa in a devicetree (for as much as I might dislike it at this
> > point in time), or the ACPI equivalent, should be the mechanism for
> > enabling/disabling these kinds of things.
>=20
> > Otherwise, we are just going to end up causing problems for ourselves
> > with various lists of this that and the other extension for different
> > combinations of hardware.
> > The open source c906 has the same archid/impid too right? Assuming this=
 is
> > a serious proposal, how would you intend dealing with modified versions
> > of those cores?
> >=20
> > I am pretty sure that you intended this to be a demo though, particular=
ly
> > given the wording of the below quote from your cover,
>=20
> yeah, this one was more following a train of thought. Thinking about the
> issues, this was more of an addon thought, as I wasn't really sure which
> way to go.
>=20
> So you're right, vendor isa-extensions should also come from the ISA
> string from firmware, similar to the base extensions. Not based on the
> mvendor-id and friends.

:)

> > > Things to still consider:
> > > -------------------------
> > > Right now both hwprobe and this approach will only pass through
> > > extensions the kernel actually knows about itself. This should not
> > > necessarily be needed (but could be an optional feature for e.g. virt=
ualization).
> >=20
> > What do you mean by virtualisation here? It's the job of the hypervisor
> > etc to make sure that what it passes to its guest contains only what it
> > wants the guest to see, right?
> > IIUC, that's another point against doing what this patch does.
>=20
> I guess I'm still seeing Zbb and friends - with just computational
> instructions as always good to have. But I guess you're right that the
> hypervisor should be able to control itself which extensions.

Yah, there may not be any obvious downsides to something like Zbb, but I
think that taking control away from the hypervisors etc isn't a good
idea.
Having a simple policy of blocking things that are known to misbehave
would require less maint. than a list of things that are okay to pass
through, but both are probably cans-of-worms.
I think we need to think carefully about what policy is chosen here.
Allowlist will be slower, but at least we'll not tell userspace
something that is not usable. Blocklist will be easier to manage, but
can only be reactive.

> > > Most extensions don=E2=80=99t introduce new user-mode state that the =
kernel needs to
> > > manage (e.g. new registers). Extension that do introduce new user-mod=
e state
> > > are usually disabled by default and have to be enabled by S mode or M=
 mode
> > > (e.g. FS[1:0] for the +floating-point extension). So there should not=
 be a
> > > reason to filter any extensions that are unknown.
> >=20
> > I think in general this can be safely assumed, but I don't think it is
> > unreasonable to expect someone may make, for example, XConorGigaVector
> > that gets turned on by the same bits as regular old vector but has some
> > extra registers.
> > Not saying that I think that that is a good idea, but it is a distinct
> > possibility that this will happen, and I don't think forwarding it to
> > userspace is a good idea.
>=20
> The thead-vector (0.7.1) would probably fit this description. Though in
> that case, userspace definitly needs to know about it, to use it :-) .
>=20
> But of course this should only be forwarded when relevant support
> is available in the kernel.

Right. IIRC, the plan for that is to add `v` to riscv,isa & alternatives
will do the rest as opposed to doing an `_xtheadvector` type thing.

Assuming the latter for a moment, we'd have to blacklist `_xheadvector`
for kernels compiled without vector support even if the relevant support
is added to the kernel. Similarly, we'd have to blacklist it for kernels
with vector support, but without the erratum enabled.

I think the plan was the former though, so you'd have to block passing
`v` to userspace if vector is enabled and the erratum is not supported.
Should ERRATA_THEAD_VECTOR be mandatory then for RISCV_ISA_VECTOR &&
ERRATA_THEAD kernels? What am I missing?

Also, in a world where we do do some sort of passing, should we only
forward the vendor extensions, or should we forward the standard ones
too?
What about supervisor mode only stuff? There's a bunch of questions to
consider here, even if for some of them the answer may be obvious.

As I said, not really bothered about hwprobe, aux vector etc, but this
side of things is particularly interesting to me.

Cheers,
Conor.

--nWo5qTPtEHBQI77d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEq+4QAKCRB4tDGHoIJi
0mtbAQDGhCUIHj+CrP2sJWJZgnpydP4QmYuQFMWLAspoXNz/XwEAwEcvetTlShFu
S4ux+lKP/3+iQ8Hwj7Jhn2axR7sRFws=
=cxr9
-----END PGP SIGNATURE-----

--nWo5qTPtEHBQI77d--


--===============4108364218171923567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4108364218171923567==--


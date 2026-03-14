Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6134F107BCEF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 01:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTxUxBNIyCcPB0NIh+oJGhzwVki99/0z5vhKFkpb2Ko=; b=2XCSbQx/uCWky7HsPni0B+VoCI
	EaxxWIOJo2JHRc8tUoxcu0s4ttyITqQlpIAHribJwy9jqnWGKsm3/uk/OOpTg+rD0enXal335hjr9
	MVTrgfRiQ4EaEFitQncRa5V2lfPwfMIri8bpwzjGQyt7+cdsRbGUsahRoxPsjfqR5b2zKyCMbz+3q
	oCHa+JjCrvbZkMaTa51fvbD9pGpT81ePPekMw85Q/BdalVTinvqM6narfeXaobpSiPDHW+XB+Tz++
	C51aqe844OSWMqq1rsZQWsMn4w5QE4iLjmPlOJO9xpr2w3nP2ChJ2vdsETCpn3RkUvsycEMRja+nM
	j9rWV39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Deh-00000001O8x-0MzN;
	Sat, 14 Mar 2026 01:19:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Deg-00000001O8r-0Zdg
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 01:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2871160008;
	Sat, 14 Mar 2026 01:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C97DC19421;
	Sat, 14 Mar 2026 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773451140;
	bh=qnr95hgbmxKCQoVxKIASrc5t+YqB+yRLOXFlitKJJD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxkgTOwvprg6wrBkZjtbNCLlgJr9aLdNXqBKiBEiFxGZ4wupJM3ZuNVkJhYPM/OWN
	 aThlf4IggApRnj+TUGNuisZc73p5WkG0VpDjlglGpBXSi0TL/QWS37Hmvkr4JEpgrh
	 sLmU1uOiIUNdjHaHQEzlMdoIC/pUQYEiU7BswfdaKFKD2pnD3/LbhkuF5jNTkVCGjV
	 2slp3PNX3y/F0eYfdgdTR9ZfTVsmAiU54vsw5+vW/YbLqXjlYECEk3P0AeJDp3FT4l
	 TOPUUTTRjwLb6z5Y6kD0IxJXGSb5RMYCfhmsI2jc3JpQHxPyVyFyH/BlBQxjUcywOg
	 dErjhHezKZpOw==
Date: Sat, 14 Mar 2026 01:18:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of
 Svpbmt "XPbmtUC"
Message-ID: <20260314-errant-gnarly-dcca92457051@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
 <20260313-spiny-duration-702fff6bca17@spud>
 <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2195985937066406839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2195985937066406839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q+I14jZDJu0cG5SR"
Content-Disposition: inline


--Q+I14jZDJu0cG5SR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 05:29:53PM -0700, Bo Gan wrote:
> Hi Conor,
>=20
> On 3/13/26 16:55, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 02:33:16PM -0700, Bo Gan wrote:
> > > Hi Conor,
> > >=20
> > > Thanks so much for the prompt review. See inline.
> > >=20
> > > On 3/13/26 06:24, Conor Dooley wrote:
> > > > Hey,
> > > >=20
> > > > Gonna offer some feedback on the detail of what's been done in this
> > > > series, without providing any commentary on whether this is the cor=
rect
> > > > approach to take.
> > > >=20
> > > > On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
> > > > > On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
> > > > > sometimes map the system memory twice in physical address space, =
one
> > > > > as cached, and the other as uncached. Through the uncached window,
> > > > > device drivers will be able to map DMA buffer for noncoherent dev=
ices.
> > > > > Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
> > > > > Make use of such feature by modeling it as "XPbmtUC", a customized
> > > > > version of Svpbmt, where a single bit in PTE is used for UC contr=
ol.
> > > > > There's no IO bit with such scheme, as it's assumed that the PMA
> > > > > (usually hard-wired on these SoCs) will properly convey the stron=
gly-
> > > > > ordered, non-idempotent attribute of the MMIO region.
> > > > >=20
> > > > > The enablement of such position of "XPbmtUC" is controlled by the
> > > > > device-tree property "riscv,xpbmt-uncache-bit".
> > > >=20
> > > > Firstly, the naming generally I take some exception to. If this is =
some
> > > > fake vendor extension for linux purposes, it needs to have "xlinux"=
 in
> > > > it, like our xlinuxenvcfg does. It should also be consistent, don't=
 use
> > > > "xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.
> > > >=20
> > > Makes sense. I can certainly change that to be conformant.
> > >=20
> > > > Athough, I think I disagree fundamentally with this property, as it=
 seems
> > > > to me like "software configuration" that shouldn't be permitted in
> > > > devicetree. Maybe I am misunderstanding, but the numbers you chose =
are
> > > > convenient, not set in stone by the specific hardware, right?
> > >=20
> > > For JH7110, the bit 32 (PPN bit 34) matches exactly with the HW. Mean=
ing
> > > toggling this bit would re-map the page to the uncached window, which
> > > matches perfectly with the synthetic UC bit in the scheme.
> >=20
> > What does "matches exactly with the hardware" mean? AFAICT, you picked
> > it because it was the best value, but you could also have picked another
> > less optimal value?
> >=20
> > >=20
> > > For EIC770X, the bit 38 (PPN bit 40) is hand picked to be able to map=
 all
> > > physical memory space (40 bit), while making it very easy for the thi=
n-
> > > hypervisor, which can utilize Sv39x4 (41 bit) page scheme in G-stage.
> > >=20
> > > I also considered the sbi call approach, where the kernel can query f=
or
> > > the support and position of the uncache bit. The thing is that JH7110
> > > can just hard-code the bit without any changes to firmware, and I want
> > > to have a consistent way for both SoC, thus the device-tree approach,=
 to
> > > let the EIC770X firmware/bootloader adding the property to dt at runt=
ime.
> > > Any better ideas?
> >=20
> > Is the only thing that's variable on your eic770x platform whether or
> > not the bit is enabled? Or are you looking to vary the bit depending on
> > the specific platform?
> >=20
>=20
> It'll be "fixed" for eic770x if a thin-hypervisor re-mapping is enabled
> underneath. It just so happens that the physical address space is 40 bits
> (ignoring the 40bit+ upper uncached region for interleaved memory, which
> we don't need when the "xpbmt-uc" is enabled anyway), and the hypervisor
> can use Sv39x4 (also 41bit) to re-map everything.
>=20
> The variation comes with different SoCs, JH7110 vs. EIC770X. I'd like to
> make it a variable, to make a unified kernel binary boot on all SoCs, so

FWIW, I have no interest in things that are not multiplatform-safe, so
anything I've been suggesting has been with that in mind. When I was
talking about not conveying the bit via DT, but storing the value in the
kernel, I was still considering that the values would be stored for
specific soc compatibles.

To be honest, I'm not completely dead-set opposed to a property that has
the bit positioning, but any property being added for what is
effectively an erratum needs to pass a high bar when the info could be
gathered in another way. That the eic7700 one depends on firmware for
what the bit may be is points in your favour, since firmware variability
is part of what dt is there to do. The jh7110 is points against, since
it could be fished out of the errata handling code.

> I need to fix the alternative logic for PC-relative instructions to read
> from a global variable "xpbmtuc_bit/mask". Also I want to avoid adding
> too many branches to the alternative macro.
>=20
> > > > I'd be much more comfortable with adding xlinuxwhatever to
> > > > riscv,isa-extensions, to signal that a soc supports this stuff than=
 with
> > > > a property for the bit itself. I suppose that bit information could=
 then
> > > > come from a LUT in the vendor extensions, that a validate callback =
could
> > > > check (via root compatible) before enabling. There's not a super ne=
at
> > > > way to do that at the moment though I don't think, code currently
> > > > expects that vendor extensions are in a different "namespace" to
> > > > standard ones, and this would blur the lines because it's not from a
> > > > specific vendor, nor is it a standard extension.
> > > > I guess, it could be done by keeping it as a standard number, but t=
hen
> > > > it's a bit trickier to neatly access the LUT while keeping it split
> > > > apart.
> > > > I know this means having to modify the kernel if there's a new devi=
ce,
> > > > but I'm inclined to say "deal with it" because they could've done
> > > > something standard and opted not to.
> > > >=20
> > > > Could also argue that this should be shoved into a sifive specific
> > > > thing, but I don't expect that they're the only ones with devices l=
ike
> > > > this that could benefit.
> > > >=20
> > >=20
> > > I've thought about riscv,isa-extensions. The issue with that is that =
it's
> > > a per-CPU thing, but I'm adding a global extension, and I don't want =
to
> >=20
> > Most of the extensions in that string are effectively global. There's no
> > need to worry about "polluting" it.
> >=20
>=20
> Got it. So I can use something like "xlinuxpbmtuc38" in isa-string? (until
> someone comes up with a better naming. Naming things is hard...)

I don't think the encoding of the bit should be in the name, otherwise
we'd need to many different variations, if using riscv,isa-extensions is
the approach that ends up being used.

> > > pollute the isa-extension string. Thus, I followed Samuel's approach =
--
> > > He uses "riscv,physical-memory-regions" in the root node.
>=20
> Bo

--Q+I14jZDJu0cG5SR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabS3fwAKCRB4tDGHoIJi
0iCdAP0YveJl1IGqhdlqO0fUyAq6U6ugZdJQN1GaN4EkiNuXLAEArpEQOjLyAipb
PaTnjbx8X3PCe4bPuL8kSh2kUMjhUQI=
=4fko
-----END PGP SIGNATURE-----

--Q+I14jZDJu0cG5SR--


--===============2195985937066406839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2195985937066406839==--


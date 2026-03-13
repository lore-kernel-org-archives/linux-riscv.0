Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371A5107BCEC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxKcbw0ZuYjDc6vjG5+lm+f7Gkb6QHD39CpIlE2B4Yc=; b=wiSXqLrqe+Qjg4idatfqM4nfzO
	Nc8QqG06AuAGnYpXHXgjI7eBt301sNdZ18sGEHlwEDaGV0aDGxAYo3tZxLvzH2bSl/rQtfqQfVbk4
	I4UwzIa31qVfLFtzgFWToopxk49FPJeBvP5fYfAFx2sV7faWgDTxWnYDdlIEC5hdCFuO5c8TNQw/S
	owad7h1ztiN2BSF2yTxhsmT5dbCmA9lp1OMcdR2a/mKne3JfLTEW6leiDKZIquRIroPTTZJ37ZXWH
	V66nZrbz92GH05dDcqquM4pd19rQ3zlArGB15KcA1lAXCX9QeGZMMV7fiUFow1JdpfvaGXawB/HZc
	dQdIZopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CM0-00000001Kp6-0yev;
	Fri, 13 Mar 2026 23:55:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CLy-00000001Kol-1Bvk
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 23:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84A6640C2A;
	Fri, 13 Mar 2026 23:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E077CC19421;
	Fri, 13 Mar 2026 23:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773446137;
	bh=veJ8YUerlXE+quwRcQmdriJ/T0Mo1IBgYUvuwIxvzZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEdaqGiTZ7ThPTo9wfmuFMROS3RwzTWz78P0reua0ujPJSmUh0Qb8E4o4/lWkARqT
	 iySuUwiLp60/3hJ/1i22sbb/hS2Sx5/YNYoE2gtzBPj6sfHgFiZQbflyLw+viBO5+m
	 w956j/inhQIdKrZtK1Oz2psNFH/IRwlQNfChQbi+KpFW7v7Osh0hoefdktEXChn8Nh
	 tRpkDU1u9x9fvLPb7trjICpdjUBNXBBI8drR3qoybBfHJhG4Zv2uW6NlR34RHA2F6n
	 Vt2vS7T2lHzykDKz1qpXytA9oJgPFMzviGVviiIRPin0qYH1F7ncb7rixvJmDFE9BV
	 ob4uOB1aswJaQ==
Date: Fri, 13 Mar 2026 23:55:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of
 Svpbmt "XPbmtUC"
Message-ID: <20260313-spiny-duration-702fff6bca17@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_165538_378890_611DC2A3 
X-CRM114-Status: GOOD (  49.69  )
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
Content-Type: multipart/mixed; boundary="===============6510432148053782072=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6510432148053782072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdLJpvapMfWJaGyp"
Content-Disposition: inline


--cdLJpvapMfWJaGyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 02:33:16PM -0700, Bo Gan wrote:
> Hi Conor,
>=20
> Thanks so much for the prompt review. See inline.
>=20
> On 3/13/26 06:24, Conor Dooley wrote:
> > Hey,
> >=20
> > Gonna offer some feedback on the detail of what's been done in this
> > series, without providing any commentary on whether this is the correct
> > approach to take.
> >=20
> > On Fri, Mar 13, 2026 at 01:44:02AM -0700, Bo Gan wrote:
> > > On platforms that doesn't support Svpbmt or XTheadMae, SoC vendors
> > > sometimes map the system memory twice in physical address space, one
> > > as cached, and the other as uncached. Through the uncached window,
> > > device drivers will be able to map DMA buffer for noncoherent devices.
> > > Such setup is usually found in SoC with pre-Svpbmt Sifive cores.
> > > Make use of such feature by modeling it as "XPbmtUC", a customized
> > > version of Svpbmt, where a single bit in PTE is used for UC control.
> > > There's no IO bit with such scheme, as it's assumed that the PMA
> > > (usually hard-wired on these SoCs) will properly convey the strongly-
> > > ordered, non-idempotent attribute of the MMIO region.
> > >=20
> > > The enablement of such position of "XPbmtUC" is controlled by the
> > > device-tree property "riscv,xpbmt-uncache-bit".
> >=20
> > Firstly, the naming generally I take some exception to. If this is some
> > fake vendor extension for linux purposes, it needs to have "xlinux" in
> > it, like our xlinuxenvcfg does. It should also be consistent, don't use
> > "xpmbtuc" and "xpbmt-uncache-bit", pick one and stick to it.
> >=20
> Makes sense. I can certainly change that to be conformant.
>=20
> > Athough, I think I disagree fundamentally with this property, as it see=
ms
> > to me like "software configuration" that shouldn't be permitted in
> > devicetree. Maybe I am misunderstanding, but the numbers you chose are
> > convenient, not set in stone by the specific hardware, right?
>=20
> For JH7110, the bit 32 (PPN bit 34) matches exactly with the HW. Meaning
> toggling this bit would re-map the page to the uncached window, which
> matches perfectly with the synthetic UC bit in the scheme.

What does "matches exactly with the hardware" mean? AFAICT, you picked
it because it was the best value, but you could also have picked another
less optimal value?

>=20
> For EIC770X, the bit 38 (PPN bit 40) is hand picked to be able to map all
> physical memory space (40 bit), while making it very easy for the thin-
> hypervisor, which can utilize Sv39x4 (41 bit) page scheme in G-stage.
>=20
> I also considered the sbi call approach, where the kernel can query for
> the support and position of the uncache bit. The thing is that JH7110
> can just hard-code the bit without any changes to firmware, and I want
> to have a consistent way for both SoC, thus the device-tree approach, to
> let the EIC770X firmware/bootloader adding the property to dt at runtime.
> Any better ideas?

Is the only thing that's variable on your eic770x platform whether or
not the bit is enabled? Or are you looking to vary the bit depending on
the specific platform?

> > I'd be much more comfortable with adding xlinuxwhatever to
> > riscv,isa-extensions, to signal that a soc supports this stuff than with
> > a property for the bit itself. I suppose that bit information could then
> > come from a LUT in the vendor extensions, that a validate callback could
> > check (via root compatible) before enabling. There's not a super neat
> > way to do that at the moment though I don't think, code currently
> > expects that vendor extensions are in a different "namespace" to
> > standard ones, and this would blur the lines because it's not from a
> > specific vendor, nor is it a standard extension.
> > I guess, it could be done by keeping it as a standard number, but then
> > it's a bit trickier to neatly access the LUT while keeping it split
> > apart.
> > I know this means having to modify the kernel if there's a new device,
> > but I'm inclined to say "deal with it" because they could've done
> > something standard and opted not to.
> >=20
> > Could also argue that this should be shoved into a sifive specific
> > thing, but I don't expect that they're the only ones with devices like
> > this that could benefit.
> >=20
>=20
> I've thought about riscv,isa-extensions. The issue with that is that it's
> a per-CPU thing, but I'm adding a global extension, and I don't want to

Most of the extensions in that string are effectively global. There's no
need to worry about "polluting" it.

> pollute the isa-extension string. Thus, I followed Samuel's approach --
> He uses "riscv,physical-memory-regions" in the root node.

--cdLJpvapMfWJaGyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabSj9AAKCRB4tDGHoIJi
0shuAQCVmryV7HgAGKCOATKpaguDs20xp7JSKqRRPf8wrfFANQD8DApSJnS8Khk5
a0GaO5ySJrV/0DQdKf/CjpPUv/lBtwQ=
=IR02
-----END PGP SIGNATURE-----

--cdLJpvapMfWJaGyp--


--===============6510432148053782072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6510432148053782072==--


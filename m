Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28FAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bahCOfhBO6z5s5dGdarIUySh7Tbk+u18FI8CJSC5CnM=; b=n4WoQrXX57nOuRPj+l3bYV+u/P
	EM3XODnUDJ5K5/21eke1L/AVgnVmoSEzDM0KszD6OYWjuUpC7Hfwd14pjS+HZJO6BgZcfCxuvSYCq
	vySLCUOnK43gPE7UljFgzkgMBIioH6w5ClIlKuC+wegxr1j+YSuvDhust4bVqs443Lyu0YYXFa4Mp
	V66weL5F8fLSjTRtc/yPJxlqM9watk1lEob1093nX4D4MDwmO0L7jeFBp4wGsjDElJX+BpiXAkXhc
	fYAz4PLYaQzo0+dJGDmC36pJOxoQVTqeA15YUN1rtcqgSSogweSPMU2lw/zfV0a8XI7jaa17A8Ekj
	ej2uAcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAu6n-00GfK1-R6; Thu, 29 Dec 2022 14:42:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAu6l-00GfId-7R
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 14:42:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A11661724;
	Thu, 29 Dec 2022 14:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCE2C433EF;
	Thu, 29 Dec 2022 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672324929;
	bh=HweCNvuVHKTNntaP2TO5kbEWCY8tJkwUc9XXwLm/Qa4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Bf5KnNRd917Q9YkSZXe0W6rUiyMWFqa+xXS352McJpMfVp0UFsfjceDf8qkCF2FgC
	 LBfntHlAXuUVUvtL0H4Sk7JwbwMGAhEwYJTyiADb2IT4rVibrpdoJF70PE8lRQ8gq4
	 pXP26HZWGWRS/HS70dTqYr2CwxZfUZKHbM+q0gl90wKNaLibnYJjaWB2DdZGulouuL
	 y8+p+vVbx5usYtBSxPRU+XzeOhCW8XtnWnWqATrIk8rfgBTcQ+d8itw1c5DIIiecFQ
	 6hOCsok6HKJ4jKYRw2bMoB7w6CIcz+bDFv84xU5dFCEoACnftcWdrmTvs+3mhxWwUA
	 6H4XhOyRQiznA==
Date: Thu, 29 Dec 2022 14:42:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>, soc@kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, guoren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y62nOqzyuUKqYDpq@spud>
References: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
 <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com>
 <Y55IQIxXw/twcxFx@spud>
 <bb350709-e29a-402c-8e7e-37fd9c452c6d@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <bb350709-e29a-402c-8e7e-37fd9c452c6d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_064211_368758_6ADEF948 
X-CRM114-Status: GOOD (  43.65  )
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
Content-Type: multipart/mixed; boundary="===============2298795329199018256=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2298795329199018256==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5hEnPjiiILINJZrq"
Content-Disposition: inline


--5hEnPjiiILINJZrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2022 at 03:05:37PM +0100, Arnd Bergmann wrote:
> On Sat, Dec 17, 2022, at 23:52, Conor Dooley wrote:
> > On Fri, Dec 16, 2022 at 09:04:20PM +0100, Arnd Bergmann wrote:
> >> On Fri, Dec 16, 2022, at 17:32, Palmer Dabbelt wrote:
> >> > On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> >>
> >> I don't particularly like drivers/soc/ to become more of a dumping
> >> ground for random drivers. If there are several SoCs that have the
> >> same requirement to do a particular thing, the logical step would
> >> be to put them into a proper subsystem, with a well-defined interface
> >> to dma-mapping and virtualization frameworks.
> >>=20
> >> The other things we have in drivers/soc/ are usually either
> >> soc_device drivers for identifying the system, or they export
> >> interfaces used by soc specific drivers.
> >
> > Sounds like that's two "not in my back yard" votes from the maintainers
> > in question..
> > Doing drivers/cache would allow us to co-locate the RISC-V cache
> > management bits since it is not just going to be the ax45mp l2 driver
> > that will need to have them.
> >
> > Would it be okay to put this driver in soc/andestech for now & then move
> > it, and the SiFive one, once we've got patches posted for cache
> > management with that?
>=20
> I actually had a look at both of these drivers now and
> found that they do entirely different things, so I would
> revise what I had said earlier. Sorry for not having paid
> enough attention at first.

Eh, I wouldn't consider it to be your fault as, I at least, have been
ignoring this difference as...

> The Sifive L2 cache driver handles an interrupt from the
> cache controller that is trigger by data corruption
> (corectable or uncorrectable). This is used as an
> implementation detail of drivers/edac/sifive_edac.c
> and could probably just be merged into that file.
>=20
> The Andes cache driver in this series on the other hand
> does not do EDAC at all but instead handles cache maintenance
> for the dma-mapping interface by hooking into the
> inline-asm implementation details of arch/riscv/mm/dma-noncoherent.c
> as an errata fix.

=2E..we (Microchip) need to add similar cache maintenance to the SiFive
driver. Should have posted patches by now, but conferences + Christmas
have delayed that a bit.

> If we expect more nonstandard ways
> to manage cache controllers for this, I think this
> needs a proper interface in arch/riscv or drivers/cache.

The Zicbo* extensions for cache management arrived after people had
already been shipping SoCs that need stuff that isn't cache coherent.
On top of the two already mentioned, I am told there are two other
non-Zicbo* cache management solutions from SiFive alone - so I think it
is likely that we'll have variants here, unfortunately.

> This could be done the same way as arch/arm/include/asm/cacheflush.h
> with CPU specific cache management callback pointers, but
> can't really be a separate device driver without interacting
> with low-level architecture code.

I'll take a look at our patches again this week (they're 5.15 based, so
well out of date, vendor tree stuff). I'll try to whip up something
based on top of this series.

Thanks,
Conor.


--5hEnPjiiILINJZrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY62nNQAKCRB4tDGHoIJi
0gi7AQDLACy2bGPvhyYrKW7hKnC+g+nCLN/fPCvK02eG+uRMmQEAuYJbcKQkDSD/
Y4Lm9bRqaoqa+Pd25j6IyVYmOUJ1rQI=
=Apu6
-----END PGP SIGNATURE-----

--5hEnPjiiILINJZrq--


--===============2298795329199018256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2298795329199018256==--


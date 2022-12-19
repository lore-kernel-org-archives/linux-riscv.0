Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F34C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InkXAE4bzPUrwk8NIctNqo1ULddV/Xk2B2IBjb6M2V0=; b=Hek6+q1ivgB6RJM2QXwCGmoWzl
	nhTpdEFT75dFyBiWI1PROEpiWwedAD689/qPzjpsBSmDkgdiJmkjB3q8LdIKj8gcRdc+KVPdnW/At
	+bHHXsrl5m7XHMUsshSYh5SjxQgHzkhgKNsWzDlACllVrQpEn85npYz9yEUHlQv2ZwKR/Mg85pg8K
	Dnd5ZOIXMldQgQWggfma57aObhBvcEFrbwpfo4M0K3KfMMGsJpaISjjAKjK0oF0QOvkRFe+U5CoAX
	30FkpmBIoXSMj+u2ciNbQJ4H2owB69n/QjzlaylqoaL8hhHPbq2Wv1MUdvyr0k/gWO8MtC+ZEal6M
	nubF8lsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7KY1-00HCHm-So; Mon, 19 Dec 2022 18:07:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Iga-00FoYR-U4
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 16:08:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8A1FFB80E53;
	Mon, 19 Dec 2022 16:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344C3C433EF;
	Mon, 19 Dec 2022 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671466093;
	bh=GaN/OfjtkAnVoyul84cO7YLvk/ptcbZoS1Ejha+69j4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DGO8kQvS8xExkWQssXfwlmUbgHbc96olZ3YRdqmxojvI15qFrBgPjr5ouwsB+4zGX
	 F4cLUAKdEbR6lppx9pJUdXO71ezzyil1gIJVgX9w4bFat8Uw2QVTzrBIp5mgjKvDdR
	 Tig9kJ5N71++gipKN05PN3xLJ55Lc0uMx8WgpRZMdgfZJRn0mMfqocSMlQHY7RaNQe
	 75++9skU9t0eGQ00JydsXTeTFAXd8Dm0jZh3oAWEhxM9C4a0P8KpzaIGFFODDMWtkb
	 mvsIKU0BtZZ7o8zEck7WRWgzR19byJrwwRz17gnsp6sOz1ubb8PepP8DV8Catrn+x1
	 aYxT6Hp1R0JoQ==
Date: Mon, 19 Dec 2022 16:08:05 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>, soc@kernel.org,
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
Message-ID: <Y6CMZVPURrDSkcwt@spud>
References: <mhng-8b05b6cd-d8a1-4302-af24-2f64a4bf7c32@palmer-ri-x1c9a>
 <32cf0901-a4a0-48a7-bf42-f2cdb34d1ee7@app.fastmail.com>
 <Y55IQIxXw/twcxFx@spud>
 <CA+V-a8utcKKp81UTxQSvD6WsHgjO_7gSz33eedaE0+VxrR3f4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8utcKKp81UTxQSvD6WsHgjO_7gSz33eedaE0+VxrR3f4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_080817_381550_C552C68B 
X-CRM114-Status: GOOD (  46.37  )
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
Content-Type: multipart/mixed; boundary="===============0086926217078998100=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0086926217078998100==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="76/8+jUyugVdoQlq"
Content-Disposition: inline


--76/8+jUyugVdoQlq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 12:43:44PM +0000, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> On Sat, Dec 17, 2022 at 10:52 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Fri, Dec 16, 2022 at 09:04:20PM +0100, Arnd Bergmann wrote:
> > > On Fri, Dec 16, 2022, at 17:32, Palmer Dabbelt wrote:
> > > > On Thu, 15 Dec 2022 23:02:58 PST (-0800), Christoph Hellwig wrote:
> > > >> On Thu, Dec 15, 2022 at 01:40:30PM -0800, Palmer Dabbelt wrote:
> > > >>> Given that we already moved the SiFive one out it seems sane to j=
ust start
> > > >>> with the rest in drivers/soc/$VENDOR.  Looks like it was Christop=
h's idea to
> > > >>> do the move, so I'm adding him in case he's got an opinion (and a=
lso the SOC
> > > >>> alias, as that seems generally relevant).
> > > >>
> > > >> Well, it isn't an integral architecture feature, so it doesn't rea=
lly
> > > >> beloing into arch.  Even the irqchip and timer drivers that are mo=
re
> > > >> less architectural are in drivers/ as they aren't really core
> > > >> architecture code.
> > > >
> > > > That makes sense to me, it just looks like the SiFive ccache is the=
 only
> > > > one that's in drivers/soc/$VENDOR, the rest are in arch.  It looks =
like
> > > > mostly older ports that have vendor-specific cache files in arch (i=
e,
> > > > arm has it but arm64 doesn't).  Maybe that's just because the newer
> > > > architectures sorted out standard ISA interfaces for these and thus
> > > > don't need the vendor-specific bits?  I think we're likely to end up
> > > > with quite a few of these vendor-specific cache management schemes =
on
> > > > RISC-V.
> > > >
> > > > I'm always happy to keep stuff out of arch/riscv, though.  So maybe=
 we
> > > > just buck the trend here and stick to drivers/soc/$VENDOR like we d=
id
> > > > for the first one?
> > >
> > > I don't particularly like drivers/soc/ to become more of a dumping
> > > ground for random drivers. If there are several SoCs that have the
> > > same requirement to do a particular thing, the logical step would
> > > be to put them into a proper subsystem, with a well-defined interface
> > > to dma-mapping and virtualization frameworks.
> > >
> > > The other things we have in drivers/soc/ are usually either
> > > soc_device drivers for identifying the system, or they export
> > > interfaces used by soc specific drivers.
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
> >
> I think to start with it would be better if we place the Andes cache
> driver in the proposed "drivers/cache" folder. We would avoid
> unnecessary movement of code?

Uh, go for it I guess. I'll try to put out a few patches for moving the
sifive ccache driver & adding management stuff to it whenever I
inevitably get bored over Christmas.
The offer to make me responsible for applying patches for drivers/cache
still stands.

Thanks,
Conor.


--76/8+jUyugVdoQlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6CMYQAKCRB4tDGHoIJi
0p2JAP4qgoX8AjUnFfvkyiQnKGYSgRjn6eE8/0cwl5UwRGUNGAEAyc85loqs6i0w
m0enLNoFgKZY5jisIfnfQ46sgFafhwM=
=kmGJ
-----END PGP SIGNATURE-----

--76/8+jUyugVdoQlq--


--===============0086926217078998100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0086926217078998100==--


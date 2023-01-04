Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D27EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q85RzRE9B0mkr7UfkbYORMKoLlcy3LriLN/p8HpYQ1k=; b=jQTrvslIbXjk3eIOQwrqs91/Yc
	Ey1FIAguN4QmY6iCLASdh/e/pKSG3MeVhFCE+FM3gL40iAcQzABHxQl64+xNW+qcRQTcHuKNiYcOp
	nysrKzk39NX8FjvEbA/ny0MQnpT/CBfuWiccNV/CzJrSQZT2OkhY6hy9p3/GzOFyX0VEJjnXj0G8t
	Hd7sm9zeCPXI6k6+WeSAQT7jvXjOrVXGK7Y4sb3lMoIjNwuoCmpuIF3uwWElIrmQseccc+aV5+5It
	EoMWlvw7Sgad2jXgMbNKdfN47YnlIIP8Uso/C9yx30i9U2xk4eAYO3FjOr2x57DCNHybAVs1SSTDH
	oQePmG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5QL-009yrl-Rh; Wed, 04 Jan 2023 15:11:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2O1-008vYe-Ku
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 11:56:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E28DA6137B;
	Wed,  4 Jan 2023 11:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C48C433EF;
	Wed,  4 Jan 2023 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672833408;
	bh=VL7oF+AzyQYXaF7PH+uXZqx2tFpD8C3uCsVxv0/bqww=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=snNYvwMD22vsBIeoG4X1zfKQiNyxOKRsIG0AM8Fo9hipTx2wEj2WcuVb1s2nGZ5yx
	 QCsJjpUXRPGrEg2mVQLDYNxEzUj0CxfMmMbtwYGC/o7rfEQYLERNr/btfysRK7pNEq
	 /pY+1iK+meOv/ITnrsxxerbJ0x10Y7JRWswKi/3JGLHC3G9ptI2ZbMNZsw5L9PJcw2
	 v/u862REQdWih6LAlxeF4aWYjUks7OYtxMLL9O8o5Lv7KQUrzd8YHlWFDUzIUktlFZ
	 ib6yq/2FrQ0SPIC5GRHQ8KkTk2mEN6Ct88bcKBKp3KMSLkDq6ti2IdveaUYne48rTL
	 eIKIxuqnYok+Q==
Date: Wed, 4 Jan 2023 11:56:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	guoren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, soc@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache
 flushing capability
Message-ID: <Y7VpeK48nslxklkF@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
 <Y7TBh+CJdZPJ6Xzl@spud>
 <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
 <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
 <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_035649_906356_2125BC33 
X-CRM114-Status: GOOD (  29.66  )
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
Content-Type: multipart/mixed; boundary="===============7485245650042558920=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7485245650042558920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tdud8ZJ0IxlakT31"
Content-Disposition: inline


--Tdud8ZJ0IxlakT31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

On Wed, Jan 04, 2023 at 11:19:44AM +0100, Arnd Bergmann wrote:
> On Wed, Jan 4, 2023, at 10:23, Conor Dooley wrote:
> >>Right, no need to touch the existing file as part of this series,
> >>it probably just gets in the way of defining a good interface here.
> >
> > Sure. Can leave it where it was & I'll sort it out later when it's=20
> > errata etc get added.
> >
> > Btw, would you mind pointing out where you wanted to have that if/else=
=20
> > you mentioned on IRC?
>=20
> I meant replacing both of the runtime patching indirections in
> arch_sync_dma_for_device(). At the moment, this function calls
> ALT_CMO_OP(), which is patched to either call the ZICBOM or the
> THEAD variant, and if I read this right you add a third case
> there with another level of indirection using static_branch.

Yah, pretty much.

> I would try to replace both of these indirections and instead
> handle it all from C code in arch_sync_dma_for_device() directly,
> for the purpose of readability and maintainability.
> static inline void dma_cache_clean(void *vaddr, size_t size)
> {
>         if (!cache_maint_ops.clean)
>                zicbom_cache_clean(vaddr, size, riscv_cbom_block_size);

And I figure that this function is effectively a wrapper around ALT_CMO_OP(=
)?

>         else
>                cache_maint_ops.clean(vaddr, size, riscv_cbom_block_size);

And this one gets registered by the driver using an interface like the
one I already proposed, just with the cache_maint_ops struct expanded?

Extrapolating, with these changes having an errata would not even be
needed in order to do cache maintenance.
Since the ALT_CMO_OP() version would only be used inside
zicbom_cache_clean(), assuming I understood correctly, a driver could
just register cache_maint_ops for a given platform without having to
muck around with errata.
If so, that seems like a distinct improvement over my suggestion & gets
around the thing I mentioned in 0/9 about a shared case in the
alternative application code.

Again, assuming I understood correctly, I like this a lot.

> }
>=20
> void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>                               enum dma_data_direction dir)
> {
>         void *vaddr =3D phys_to_virt(paddr);
>=20
>         switch (dir) {
>         case DMA_TO_DEVICE:
>         case DMA_FROM_DEVICE:
>                 dma_cache_clean(vaddr, size);
>                 break;
>         case DMA_BIDIRECTIONAL:
>                 dma_cache_flush(vaddr, size);
>                 break;
>         default:
>                 break;
>         }
> }
>=20
> which then makes it very clear what the actual code path
> is, while leaving the zicbom case free of indirect function
> calls. You can still use a static_branch() to optimize the
> conditional, but I would try to avoid any extra indirection
> levels or errata checks.

The other thing that I like about this is we can then remove the various
calls to ALT_CMO_OP() that are scattered around arch/riscv now & replace
them with functions that have more understandable names.

Thanks Arnd!
Conor.


--Tdud8ZJ0IxlakT31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7VpeAAKCRB4tDGHoIJi
0qQsAQDomY43mfhf5tuVslNFGbFLsI5DjkZPO/5jL23g3ssjogD+ML7u3JxZU2n5
d/kCqDu2vZUi/C+qFucg7GEUjr4QPQU=
=hh3j
-----END PGP SIGNATURE-----

--Tdud8ZJ0IxlakT31--


--===============7485245650042558920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7485245650042558920==--


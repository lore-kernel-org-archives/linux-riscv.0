Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9D1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFXrnIMZCX1aWJEcHlpeNBnlrZIz29nnenYsjX55yT4=; b=GquO+1al1XcPfNr9jiqpeI1zvo
	18SWeHDZWrqGmA9BlkjDMYhcn5jKjfNuQU3/cq/KcpJQ4GsSWCRnAyu75qnbKK7CGdyb5ICtsB/od
	AbxjfA/5cs6XFhqGDkz1uPZ8MzfvWa8M0bhaRCKdhXyQgoV32AMWjfHEqhoePFmFBmDYGEMvHjClq
	66za4na6UUVaPveQf8q3jPmbRrfywAGqqS3iSsUwAtmDihqzBmubrfEF3Vq1r5G0HGawJBfnvGQvf
	o1sNwwJzp8FsoOQWWHI08Qo0lpXF5SXlZ8JBu5iFGcHLtQF8Qy91U2HiYCUgtimkuOZhoAibsU8FG
	5fCSkuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7KoB-00HOs4-E8; Mon, 19 Dec 2022 18:24:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Iuo-00FyzD-U9
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 16:23:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 50BC7B80E8F;
	Mon, 19 Dec 2022 16:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97458C433D2;
	Mon, 19 Dec 2022 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671466976;
	bh=AP7So4vFX8TXSzeR4auXo5dAvhGr1KjNOTVhu/9sCEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oamcbvikShoZe+LabtlC0VsHGm6bzhr/TxE0TnD1Q/7LxL+ZTr/Mump8QwJ+jUjBJ
	 Y8v9fBNnh9iwMnqpFkS9MrbHkX+mUyAf/ZZZ/JF3ofToeKbOSGl/XXv75BZ+6t5C1K
	 nKCXohA9y+AbLpj+yfSZWax8OlEEG8BbLv2Vna7fZKPEFdYGy3MAq6APYO9pNsf15Y
	 Z2f8506iv+qg3QSD+nYbrQQ9MKHhqZ0e6zdYs3tQ3RXfM8Oih4txWTmGpl+7LfcPEh
	 f+OdxNtY/fackoBHoj7GEBmmizJDMFJmAZRVGTzYpvBbwc+YaVmaoDCT2xhQLT8ASn
	 4scxP6PFMhvDw==
Date: Mon, 19 Dec 2022 16:22:49 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
Message-ID: <Y6CP2VhKUPZixQ8r@spud>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y543kM4070CSDtZi@spud>
 <CA+V-a8ss0idLDoc+J8-Undqd+DUGrpeytenzSxV8xMs2N3dh1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8ss0idLDoc+J8-Undqd+DUGrpeytenzSxV8xMs2N3dh1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_082259_428261_7B9A503D 
X-CRM114-Status: GOOD (  20.39  )
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
Content-Type: multipart/mixed; boundary="===============4368587371472371773=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4368587371472371773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kqnHAilnmtzrgK7g"
Content-Disposition: inline


--kqnHAilnmtzrgK7g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2022 at 11:15:17AM +0000, Lad, Prabhakar wrote:
> > On Mon, Dec 12, 2022 at 11:55:00AM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Introduce ALTERNATIVE_3() macro.
> > >
> > > A vendor wants to replace an old_content, but another vendor has used
> > > ALTERNATIVE_2() to patch its customized content at the same location.
> > > In this case, this vendor can use macro ALTERNATIVE_3() and then replace
> > > ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.
> > >
> > > While at it update comment above ALTERNATIVE_2() macro and make it generic
> > > so that the comment holds good for any new addition of ALTERNATIVE_X()
> > > macros.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > + *
> > > + * Usage:
> > > + *   ALTERNATIVE_x(old_content,
> > > + *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
> > > + *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
> > > + *      ...
> > > + *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
> > >   */
> > >  #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> > >                                  new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)         \
> > >       _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,    \
> > >                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> > >
> > > +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> > > +                                new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,         \
> > > +                                new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)         \
> > > +       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,  \
> > > +                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,  \
> > > +                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
> >
> > btw, why is this indented with spaces when the line above it is indented
> > with tabs? (At least, that is how it appears in mutt).
> >
> I'll update it with spaces.

The file uses tabs, so it'd be switching the spaces you added with tabs,
right?

--kqnHAilnmtzrgK7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6CP2AAKCRB4tDGHoIJi
0qYJAP9z2qR+D518JddxaVh4saksLN5VBZkCC4Q+XUHzt9P+owEAuU1gIeb1wFlg
6cbJwCN63kPV3dyn8vIDqGfyF7bUvQA=
=z9Dl
-----END PGP SIGNATURE-----

--kqnHAilnmtzrgK7g--


--===============4368587371472371773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4368587371472371773==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC56FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17aNU+rgObtjvrEPVx7hYBOmktKvX+DtclJgkmwkaKY=; b=vodGooZ6knc7PYSxdr8vUH44Aw
	Xan5W2dC5jtwECMdFYc5KRJ2LNYQ4roDgwyu1V+fFVMkq0cAhQpSQOP+APxnYylLs2ZSyYszPRQT9
	jmVZUYNu/oAKe1NsIA+Kh05OdziKd0czShnYvdAY5zNk2u6zya4okDe2vL+orsX4XiVFoiJF2gqHo
	j6ssXpzJElCRvzTjvo4dFl5GFEDjumBH3fS85mAlwnnewkgPvp5pXS46gxJScLk+OXsuH1h3nTL/R
	M3qGbzvipRyrsm/bbMkyaHN95o27N42EbR7+Hv3UhHumEha+MnsqOT5PRsR52B7GoCLiQltgM1i2L
	3dA91DHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd972-0000000Bb4f-1VYI;
	Fri, 26 Jun 2026 16:09:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd971-0000000Bb4W-2Csz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 16:09:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 257844185C;
	Fri, 26 Jun 2026 16:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB561F000E9;
	Fri, 26 Jun 2026 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782490143;
	bh=Fx3tciuHyjlkIBIBNEBD+s8vVCSZdcyUAOaq3PBg7Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQZOZQVlKUG92jlBmV7tChmBKGdzefozF27KNgP05RnlO6UgoAp/85WdimyWCLTJN
	 ZFGfCICs2z+ZEzedTCQH+Nje6VFRH6R1EzPqC+LuVN+owy7Nivt7G3oHHNYIGfYK77
	 aNv6xDG5Pb0kYE8UfgrAV9vC/wfbZSLC+LuOi1SoZrmhLHK+5iUJBJ5GJxcLsJY3Oj
	 hdcnrobdPhRHYU1nMv6tqfCHXew1xsF5yJR5PRizgB1N+mvPkDcru3Fz1GyAwPhzDY
	 47GHd4+qSlkAW6Mc+Q2uwWR0JFH/3xYj7438e/s27fcK6u74CvijZNWFKNh1tCOT/7
	 rNF/9jor31ViQ==
Date: Fri, 26 Jun 2026 17:08:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: riscv: Add generic CBQRI controller
 binding
Message-ID: <20260626-refining-thus-6635a0f7c5cd@spud>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
 <20260625-cupbearer-failing-9ce0abf97b93@spud>
 <aj1_0AnIBk8_xoDd@gen8>
 <20260626-immobile-staining-c825a86bd613@spud>
 <aj6jLrECZM18I4MP@thelio>
MIME-Version: 1.0
In-Reply-To: <aj6jLrECZM18I4MP@thelio>
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
Content-Type: multipart/mixed; boundary="===============6996208715113793364=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6996208715113793364==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fQnCqX8ZQXXtFFbN"
Content-Disposition: inline


--fQnCqX8ZQXXtFFbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 09:05:02AM -0700, Drew Fustini wrote:
> On Fri, Jun 26, 2026 at 04:44:56PM +0100, Conor Dooley wrote:
> > On Thu, Jun 25, 2026 at 12:21:52PM -0700, Drew Fustini wrote:
> > > On Thu, Jun 25, 2026 at 05:19:28PM +0100, Conor Dooley wrote:
> > > > On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> > > > > Document the generic compatibles for capacity and bandwidth contr=
ollers
> > > > > that implement the RISC-V CBQRI specification. The binding also
> > > > > describes the common riscv,cbqri-rcid and riscv,cbqri-mcid proper=
ties,
> > > > > and the optional riscv,cbqri-cache phandle that links a capacity
> > > > > controller to the cache whose capacity it allocates.
> > > > >=20
> > > > > Assisted-by: Claude:claude-opus-4-8
> > > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++=
++++++++++++++
> > > > >  MAINTAINERS                                        |  1 +
> > > > >  2 files changed, 98 insertions(+)
> > >=20
> > > Thanks for the review.
> > >=20
> > > [..]
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - description: Tenstorrent Ascalon Shared Cache
> > > > > +            const: tenstorrent,ascalon-sc-cbqri
> > > > > +          - const: riscv,cbqri-capacity-controller
> > > > > +      - enum:
> > > > > +          - riscv,cbqri-capacity-controller
> > > > > +          - riscv,cbqri-bandwidth-controller
> > > >=20
> > > > Please modify this, as has been done for other riscv spec related
> > > > bindings, to let people get away without using device-specific
> > > > compatibles.
> > > >=20
> > > > In this case, you can just delete the first entry from this enum, s=
ince
> > > > it already has a user and only have to implement this feedback for =
the
> > > > second entry.
> > >=20
> > > Would this work?
> > >=20
> > > properties:
> > >   compatible:
> > >     oneOf:
> > >       - items:
> > >           - enum:
> > >               - tenstorrent,ascalon-sc-cbqri # Tenstorrent Ascalon Sh=
ared Cache
> > >           - const: riscv,cbqri-capacity-controller
> > >       - items:
> > >           - {}
> > >           - const: riscv,cbqri-bandwidth-controller
> >=20
> >=20
> > Should do, yes. I question the need for a comment though, seems pretty
> > evident from the compatible what it is.
>=20
> I was thinking people may not know that 'sc' is the Shared Cache. I
> probably should have shortend the comment to 'Ascalon Shared Cache'.
> Anyways, I can drop it.


Or call the device "ascalon-shared-cache-controller"!

--fQnCqX8ZQXXtFFbN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6kFQAKCRB4tDGHoIJi
0ngnAP4+tZ3gpzZDlXPPujWnhu7Hv/STeRXLHNaHQpmbLVywZQD/fdcUyQlrk7zr
qDRq2QQ5uj/CfqxhWarfWX1g1+enBwE=
=RBQ8
-----END PGP SIGNATURE-----

--fQnCqX8ZQXXtFFbN--


--===============6996208715113793364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6996208715113793364==--


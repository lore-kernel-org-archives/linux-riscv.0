Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F2C5CFEB
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUQBp2L4H+q9kdG1sWuyAW1pg+f0r7o6/kHHsf9J5RM=; b=kTdaONxoLz0IDZfmZdhb0Pnm5s
	Tm6r7T5WfEIkrfZsOwkf9BMTFZFaPy3k6msOj9H4JyYuXpn0XEKKaYKaJIu83jWUiLgbI0pFzYXEx
	4EzTKMZn6qfhmqMM+Y9l70qSMXZOud49meHonHbSXeEcfeVf4tgXnghYu1nNGw790hXZYoCyvwaae
	gmMZjZcPE7NO6gAgVDp6xMYVxIa/AAD3SwqO1VxGHVJ8F3e/DtzA42AmoRBE6mXXcs0Tb+8hSR786
	D1eMgjCw6hFJ4zr6A32rlZFkF0OMwOnup2DKNOONS6Bq9kC0CdqVppORu+1STpswa5duB0ZMT4/Vs
	pGvAAamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYyh-0000000FeoT-436e;
	Fri, 20 Feb 2026 22:28:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYyg-0000000FeoL-3BjL
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F91B60123;
	Fri, 20 Feb 2026 22:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7266C116C6;
	Fri, 20 Feb 2026 22:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771626481;
	bh=wE0q/7dkOqR1gW9ECzxwZTApOZqI/Y970y7z51cz0x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LELsAyP5zFERbgoJyfb6/3Jspc2YS9em7Ak2InKMdysOGPKJefGB22bdtnX970DA5
	 I7wiFwsT/yPn2+cjNanoMfmHI5CeZpsE+emmQT/hKQlW7HOjUXpxYXBiLDcIdmRZe9
	 asbNdn2KS3dFWbEdXfRFor/DzIUqmCT7UNg0a3umGYM5YKmRFx6nf7I7Xd/AbLFqt8
	 nnfkPC99V7o5oZEdmELPMFjuyTW9hpALr5UBkFsoOX9L+G+7UISXPOQnP5O/CGX0xD
	 9pOMRZ13MxCWQa9uXpD1Lq26U6expXd9Xi3Efg1oefBLBWNd84vRwvX2zovvuWWNfP
	 n5pBfm5r1MVUA==
Date: Fri, 20 Feb 2026 22:27:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Max Hsu <max.hsu@sifive.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Green Wan <green.wan@sifive.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Debbelt <palmer@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] riscv: dts: sifive: fu740: add PDMA device node
Message-ID: <20260220-trilogy-passerby-fc792af8a00a@spud>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
 <20260221-pdma-v1-5-838d929c2326@sifive.com>
 <aZjEegxkIH3tqBo-@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
In-Reply-To: <aZjEegxkIH3tqBo-@lizhi-Precision-Tower-5810>
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
Content-Type: multipart/mixed; boundary="===============4915716145904990068=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4915716145904990068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fcTsCJeLa/9CujzX"
Content-Disposition: inline


--fcTsCJeLa/9CujzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 03:30:50PM -0500, Frank Li wrote:
> On Sat, Feb 21, 2026 at 03:43:57AM +0800, Max Hsu wrote:
> > The FU740 SoC includes a 4-channel Platform DMA (PDMA) controller.
> > Add the device node to enable DMA support.
> >
> > Signed-off-by: Max Hsu <max.hsu@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/bo=
ot/dts/sifive/fu740-c000.dtsi
> > index 6150f3397bff..30d0d6837c57 100644
> > --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > @@ -329,6 +329,15 @@ gpio: gpio@10060000 {
> >  			clocks =3D <&prci FU740_PRCI_CLK_PCLK>;
> >  			status =3D "disabled";
> >  		};
> > +		dma: dma-controller@3000000 {
>=20
> not sure sifive, generally require orderby hex address, and need empty
> line between child node.

Correct on the ordering front, but the latter appears to be the style in
the file at the moment so I don't care about that.

>=20
> Frank
> > +			compatible =3D "sifive,fu740-c000-pdma", "sifive,pdma0";
> > +			reg =3D <0x0 0x3000000 0x0 0x100000>;
> > +			interrupt-parent =3D <&plic0>;
> > +			interrupts =3D <11>, <12>, <13>, <14>, <15>, <16>, <17>, <18>;
> > +			dma-channels =3D <4>;
> > +			clocks =3D <&prci FU740_PRCI_CLK_PCLK>;
> > +			#dma-cells =3D <1>;
> > +		};
> >  		pcie@e00000000 {
> >  			compatible =3D "sifive,fu740-pcie";
> >  			#address-cells =3D <3>;
> >
> > --
> > 2.43.0
> >

--fcTsCJeLa/9CujzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjf6wAKCRB4tDGHoIJi
0lEjAQDjgGPf3wvEr+LErvWPWwlnhitG9RybYY14S/6K35R3+QD9Estycm/22oj6
3d+6HADdHDeuruwB3TxblckrVngfsQQ=
=FSgS
-----END PGP SIGNATURE-----

--fcTsCJeLa/9CujzX--


--===============4915716145904990068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4915716145904990068==--


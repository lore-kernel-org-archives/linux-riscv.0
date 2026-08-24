Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B518C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4dafzoqVMkZ0yHLFKUGdRMA4or4uTk2oc5/Ry8xf1E=; b=GRDx1pMhfTXyivOngsPrBH/I3P
	QD9cRp37IeoC10Te3QPKo8R6N6vzh3v+TAAvQem8Vy4kVrPUem2FL2fSJzT1MCSBn1wPrYcBh3lR7
	Mq/xkk9LQprL1yMKKPlQr1Is//CNodwxTU2iob6gBoA48KojtSfLJ7O9hYwyNvhsPFFI4at3Dg7n9
	QxpSF1rjK7XtMfwgvtzNmmYyTZjvYheccs6m6wQL49grFd3GiABkn9NL+/hYiPY9Cmc0RCbTipIrd
	wwDcRXhsYNKwt+WEdF0Z00okMOoxQokw+JCHL6sd+UEeOMD5pV22AKQu/J4Z8LQVyEmBnfQi3plaC
	I4aAoflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYEo-0000000H8Ns-2OxM;
	Mon, 24 Aug 2026 17:13:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYEn-0000000H8Nl-23xW
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:13:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 401E043A39;
	Mon, 24 Aug 2026 17:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D80A1F000E9;
	Mon, 24 Aug 2026 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591613;
	bh=HvDdBWD/b23UU+vg6S9XZEJcnKbBpxrpqSQC4IwZkdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RYvhHHzvymTrIPxmkLDVXIoTZDb3OjzWIkHKZ+7n0i/+EripyZcO4BJb8847H0ENP
	 u2d/vQmiNRugm5DC7flQzHAR2acnUtUdLXF9NT/CwPZRwC6dMOBU45oV8NaHYgJPE0
	 QbGaebMnfk6SbkSL5PbDxgnkO7udof27GbMBej/0IXxGbrEqecXIZtCNbFJJVSAp43
	 8jUy4zomG24U/FixrxL5ULgNk+9Ed/3CgqkKfsfo6Sm1+nJUFZSSKCedhV9cm8d7Mn
	 IhYeUyHdnwprnmYpo9nbaFLBl+ssUIKwmJ6+bwSUaSPcDa+qlz7CeI/UC+3gIKFV2t
	 fh70a5Xoj+AIA==
Date: Mon, 24 Aug 2026 18:13:25 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: net: snps,dwmac: Add compatible for
 UltraRISC DP1000 SoC
Message-ID: <20260824-blimp-spirited-01365897db24@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
 <20260824-bride-food-052b313e4b76@spud>
MIME-Version: 1.0
In-Reply-To: <20260824-bride-food-052b313e4b76@spud>
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
Content-Type: multipart/mixed; boundary="===============5161978188376159576=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5161978188376159576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5O4Q84D38y4t01tR"
Content-Disposition: inline

--5O4Q84D38y4t01tR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 06:09:48PM +0100, Conor Dooley wrote:
> On Mon, Aug 24, 2026 at 01:54:21PM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> >=20
> > Add the SoC-specific compatible string for the UltraRISC DP1000 GMAC
> > controller to the DesignWare MAC binding.
> >=20
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
>=20
> The dts may not be right, but I am also a bit concerned here.
>=20
> This binding permits 100s of combinations of properties, of which only
> a very limited set can be correct for your device. Just adding the
> compatible permits all of this variation.
>=20
> Please add some restrictions.

In fact, it's particularly bad here because you don't even restrict
which fallback compatibles are used, so there's no guidance on what
version of the IP is even in use!

>=20
> pw-bot: changes-requested
>=20
> Thanks,
> Conor.
>=20
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 2449311c6d28..2ed4564ae99d 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -119,6 +119,7 @@ properties:
> >          - starfive,jh7110-dwmac
> >          - tesla,fsd-ethqos
> >          - thead,th1520-gmac
> > +        - ultrarisc,dp1000-gmac
> > =20
> >    reg:
> >      minItems: 1
> >=20
> > --=20
> > 2.34.1
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



--5O4Q84D38y4t01tR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox7tAAKCRB4tDGHoIJi
0lp+AQDCJM0dwn64CDrt7zalPVln36JhAawbBkUx93Z07kRzOAEAvJON583LI3qh
FHzphlniOwb9apW2Tc4SX/52jr+RoAo=
=+EOL
-----END PGP SIGNATURE-----

--5O4Q84D38y4t01tR--


--===============5161978188376159576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5161978188376159576==--


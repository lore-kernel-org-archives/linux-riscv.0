Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DBBC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkM5RBIh2Z8pK4uynSob8cjV81j58F+TLQbwNIwvQxM=; b=QEMT8Djg4x9LhRAtjkSt0XAk9y
	xqlqp2F4uXGup1mUhGiNou68TRar1ZSrCTEaO73RXqX4BpudfNLLfCCxIznnfScCFgZe0jMntW+dK
	Z06KOcIXG25q8cgl3MnYdgSWzANQuXSiUdXRfFz9aiMnlxZ+fhBunJrSn2LmkOPkyRkD++uejpaS0
	6AJRB/hKl1uV9vlmoWqxoG+Ur9Ev4xtyG9auiebVf8RNsOMeCq+S9auriJJBg8Mvuto3JhIulDDNM
	viBM5PhcqbSnjJm3XzMavKgztO412lTSpSodNpQl6UCJw4SZr3kuAUJVnpFskCJPZRv/h62rI2RoJ
	3FJYGpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpSI-0000000CH1Y-1szZ;
	Thu, 26 Jun 2025 16:28:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpIE-0000000CExQ-3eO0
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 16:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBBD76112A;
	Thu, 26 Jun 2025 16:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB5FC4CEEB;
	Thu, 26 Jun 2025 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750954661;
	bh=FcMAs4cr6VLQ5THiQAsVxnlsWy5vYErs3oBHPmAG8rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIwKM+p0PZQE8g8sIkRqSQ4pFAucadt2eHG9gKidUiUnYTNHh6SK8ua2r3gDc5lvO
	 FJ19t8rEjqbwq8j48SKX05rsC/DZ6QSNa46wMSnxJiiCMDgATUAkLBqHCAWB/ifFNX
	 A0fLpNl+YCMvPaeguUnKtSGYRX79Z8i4/dbgSWHjkTftrm+pOtjJ2dViSRqZ2z3ZIL
	 R6SZtShOUvmWS7bl140VQYeCs3EQVDcx3KLdTG94gXgpfVIaavjhLR5Y004OZgaBNA
	 Lt6c8xS6LoAUHtByo5WYe1zVDi1+hg/wAy8KqpJPbazJTRr4woZ/rRrkHWBVfxOYOV
	 aWwmh46j697Cw==
Date: Thu, 26 Jun 2025 17:17:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250626-glandular-founder-2f44973683e5@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <20250625195858.GA2115486-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250625195858.GA2115486-robh@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2613087525673962033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2613087525673962033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iC7+lZmyKlilUlMQ"
Content-Disposition: inline


--iC7+lZmyKlilUlMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 02:58:58PM -0500, Rob Herring wrote:
> On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > The Sophgo CV1800/SG2000 SoC top misc system controller provides regi=
ster
> > > access to configure related modules. It includes a usb2 phy and a dma
> > > multiplexer.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++=
++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/soph=
go,cv1800b-top-syscon.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv18=
00b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
> > > new file mode 100644
> > > index 000000000000..e8093a558c4e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top=
-syscon.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > +
> > > +description:
> > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > +  register access to configure related modules.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: sophgo,cv1800b-top-syscon
> > > +          - const: syscon
> > > +          - const: simple-mfd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +patternProperties:
> > > +  "dma-router@[0-9a-f]+$":
> > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> >=20
> > I think you're supposed to add "unevaluatedProperties: false" to each of
> > these nodes.
>=20
> Not necessary if the referenced schema has=20
> unevaluatedProperties/additionalProperties set to false. The tools check=
=20
> for this.

Oh cool, that's good to know, thanks.

--iC7+lZmyKlilUlMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF1yoAAKCRB4tDGHoIJi
0psEAQCiyo1+b9AvMe/EpRaJklfQNqQpCR9Mv1sARmJoDpdRKwD+Me8ov5JrZ4p0
Q47E/uNqXiO6fziM3poa8aA91Wj/8w8=
=/sgH
-----END PGP SIGNATURE-----

--iC7+lZmyKlilUlMQ--


--===============2613087525673962033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2613087525673962033==--


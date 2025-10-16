Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9D2CCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjzycDVRr1NwpSZJSVceYVrbhdZ1lnhi/peW5sZsEV0=; b=WpPQ43h8ZTJXcpVjRPNTRdugdL
	SfAYQeIpukYK7Qq3hxOxZrVXqDgCghU9oevyBpNmtnwCVlJW7gTpelLYujyc1IoRvTfKB7nA2Zh2I
	jhrBRBJBtrJx1vJtyl5eOKse8t3qUcdR+tz1Tdf9ia5sYCwOIYCdiHXTdiIpv99U4gK7pRJUodUVR
	ATIPPw129RYULkM6MVVNpbQ3Fl/0Q5fg8e/xE+4Hg0cKJX1mytAK3oLH316B9ixSlMvA5RK3o/wGn
	c1bPKPRgckmWiX44N0gunrI59bIsN0zZPa0t5qN3kmDJRFceVNhiFKB3BF6+dDbqjyEpt10R6buHs
	uBnhLirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QGT-00000005GhC-13w1;
	Thu, 16 Oct 2025 15:51:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QGR-00000005GgP-1D4M
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 15:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A23546402A;
	Thu, 16 Oct 2025 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F3AC4CEF1;
	Thu, 16 Oct 2025 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760629898;
	bh=oq62L0QEd7GMpJS9eO2BskgBIJhoVEYg5AjMxl/aOgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyU80uoGG5kkW2++eUWu/SaamQze8xl4dWD0p4gadFBX6zlV4xiC2kRdqhSN8KTfv
	 0tzoGlONFV2sfqft42lulCb0CBRRddTlq8P5aUovib+1Ymmmiulw+sKKtZHw26Kljh
	 BwbYybapIwG+terlVH+cN/sa/Muyl5xe8dacgFlN21nP2UssMMuTOf1/1o8P3RZWSq
	 X2+NBTgvg7WFQ7+uMTXf+dshmkgqbkW5MHLsKxF+UF/IRDjXOjkuXHMfQb71Vk3GDq
	 YnoRWAke6Va5ytrbKmO57fhyMWVEV5FiC77Yw/GinFZmKGJmYi4bIdtRK2QYFpEEjM
	 y2XkgdeRysKyQ==
Date: Thu, 16 Oct 2025 16:51:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	E Shattow <e@freeshell.de>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 2/7] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
Message-ID: <20251016-countable-probing-062cd0504baf@spud>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-3-hal.feng@starfivetech.com>
 <a4c5e7fd-a37d-4729-ad58-81523f813fb3@canonical.com>
MIME-Version: 1.0
In-Reply-To: <a4c5e7fd-a37d-4729-ad58-81523f813fb3@canonical.com>
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
Content-Type: multipart/mixed; boundary="===============4527172213382279235=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4527172213382279235==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0gGGbfbrsf7Gc4JG"
Content-Disposition: inline


--0gGGbfbrsf7Gc4JG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 10:58:41AM +0200, Heinrich Schuchardt wrote:
> On 10/16/25 10:00, Hal Feng wrote:
> > Add enable-gpios property for controlling the PCI bus device power.
> > This property had been supported in the driver but not added in the
> > dt-bindings.
> >=20
> > Fixes: 22fe32239770 ("dt-bindings: PCI: Add StarFive JH7110 PCIe contro=
ller")
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >   .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml         | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie=
=2Eyaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > index 5f432452c815..f254c7111837 100644
> > --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > @@ -60,6 +60,10 @@ properties:
> >       description:
> >         The phandle to System Register Controller syscon node.
> > +  enable-gpios:
> > +    description: GPIO used to enable the PCI bus device power
> > +    maxItems: 1
> > +
>=20
> Shouldn't we try to keep the entries alphabetically ordered?

Grouping the two gpios together also has some value. I don't think it's
particularly important which way it is done.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Otherwise looks good.
>=20
> Best regards
>=20
> Heinrich
>=20
> >     perst-gpios:
> >       description: GPIO controlled connection to PERST# signal
> >       maxItems: 1
>=20
>=20

--0gGGbfbrsf7Gc4JG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEUhQAKCRB4tDGHoIJi
0kHnAP91tU6Elbe7EoQ06v9wFqPRkrxkwtDTP1VqY/ANSWwhiQD+IXGZb8bDIsQY
1ijBK46Ge9swvJk32RZqngcbnhRZ+A8=
=rpz9
-----END PGP SIGNATURE-----

--0gGGbfbrsf7Gc4JG--


--===============4527172213382279235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4527172213382279235==--


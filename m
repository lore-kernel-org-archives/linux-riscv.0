Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496CF10775F4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URedYalf6nTHm3Nmtkg75G6K3UsyLQRkF+Cv4XZx864=; b=X4UkTV6Cp/IExZ+kfw2S93uIpw
	11kO0QUXarELu1z7TMu6EWXRirTkpaj1Ea4+M6DgwKuV5STerlEEN9rVHmYCnCbp0GtatkElS4Wlt
	PfdS3l0fsISA43DLOqX1iACf2xr5knq2LWsKlzeFU4/2z+2oSekV30OxgtisMt2hVs7Ok93hcHl6s
	7XJinbXXoYltFR55mD/rsPUmFyV6utagk4/KYaiKivb61BcVOJVE109iXYKN/njcPDs57fw00yi/Y
	5Egcz8dT4J/QIk/8+bwb/NXwxNBLgQmvx7Kv+QdU9nZQ2ZUM7IvbqQtNwKYngP186oSxZaFSTcniT
	eLdhetOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uap-000000093h3-1WZG;
	Wed, 18 Mar 2026 17:22:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uan-000000093g6-1xDr
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 17:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE41D42A5C;
	Wed, 18 Mar 2026 17:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62995C19421;
	Wed, 18 Mar 2026 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854520;
	bh=RbflVVAPE2po6tgMjPMGmvrHAg0qgOj85Ij3mwxQhb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ER13sYwth0Kfn2l7L6Hfue8AMtL/49O0yjz2cvqpEBQuRu5NkihEHp38ocVegTQ+6
	 HZMdVrIkIPy0RtRRkbN0cmK2B1emb4URSXCfZZybD4tAO061iWSScTAWwecSkGGWdb
	 qgD5bbT31BcMuFVhF3iW8i9wiZxgVfxjeOJu075+uMu4KG5CD/C/Hb5n5wy5kuC5hf
	 jyMirTdwy4pP84fU078nVeK9F8t/kAXONcFwk9qoZSRSx1F8mXQeOcvU7ssYApSlrD
	 4gYnrCP/cShX7AKMCG47TwZq9D63ve17ler1ZAId8UPIARwpanjB8U44aIit2WrQ/Q
	 mtqjCRGrzwInA==
Date: Wed, 18 Mar 2026 17:21:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260318-crock-tinderbox-ae12024627d9@spud>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260317214435-GKA453922@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_102201_551581_F726FE48 
X-CRM114-Status: GOOD (  23.74  )
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
Content-Type: multipart/mixed; boundary="===============0134455466676734800=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0134455466676734800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9yXgHBynxFH/8bE"
Content-Disposition: inline


--l9yXgHBynxFH/8bE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> Hi Conor,
>=20
> On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > Add compatible string for DWC3 USB controller found in SpacemiT K3 So=
C.
> > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > >=20
> > > Explicitly reduce number of phy property to minimal one.
> >=20
> > Is this valid for the existing compatible, will it work with only one
> > clock?
> >=20
> I didn't change clock binding, do you mean phy?
>=20
> Both k1 and k3 work with one clock (no change here)
>=20
> for phy, the existing k1 requires two. for k3, one controller requires
> one phy due to only has USB2.0 support, other controllers requires two
> phys - USB2, USB3 PHY

Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
constraints for the k1, can you please add a conditional section to the
binding to enforce 2 phys min for k1?

>=20
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 ++++=
+-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.y=
aml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > index 0f0b5e061ca1..cc27b363ca79 100644
> > > --- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> > > @@ -27,7 +27,9 @@ allOf:
> > > =20
> > >  properties:
> > >    compatible:
> > > -    const: spacemit,k1-dwc3
> > > +    enum:
> > > +      - spacemit,k1-dwc3
> > > +      - spacemit,k3-dwc3
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -42,11 +44,13 @@ properties:
> > >      maxItems: 1
> > > =20
> > >    phys:
> > > +    minItems: 1
> > >      items:
> > >        - description: phandle to USB2/HS PHY
> > >        - description: phandle to USB3/SS PHY
> > > =20
> > >    phy-names:
> > > +    minItems: 1
> > >      items:
> > >        - const: usb2-phy
> > >        - const: usb3-phy
> > >=20
> > > --=20
> > > 2.53.0
> > >=20
>=20
>=20
>=20
> --=20
> Yixun Lan (dlan)

--l9yXgHBynxFH/8bE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrfMwAKCRB4tDGHoIJi
0uYgAP4hNROGafNxKj4L7xTfPFe4fXHdldzt4A56nNUAqNTlDwD/cLpaVshh9YeN
cHdEm4s7WhmsyY96RlR4h00BLzlh3gc=
=hS48
-----END PGP SIGNATURE-----

--l9yXgHBynxFH/8bE--


--===============0134455466676734800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0134455466676734800==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5ABC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MW1D66Xct3/Mort95/Fr9yF0+j3ivTnNDvvrqfD+2Tk=; b=tW+XCg2JFoZ+tJO9C8UUEbd5wW
	wnpamnTlXloJxzt7fuWR88wsqLdYwVPBuNIikG79rr9f1X0a3Wfxd3xDulDh6quLGnntrlzkwE5r8
	BUdtfyY7o5YygeUyGELahnGCjUMyT9MFYoujqFBFXBgz6EQ2M1uFRYjRPDg0S5thN0H5c3lAao1x4
	DE8bMMiWfQ3wLoMPed4V7BMfJHlH03zJvQLxe+RG0w3lFY1mM0Xm7eArUrGauzXdNYRn/x2WhY0e2
	f4LIPZSQ12/+guL7lWqzwGC+BMxnR2d4Mc5Nx9HEyxoxbROx9EJoL1AGiM6W9Pe+IX0nCE3lYWEPk
	XJdjykoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywQD-0000000EGlt-1O1A;
	Mon, 22 Apr 2024 16:21:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywQ9-0000000EGkO-1o0b;
	Mon, 22 Apr 2024 16:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DD2360F0C;
	Mon, 22 Apr 2024 16:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7896C113CC;
	Mon, 22 Apr 2024 16:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713802892;
	bh=AFRCwPy48IRqorUVwWw91pu04QMTojwYvcp8gaaxSg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwEfKmyw82HsaUL37rAvvwNItHpyNTg1GIg4F221ja1a+s0OhbrcRDX70Jgm16kUT
	 vtLXqqSOky87PY/5F8n6SXjoV5HGzkM+gVF9EiYx38t93a9DukxQ3vyTS++Bn9KNPw
	 thg1unZuJLGivIPRQ3096RmQEAcje2tsQR0dbzo7oba/aEc3aYY2YQBu1Uy6d1n8W+
	 kZSQUT8H2NdxkoO3JG0MnoLT0arPg2iP/nF1/Dz4Bl+h12ceknFXltsMdXLuvDels/
	 aTeU6Jyjs7+jjtEinE1t5/3zVhFqRJ4OJSrr3WPxtFAoitQtxlDOD+GCjfLypqx1V4
	 P7GRQ6DfgwGyw==
Date: Mon, 22 Apr 2024 17:21:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20240422-folic-obtuse-570b1747e7b9@spud>
References: <IA1PR20MB4953780F4617823F7173B6D6BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953040232A4D41E41F2D2A9BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240419-harmful-neutron-d0db367cf659@spud>
 <IA1PR20MB49536E7548B65B41F4F33FDEBB0C2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49536E7548B65B41F4F33FDEBB0C2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_092133_633080_EF3AB4FD 
X-CRM114-Status: GOOD (  44.81  )
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
Content-Type: multipart/mixed; boundary="===============7472835648983063583=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7472835648983063583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zBWc+J/izNiVp8j0"
Content-Disposition: inline


--zBWc+J/izNiVp8j0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 09:39:18AM +0800, Inochi Amaoto wrote:
> On Fri, Apr 19, 2024 at 03:26:53PM GMT, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 03:22:24PM +0800, Inochi Amaoto wrote:
> > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > connected, it only supports setting the mode manually.
> > >=20
> > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > ---
> > >  .../bindings/phy/sophgo,cv1800-usb-phy.yaml   | 90 +++++++++++++++++=
++
> > >  1 file changed, 90 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv18=
00-usb-phy.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-=
phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> > > new file mode 100644
> > > index 000000000000..cb394ac5d8c4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> > > @@ -0,0 +1,90 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/sophgo,cv1800-usb-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sophgo CV18XX/SG200X USB 2.0 PHY
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sophgo,cv1800-usb-phy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: PHY clock
> > > +      - description: PHY app clock
> > > +      - description: PHY stb clock
> > > +      - description: PHY lpm clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: phy
> > > +      - const: app
> > > +      - const: stb
> > > +      - const: lpm
> > > +
> > > +  dr_mode:
> > > +    description: PHY device mode when initing.
> >=20
> > "initing" isn't a word, "initialising" is the correct word. Or
> > "initializing" if you speak American. But if it is just the value during
> > initialisation, why do we need to know - we can just overwrite it in
> > software, right?
> >=20
> > Are you sure that this is limited to initialisation? I would have
> > thought that it describes the configuration that the board is in, and is
> > a fixed property of the system?
> >=20
> > > +    enum: [host, peripheral, otg]
> >=20
> > Rob, I know this is a phy rather than a controller, so referencing
> > usb-drd.yaml doesn't really make sense, but there are several PHYs using
> > dr_mode so it feels like there should be something to reference here
> > rather than defining the property anew.
> >=20
>=20
> Yes, you are right. Using dr_mode in initialisation is not necessary.
> We can just let it go and using the default mode. In fact, for most
> boards with this SoC, host mode is just enough. And it is just easy=20
> to overwrite the mode value in the driver if we want another mode.=20
> For the OTG, it can just check the `vbus_det-gpios`. I will remove=20
> this property, thanks.

Just to be clear, it's valid to have a dr_mode property in cases that
you cannot detect what the mode is dynamically. What I was questioning
was the wording about only valid for init.

> > > +  vbus_det-gpios:
> > > +    description: GPIO to the USB OTG VBUS detect pin. This should no=
t be
> > > +      defined if vbus_det gpio and switch gpio are connected.
> >=20
> > I don't understand the second sentence here.

Ah, with your explanation below I now understand what you mean here. I
think this needs to be re-written - I think it would be easier to
understand with s/gpio/pin/ in the second line.

> > > +    maxItems: 1
> > > +
> > > +  sophgo,switch-gpios:
> > > +    description: GPIO for the phy to control connected switch.
> > > +    maxItems: 2
> >=20
> > You've got two items here, they should be described. /But/ the property
> > above says "switch gpio", which is singular. Which is it?
> >=20
>=20
> `switch-gpios` is gpios to controll USB switch connected to the
> phy. Sophgo recommends that phy use a switch to separate device
> port and host port if it supports both. I know this is weird,
> but many board follows this design, such as Huashan PI and=20
> Milkv Duo S. As for item number, it is just an array of gpios
> to process one by one, I mark it as two just because Milkv=20
> Duo S use two gpios to controll the USB switch.

Right, but what I'm looking for is a description for what each GPIO
does, so that someone can know how the dts should be written.

> For vbus_det gpio description, There is because the design of=20
> Milk-v Duo S, which connect the switch gpio and VBUS detect=20
> gpio. In this case the OTG function is broken and we can just=20
> change the mode by toggling switch gpios. So I suggest not=20
> defining this property.

Okay. See my comment on it above.

Thanks,
Conor.

--zBWc+J/izNiVp8j0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiaOhgAKCRB4tDGHoIJi
0q3VAQCrGsXppmUynfWM7SA2AFjgkUzDreJrN1u78Q9BRRDXjgD/c6kSQbgAQB85
O/F2pHE5G5vYsnXHPejmMURPSVfkmQ4=
=AGnu
-----END PGP SIGNATURE-----

--zBWc+J/izNiVp8j0--


--===============7472835648983063583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7472835648983063583==--


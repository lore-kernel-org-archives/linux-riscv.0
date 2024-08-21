Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA39C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JvdRFiGe/oPBcILV9lohywvaUyPiMi+U0vlQy9lB2s=; b=azkCsm5M07Oq6dqB6waIMfIKnp
	JHB/38hwBQMjPbtMgYRzA2i2z3oE0wNeoijYXWilBf+qo02N4zfPdrguFkeg+rYH738UprTJF/HF7
	voHlJ3BEBg64+YnIUUEZzB7dcK9M1Agn2vHQS0g2qZWst0CrfKillXP5RULev3IrnDMPgV0jeKv8g
	wDlspGxiEPWM+TYUtiBNp9Cceg7QoPRWp6k0tnsjaaugMeJGXI1llhbSUXBOQHAU3SLcEVGyu57Jg
	xULjq2Pfd+xZkFCbeVrSJ/j+w+ILzd8dcLG53CNZMMeUcTGaDIBuPAJjjGflFbhYqysqZe9Mi0MMm
	AP2YdlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnHV-00000009VKs-3Ul7;
	Wed, 21 Aug 2024 15:29:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnHT-00000009VKH-05CA
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 15:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26556CE0E62;
	Wed, 21 Aug 2024 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC82AC32781;
	Wed, 21 Aug 2024 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254188;
	bh=kM9T4AHZ6ULY3dqDxLeHx/n7GocYC9a1Ufp84n6ZZaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEp3HXmak6uLH3Lkeuss+9978yCSxp+iL8YP1A/WdsOpOnEJIsN8SyqO1zf4fmKr1
	 lWJ3RhRbBWp9XHsaUlOvFLLCuGVN1b96sA/uPDsZgr1gj6VWa037dc3+X3GRRh/5xk
	 181EvCpLAb2BL4PP3k79713Fe4r8i0aZIQKcg234XRRoRNmPqP4awDmS7QokTE4F9z
	 IFzR7eb35H8mRSoVnu65UYtzBIWjIgWe7iFWFz2g/bn5Z/NGAIP27QLYjdXNciDRjn
	 FkLgt2VlCOFJIrXYVAXVSu/UANkv2xDH+zej4mlQECPD75KHYNM7rG/VaD3rgqx7ud
	 AIfgOcBvBOiFw==
Date: Wed, 21 Aug 2024 16:29:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo CV18XX SARADC binding
Message-ID: <20240821-unholy-statutory-7aa884ebf857@spud>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
 <20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
 <20240812-unwary-mongrel-9f6758bf624c@spud>
 <89aabfbe-79bf-4da7-be44-b6cbd92b72a9@bootlin.com>
 <20240820-borough-latch-17d785301aef@spud>
 <20240821094150.5787905b@xps-13>
MIME-Version: 1.0
In-Reply-To: <20240821094150.5787905b@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_082951_431390_2343A135 
X-CRM114-Status: GOOD (  33.38  )
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
Content-Type: multipart/mixed; boundary="===============2410734036386774153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2410734036386774153==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tue/8AFCKfIOWTNr"
Content-Disposition: inline


--Tue/8AFCKfIOWTNr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 09:41:50AM +0200, Miquel Raynal wrote:
> > > > > +      Represents the channels of the ADC.
> > > > > +
> > > > > +    properties:
> > > > > +      reg:
> > > > > +        description: |
> > > > > +          The channel number. It can have up to 3 channels numbe=
red from 0 to 2.
> > > > > +        items:
> > > > > +          - minimum: 0
> > > > > +            maximum: 2 =20
> > > >=20
> > > > Is this sufficient to limit the number of channels to 3? Aren't you=
 relying
> > > > on the unique unit addresses warning in dtc to limit it, rather than
> > > > actually limiting with min/maxItems?
> > > >  =20
> > > It seems like I can't use min/maxItems on this property. I think that=
 it is
> > > using size-cells + address-cells to deduce that the number of items s=
hould
> > > be equal to 1. =20
>=20
> Looking at dt-schema, I couldn't personally understand from where did
> the error messages reported by Thomas came from. There are clear

I think the complaints are on a more meta level than that. He provided
an items list
     properties:
       reg:
         maxItems: 1
         items:
           - minimum: 0
             maximum: 2
but this list only has one entry as there's one -. The first complaint
=66rom dt_binding_check is that having maxItems is not needed with an
items list, because the items list contains the maximum number of
elements.

The second one comes from cell.yaml:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/meta-schemas=
/cell.yaml

It either allows a single item, with maxItems: 1 or multiple items, in
which case maxitems must be greater than 1. That's where the "anyOf
conditonal failed" and "1 is less than the minimum of 2" stuff comes
=66rom.

I hope that helps?

> constraints over minItems/maxItems regarding the use of {#address-cells,
> #sizez-cells} being {1, 1}, {2, 2} and {2, 1} (in reg.yaml), but nothing
> explicit regarding the other situations, namely {1, 0} in this case
> which enforces maxItems to 1 is not clearly stated in any of the core
> yaml files. Any idea where to look at? Although, I'm convinced there is
> something defined because renaming the property from 'reg' to 'foo'
> silences these warnings.
>=20
> > I think I was mistaken in talking about mix/max items here. I had the
> > right idea, but mentioned an incorrect solution - sorry about that. I
> > wasn't talking about the number of elements in the reg property, what I
> > meant was limiting the number of channel nodes in the first place -
> > something which min/maxItems cannot do. As examples of the problem I was
> > thinking of, see the below two examples:
> >=20
> >     adc@30f0000 {
> >         compatible =3D "sophgo,cv1800b-saradc";
> >         reg =3D <0x030f0000 0x1000>;
> >         clocks =3D <&clk CLK_SARADC>;
> >         interrupts =3D <100 IRQ_TYPE_LEVEL_HIGH>;
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >=20
> >         channel@0 {
> >             reg =3D <0>;
> >         };
> >         channel@2 {
> >             reg =3D <2>;
> >         };
> >         channel@22 {
> >             reg =3D <2>;
> >         };
> >     };
> >=20
> >     adc@30f0000 {
> >         compatible =3D "sophgo,cv1800b-saradc";
> >         reg =3D <0x030f0000 0x1000>;
> >         clocks =3D <&clk CLK_SARADC>;
> >         interrupts =3D <100 IRQ_TYPE_LEVEL_HIGH>;
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >=20
> >         channel@0 {
> >             reg =3D <0>;
> >         };
> >         channel@2 {
> >             reg =3D <2>;
> >         };
> >         channel@22 {
> >             reg =3D <2>;
> >         };

I noticed that I pasted two of the same example. I must have just
yoinked the latter to a vim buffer rather than to my clipboard. At least
it didn't matter in the end.

Cheers,
Conor.

> >     };
> >=20
> > The solution is simple, remove the + from the regex. Sorry for sending
> > you on the wrong track Thomas.
>=20
> Ah! Thanks Conor for the details, now it makes full sense :-) BTW Thomas
> the regex is
>=20
> 	^channel@[0-3]+$
>=20
> and I guess it should instead be
>=20
> 	^channel@[0-2]$
>                     ^
>=20
> in order to fully match the real indexing constraints you're enforcing
> with minimum/maximum.
>=20
> Thanks,
> Miqu=E8l

--Tue/8AFCKfIOWTNr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsYH5gAKCRB4tDGHoIJi
0qwgAP9DK5VMEgFavpXECmhFBfncT7lIUlxJBxj6s5zdF7kQnQD/Sw2qGwYA2V9y
v3kct0e0cmDF19Qfeha3fH3QXcYq6QQ=
=9e4E
-----END PGP SIGNATURE-----

--Tue/8AFCKfIOWTNr--


--===============2410734036386774153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2410734036386774153==--


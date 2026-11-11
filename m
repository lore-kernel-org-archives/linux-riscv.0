Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B10760A2614
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vw4q6g4b;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5yT/8Ip
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Cnjz9E4gHa2zNHO8KA4K+qrvMcxfS6rsQPXcaMZEFU=; b=Vw4q6g4banBzRcOVeRB4dMQoZs
	t/fU92yBu/eb4CG3jCRgLznmIwwEUzbHHMWoWtkygAZ53GnP+Uk8DXJgVevLaba8gXbJKMuE00Abe
	4l3Rs29eMixmDYTxscZG1c0YLHlF3A+cL4m2NDqN+mv3g7INU8AWvIWFfVLvPO4BoI37bjn4FXUDw
	gidn/qQMhezikm4b7PbGJS/X0KqAZWqy3m9ONVjCFt6RqYsbH9Pb9T7Qd7wQhGlPNUNOlN4r0tsts
	4AleWm4exjTc+e1zD/F33Z0IiutgQt7GD2Nsx7fpihyqwxhxcLmTT4NdKROl1Rn/bDwRZe4V4j4gk
	xlzctyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR59I-00000006Hm6-11s5;
	Wed, 11 Nov 2026 10:01:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR59H-00000006HlO-0jBp
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 10:01:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4048F62FB6;
	Wed, 11 Nov 2026 10:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0591F00A05;
	Wed, 11 Nov 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391306;
	bh=9wY75Oc5XbeR6DiKMFgRwxqRRRSUa+hCgjs5NUnDR1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5yT/8IpmexBC4a6ZeCP8iFuSEnAegRPglJylD2ZuNq+WQ4ttUX5Owmvck3me/4Ux
	 /53O+tAA/jkOfFaWhA3gJDNKjHsG6lfPj7drficGxFiou/BP/Il2tMleOxP5M7cp3/
	 rcsjAKlOuIteoaqBkPKiMvCA/gLcPfh96AYjS5+ccn3ed+KdZTAvzjXwuRrq6jw1sQ
	 OEXBXb/y+p4jf5M1fgpfnuWOY/fx1QiBcMSUVA7URnkyqrS3oyQ68fqbTyGcQux0Dr
	 WCFvd06RIPEFZfWzS600pd+cMkirOjfxYfBih3d1Pz1T6LP4UG2dGr4ET3LqMD+IB5
	 FhHe9hbc8Fbjg==
Date: Wed, 11 Nov 2026 10:01:39 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20261111-underage-distant-87bff35745b9@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
 <20261103-charm-ending-efe2b7081ca7@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-charm-ending-efe2b7081ca7@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1742868842327280209=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1742868842327280209==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RLV/GgZW92MgkbBk"
Content-Disposition: inline

--RLV/GgZW92MgkbBk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 09:49:22PM +0000, Conor Dooley wrote:
> On Tue, Nov 03, 2026 at 04:11:30PM +0100, Aleksa Paunovic via B4 Relay wr=
ote:
> > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >=20
> > Document the MIPS P8700 ACLINT MTIMER.
> > Extend support for both mtimecmp and mtime registers
> > within the ACLINT MTIMER, identified via reg-names.
> >=20
> > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Same comments here too.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

On second thoughts, we probably need to be careful about the reg
ordering here. This binding has always required that mtimecmp be "first"
because it was the only let me rescind my ack for now and think about
what the correct thing to do is...

Cheers,
Conor.

>=20
> > ---
> >  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 35 ++++++++++++++=
++++++++
> >  1 file changed, 35 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-=
mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mti=
mer.yaml
> > index cf7c82e980f674afcf59fc726742dc4f49c1a820..40acb651c27b7eaa8a20caa=
8bbc225b350088810 100644
> > --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.=
yaml
> > +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.=
yaml
> > @@ -21,14 +21,19 @@ properties:
> >            - enum:
> >                - anlogic,dr1v90-aclint-mtimer
> >            - const: nuclei,ux900-aclint-mtimer
> > +      - const: gf,mips-p8700-aclint-mtimer
> > =20
> >    reg:
> > +    minItems: 1
> >      items:
> >        - description: MTIMECMP Registers
> > +      - description: MTIME Registers
> > =20
> >    reg-names:
> > +    minItems: 1
> >      items:
> >        - const: mtimecmp
> > +      - const: mtime
> > =20
> >    interrupts-extended:
> >      minItems: 1
> > @@ -42,6 +47,25 @@ required:
> >    - reg-names
> >    - interrupts-extended
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: gf,mips-p8700-aclint-mtimer
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  examples:
> >    - |
> >      timer@ac000000 {
> > @@ -53,4 +77,15 @@ examples:
> >        reg =3D <0xac000000 0x00010000>;
> >        reg-names =3D "mtimecmp";
> >      };
> > +
> > +  - |
> > +    timer@16154000 {
> > +        compatible =3D "gf,mips-p8700-aclint-mtimer";
> > +        reg =3D <0x16154000 0x7ff8>, <0x16108050 0x8>;
> > +        reg-names =3D "mtimecmp", "mtime";
> > +        interrupts-extended =3D <&cpu1intc 7>,
> > +                              <&cpu2intc 7>,
> > +                              <&cpu3intc 7>,
> > +                              <&cpu4intc 7>;
> > +    };
> >  ...
> >=20
> > --=20
> > 2.43.0
> >=20
> >=20



--RLV/GgZW92MgkbBk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavQ9AwAKCRB4tDGHoIJi
0jb4AP0WjuVNWtVw7MnmG1rHlM3rJmBgGeKnCIAo1DZytJr2HgEAia3oReDA58wC
DWF/Y2M0nU4hg4g67ukM8mfRsKffTgw=
=GaSR
-----END PGP SIGNATURE-----

--RLV/GgZW92MgkbBk--


--===============1742868842327280209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1742868842327280209==--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60EA606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZG3BTb0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcG7ETBE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9oQ1eykF+p1R3LdIVGqSnNtdyFmLyvmJF72BlfAStmE=; b=LZG3BTb0hcJ9Ga57LZBDsVDFVg
	WKBVDju2hhycOGtGucUHMJthEePCojxnxuuwDQrTbBl/OfaxIG83FQ9MyeDqoeP9plNkGVcaMnR7F
	4qsuXzQik0KxtmmEe9prfXq1/5yFN8faHmJSwlSALpsAy6B/23KvezhzPwIejOFmF/IlXpuF8X6ND
	o5HKrgr1GEVzZiltfBiEb1epAo8PP/MIs/KdwtcnMtGUUQk2BTlrFGmRXYbRINlMAt36VffVHr02T
	XtK09vAp1isap6z8HK1sTg+evibJmyDCy52P8L167o4qvBRfOLfMxib+P4X95QunbLX2D74PUe2wv
	iiLuiLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdmc-0000000E7Lf-3j3F;
	Thu, 26 Nov 2026 18:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdmb-0000000E7LZ-3Y1j
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:01:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C1E740494;
	Thu, 26 Nov 2026 18:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F841F000C6;
	Thu, 26 Nov 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716081;
	bh=dDY36AvQgrOy9pXy1FMhtre9bjSpWej5ips53tUnj3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcG7ETBEW1ed09GgyBBcXh3TXKSAcjhGDj9/pk54Vrp8BYsIgpRBhWq0v3lhBxV4o
	 Ph2GNVe1vXoT2fNQj1FrAps0DQ30wKT1GwZEvAPjYp9kaHJfdzBPCq9kLR+Q9rLJWM
	 76h6qbeNarG47pU2Ysrc4gDsoLPtYybjLK1HcMP3sMbu+lemjoxnLVTY+D97fjtYZW
	 ouuQ1oEK0rI2T3cHz9tS0ETSAFXCfAUBJgENDVCeHYtxgB/HkKuzYUmXXr3wCnZTy+
	 iifS2urWXWLboE0AP+QgqxaxMkIic+s6C6/jfNre45XzLGlrobgcrO1n8azuPhAf1/
	 xmXzuWWv6d0ew==
Date: Thu, 26 Nov 2026 18:01:16 +0000
From: Conor Dooley <conor@kernel.org>
To: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261126-resale-roast-ec3dc50ca350@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
 <20261126-sage-subscript-abb9ea294ca2@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261126-sage-subscript-abb9ea294ca2@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4448761667286804910=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4448761667286804910==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BUT5UXC++Pyzk4aA"
Content-Disposition: inline

--BUT5UXC++Pyzk4aA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 06:00:05PM +0000, Conor Dooley wrote:
> On Thu, Nov 26, 2026 at 04:38:56PM +0000, Marouene Boubakri (OSS) wrote:
> > Hi Conor,
> >=20
> > Thanks for the review, and for the acks on patches 1 to 4.
> >=20
> >=20
> > NXP Confidential
> > On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > > > +RISC-V OPENHW GROUP SoC SUPPORT
> > > > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > > > +L: linux-riscv@lists.infradead.org
> > > > +S: Maintained
> > > > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > > > +F: arch/riscv/boot/dts/openhwgroup/
> > >
> > > There's no git tree here, are you expecting me to apply the patches f=
or
> > > your platform?
> >=20
> > Yes, if that is okay with you. I don't have a tree for this: the platfo=
rm
> > is small and I expect very few patches. I will review and test whatever
> > comes in for it. I can add your tree as T: in this entry, or list the
> > directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
> > If the platform grows I am happy to set up a tree and send you pull
> > requests instead.
>=20
> Sure, I suppose I can. Keep this entry and add the dts dir to my misc
> entry.


I see you've already send v2. I can always deal with the MAINTAINERS
stuff on application if v2 is okay.

--BUT5UXC++Pyzk4aA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawhz7AAKCRB4tDGHoIJi
0j2nAPwN24QJf6FPNXePqWf8uvGIRVI7IPEguafbAKDUMydZNAD9HnELmLyHGIPY
T6+kO1CBNDDv0SdKpnErDxxP4dmFQg0=
=YifN
-----END PGP SIGNATURE-----

--BUT5UXC++Pyzk4aA--


--===============4448761667286804910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4448761667286804910==--


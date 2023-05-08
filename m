Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9256DC77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpldCTL2n+fvUsQ4bQzu1O1EQDJ58IY8f4RkUEX9BtE=; b=sXZ5iXIVIaPXOI6CQM5zh//j/a
	X8uktOc9G6CakAYpZygoEt16Zf/++zSZVd7X6wrBrlkcHGRyzOzoIfTXJbGn2TscElDgOhroAWRrP
	YfG0f/PZ0CQXuj9CaSeoWhv819v8Dau9hE+2R/dU28sXYiyk95cyp9QC4PBV46wLok7L4x2VGi5XU
	cZK87vW0m9acz56jp43J9u6KeZxZ3tvZFXPpPc0kLzVGLjiB5hQBVaMDrxwe2padfJ29VPvrw/AqP
	CfpoRS53DZb8yw58eVu82KptR3IhBksDe9cdIqiVFS2K3ybRGQdGi1m3cqK3SWE0RI8M72Cdg6/ES
	y0jrN7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3yA-000zjl-0a;
	Mon, 08 May 2023 16:44:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3y7-000zis-2V
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 16:44:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A226C61CB4;
	Mon,  8 May 2023 16:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E4AC433D2;
	Mon,  8 May 2023 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683564250;
	bh=bfEBgQKWZzeEo35Bvckm2RInCVZk3NagszRRmsAUo84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmSnpb1rRnVd/dO0C57DZLRTEKBbSkHJ/M0dzc4AYqy9Tr5fPDhdEzYtDVoU90k9U
	 LS0Bk/i82G2ob1NhIS0C1dUl32rAjPRqFHJjE0lPrxSJaXzVcAe/w+IkXqSF8nnDza
	 EqFgkOWfDQp8H9LP4gtmxNJHUBEx3zSQNyXfsz/cTJvSczQ1keZVm+LJnJzjdom86c
	 r5qEKNJrDIt5otchrglakxktHX7HFfzVNWIdFvvp4SBTUbBNKA+4pxQIxTrXoI08HN
	 Q/mDxknGXSiLGyb2v30nab5oGsgC6iQeHAK+6oPzI3gOhk/4Yw9DmRQd0qeMGTW23N
	 MHQY83Ry9b8rg==
Date: Mon, 8 May 2023 17:44:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>, heiko@sntech.de
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
 <ZFkiotPacIMUghDP@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZFkiotPacIMUghDP@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_094411_883458_655B6F59 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============3289078951826432453=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3289078951826432453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SF2X7dyBkYPnhHIF"
Content-Disposition: inline


--SF2X7dyBkYPnhHIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 12:26:10AM +0800, Jisheng Zhang wrote:
> On Sun, May 07, 2023 at 10:35:12PM +0100, Conor Dooley wrote:
> > On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:
> >=20
> > > +		c910_0: cpu@0 {
> > > +			compatible =3D "thead,c910", "riscv";
> > > +			device_type =3D "cpu";
> > > +			riscv,isa =3D "rv64imafdc";
> >=20
> > Does this support more than "rv64imafdc"?
> > I assume there's some _xtheadfoo extensions that it does support,
> > although I am not sure how we are proceeding with those - Heiko might
> > have a more nuanced take.
> >=20
> > > +		reset: reset-sample {
> > > +			compatible =3D "thead,reset-sample";
> >=20
> > What is a "reset-sample"?
>=20
> This node is only for opensbi. The compatible string is already in
> opensbi. Do we also need to add dt-binding for it in linux?

If it's to be included in the kernel's dts, then yes, you do need a
dt-binding. If you remove it, then you don't :)

That said, "thead,reset-sample" is a strangely named compatible, so if
you do keep it it may end up needing a rename!

Cheers,
Conor.


--SF2X7dyBkYPnhHIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFkm1AAKCRB4tDGHoIJi
0sW2AQDXJJbO5yD00A0FYT9OCSkvX0JlUUm5rAnhGLMxzDjE+QD/bkvjCep2sIjo
fz26Q9tH3VixEleafSwINv87ub4bjAc=
=ql70
-----END PGP SIGNATURE-----

--SF2X7dyBkYPnhHIF--


--===============3289078951826432453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3289078951826432453==--


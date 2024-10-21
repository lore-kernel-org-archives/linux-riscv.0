Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE350D15D88
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u27eYP3OodkMdiLA/QhIwl/pAeOywJOeM19GiaE46nw=; b=JyIY81j9o5fLg4Eoszg/9i7tdQ
	QxeYnaiAixp9IR0ffcBtTAjOxKqCLCZjajRS6RUPQ691X8YziP4OaIVzaQTcD8hvwEbITPS3i6ZRk
	gqJUbMBhl7O9YzKqb3XlrLwyOxAKbBozH/cBhtGehZ225h9F5mqomul3wo+6QAi5T70z82EFOuJFs
	H+Rf5YpE/W2RjmfMQedR9mqLI3kueXOKIN58AK6mX9vCsRXNkSZEAjzmjGDGs6MlNwcBsjFiomy8x
	ZKiipXt4+Nc9BsinYI82HW0o5/8nobOhbpFc22brw0Oo4LozMvTKilYPK64P1ypG14QBPS8FT98eB
	a1UTycuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rf9-00000007H7Z-1hOJ;
	Mon, 21 Oct 2024 12:37:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rQD-00000007Da7-0jWT
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 12:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DF62A429BF;
	Mon, 21 Oct 2024 12:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD70C4CEC3;
	Mon, 21 Oct 2024 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729513323;
	bh=VogxaHDr5VXDt3OXG/BgBX3+80NJA3EfEloZ63QiD7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n463WHQm9i8QVjyGeh3YMoJAcfrGatS7n1qqFasYQonh5m/Mv+Aw4akG/ZG52sgMn
	 uHZ624sQoxRDJkxYuuRyxr/XYKvIgU5UsQ7Q6nEhpkGrtOg7QSsYo3/i5F+XcY0LLL
	 FSgczerOI7oh76JDaCb4Fyom1SwfsuA5Dk176E91UH1J2hCwzcezor9fIgjTqr/Sf5
	 CPaDMPai/0yREpBwkh6RmHKiDq9G/WHxQfQVPiZ/3qlHCq/jJrd7imk6naNUvy2rP8
	 Iq3BokG3RtcKePOODcI93PdumSJj32OZnqAFlZoc0JxBxvV9r+HvWAB8/w8HxLgTLW
	 qZ7AFh9PYsE+w==
Date: Mon, 21 Oct 2024 13:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2044 uarts
Message-ID: <20241021-rosy-drove-1ae3c8985405@spud>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
MIME-Version: 1.0
In-Reply-To: <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_052205_381995_6B733616 
X-CRM114-Status: GOOD (  20.65  )
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
Content-Type: multipart/mixed; boundary="===============7557787033744608556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7557787033744608556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vROro1MZrp9CSqQL"
Content-Disposition: inline


--vROro1MZrp9CSqQL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > The UART of SG2044 is modified version of the standard Synopsys
> > > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > > and can not set right clock rate for the common bitrates.
> > >=20
> > > Add compatibles string for the Sophgo SG2044 uarts.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uar=
t.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > @@ -58,6 +58,10 @@ properties:
> > >                - brcm,bcm11351-dw-apb-uart
> > >                - brcm,bcm21664-dw-apb-uart
> > >            - const: snps,dw-apb-uart
> > > +      - items:
> > > +          - enum:
> > > +              - sophgo,sg2044-uart
> > > +          - const: snps,dw-apb-uart
> >=20
> > Why does each vendor have an items entry of its own? Seems like needless
> > clutter of the file IMO, except for the renesas bit.
>=20
> I just follow others when writing this binding. I think it may need
> another patch to fix this problem, right?

Yeah. But I'd hold off to see if someone gives a rationale for it being
done this way before sending that. I've not deleted this thread, and
will send an ack if someone justifies why the binding is written like
this.

--vROro1MZrp9CSqQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxZHZgAKCRB4tDGHoIJi
0rj+AP44waD9B7Jd/XToGUQfeog3xWZy/JWbqvcVrrp8HiNOBQD8CTzmD0lxAnQx
KSwr6YOPFc2LF2eursvFE/afDgddUwk=
=3xW3
-----END PGP SIGNATURE-----

--vROro1MZrp9CSqQL--


--===============7557787033744608556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7557787033744608556==--


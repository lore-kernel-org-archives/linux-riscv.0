Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F70C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOzUKzqKwIN5N5HQ9JBXXPulVZGsp4Bb/UbJnTiuU3o=; b=GfGDpq/7A5k56wbTi29Sw/r3eq
	GZXcnDXi3us7EioWhZb5G2M6r210etu+p5a9NiF/TBLqyZfLse01SH62P/nPnJIvahR43J6A4h3uP
	OviWFOdylKC8beeIyf/9Q9j7JEcCnfvFUrMX4mC3bCbbbhSP0EmhmAgjnuM1PuC9NqV5MqC75Z6rD
	belQWHuRqDtCFdgXCWS0SQSzO5BBHquJgX3RH5cPUZYYPq98exafJWm8e8BAQv07CycE6QiFEci87
	CxwMW2/g9q7dlH0wZk0oCPQ+IKPPEgNk0OUfYNMNJq1pD/hmKnban6nbAZDh+a8V5BSucxGqrrzq3
	z74wmNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOMQ-00000007hqi-2Af1;
	Mon, 15 Jul 2024 16:15:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOMM-00000007hpj-34kE
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 16:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE73DCE109B;
	Mon, 15 Jul 2024 16:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A56C32782;
	Mon, 15 Jul 2024 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721060127;
	bh=mLWYv23u+mgS32+SyTYQAadch7hGryWLzzmSpRmxH4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuhPMO91ivtWsDW2ZpoB69blhPpQa+W32lkdY4S3fmB1ON5DlP2Nr21z21MR2UE9t
	 uFEcmVvLgPQyLiriWWGRwTP2oBrtuPRCFTccD9+//wFLrYTiaY1WKjHwWY1f2hXEp1
	 ASfoQr6JBQr5jp8nPYw74DROeUpHHcI4oXs2RYQ8nrRnlVZe8T2FMlCgFssyT961xn
	 yI13nUCzhulrAZNdnIqPo92CIMs1j/yv8MpzuiJ/5pfbjzYJDYLVdzpp7/J8ynR/9K
	 L1q24+5rsuuaPrjzm3nWQVd3ICwC864pLLzC27mtKi5jDACiB5a8h05Gdqf+fR71vL
	 +LMtLQg4mpM0g==
Date: Mon, 15 Jul 2024 17:15:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs
 mailbox
Message-ID: <20240715-upriver-grumbly-e8f6172f6a72@spud>
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22382E1C032FDE2D36E6B58DC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <IA1PR20MB49537F9F04E601413EA1C86FBBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49537F9F04E601413EA1C86FBBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_091531_171518_3EAC38E5 
X-CRM114-Status: GOOD (  21.41  )
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
Content-Type: multipart/mixed; boundary="===============5308271757136928472=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5308271757136928472==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zzXEz8jPPTQgnAU7"
Content-Disposition: inline


--zzXEz8jPPTQgnAU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 10:56:38AM +0800, Inochi Amaoto wrote:
> On Mon, Jul 15, 2024 at 12:36:45AM GMT, Yuntao Dai wrote:
> > Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox
> >=20
> > Signed-off-by: Yuntao Dai <d1581209858@live.com>
> > ---
> >  .../mailbox/sophgo,cv1800-mailbox.yaml        | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv=
1800-mailbox.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-ma=
ilbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbo=
x.yaml
> > new file mode 100644
> > index 000000000..05099d819
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.y=
aml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800-mailbox.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo cv1800 mailbox controller
> > +
> > +maintainers:
> > +  - Yuntao Dai <d1581209858@live.com>
> > +
> > +description:
> > +  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel=
 for
> > +  different processors. Any processer can write data in a channel, and
> > +  set co-responding register to raise interrupt to notice another proc=
essor,
> > +  and it is allowed to send data to itself.
> > +  Sophgo cv18x SoCs has 3 processors and numbered as
> > +  <1> C906L
> > +  <2> C906B
> > +  <3> 8051
> > +
>=20
> Unify the "cv18x" (at least it should be cv18xx) and cv1800 in your bindi=
ng.
>=20
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,cv1800-mailbox
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    const: mailbox
>=20
> I think this is not necessary, there is only one interrupt.
>=20
> > +
> > +  "#mbox-cells":
> > +    const: 2
> > +    description:
> > +      The first cell indicates which channel is used, the second cell =
indicates
> > +      sending to which processor
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#mbox-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    mailbox: mailbox@1900000 {

And while you're fixing the things Inochi pointed out, drop the
"mailbox:" label, you've got no references to it.

> > +        compatible =3D "sophgo,cv1800-mailbox";
> > +        reg =3D <0x01900000 0x1000>;
> > +        interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "mailbox";
> > +        interrupt-parent =3D <&plic>;
>=20
> Remove "interrupt-parent".
>=20
> > +        #mbox-cells =3D <2>;
> > +    };
> > --=20
> > 2.17.1
> >=20

--zzXEz8jPPTQgnAU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVLGwAKCRB4tDGHoIJi
0ksrAP44CRJfWjmm/fXdRQgnKm3Z9zOczwqC4FTn2T2jQGjO8QD/RdCakhwmab1e
5Al7Ec3yk7tBgCouJxToC69YlwNW6Qs=
=eXZT
-----END PGP SIGNATURE-----

--zzXEz8jPPTQgnAU7--


--===============5308271757136928472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5308271757136928472==--


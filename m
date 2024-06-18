Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C53C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELs5AVt6+8z0bJ6gdpuGwfz0Ws0P+4CBuJiJCXbkkBk=; b=Old+pFTFoEUtN91xJLDzFbHWOg
	M4kOfiko28V+uZi2SwbHHCQU9NyDwhJ5auF76wyYeLKtV+hETisDzywsEhmvB2BvxSnSDXEVIR1pQ
	zJ5hAq/tYw6FlPKvOYcbOGvE4unTvNKOvLo3czQBZAr+Fuo2PtwKxNRefueeH4O3lGa3ulE1gwZWo
	3jpVFDepsIgCUF5dbfcUqjm/QteKAsrJ5/jIlEV297a5YUXHvHT8OX9Khq5UjlvmjVKmwubsCRZwm
	N6fySilXqsbB6+IryAs4Ncy9qUGEaYsTwHVrBnGP31PPEzTFMMIG4l4Xs4ObWsfkwsvizItH2d8YE
	lw89AhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJav8-0000000FeAg-1fNe;
	Tue, 18 Jun 2024 15:38:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJauz-0000000Fe9A-3xn0
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14B91619F6;
	Tue, 18 Jun 2024 15:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31447C3277B;
	Tue, 18 Jun 2024 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725123;
	bh=fmH+xD1cgLl3hrIzxElufLFVaOm4PxZmFn0NGOamYw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TpPt3H2alws9aXnqoBjGD9bXQ8D0wnMHu58Y4s+cOY2BLeCJkBlUAI7I7dUV0s0Eu
	 B7qqDvY5FgMRA3b8k1pglul1Y7jWt6sFxiLmAzPTwc0KxCIDJvE1gPMaD5HnIbLt1V
	 I3CKtJO1GucynggtOCcxVQEg0q1XQS7rCqzeofrQsMsRj5hji9Hf2qVwlLub7loG6a
	 XKvTmAIlIOggS6/XV26S1MUKWUqa8Lmixw8wn8e2BQFlm4udWIyWGJiOhR/ZLQlwV5
	 Q+78Qs4gveJYyxVlH8ZMsiGglD6KeOYr8NAzmPhDcTA2Olix3idZj+sTUrnXADAyOY
	 KHRCrTNPHIBHQ==
Date: Tue, 18 Jun 2024 16:38:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Yuntao Dai <d1581209858@live.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Message-ID: <20240618-monastery-manger-1a7d9a272f11@spud>
References: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_083846_134666_53DCEADF 
X-CRM114-Status: GOOD (  18.19  )
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
Content-Type: multipart/mixed; boundary="===============5776016085193062284=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5776016085193062284==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nvbiF6U45eoEZ/qe"
Content-Disposition: inline


--nvbiF6U45eoEZ/qe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 11:12:33PM +0800, Yuntao Dai wrote:
> Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  .../mailbox/sophgo,cv1800b-mailbox.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv18=
00b-mailbox.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbo=
x.yaml
> new file mode 100644
> index 000000000..e1868aaf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.ya=
ml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo cv1800b mailbox controller
> +
> +maintainers:
> +  - Yuntao Dai <d1581209858@live.com>
> +
> +description:
> +  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel f=
or
> +  different processors. Any processer can write data in a channel, and
> +  set co-responding register to raise interrupt to notice another proces=
sor,
> +  and it is allowed to send data to itself.
> +  Sophgo cv18x SoCs has 3 processors and numbered as
> +  <1> C906L
> +  <2> C906B
> +  <3> 8051
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-mailbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: mailbox
> +
> +  recvid:
> +    maxItems: 1
> +    description:
> +      This cell indicates the mailbox controller is running on which pro=
cessor

You can just look up your hartid at runtime, wouldn't that be
sufficient?

> +
> +  sendto:
> +    maxItems: 1
> +    description:
> +      This cell indicates the message sends to which processor

Can't this go into an mbox cell? Having this property would limit the
mailbox to only communicating with 1 of the 2 available processors.

Cheers,
Conor.

> +
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      This cell indicates which channel is used
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - recvid
> +  - sendto
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox: mailbox@1900000 {
> +        compatible =3D "sophgo,cv1800b-mailbox";
> +        reg =3D <0x01900000 0x1000>;
> +        interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "mailbox";
> +        interrupt-parent =3D <&plic>;
> +        recvid =3D <1>;
> +        sendto =3D <2>;
> +        #mbox-cells =3D <1>;
> +    };
> --=20
> 2.17.1
>=20

--nvbiF6U45eoEZ/qe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGp/gAKCRB4tDGHoIJi
0lZhAQCIpzmZgPmLcK0DlQG035X/2WhR0AckY3tilztfWdynmwD/ehaUlanIwAhu
5bCcdtphU/WsBn0uG7+dwqn9H9B+IQY=
=FmkD
-----END PGP SIGNATURE-----

--nvbiF6U45eoEZ/qe--


--===============5776016085193062284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5776016085193062284==--


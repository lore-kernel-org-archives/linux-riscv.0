Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED3ECD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxcy0rL5x9+OMDAHj6YhOq9Ej4DDoP033AiULysv3Rw=; b=TxB2GExZFVFBaUb0z2DJkVlGT/
	jiau5T3ufmjOFOgUIYz9MWc1ZJwlVxeLBeDj65+h2DiKwpfs51M3KAoI3Je2h9Mb/OK5ASQA+rnHo
	Gp6+GyJOP51cVEUewyN4XKCaj9H8pYqrCpmT+bSEhwNC+qkV1g17vhO0TEXPXYxILxLaU12Ize1G1
	yx1aa/NpQVCItP6+S501qiKLQ951C91qsp8d374Pse7tZLy7z2w/08fmprn4fAg2k8gZ8i2pPnhpr
	GvZaIDgYKk6TNb6582hclH4bUkIjfF/vA0idX131RyxYMaKDecSigDz1sAK3nKvdIEKn7JRtSh4EH
	M2HIfKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLl8-00GNtC-2L;
	Mon, 18 Sep 2023 21:26:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLl5-00GNsR-1B
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 21:26:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DE1F61370;
	Mon, 18 Sep 2023 21:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA42C433C8;
	Mon, 18 Sep 2023 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695072377;
	bh=lEN1ls2dQkgYbioyJtFPuLMXALUsRxPq6Ic/riPZ0ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqgBdUlH+wSg9plu2Er1SzBhJU2wj9WSfxwhShNfKjOe9Cul0jpDI0hk/Cl1V6UQt
	 2PV2q+GfZjLlBLJguSRIuqd+qC0nmbnJIgSO2DC4u2zmLq7R9u6sN8y1mullDfZTm1
	 47tYhx3uPj0wmmaZV7ArWxgMhrgKh3jz/i3AucsqOGlQdsKIkt+LGVbDhA5eRzlrVX
	 D2kQCfd54mO6pXJhqFiH3KqscVbnUj/oDJCrSBwTh4Oz+z6Ul6B6y81r88Vhu1A69P
	 jeG0jQtFYwafrk/+TMtIyAEOttfVYJqQUEePKOdIlriH8KHrZ/0HxooyiY0OomwOAs
	 tkd32TsQDs6GA==
Date: Mon, 18 Sep 2023 22:26:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Kwanghoon Son <k.son@samsung.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	inki.dae@samsung.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
Message-ID: <20230918-4ef7f52da269f3a7e4023bb3@fedora>
References: <20230918045125.4000083-1-k.son@samsung.com>
 <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
 <20230918045125.4000083-2-k.son@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20230918045125.4000083-2-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_142619_484685_951C8DF7 
X-CRM114-Status: GOOD (  18.86  )
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
Content-Type: multipart/mixed; boundary="===============2397184880642329716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2397184880642329716==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WE881O0NIJLSEjS/"
Content-Disposition: inline


--WE881O0NIJLSEjS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 04:51:23AM +0000, Kwanghoon Son wrote:
> Add documentation to describe th1520 reset device

I would appreciate if you could add some information here as to what is
missing from this - the reset controller isn't just for two WDTs is it?

>=20
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>  .../dt-bindings/reset/thead,th1520-reset.h    |  9 ++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-=
reset.yaml
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.y=
aml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> new file mode 100644
> index 000000000000..49ea8c6a331f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD th1520 SoC Reset Controller
> +
> +maintainers:
> +  - Kwanghoon Son <k.son@samsung.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: thead,th1520-reset
> +      - const: syscon

iDumb question perhaps, but why is this a syscon?

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/thead,th1520-reset.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        reset-controller@ffef014000 {
> +            compatible =3D "thead,th1520-reset", "syscon";
> +            reg =3D <0xff 0xef014000 0x0 0x1000>;
> +            #reset-cells =3D <1>;
> +        };
> +    };
> diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-=
bindings/reset/thead,th1520-reset.h
> new file mode 100644
> index 000000000000..ec10751814e5
> --- /dev/null
> +++ b/include/dt-bindings/reset/thead,th1520-reset.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef DT_BINDING_RESET_TH1520_H
> +#define DT_BINDING_RESET_TH1520_H
> +
> +#define TH1520_RESET_WDT0 0
> +#define TH1520_RESET_WDT1 1


--WE881O0NIJLSEjS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQjAcAAKCRB4tDGHoIJi
0n1CAP4m0yajHLa/MSox0QSJHmD92CP5eFO1xINILg9LNE7KowD/edgItl4xdrao
dBqNau3d679aFegrxyqICNRrYm8figQ=
=9Hl8
-----END PGP SIGNATURE-----

--WE881O0NIJLSEjS/--


--===============2397184880642329716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2397184880642329716==--


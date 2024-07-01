Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CE5C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWJHIwyY6tSiRFZkFVvgrN6+UlyW5pc4qJK49GWJfMM=; b=ZwnFjt49/erncaU7v8hLO9OfPj
	qu81d5cVZSpO7SIYXq6dmi//+of11pDUby7QUPuzS/9QpuyZTz4/7HMnh/VxUAY5UazBAhpJQ213u
	poeeIXEZJx/o7Ti0jIXbNBmDiuZFDK+TPuxn98HO6dItKZzJ0BELq/rPsm7yIUv5Qs+KnNYDILJZ1
	Fvx+ickV/f4IfHTq84xaUDVkaswClQfMQ4zcj7UvyDrNGnjo2hgpanTG/0hENsCJTaS214qWxfIcJ
	DJMABw8+V/i0RBK57fs83VUusravrH5vHuO6yLLU60S0jTNVOez6veoFn0Bzq+LNXhkNtSpx5uGHT
	r2IkVUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHk1-00000003ezX-1ya3;
	Mon, 01 Jul 2024 14:10:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHjy-00000003exy-3gcB
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 14:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D897361389;
	Mon,  1 Jul 2024 14:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78217C116B1;
	Mon,  1 Jul 2024 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719843045;
	bh=ON+nntxM1A/nZjP7xkxPPcVzGNlKwHXzUiAQYpUlRgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQuibPTHJ3nSdk+Z/Pjt6EzKaXmviM6McN6GlBzArW9AfjD3jubpGYckP9EydFHM0
	 75DmM9bJRkl5+nyem+uXsb6cFEbnvfQ5IkV6lc1Ql+TBeYajAsvZ+wD1hJguSXeEOM
	 1ej8+wbLVzMZvKP/jVOCMH+bCVVJbswstmqzYTJFm6WCahnXKGnGy+mt37++m/Us+q
	 IC3s9/+D6ueVDvXCJmbyPEo6mBAY3/ifze1Mnhb5gJY1d/tH2cL09zwTKAsa2FTBub
	 ST3hVcss6/EAxQ1VhUX6PEd2bx6jsp992CrgPeviRKWHITRqhqjsqFJWpNIe/eIMu4
	 2ETupm0lBSzLQ==
Date: Mon, 1 Jul 2024 15:10:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: snps,dw-apb-ssi.yaml: update
 compatible property
Message-ID: <20240701-unveiling-violation-b351a2514a3e@spud>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-3-kanakshilledar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240701121355.262259-3-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_071047_045720_48B40C9B 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: multipart/mixed; boundary="===============9206013544152479207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9206013544152479207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g3/8GkF0jS0jmNSZ"
Content-Disposition: inline


--g3/8GkF0jS0jmNSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 05:43:52PM +0530, Kanak Shilledar wrote:

$subject: dt-bindings: spi: snps,dw-apb-ssi.yaml: update compatible property

Mark likes SPI bindings to be worked "spi: dt-bindings: ...", but
additionally I think the subject should say something like "add support
for T-Head th1520" or similar, what you've got is pretty generic.
Not requesting a respin for that alone, maybe Mark will grab it as-is.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> updated compatible property to include "thead,th1520-spi" for the
> TH1520 SoC SPI Controller.
>=20
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
> Changes in v2:
> - Separated from a single patch file
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b=
/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index fde3776a558b..bccd00a1ddd0 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -88,6 +88,10 @@ properties:
>                - renesas,r9a06g032-spi # RZ/N1D
>                - renesas,r9a06g033-spi # RZ/N1S
>            - const: renesas,rzn1-spi   # RZ/N1
> +      - description: T-HEAD TH1520 SoC SPI Controller
> +        items:
> +          - const: thead,th1520-spi
> +          - const: snps,dw-apb-ssi
> =20
>    reg:
>      minItems: 1
> --=20
> 2.45.2
>=20

--g3/8GkF0jS0jmNSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoK44AAKCRB4tDGHoIJi
0i+KAP9WbgNjmAJbuYovmoWmaxtHGrw7NSki6DjRw3Zji1HEmwD+JSgByUspkeDv
u7tlU/holugHHzXnp08OUX7QEnYk3go=
=I0Ar
-----END PGP SIGNATURE-----

--g3/8GkF0jS0jmNSZ--


--===============9206013544152479207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9206013544152479207==--


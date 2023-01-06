Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC57C61DB3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 21:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tJw9HOFMd5EScj1btCsWWDcEYWDRBHIm/qJ141UF/I=; b=TRgICeby258G1CsYkZoxlOC6Ra
	vztnUKOjaft71CiRK/0kpzisoaIqWWL3rx7jnm2fRJkqAdNs6SssNqfqzKREGzN7KhU+7uy4aWUlA
	QIHRKNc82+eiCQBgWF/1KbF+O+NBlLI50BULP+ZAJX93ypN+4VKCjTUwBqcu3UKbJed4sYaVF66Sy
	8lY/akoET+ioL3bHevutc+D0sCdf94TJC9nJ6RHCrcR7CBfasqpuVXze+19Bgk64IqC7n6ULs/SBh
	MVkQo3IEvP2KAEHfPGvJzkRQWEHqHNWxddEXZvaosiK9AxsQz7qI+lem0iuHzC8SzSirkA91wZLWT
	HvhyawWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDueu-00F9bf-4w; Fri, 06 Jan 2023 21:53:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDueq-00F9aQ-OG
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 21:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1437961F86;
	Fri,  6 Jan 2023 21:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1CDC433D2;
	Fri,  6 Jan 2023 21:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673042027;
	bh=rI+SEvyTIsvgt30L44Eed0n2Px45rBkzB8yN8mvHwXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNCqaw/BCF+CSc8AjqiAkJsFi2TwnVft2XalA+XwUYQ9OT2XecNC9pxLgIG+Z0/qC
	 H+21MbYZ69zzk5bXUIqZ0xPmeqw8Pupf0IDUKw6src9anTmZaZEgkAHAJ4JNwJczSN
	 rqEvPJTAd/jAqT5tZusogGTLtCuMBs4KVD7RBxbtDguMeOa0jZ9dW7TMd37VIsneJ7
	 fstTUvMAvGgNqYhucqQQSmEQ6v2rKHi8vwdMXnWxvecS1NOE6hzq0Dojj5jO0mkhq2
	 FL/1o4hFKF8FoFtIm2Y1wADLdvtmDz9YVRtuBEALtaqeCiJ73ps3I4sZXuFhQtQ1O4
	 kA/d3AxLNOfZQ==
Date: Fri, 6 Jan 2023 21:53:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Message-ID: <Y7iYZqKcoRycsoTg@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230106185526.260163-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_135348_884890_2350A856 
X-CRM114-Status: GOOD (  21.30  )
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
Content-Type: multipart/mixed; boundary="===============0675795478786967014=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0675795478786967014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tIA4JDPsWfQayrqA"
Content-Disposition: inline


--tIA4JDPsWfQayrqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 06:55:24PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
>=20
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v5 -> v6
> * Included RB tag from Geert

I think not!

> v4 -> v5
> * Dropped L2 cache configuration properties
> * Dropped PMA configuration properties
> * Ordered the required list to match the properties list
>=20
> RFC v3 -> v4
> * Dropped l2 cache configuration parameters
> * s/larger/large
> * Added minItems/maxItems for andestech,pma-regions
> ---
>  .../cache/andestech,ax45mp-cache.yaml         | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax4=
5mp-cache.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.ya=
ml
> new file mode 100644
> index 000000000000..9f0be4835ad7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andestech AX45MP L2 Cache Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  A level-2 cache (L2C) is used to improve the system performance by pro=
viding
> +  a large amount of cache line entries and reasonable access delays. The=
 L2C
> +  is shared between cores, and a non-inclusive non-exclusive policy is u=
sed.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - andestech,ax45mp-cache
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: andestech,ax45mp-cache
> +      - const: cache

You might find value in a specific compatible for your SoC & enforce
constraints for it. Or you might not & I don't care either way :)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--tIA4JDPsWfQayrqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7iYZgAKCRB4tDGHoIJi
0p46APsFNXlYwWU3GS2ttLrn+Seaopu4i3MRZtRPmU+RWPVj7gEAuhpuF3CBfuYo
qNWNGFI9q2g2IQ3D9k4AHavtlGWS0ww=
=pobs
-----END PGP SIGNATURE-----

--tIA4JDPsWfQayrqA--


--===============0675795478786967014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0675795478786967014==--


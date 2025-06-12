Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541EFC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x0StkgfcYfM2MLY8CvlhAZJgAEsvi47j0hTL99JU9c=; b=1TbOQOBIo7zD8Oot0tKS6vp1vf
	/Rfsh2IX+OQe7O3ShXWW98q1tJDGxHs+RgYyV4TxCrSiTwm2JtyI/1JMTIx0FU3/a/oYSBO9UyXQ6
	mEQ8V7PtMi/hy/j7tvkvEUG014VygOQC8i1T9t2OFqXSecCoRGLjZWGYANHtpk8g6dphY7877emDh
	rXEOJc8RhsqNJBXup9BJpBoMk1Op6HI+b+sHj1TWWNS25cF7HkOoFmglGpuO3rnunnIwHpLlvpM2G
	dtMNBpgnoIrQJscoi6m74hVtgqgTOqZVNKX+uJxCMVWvDg/+ZEMJFJqUtcoQ0VEYKGKYG+xLhvPiW
	jK8K8pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsD-0000000ELwm-0a2j;
	Thu, 12 Jun 2025 19:46:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkQ9-0000000DtiW-22WL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 16:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F71CA51E73;
	Thu, 12 Jun 2025 16:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD165C4CEEA;
	Thu, 12 Jun 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744292;
	bh=COIWAD9Jakpzo0yFDTumEeGqKLB4OHO2BnSyyumsKRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFNDjx0X0nL62Q4iwIJDDPvVYY1lg8EPQ7a55Rg1ntWkbImh+4q9SBxg5s+21koyD
	 +xxlh7EfQXwsnxFgaPV6RIMDVndj3aXe2G3jyGdLmz9me6HQeyenSPnQaZGk/U3Z/d
	 fQk0vL+mB+pVIPnJoxv/iGsoMnotOT2DZPz1ENaGKpqJvZmUrUMRD7cuucMI0Zn9LE
	 LFfV3VdV9OUNgthpGqjQaKCYMgvr5GebfwYH6SQnf20ATPuzVUihOg6NfFkJUd3IZ7
	 IQlKojesNrBwsYPMgXkX0LfnFJbzG2pmvb5SxyvogRVivvwYQQrE1gdreM5QpUqBGJ
	 RL72qJ18+weJg==
Date: Thu, 12 Jun 2025 17:04:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250612-culpable-roman-295df1360198@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250611082452.1218817-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_090453_660537_12B7B61A 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Type: multipart/mixed; boundary="===============8161228392412169436=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8161228392412169436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vDGa67YNy/FrbwY3"
Content-Disposition: inline


--vDGa67YNy/FrbwY3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> access to configure related modules. It includes a usb2 phy and a dma
> multiplexer.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-=
top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv180=
0b-top-syscon.yaml
> new file mode 100644
> index 000000000000..e8093a558c4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X SoC top system controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> +  register access to configure related modules.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,cv1800b-top-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "dma-router@[0-9a-f]+$":
> +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#

I think you're supposed to add "unevaluatedProperties: false" to each of
these nodes.

> +
> +  "phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#

Why are these permitting random addresses? Are they not at fixed
addreses given that you only support one platform (modulo the rebrand)?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@3000000 {
> +      compatible =3D "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> +      reg =3D <0x03000000 0x1000>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +    };
> +
> +...
> --=20
> 2.49.0
>=20

--vDGa67YNy/FrbwY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr6ngAKCRB4tDGHoIJi
0l2QAPwNaWEYplXDLHYU0BTmmeZDi2+B04/jYyy1li16HuxyqQEA/PaboP5bnjt0
CzDx5GBKh23TZLwdXLtMNxFSH3ZKTws=
=Bne3
-----END PGP SIGNATURE-----

--vDGa67YNy/FrbwY3--


--===============8161228392412169436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8161228392412169436==--


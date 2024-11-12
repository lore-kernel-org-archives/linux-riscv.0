Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E27D42BBE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7houhUOoILOsGy3Wfayycmrp9mCxCzmJ010CxQJKIA=; b=J6Hel4Ztnq+3/vA77PU5Dn8IYQ
	x/tLMfaKMxvAU4wCB9YCsNPaHpdKatcPU8PEK+vLCoDureicfXntgkCPhDUYxCisNuFdJMQdvwO9G
	joxTfMxyexhoLLmK9YI13TTsKxqGa8RyBfYflQarEt7W+lBYOATu+jtZjlnXvYjgomZsT6CM8f5TN
	E8nBTBbjNo7gR86/MUFyH19OJi15lYHYlhHNk/fcFUp001Kg4KbWgqU3dEBv059KqZ5rf70awbOak
	gXoTxPu50rwtjRuaCBgLVAiZv/3RzYNWaotYZHMpFbY0PnEsQXlPoK4P12VPMDY88UPEGGOTyOf4c
	dyLhDG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvKT-00000004VCA-0nBA;
	Tue, 12 Nov 2024 18:09:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvEW-00000004TuO-0Jil
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 18:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9EFCA42005;
	Tue, 12 Nov 2024 18:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D05DC4CECD;
	Tue, 12 Nov 2024 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434598;
	bh=tpLHM8gccjiB9TKd4r6ak7Z24HirrOP9meXzwB/YKZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j86D5prCl7y97ZHmVe6LqOL10fpsKI+gwn8KSrIMNXO7taHDN2iLHhMcYBZkXQvw7
	 RyZfPfyHQyNJeokKsxj3ACb9qLnduUkhFajLl5pMclUQg8EqWWXLkmYJCbTQe4VJ9A
	 rbhwn1xkFpFEsCI5d2pZROcoIv58b0yspcrtIf4teipc/6VCDwt5S1puGQXWGdZNyE
	 mkbckZ6xOUV9icV0L+RoCPDLwDPajWAJD0iQE4cTyn9KAd0BSk9yobhkVCwhyq5Dsr
	 3pFC5gI4M+ix39GLDHVQ/9a4mevaVYsILXh5XVhKSbG4MZc/LzyQLlhffBO5vGu7uO
	 Nq9OQSJ7hThoQ==
Date: Tue, 12 Nov 2024 18:03:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <20241112-aged-trailing-cffda6af0944@spud>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_100320_263171_6C93355D 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============0779165149531072156=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0779165149531072156==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dWgxOHE1CCfc7zNw"
Content-Disposition: inline


--dWgxOHE1CCfc7zNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
> From: Troy Mitchell <troymitchell988@gmail.com>
>=20
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
>=20
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++=
++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b=
/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..e8cce360bf03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz.
> +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
> +    default: 100000
> +    minimum: 1
> +    maximum: 3300000

It's sufficient to define just default and max btw, the min is set in
i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible =3D "spacemit,k1-i2c";
> +        reg =3D <0xd4010800 0x38>;
> +        interrupt-parent =3D <&plic>;
> +        interrupts =3D <36>;
> +        clocks =3D <&ccu 90>;
> +        clock-frequency =3D <100000>;
> +    };
> +
> +...
>=20
> --=20
> 2.34.1
>=20

--dWgxOHE1CCfc7zNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOYYgAKCRB4tDGHoIJi
0j7FAQCbUUgxdSJQs+FT/bE1oW0kpoCBE49kCO83l0nOmUPHpAEA85bBZy41ZiTq
ots9GS42MSa62edsAPDjufaHt6iEggc=
=L2u2
-----END PGP SIGNATURE-----

--dWgxOHE1CCfc7zNw--


--===============0779165149531072156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0779165149531072156==--


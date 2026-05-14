Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9143DCD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8+ezbxkIWRwA8jzZ6O5U05avD4W9LJ0F8hcvhvakE4=; b=xYRBhSS866BhKxBYA9gBjngMhK
	va8SxOoF8SP1pkTQoGtWktT5Q9mQ6inhrSb8wrPsNF/BlJG630Ao2iDDzjHjxWfJJ7eTCYT9d/An0
	uzqI1JMvkdg5PlMBn3+C2snE+UFLSJjoM/6sl0eAQGvTJs/TTmkgMM4sO3lMh4VlBEuvm1L7FSg++
	ikPMyhnHofDxgFzLrbzyN+WQv42IZzM4Cm+o3C/rvR9DCruHseYX1TIHtNtwT1n0jrCvp5EAgT0rQ
	8gHF5LAD4h5g7gUxkLk06Qcz3Ezqdq/NHyXku2isy+UXtvXkPFxbDDHMu9XdgjSESMbFemrR79XUz
	57P6V0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNauZ-00000006KwQ-21xH;
	Thu, 14 May 2026 18:35:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNauY-00000006Kw1-0shh
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 18:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BCA260008;
	Thu, 14 May 2026 18:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5989C2BCB7;
	Thu, 14 May 2026 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778783753;
	bh=LpfA4YJLp82nKZ7j8ERgicnB0lfPbUUdobv0xO2bWZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlj98AlDQyTeX12JFgkt/ly0N1n9zIuDvPKybIPVZV+gTnzr92YhV/WrC0y+W9XG0
	 TxPVEtSqK55DC9fVH/X2H5It9iRxxz7g+6JVykf4k3iVBtY6F9OJ/jq2hw/uMnWTda
	 EKQB6r8olDKz1si9FcAnQ9+8hOnZ38AYpp+Oh50hVMVbTDg6pj63qJVlSMU41Ld9zI
	 4WDlfk1PxECkRORw7/Bah9ag/IamZ774oZkfPNVbJ+TssAlDoP46GOdsC2luZgqNXr
	 RKzp1Um7JQPXc8gJV5qWIl0He2UMvbNe21rH2A27SrHYUXaoLj086hWkx/uYudyaj+
	 jGi+GaYj0+phw==
Date: Thu, 14 May 2026 19:35:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 01/22] dt-bindings: pincfg-node: Add property
 'input-debounce-nanoseconds'
Message-ID: <20260514-petted-onscreen-0e588a2d1023@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260514111218.94519-2-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============8315047506861085839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8315047506861085839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWLjzhTOBnTrZUGw"
Content-Disposition: inline


--pWLjzhTOBnTrZUGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:11:57AM -0700, Changhuang Liang wrote:
> Add the property 'input-debounce-nanoseconds' to specify debounce time
> in nanoseconds as an alternative to the existing 'input-debounce' which
> uses microseconds. Make the new property unavailable when the existing
> property 'input-debounce' is selected to prevent conflicting definitions.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../devicetree/bindings/pinctrl/pincfg-node.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index 97dbce8a261f..4db66cdf438c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -104,6 +104,11 @@ properties:
>      description: Takes the debounce time in usec as argument or 0 to dis=
able
>        debouncing
> =20
> +  input-debounce-nanoseconds:

-ns is the standard suffix here, and if you use it you can drop the ref
below.
pw-bot: changes-requested

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Takes the debounce time in nsec as argument or 0 to dis=
able
> +      debouncing
> +
>    power-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: select between different power supplies
> @@ -214,6 +219,13 @@ allOf:
>          input-schmitt-enable: false
>          input-schmitt-microvolt: false
> =20
> +  - if:
> +      required:
> +        - input-debounce
> +    then:
> +      properties:
> +        input-debounce-nanoseconds: false
> +
>    - if:
>        required:
>          - drive-strength
> --=20
> 2.25.1
>=20
>=20

--pWLjzhTOBnTrZUGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYWAwAKCRB4tDGHoIJi
0rIOAQCBZn1RMJo851Cn3cOWdtjpvbrU87prJ18Ys3d0fR3dMQD/UMn0zfMmTLW1
R5NuaVy2a1l4qhNVvCtgC33sqC0w3ww=
=GXnu
-----END PGP SIGNATURE-----

--pWLjzhTOBnTrZUGw--


--===============8315047506861085839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8315047506861085839==--


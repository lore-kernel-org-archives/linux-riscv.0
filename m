Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F824C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3NnbNux/gKSR41CkFxb/+fWYRlDEx/kHD00cqMQTKo=; b=YQV+j8f6ULZmPazF3eL0lLbROh
	SBYkXl5RVPjmg1CwkMDxurBIegrbpc3KqGNZy4/7kFdQ/Imkx/LbCjEmp2KtCYAsfTLL38AAtZgIV
	8fK0vxKfqNjJ0Y/EDAPqOyWxo/q2CRN2RTpG5F1mtxJk+xgjLDgUvY/uYVddpRTmEoST+otuehbKY
	cQ65unhwB+C4v3cveAFJeO19ewUE9pfr8h74KWiiLEHaKawjjrAmUWSGKn0o1XFi8KYBdO9j/xzYB
	QM51RZo6O3mDBcbQZg3zGnMNtg7+dTtpsyjGGdXcLJRXlOnOHl36hwvm84/+M9BHya9jGf3cSTRYZ
	e58XK5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0EE-00EXXb-0z;
	Thu, 26 Oct 2023 13:16:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0E9-00EXW6-1q
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 13:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC9F760B76;
	Thu, 26 Oct 2023 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8796C433C9;
	Thu, 26 Oct 2023 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698326204;
	bh=K9OAFyz+7TNreG16Cevm17Kt9VFkMRVq0eOtrmSO5Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Om7zOqYTp6V3XsoLvP5+ArLRL0sJbOrEYW8ljitfiu3783rlKacY152DZWCbdtjuk
	 ECyj1VAA7nymvEW0jgdbbUFcxxuKitjKcLe+o14HTW70Rrnmxx/CbCdvz21CY6Mhrw
	 zacgjzBdcy+dGT73FVndVFz5aSg6FY/d7Zs99nyFXE8OoPvR0AD0/M8WSTTuP0I90Y
	 Gy93YXEl2xEvrRaBEKx3HgA5vlsi5FoGxZ5S9XFogMaEOqy0qDeC50DEygXxiFIMAv
	 Uwdtdbc8z7NrxmjY9JtNAdGlqMhzwfhk2Y1B5rjuipx6E7OlDI2nF84mNsRclO5I2m
	 6490aI19k4F/A==
Date: Thu, 26 Oct 2023 14:16:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/4] dt-bindings: cache: sifive,ccache0: Add
 sifive,cache-ops property
Message-ID: <20231026-cupcake-smashing-eb150e74a17c@spud>
References: <CAJM55Z8DXDs6LT0JrTyEMp8V6BHvsjUW7aJ8Gj+fRGsasHAi_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8DXDs6LT0JrTyEMp8V6BHvsjUW7aJ8Gj+fRGsasHAi_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_061645_655342_34C644DA 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Type: multipart/mixed; boundary="===============3463852921900323594=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3463852921900323594==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hRUnr5j1rWZpVzgz"
Content-Disposition: inline


--hRUnr5j1rWZpVzgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Emil,

On Wed, Oct 25, 2023 at 11:56:41AM -0700, Emil Renner Berthing wrote:
> This cache controller also supports flushing cache lines by writing
> their address to a register. This can be used for cache management on
> SoCs with non-coherent DMAs that predate the RISC-V Zicbom extension
> such as the StarFive JH7100 SoC.

I'm not really sure why we need the flag, is it not sufficient to
register the cache ops on a per-compatible basis? At least for the
jh7110, you're always going to want them, otherwise your system is going
to be largely non-functional, right?

>=20
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 7e8cebe21584..36ae6f48ce0b 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -81,6 +81,11 @@ properties:
>        The reference to the reserved-memory for the L2 Loosely
> Integrated Memory region.
>        The reserved memory node should be defined as per the bindings
> in reserved-memory.txt.
>=20
> +  sifive,cache-ops:
> +    type: boolean
> +    description: |

and this | is not required btw, since there's no formatting here that
would need to be preserved.

Cheers,
Conor.

> +      Use this cache controller for non-standard cache management operat=
ions.
> +
>  allOf:
>    - $ref: /schemas/cache-controller.yaml#
>=20
> --=20
> 2.40.1

--hRUnr5j1rWZpVzgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTpmuAAKCRB4tDGHoIJi
0vG1AQD9Fhze9QKqj00P+zguWQSroVY9G3kMiTWghXQbNb9PoAD/bQUYVQNgsLE2
5yEvG+pxv0JoZjPqvCdpwD909s1ZAQ0=
=1ovc
-----END PGP SIGNATURE-----

--hRUnr5j1rWZpVzgz--


--===============3463852921900323594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3463852921900323594==--


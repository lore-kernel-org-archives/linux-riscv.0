Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66FCDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ48kXgSH9P+TgMglnjjS/K3v907oCC9AdmCNaeftko=; b=d+jHqEPo7mCiDZbAtmYwDQHQrH
	fnhmHI8d5+kNGQRcelr+wF0gbLUV/c0TclsSXzYx0HAa+qtEw7PSmer978ltfgVSaSmdbK0yvXpaT
	PwM/umP+IFFIRMQP31tNaUbkUc6xWTDfZLaE4tO3zb7E0I3EZR3Pe7MkyVKLSmMWPHpZBIaJq19uK
	VRY7Qays2BX9PWYwDRjHWmA7Jt4eohf613cu3Lw9y4qKiDtGU6xVcyRrnWckgtujm+buGgAhpIz6p
	amicxoE926gCExwohb/3PTXvI3nLHgh65k27S9TMRaZRHyzZTx3jAhvJEqupkP4mN78a7slIxBfmi
	u4FJkLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmD5-001iO5-0l;
	Fri, 20 Oct 2023 09:54:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmD2-001iNN-08
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 09:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ACB37B82E25;
	Fri, 20 Oct 2023 09:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40352C433C8;
	Fri, 20 Oct 2023 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697795662;
	bh=Mc1hlPCWDoEzc67b2HL65SjbenBfZTNLrCCBJI6gx7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GduuNVjSDu84xGDEpDVvVDUHbOk5JsbRHqP6jtnwPBIe0da+m4IDOvYN7VVIaxyoj
	 7Z0XVpHKpTj8/YWkF+1W7x87mbD/ZNRc2E01ItapradAApLpnA60uQzlqMxIc+4aJR
	 9zFw/VkPDfl5RSs+STNsOomKEN0HQAw1wVpGWRN+gr12jQHFCKqoOtR3oTtAQ6pcP9
	 ctFCsQZk+ptWuv7BptiZczdQfxnPHFUZrvE9BjRg++wLPKoLylPdw42gkFBkpXlwTA
	 DyZ26W/Jw5KLUXJS+OZ+9UsMEljFQD3t4WGMW9mYgvDSywplMh83bwmG6ZthfhEWfA
	 mzcLDSsblx8gQ==
Date: Fri, 20 Oct 2023 10:54:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com,
	dylan@andestech.com, locus84@andestech.com, dminus@andestech.com
Subject: Re: [PATCH v2 05/10] dt-bindings: riscv: Add andestech,cpu-intc to
 interrupt-controller
Message-ID: <20231020-droop-decimeter-eb22d50d785c@spud>
References: <20231019135905.3658215-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231019135905.3658215-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_025424_239424_E42AC0DF 
X-CRM114-Status: GOOD (  15.87  )
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
Content-Type: multipart/mixed; boundary="===============6022933033999167040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6022933033999167040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aOzht/ojDeW4Ytjn"
Content-Disposition: inline


--aOzht/ojDeW4Ytjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Oct 19, 2023 at 09:59:05PM +0800, Yu Chien Peter Lin wrote:
> Add "andestech,cpu-intc" compatible string for Andes INTC which
> provides Andes-specific IRQ chip functions.

You need to provide some information as to what differentiates your intc
=66rom the regular one, not mention linux driver specifics.

>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..5b216e11c69f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -99,7 +99,9 @@ properties:
>          const: 1
> =20
>        compatible:
> -        const: riscv,cpu-intc
> +        enum:
> +          - riscv,cpu-intc
> +          - andestech,cpu-intc

Should the andestech intc not fall back to the generic intc compatible?
The generic one appears to implement a compatible subset of the features
that yours does.

Cheers,
Conor.

> =20
>        interrupt-controller: true
> =20
> --=20
> 2.34.1
>=20
>=20

--aOzht/ojDeW4Ytjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTJOSAAKCRB4tDGHoIJi
0kNAAPsFMkJdFWcgrUXsnlWZMeknHckgIwKEIgWH18LiCsJoCQD/SSbOIBby4lmf
fEtXLi5CVUzMCTEadGcz0sJW+kxJygY=
=eRD6
-----END PGP SIGNATURE-----

--aOzht/ojDeW4Ytjn--


--===============6022933033999167040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6022933033999167040==--


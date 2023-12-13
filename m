Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A592C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5vVAhlCTs9OMHbGVNe+tmqmoqILVJN/dvipcXwsaVo=; b=EKtSK0j8BN3NGsynq09q20/peX
	Oyk6NutDuCKEEIc7xIlJUEQkqwIiju1e2XUkzJMs5YeoKTkgqRx5nIplJEw/fJweuPmByJBItdhYe
	pLb4dYhVXbXEtabMXUbZtSYwbb5lfehwGxd/wwPID2ewNDHVqKhJwrfM9Ptkq+Hwlof/oE5N8Vl0f
	HrSFe3C01dc/d3Ubq4jk+icI6y6BnMMsZ1Fjhs9SvGVYrON+KooAmKLdYuewUB2oQ/dgVQpLrFWNZ
	XSf8tBaGJMteAJeyUNpqePKYaBhVi9AEaBKEUCO1Nx8JDKYF8b8AerFjL142xFbPKrWTbz+0QJ0ne
	zOkmXc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR8G-00FDhY-1x;
	Wed, 13 Dec 2023 15:26:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR8C-00FDec-1b;
	Wed, 13 Dec 2023 15:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4F226132E;
	Wed, 13 Dec 2023 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA69C433CB;
	Wed, 13 Dec 2023 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481199;
	bh=5LrrEvMyyj0fWb6NPjVbblFGe/sJuNAe4eX2ZyX7Kt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gb6BH7D+aYS61woucg5hbgnpKCFH2JrZe9F7CoamrCJlrRo+15C86NHi2e7T9MoI0
	 voFaVtvfZv/m36LPNfwBTmuS+fzS/AZgBTL6y1G5uJKdzX+82fqYVPsguuz4WpGlfR
	 1duPZzQ84PZHAjZJENwupiAANqkRbYlKDP8/kc4RZLH/+/VSSctEpbwMMA6dixOzmD
	 sDUCEhLqqa6Mke47Dab95s7KYkO0rDF5YbInpc//M4u5vOhFqp/NY6TRGcO2+52gFm
	 YH/2i10BIfOinYtmJuflXh8fQo2clkel8PHqG9azTs1GexOFYGdkEgJXJ3+1y3LPLm
	 glD3qCYeHihAw==
Date: Wed, 13 Dec 2023 15:26:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 09/16] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231213-romp-squeegee-0cdb44aff415@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-10-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-10-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072640_621980_40D21A86 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4095146732682792188=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4095146732682792188==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7g0vcE0ZONFlAzn3"
Content-Disposition: inline


--7g0vcE0ZONFlAzn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:54PM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> Changes v4 -> v5:
>   - Include Guo's Reviewed-by
>   - Include Inochi's Reviewed-by
>   - Update to C910 documentation with its commit hash
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..b5cb8ac7ac80 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w, as ratified

I'm not sure that "ratified" here is the right word, probably
"documented" is better, but I don't think that is worth a resend.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +            in commit 4c4981 ("Initial commit") of Xuantie C910 user man=
ual.
> +            https://github.com/T-head-Semi/openc910/tree/main/doc
> +
>  additionalProperties: true
>  ...
> --=20
> 2.34.1
>=20

--7g0vcE0ZONFlAzn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnNJAAKCRB4tDGHoIJi
0rGDAQD3aa1sgvZcl2UuyEAdv8hNrEY8UAeOmq4VVREsig79WAEAp7psoeCxBWLM
X4adVORVHKHi9jWmb2mdq7PBBO0wmwE=
=8PPM
-----END PGP SIGNATURE-----

--7g0vcE0ZONFlAzn3--


--===============4095146732682792188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4095146732682792188==--


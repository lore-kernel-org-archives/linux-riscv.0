Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDFBCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9HqYjyH8uSXPv6OlJVhWcsptkIqcsHfqdScyxSpQlw=; b=EBX85JW3klfi4Pe5iU5btX8Z49
	gPgv93h6cTtn0tUDYnDQcH1tvoPVUS448knwmc9N886kK3K63tRNCQzMLeWaBgfEjMWyCSK2pJULY
	35V3QGlJLBZGtxZK0SDeLgX5C2RF8tE7BEZJu8Q4kYzLaL8BiY2e4uF/SPskIdx8YsYO/rXf3oS6r
	rdkqgPRabIPyHMgM3I/e0URlR9QbDFiQoxurKiosNlhvM+ghD+6SbXhwCNOO+xqTH/yWO9GMGbVY9
	ei3QLBzvytjiWx1oUjBQwzvarVBFRPq3lU4immE0ao8ZjGGJp8jrOTiAFpPiY83wqfiXbQBWzVrUi
	gitppgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quumR-007PXs-2l;
	Mon, 23 Oct 2023 13:15:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quumM-007PVQ-38;
	Mon, 23 Oct 2023 13:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 29EB4B81DA3;
	Mon, 23 Oct 2023 13:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA831C433C7;
	Mon, 23 Oct 2023 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698066932;
	bh=CdJMUFikVJCii5mXprW48PiT+muGUJ/z75ryr8dOT9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gfba+b579X1512dlnYUOz7QOqNdJEPRvyAvHLUmZannabB5KUp/Vd3Nm/wSp8w2Ri
	 waWiz3yGxmNns+bcqhNmTx3yAj8DjeWrGgYG+cILorB5OlTJMUMuZfwBM5P6K2opLI
	 UY4ZUWoLhQYb5c8kuo2Rqj2ltbtYQCYqcShndvP7eJQcrpkDGEqkBKUqewciqhtL4z
	 ZRHbdg0S9NouQGLv9TERVzEhsg491DHa+Nb3tYAsbl/ShQKjEBrY/bAm6jfQFNhnKg
	 n6QRiR+y6WdYy+q4hnLsqr0vNva4ufLMvhzGRqdzZQR30/A4Yj82LcIoT3QECEOCGO
	 RTAdBEBM+aIrg==
Date: Mon, 23 Oct 2023 14:15:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 RESEND 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <20231023-contented-passcode-2e8d082afed4@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-5-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231023004100.2663486-5-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_061535_311879_B9A2347D 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4917615257626772118=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4917615257626772118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="57Aul/yfSew6m9cD"
Content-Disposition: inline


--57Aul/yfSew6m9cD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 08:40:51AM +0800, Yu Chien Peter Lin wrote:
> Add "andestech,cpu-intc" compatible string which indicates that
> Andes specific local interrupt is supported on the core,
> e.g. AX45MP cores have 3 types of non-standard local interrupt
> can be handled in supervisor mode:
>=20
> - Slave port ECC error interrupt
> - Bus write transaction error interrupt
> - Performance monitor overflow interrupt
>=20
> These interrupts are enabled/disabled via a custom register
> SLIE instead of the standard interrupt enable register SIE.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Updated commit message
>   - Fixed possible compatibles for Andes INTC
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..4c1bbcf07406 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -99,7 +99,12 @@ properties:
>          const: 1
> =20
>        compatible:
> -        const: riscv,cpu-intc
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - andestech,cpu-intc

Why is this an enum rather than const? What other entries are we going
to add here in the near future?

> +              - const: riscv,cpu-intc

My follow-up question, if my original question on the v2 series had been
answered was going to be about how generic the "andestech,cpu-intc"
compatible is.

Having a cpu-specific compatible in addition to "andestech,cpu-intc"
one makes sense to me, so that we can differentiate between
implementations/integrations of this intc, especially if Andes have no
plans to move to the standard implementation.

Cheers,
Conor.

> +          - const: riscv,cpu-intc
> =20
>        interrupt-controller: true
> =20
> --=20
> 2.34.1
>=20

--57Aul/yfSew6m9cD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTZx6QAKCRB4tDGHoIJi
0lxjAP9yZzi/BFekfjYM8fNDu6y5img3GQ6JfxNOt5mf+VPcSQD/U7Y4IGJ8P8Uy
b+1kEyPrf/GAimbqTmYZqLzmAO9cNgw=
=3GJA
-----END PGP SIGNATURE-----

--57Aul/yfSew6m9cD--


--===============4917615257626772118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4917615257626772118==--


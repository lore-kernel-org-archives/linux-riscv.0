Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F003C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTcMWNeXwj8oa1hrjZpFOOT0eueV8XGGdFm+Goh+eaI=; b=k5D/s6g380KvEyUr0VFpEcwcME
	QLYgI71WkLyrf5i8eIKKkYEfcbnueDH6mOIWL3dIPSHqeeA8EFlp2yczaJPWA+VXHmHP5c0OC0hWc
	XKC8CP1of7xz1cqqUDxrhhexEkMllL3X2q9BCn7PPrCMc+2IBVCjcgnjIHLUMKS9ZUNhahG/NNDFI
	BK4RNS5ABwRUEXsOAWnd8xkcBxOjTAx+CpuIge21W8I2ma4JOR9Si6wfTTwTrpQY2U2GuQK/d5X+D
	LNX/mjKfU5uTzxUh5S0ZVGgu5ykHaPrZfB9pw1xD7Qeth35DCNarvF4usEOGdQhZlSCLRLObPQEuJ
	pFn32D4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS26h-003PLf-It; Tue, 14 Feb 2023 20:40:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS26X-003PJT-8q; Tue, 14 Feb 2023 20:40:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D61EB81F19;
	Tue, 14 Feb 2023 20:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A53C433EF;
	Tue, 14 Feb 2023 20:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676407242;
	bh=lrMHbP8q0keqDRMjaD+3mRme+hAn8zfTo/aQ3vWmmtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/u+uC3yXfTg2vn7K6SjTSKS0TShbZeExViWDXYRuKdIdJt4lWLgsUzFtTB9+oBix
	 OYnxLELivlgY8ZusvjtadeoIEYDKgolLDGsf88AmCk/pu6B/3sov1k+yqIVp3Wzd+H
	 7ZeqyGufHpAH2yxyRFGDtxnBBfzUHyqeGQSl/9on8JO1jHFd8sBCzkz3b0vOEmeuDz
	 rBUYbuc48nEhILbcRULwjH3sOLcDmzxq/Q/QC+3EYgEPBTEjO8WYvl2gUcv3Tx3DMs
	 YoMc9fb6Rk8PcH10uGGA4vTj4U2dKCTKV5MXgAbGr7SYx+XWlKVZPMM1UjF/NOEStN
	 J1yvMSBThs9bA==
Date: Tue, 14 Feb 2023 20:40:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 01/12] dt-bindings: riscv: sifive-ccache: Add compatible
 for StarFive JH7100 SoC
Message-ID: <Y+vxw28NWPfaW7ql@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_124045_628420_DD6EEF8D 
X-CRM114-Status: GOOD (  22.42  )
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
Content-Type: multipart/mixed; boundary="===============2863023992696800983=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2863023992696800983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c503JmGKmuhITlWZ"
Content-Disposition: inline


--c503JmGKmuhITlWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

On Sat, Feb 11, 2023 at 05:18:10AM +0200, Cristian Ciocaltea wrote:
> Document the compatible for the SiFive Composable Cache Controller found
> on the StarFive JH7100 SoC.
>=20
> This also requires extending the 'reg' property to handle distinct
> ranges, as specified via 'reg-names'.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index 31d20efaa6d3..2b864b2f12c9 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -25,6 +25,7 @@ select:
>            - sifive,ccache0
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> +          - starfive,jh7100-ccache
> =20
>    required:
>      - compatible
> @@ -37,6 +38,7 @@ properties:
>                - sifive,ccache0
>                - sifive,fu540-c000-ccache
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
>            - const: cache
>        - items:
>            - const: starfive,jh7110-ccache
> @@ -70,7 +72,13 @@ properties:
>        - description: DirFail interrupt
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: control
> +      - const: sideband

So why is this called "sideband"?
In the docs for the JH7100 it is called LIM & it's called LIM in our
docs for the PolarFire SoC (at the same address btw) and we run the HSS
out of it! LIM being "loosely integrated memory", which by the limit
hits on Google may be a SiFive-ism?

I'm not really sure if adding it as a "reg" section is the right thing
to do as it's not "just" a register bank.
Perhaps Rob/Krzysztof have a take on that one?

> =20
>    next-level-cache: true
> =20
> @@ -89,6 +97,7 @@ allOf:
>            contains:
>              enum:
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>                - microchip,mpfs-ccache
> =20
> @@ -106,12 +115,29 @@ allOf:
>              Must contain entries for DirError, DataError and DataFail si=
gnals.
>            maxItems: 3
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7100-ccache
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
> =20
>      then:
> --=20
> 2.39.1
>=20

--c503JmGKmuhITlWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+vxwgAKCRB4tDGHoIJi
0oxaAQCGMYKDUNPRgSzkFdb5w580ar4q22vbuohV/qlN+nqmZAD9Ec7wuDk6FVks
xfGCasNhDtktyM9Twv343D+jik817wY=
=2zVT
-----END PGP SIGNATURE-----

--c503JmGKmuhITlWZ--


--===============2863023992696800983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2863023992696800983==--


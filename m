Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564EC6FD1C
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd5afAdfB+xXUErc7PJ692chAp0W0MduNxrOoZeSYiY=; b=gnQ0zCmJaVriv+Rf6Et8pSWOXV
	VTxj4Cgx5uNFzamWVqXO3374wXKdb5Hk/4G2YpPEh5eaUMA0LYMtcS4K+gEIUe6SZxxW4fyVfok1c
	6WpVYmEekLkehw49LWk5IroIIrlXnerA7eqvZLDdemEK8oQ7WkANmchBdiAIaI/dOanL08DePI7Xh
	iCfXAf66zErjvHy8gON3ykn86YD+qJdzmteM+60lO+zYWNTn7UenX4Hq7X0yrCk8vfmOgtSyu3oDS
	UiecyzUW/5obKNANzY+pn1/Fuu7Hy/t20rmQaISpyk07Cw35sk35yRVIOrfLH5ERB6+lATJu2dkdb
	Y2u8nLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paz0p-000Zjk-Kw; Sat, 11 Mar 2023 13:11:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paz0k-000Zj2-50
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 13:11:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC70260C0F;
	Sat, 11 Mar 2023 13:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB64C4339E;
	Sat, 11 Mar 2023 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678540304;
	bh=k5Rt3l8pfBEJ235rZf8weV1YbFpwHUyaIWuhs70r6gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ck+R40RLxwL1f54SPwBVujJeOvHZtHQvoSOnryGpBwlrRs48oHphprqkFis4czaUv
	 imHb/rUswc0ews932WBQORLm1k8aa1WlO4+3eWq+O9K+1Hrb73kOO4Lold3LYDrFo6
	 ++L8Mn57VOsyKVTndeH0lIu1Cc0bUeKMgBYDXKIVteGocr+ARU8qLFPp8l5djLqWuH
	 0Q3ypEIV1nXaTuAh/LdN0i/Wc1qHo/tl0pmGx9rsueu6BkBlfXcg4vIIraLOhgfiMT
	 hNzR4u+gFNm4wYE1aqjKqsVuEIaJSLHnt6lEaRJGty2cPxoI+9tZHLdjjgRUPQYNDT
	 jm2NNH4NJas9Q==
Date: Sat, 11 Mar 2023 13:11:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <34b0473a-91bd-453b-91dd-01defde92d68@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230311090733.56918-12-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_051146_286017_6D67CD77 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: multipart/mixed; boundary="===============2838152973942239294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2838152973942239294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n5MdS1AR7BVERisz"
Content-Disposition: inline


--n5MdS1AR7BVERisz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 05:07:23PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>  MAINTAINERS                                   |   8 +-
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>  4 files changed, 454 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh71=
10-syscrg.yaml
>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.ya=
ml
> new file mode 100644
> index 000000000000..84373ae31644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml

> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: osc
> +          - enum:
> +              - gmac1_rmii_refin
> +              - gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext
> +
> +      - items:
> +          - const: osc
> +          - const: gmac1_rmii_refin
> +          - const: gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext

Assuming nothing else here is optional,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--n5MdS1AR7BVERisz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAx+CgAKCRB4tDGHoIJi
0gkTAQCLhD9mRz1rod995MlPJl5nFDisZYW9VFFMTO5CkYOlfQEAsiEcOvJXKX3k
YDj9xHKjqAmz4X6uKzPqvGqq/akEyQw=
=rizi
-----END PGP SIGNATURE-----

--n5MdS1AR7BVERisz--


--===============2838152973942239294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2838152973942239294==--


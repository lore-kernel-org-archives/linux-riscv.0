Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izfLj5mJcy0WRpmWWMWIHdMvjR8qCzK68coS57Q2r40=; b=TyyIAERMqOJ+C6kHZaBmf4vC3q
	flFQ+i0uwrRUYurTp9YHbZaHSBoMeff3EDHBZKblRBzyqPRtqts8JpuCUUhVMdBg1bxp9yJkp2oDD
	QqVnxuFJxQjZ+pqrwBvgurEqo7n3pIiLHmDjmBmrgxIRuE29hWAtL0Ax5TcMBb4J3eilFm/lrY6pc
	CQvfKL72nt50hE36MI5RABJWl46R+EU0LcaSA2T6CctKIpfBlTzej7O/a8PP5IL+GzSvSGeBuwFub
	Gy6jM1+NFqQ6k1o6XnjHFTyNyrsmj7679/lDlpliebKtYZydAPbeaw0qzJft2B+NxGtuabQZMw8PF
	D99yt6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ltF-005lEC-QZ; Tue, 20 Dec 2022 23:19:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ltC-005lA4-Co
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 23:19:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 919D6B81A58;
	Tue, 20 Dec 2022 23:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D797AC433D2;
	Tue, 20 Dec 2022 23:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671578349;
	bh=qMUMHQtG6S21x4uF4KO8b+hnyWIfjJB888+0zqmuxAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgWiKaioHWClemJ2WCkd0i7zKlWk2cbjoeyTwK2nSgdcgF1YAS62qojUink35rzQ0
	 4SIhzR47AodUfs5DfPN87n2ksgHHD5JskdAkaSwMiF82BbsU6zP6zdGih/pZo9TOZy
	 oBGZ13tp5Bdj9sMioswX5LXY+eWwsgl+5Y7zBPUVknTlooOgI98z3dF6VHfPWxwQzn
	 rZ6BufP85uZZ8ZNSOvKIWuJ03zdIwPlJm1zQjhPt9ui3kAIKJ6VNh6M1eVpNlqu7Lt
	 RlZYv0MrT/tqkTl17WOeaE4vxJC8j/Gv3dslLRaTNwbEFJNe3Vr/63dwjfatIhExSZ
	 qh4Rtxlo9nkxw==
Date: Tue, 20 Dec 2022 23:19:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Message-ID: <Y6JC6PZaRMYxZG5Z@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-9-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220005054.34518-9-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_151914_750764_2C5C53D8 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: multipart/mixed; boundary="===============4072924512452624155=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4072924512452624155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WUqIxYHpBSMPOybA"
Content-Disposition: inline


--WUqIxYHpBSMPOybA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 08:50:51AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 12 +++
>  3 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh71=
10-aoncrg.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aonc=
rg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.ya=
ml
> new file mode 100644
> index 000000000000..a3cf0570d950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-aoncrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: RTC Oscillator (32.768 kHz)
> +      - description: GMAC0 RMII reference
> +      - description: GMAC0 RGMII RX

Gotta ask the same question here about the muxing - are all of these
clocks truly required?

> +      - description: STG AXI/AHB
> +      - description: APB Bus
> +      - description: GMAC0 GTX
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: rtc_osc
> +      - const: gmac0_rmii_refin
> +      - const: gmac0_rgmii_rxin
> +      - const: stg_axiahb
> +      - const: apb_bus
> +      - const: gmac0_gtxclk

And if they are, is this actually needed since the order must be as
above?

As I said in the previous patch, I've probably missed something...


--WUqIxYHpBSMPOybA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6JC6AAKCRB4tDGHoIJi
0hj8AP9mlofAGPd6eI/o8Pxq0+Ws0ZQUYZBn4pD5T51KEOWrnAEAqacpXoQxKO46
3Voprv1hHNQASDRuQJzm1tEZBJNHAwQ=
=Nwuo
-----END PGP SIGNATURE-----

--WUqIxYHpBSMPOybA--


--===============4072924512452624155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4072924512452624155==--


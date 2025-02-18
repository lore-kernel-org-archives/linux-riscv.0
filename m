Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63523C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94X61WyJ76qoxSC6meu0VMezTIrw/gR9GZ1eF8O3K9Y=; b=nbOJyPBFF9hW146wqb7yqpzwbE
	vULvNMQJ4nsrYquNDVOo9kse2em6xwBFLAXoqDuS9Hbs817Nv9BeVm8+k7Wnf9AQ0UHC+EEvH/LEF
	Hq+8qKdkwQsMWYN12LG6WmFbtfqD8jnZNsa1kEqVyTFEuRzGYu5/q4QdqjvtqVuSzIwJKP375zEzg
	qspBIE3SagAGNH1VtZzlFEEq1Y1lRqQFa4PQFwV9DkiS7CnsQcFnW1YmvEpEBLlb+JcgPmqW/Fm1F
	1J8sCB6YuBQNaEI+inN+qOQFv6Y2Ta73WTk1GKGL57zQRRIXLQwwDVF6ahmtx+nSdAmrIx3z01/Av
	6UyenH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQxz-000000094JY-2Sqa;
	Tue, 18 Feb 2025 17:01:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQxx-000000094Id-0HEv
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 17:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C880A41457;
	Tue, 18 Feb 2025 16:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0877C4CEE4;
	Tue, 18 Feb 2025 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739898059;
	bh=wxVWlXKd4zOjpRPoDQOUTBz16/v4noEajLoaLCp3H3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMdQ1jglKvPsgXNlQIywqNhdxIcZB6r1xwgdtlGlNXvWeYmhE8GGQJ8pW5C3oeOwD
	 M0JqZl4PU72vbjh8mr4pqQswaGDikgrfMTCBuFHoGEuohVQYbvcNxDqjkO34YL0J4p
	 B3O5lWK2JuyxGt1yUcSjEw/CrVBrAvcU7Jl+xu3INQ+OHQ1e/8zmIf1h71PGFIrTjn
	 EJv/TCZcDhic9mqBdCPA6lQ7m81f3flZ0nJ2c01guEIhk0ITbX4C7RC0v6b5Pct3W4
	 5Dk2oF4EvI9YgDzK6VbVjeuYICPjWCiCv0cwQNvTrF76PAVfhVsIsyHlckB3c6xVnf
	 pWRcjjEFDtcOg==
Date: Tue, 18 Feb 2025 17:00:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: canaan: Add clock initial support for
 K230
Message-ID: <20250218-status-friend-51fb039ab97e@spud>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
 <20250217-b4-k230-clk-v4-3-5a95a3458691@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <20250217-b4-k230-clk-v4-3-5a95a3458691@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_090101_240613_AD2DA4FF 
X-CRM114-Status: GOOD (  18.62  )
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
Content-Type: multipart/mixed; boundary="===============1640444076589211643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1640444076589211643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wyBkyPjl9mwD8eXq"
Content-Disposition: inline


--wyBkyPjl9mwD8eXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 10:45:18PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
>=20
> The clock tree of the K230 SoC consists of OSC24M,
> PLLs and sysclk.
>=20
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  arch/riscv/boot/dts/canaan/k230.dtsi | 32 ++++++++++++++++++++++++++++++=
++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/c=
anaan/k230.dtsi
> index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..e50ba03c2c21597e5f7d04a65=
2db08f84101cbfb 100644
> --- a/arch/riscv/boot/dts/canaan/k230.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k230.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>   */
> =20
> +#include <dt-bindings/clock/canaan,k230-clk.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> =20
>  /dts-v1/;
> @@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	osc24m: clock-24m {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "osc24m";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		interrupt-parent =3D <&plic>;
> @@ -138,5 +146,29 @@ uart4: serial@91404000 {
>  			reg-shift =3D <2>;
>  			status =3D "disabled";
>  		};
> +
> +		sysclk: clock-controller@91102000 {
> +			compatible =3D "canaan,k230-clk";
> +			reg =3D <0x0 0x91102000 0x0 0x1000>,
> +			      <0x0 0x91100000 0x0 0x1000>;
> +			clocks =3D <&osc24m>;
> +			clock-output-names =3D "CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4",
> +					     "CPU0_PCLK", "PMU_PCLK", "HS_HCLK_HIGH_SRC",
> +					     "HS_HCLK_HIGH_GATE", "HS_HCLK_SRC",
> +					     "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
> +					     "HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA",
> +					     "HS_USB0_HS_AHB_GA", "HS_USB1_HS_AHB_GA",
> +					     "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
> +					     "HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE",
> +					     "HS_SSI2_ACLK_GATE", "HS_SD_CARD_SRC",
> +					     "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
> +					     "HS_SD_AXI_SRC", "HS_SD0_AXI_GATE",
> +					     "HS_SD1_AXI_GATE", "HS_SD0_BASE_GATE",
> +					     "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
> +					     "HS_USB_REF_51M", "HS_SD_TIMER_SRC",
> +					     "HS_SD0_TIMER_GATE", "HS_SD1_TIMER_GATE",
> +					     "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
> +			#clock-cells =3D <1>;
> +		};

Apologies for not commenting on it until now, but this patch seems like
there's some hunks missing from it. I'd expect you to remove the dummy
"apb-clk-clock" from the dts and replace it with a real one sourced from
the newly added clock controller.

--wyBkyPjl9mwD8eXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7S8xgAKCRB4tDGHoIJi
0hatAQCRO0T+IiRpcIn+PLRCtbTAxqFwW6t9fOFOpsJFJCLLowEAl60fTsjXKtv6
qz34I22c5i04TjOJS443k9ADwTGz2wA=
=6K8s
-----END PGP SIGNATURE-----

--wyBkyPjl9mwD8eXq--


--===============1640444076589211643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1640444076589211643==--


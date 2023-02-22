Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FA4C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9HbIti4JPH/KrRkODtXkw1erms4bmHwa7AQw+TrMlU=; b=05DJ1kO+G0cApLdCaBrH9SgRLD
	S0KIWyizAVsHWs8hfSyBF+uNDqfkFUkbNZ3urC9C4bg05yq/wMt+wDPDaC4FJGLgu8HiDXxH1WwRh
	ZYDuZ2kIBbqqFwhNETN6wwBVCqGND1rV/HOBaRqe0plLRwR2FhRxrQN95iB8nikXA+SSwG7rn0kq+
	0CE1wdGk5OE0UvUl6U7/H79qodGP71BYxzsnQpYxbXB1u3CijronEVxOA/RDWnC/NIKwyclRz5Sgf
	7Rdtu2coKqv7YDR1d7k5LgoIqjDJiFMxvbv35n8QgQtR8VJ/Rv77G/lGpdE6GawBORSJ3tyRJS2+J
	CExv9rwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmZ7-00C1bM-9o; Wed, 22 Feb 2023 10:41:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmZ4-00C1ZH-BZ
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 10:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677062494; x=1708598494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=og8oc3RuSx7isHJHsUxe9wkqbVmwchIzWVG+7PVsMs0=;
  b=vlKVHiIFJRZIvcGeTQrWFztM72jlnKV4WvB7JC5/HqLW13kkheudyVMl
   yDKCEhQPQcRpywPnEsqzCOEjrS3V/OAG+eeA33XuFbIP77BDUDzIRbjzG
   BS0Iuqw+3KnveEH8dFnjOcSTQqOaHvOjnj0JeRIpBf0h33WqZErRg8WVO
   /FvweeN54LW/0voFUMtOsvb0JjU3DW8CvEeJNLTguMnR0TWCg8PvvfMUX
   OtYH1E1bWAnnIIUMTvjTVpBlUuzw1JcQHlWDTJkQPkiI+00ub2HmflrUQ
   iAYABrpTzLmj8XY5jFq8+KNPfqcpJ+I7ruQV6eMvIhOelrCZLQaGKyU2/
   g==;
X-IronPort-AV: E=Sophos;i="5.97,318,1669100400"; 
   d="asc'?scan'208";a="138452374"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2023 03:41:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 03:41:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 22 Feb 2023 03:41:25 -0700
Date: Wed, 22 Feb 2023 10:40:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Hal Feng <hal.feng@starfivetech.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 09/19] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y/XxOw+T0WdYY7jP@wendy>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-10-hal.feng@starfivetech.com>
 <e4c2b711-7953-821b-4281-04e4b40154ea@linaro.org>
MIME-Version: 1.0
In-Reply-To: <e4c2b711-7953-821b-4281-04e4b40154ea@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_024134_569526_E41C83D3 
X-CRM114-Status: GOOD (  21.98  )
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
Content-Type: multipart/mixed; boundary="===============1941665636492402504=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1941665636492402504==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A5GMe6d9NPNRqkf9"
Content-Disposition: inline

--A5GMe6d9NPNRqkf9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 10:13:19AM +0100, Krzysztof Kozlowski wrote:
> On 21/02/2023 03:46, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >=20
> > Add bindings for the system clock and reset generator (SYSCRG) on the
> > JH7110 RISC-V SoC by StarFive Ltd.
> >=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>=20
> I don't know what is happening here as neither this nor other patchset
> explains anything. Please stop writing what you do in the patches, but
> explain why. What is easy to get.
>=20
> (...)
>=20
>=20
> > +
> > +#define JH7110_SYSCLK_PLL0_OUT			190
> > +#define JH7110_SYSCLK_PLL1_OUT			191
> > +#define JH7110_SYSCLK_PLL2_OUT			192
>=20
> NAK. Do not add incorrect bindings just to remove it THE SAME TIME.

For some context, the PLL driver series [1] does the following, which is
where this complaint stems from:
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt=
-bindings/clock/starfive,jh7110-crg.h
> index 5e4f21ca0642..086a6ddcf380 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> =20
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT			0
> +#define JH7110_CLK_PLL1_OUT			1
> +#define JH7110_CLK_PLL2_OUT			2
> +#define JH7110_PLLCLK_END			3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT			0
>  #define JH7110_SYSCLK_CPU_CORE			1
> @@ -198,11 +204,7 @@
>  #define JH7110_SYSCLK_TDM_TDM_INV		188
>  #define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
> =20
> -#define JH7110_SYSCLK_PLL0_OUT			190
> -#define JH7110_SYSCLK_PLL1_OUT			191
> -#define JH7110_SYSCLK_PLL2_OUT			192

I was talking to Emil, who pointed out that these defines aren't
actually ever used in the dts, so there's nothing really gained
by adding them here in the first place.
Seems like this series could simply move these defines into the driver
(as the PLL addition series also does) and then we would not have to
be worried about breaking the ABI in the future?

Thanks,
Conor.

1 - https://patchwork.kernel.org/project/linux-riscv/patch/20230221141147.3=
03642-3-xingyu.wu@starfivetech.com/


--A5GMe6d9NPNRqkf9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/XxOwAKCRB4tDGHoIJi
0ouHAQD1J4/fzbT7Ija75eE1nauMe2czMcMbWAzQIL1nwqgxdAD9GIT1Ap0dMr5V
1t1LqyevhjLJUO2GrLIxTX8k1p6Zqw8=
=KcGW
-----END PGP SIGNATURE-----

--A5GMe6d9NPNRqkf9--


--===============1941665636492402504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1941665636492402504==--


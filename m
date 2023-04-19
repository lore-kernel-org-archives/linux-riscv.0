Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F584C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ubZURDQX+HIag8LPHAz1rJEXU6G4qjdmBL3+wAIPRc=; b=Y7Eefsa1QqlTgxak+TWuPRGGZS
	13/SJrVcBNKsjrXWRBBCr3hpdmlvotCF0UJh6P/Y8a8Q4fnRdYDz091Ek59EteUe7MT3nVq1intAb
	Uj4ZZjkKeM+K4WjtpG1a2LUNPhyoi6kVO4IItSRjWEaH9W7p2+FSMET32rAiijlymjQ2WGne1YtCk
	UZ22nN9tzaU9hEBvAtZpIRyN04GhLCb+KJLGdBqbExMGbMbbLpVHaZFvHZGxUOmjebxV0TwD32tE0
	CpxAiaKtj3jSkaIccb5NREDv/N0eG5WcekxTQ3HqUiSQ9cwdNaMeA3LHX0joS4iF/RWSbmqawoJOD
	gMbnk86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1Em-004Dnh-2g;
	Wed, 19 Apr 2023 06:24:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1Ej-004Dma-1X
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 06:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681885453; x=1713421453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8/urAO3cr38Q500Q7Zd86j88a9lBzovlp1Wn4tiEqAs=;
  b=wlRq3yCW0wlXw7iRkcBtwAvBoYPcub+hPCb1oVlzg9O7KYazJfgmHNKO
   i+bKW9nPGYBtShFW9tZKG8LbAd0VREJ3SWxvm9PciRzOTaYgattqDOfqb
   PRPLr7Kvi0p4UgsLdPIXyl0tNMnvi1OOGVlTEUgP8olc+/hbmstn+Lc4B
   ZrG2OGF4eBowgYkpS95GRmhZzkKe097hl6Kc32YXpGS4nkzeDzfnPr5H0
   zXpbHSkXyJU72Ausjl428gUh7EphEWkA72HM3+g6fq6XYUKpgbYhF32Au
   8SfR3Dxsw0CVHK0kRqSvxjUIFvN4LWM0Eot0yDSyLdoBJpOAuwv/nYXcm
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677567600"; 
   d="asc'?scan'208";a="221576825"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Apr 2023 23:24:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 18 Apr 2023 23:24:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 18 Apr 2023 23:24:05 -0700
Date: Wed, 19 Apr 2023 07:23:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [RESEND v2 0/6] Add JH7110 AON PMU support
Message-ID: <20230419-subway-itinerary-9f5532929c14@wendy>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_232413_561675_C6D0D592 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: multipart/mixed; boundary="===============6421045741753373478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6421045741753373478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zrWAbWhImwI++znI"
Content-Disposition: inline

--zrWAbWhImwI++znI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 08:56:40PM -0700, Changhuang Liang wrote:
> This patchset adds aon power domain driver for the StarFive JH7110 SoC.
> It is used to turn on/off dphy rx/tx power switch. The series has been
> tested on the VisionFive 2 board.
>=20
> This patchset should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20230414024157.53203-1-xingyu.wu@starfive=
tech.com/
>=20
> changes since v1:
> - Updated commit message.
> - Changed "starfive,jh7110-pmu-dphy" to "starfive,jh7110-aon-pmu".
> - Put if condition under allOf in .yaml file.
> - Updated spelling error.
> - Dropped patch 4: Add pmu type operation.
> - Changed "jh71xx_pmu_general_set_state" to "jh7110_pmu_set_state" and mo=
ved it in call back.
> - Changed "jh7110_pmu_general_parse_dt" to "jh7110_pmu_parse_dt" and move=
d it in call back.
> - Used pmu_status save the pmu status offset.
> - Changed "JH71XX_PMU_DPHY_SWITCH" to "JH71XX_AON_PMU_SWITCH"
> - Changed copyright to "2022-2023"

For the future, when you resend, please say why you did.

>=20
> v1: https://lore.kernel.org/all/20230411064743.273388-1-changhuang.liang@=
starfivetech.com/
>=20
> Changhuang Liang (6):
>   dt-bindings: power: Add JH7110 AON PMU support
>   soc: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
>   soc: starfive: Modify ioremap to regmap
>   soc: starfive: Extract JH7110 pmu private operations
>   soc: starfive: Add JH7110 AON PMU support
>   riscv: dts: starfive: jh7110: Add AON PMU node
>=20
>  .../bindings/power/starfive,jh7110-pmu.yaml   |  15 +-
>  MAINTAINERS                                   |   1 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   5 +
>  drivers/soc/starfive/Kconfig                  |   4 +-
>  drivers/soc/starfive/jh71xx_pmu.c             | 200 +++++++++++++-----
>  .../dt-bindings/power/starfive,jh7110-pmu.h   |   3 +
>  6 files changed, 174 insertions(+), 54 deletions(-)
>=20
>=20
> base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
> prerequisite-patch-id: 388b8adbb0fe2daf4d07a21eafd4f1bd50ce2403

Also, all of this pre-req patch id stuff is pretty useless. You've
already pointed out the patches that this is based on, so IMO this
information isn't helpful & is probably more likely confuse tooling
than anything else.

Cheers,
Conor.

--zrWAbWhImwI++znI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD+I8QAKCRB4tDGHoIJi
0ttKAP9MGaU90RWek8EkqCX6COe90cvlPNNwd1wpPoa0MMPaRgD7BlV2IUkTi7c/
TP3qPPR4Hx170gDBCArFJpLuCzUmYAg=
=yE96
-----END PGP SIGNATURE-----

--zrWAbWhImwI++znI--


--===============6421045741753373478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6421045741753373478==--


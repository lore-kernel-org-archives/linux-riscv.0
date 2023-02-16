Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C7DC636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPI67naTWKtWfveNe9HhmUC2FOni5dn/30p8d1f3EBA=; b=vx6nC5g6BJ0AaaCxRGE4f4lQ1R
	EHlWTFkydTT7gW1WxSg5sLlZYvt1bjTRBze2kBb4IDDiNErbIjkMSIaD+X9ZBr5bX3lbBqxoXoSB4
	Rrhb3diJ4wcWRXAZEr/ddOiImv26gCn6dPDlpr6x3wOuPSdU/OgTadpLaLzF8nm+firF7OEcrEz7e
	evrRUi0UjvZeOfBYnOEwtzzDz23EeLpt0ox0MHx9Nvp+6DLjZBxt+sd0LkSp4ugmdwKu1QhGSi2au
	Psy8524P8/Bmixq1mML0PRYElm027/O5nnKX52kvKjSyYCoftP7o0QpKQXLVuucbBmDU0TpR5GJb4
	0suQIPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdv8-00AFtY-1g; Thu, 16 Feb 2023 13:03:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSduE-00AFEK-M9
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 13:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676552554; x=1708088554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Os0cbA1NKAY1dAa1OM2C6w4bQcGQRi9Ty+JzgyPKLI=;
  b=CDEq3aB2q472FzOyWmOg6V/dny56cQUCupnh879v575Z//Tq5xxE+TIl
   POsnvUxfiP6UKGNy/5hPA3FuUUbWtWx3OP6K/8GTR5SAFxR56YAeQhqFa
   ILhWy6+lxzWyJB+lHMH9N/MoD5vnwhE3o3T44uFTqZYuP2vlrJ0qCc7To
   Nk7tvPQ9oaCFHZ4eGGRPc2ZOaC6kYngN8iq62agHgr1O7qnmwnimPrvkc
   +jQsb6W3dkvG/7KYW8dKtRIti1o7P+jHOs+Vq6Z52PrN1p4Fi4JzhEkUp
   VFVeukQ5gdNc9zsgkwCmV5Jgr6eKiaZpnX5o/ZNMOaxtPMHCy2f/3alb8
   A==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="asc'?scan'208";a="200985890"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 06:02:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 06:02:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 06:02:26 -0700
Date: Thu, 16 Feb 2023 13:02:00 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y+4pSMS0vCQi7e/U@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
 <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
 <Y+38bT8cnahu19bw@wendy>
 <Y+4AxDSDLyL1WAqh@wendy>
 <CAJM55Z9M2xgNBRxG8cNefGt5hn4fbZmgHWzC2e8AfmKUq9Gw7A@mail.gmail.com>
 <fbf82563-0b2c-d813-2c7c-08ea712ea91d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <fbf82563-0b2c-d813-2c7c-08ea712ea91d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050234_816141_DB201FC8 
X-CRM114-Status: GOOD (  22.14  )
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
Content-Type: multipart/mixed; boundary="===============5658188818040924577=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5658188818040924577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aNjJmvAN8VFzp7As"
Content-Disposition: inline

--aNjJmvAN8VFzp7As
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 08:27:42PM +0800, Hal Feng wrote:
> On Thu, 16 Feb 2023 11:32:31 +0100, Emil Renner Berthing wrote:
> > On Thu, 16 Feb 2023 at 11:09, Conor Dooley <conor.dooley@microchip.com>=
 wrote:

> >=20
> > No, I'm sorry for being late here. The below definitely looks better to=
 me.
> >=20
> > Hal, would you be fine with this change?
>=20
> I'm fine with this. It will be more exact. Thanks.

I'll convert these both to Acked-by & send this as a real patch then.
Thanks!

> >> -- >8 --
> >> From 4d44e8a83716d1caa314f25a95bd21ac8904909e Mon Sep 17 00:00:00 2001
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >> Date: Thu, 16 Feb 2023 09:58:22 +0000
> >> Subject: [PATCH] dt-bindings: riscv: correct starfive visionfive 2 com=
patibles
> >>
> >> Using "va" and "vb" doesn't match what's written on the board, or the
> >> communications from StarFive.
> >> Switching to using the silkscreened version number will ease confusion=
 &
> >> the risk of another spin of the board containing a "conflicting" versi=
on
> >> identifier.
> >>
> >> Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and =
VisionFive 2 board")
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/D=
ocumentation/devicetree/bindings/riscv/starfive.yaml
> >> index 60c7c03fcdce..cc4d92f0a1bf 100644
> >> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> >> @@ -26,8 +26,8 @@ properties:
> >>
> >>        - items:
> >>            - enum:
> >> -              - starfive,visionfive-2-va
> >> -              - starfive,visionfive-2-vb
> >> +              - starfive,visionfive-2-v1.2a
> >> +              - starfive,visionfive-2-v1.3b
> >>            - const: starfive,jh7110
> >>
> >>  additionalProperties: true
> >> --
> >> 2.39.0
> >>
> >>
>=20
>=20

--aNjJmvAN8VFzp7As
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+4pSAAKCRB4tDGHoIJi
0hWTAPsF72hFmfBpwWWe1huxbfD6A8AQj7JWhe5LZj8JTj/YIQD/Ul9+sm7R2NEE
Www1V7URz90OHBMRDrhYgZzhCTViVAM=
=sfbd
-----END PGP SIGNATURE-----

--aNjJmvAN8VFzp7As--


--===============5658188818040924577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5658188818040924577==--


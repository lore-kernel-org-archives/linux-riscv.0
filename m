Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A9C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM/TgwRACs60Bkj4FH+c2oyR04ybiR+4W+iroff7N3w=; b=SJNlR51N8o5F6Ipy+9w58ozssE
	8Wj/pA3cKRrs4uz0RCmUf/fIRiygUntyxyFmv6bSxKucObGSMWXMzbnNwM5K755G+g2CKmq8llWpe
	69/46Pv0ijNdkZzEm6wF3bp145xLVVJm8fVB8q139Krdy/mwZFi+YXuIWnFLwLTq+9Vl9B75L5DQz
	+yrGVjO0Y+xFFXxYiAocxdKNUhfAbOo1aAqNXWTICC51jGZimUcryZEz0BbHbGKVNLkAjM+sYfB/n
	6/YS/jfQsOSugmor2f5Rdiv3sPru01sPvLzYFLw9ZAtQPzwl9+X9TC8oB8s27h4qCvuB0TTWLYrr1
	NiAd5ALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbD4-009UBW-JG; Thu, 16 Feb 2023 10:09:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbD0-009U7A-Lw
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676542186; x=1708078186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b67WqMZ9AXD4ZKgRusOoJEIzLgWGQaqufNPOFOnkpPI=;
  b=IdZRaG7LhA/yBAHwfyf/OJ39DZ71s/X+te2D//R29JwRrx0L9LSavxp0
   lO1Y5F7Qw1tUMKPoXYD10rEdl8G9yhrNAUz8m1pAFwOrsNc2L2jJRDH3n
   6yPa+p7j9/J/igTkSqLCCEJ6e9JPfedsS7e1DwT0ptSd8J36fmZE13siG
   JV53FUl6NRcMw6JIzLUJ8vBqWt6/TtD9m6+4Z8qHUhY7W47KSJM8XutZG
   1L3bmNQ5u1T4bMmxMFbc7GOdjtYhGCFr7bNelSbZTUoQN0u5fUOxCckQP
   ivbP5a03B+Q15Whcxx7fsf1CvfnMUuXEa+7f8xbCWzRXem81tZPYJeGE1
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="asc'?scan'208";a="137526735"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 03:09:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 03:09:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 03:09:34 -0700
Date: Thu, 16 Feb 2023 10:09:08 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Hal Feng <hal.feng@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y+4AxDSDLyL1WAqh@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
 <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
 <Y+38bT8cnahu19bw@wendy>
MIME-Version: 1.0
In-Reply-To: <Y+38bT8cnahu19bw@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_020946_812944_CAF35D15 
X-CRM114-Status: GOOD (  34.13  )
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
Content-Type: multipart/mixed; boundary="===============6328575169271632114=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6328575169271632114==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i/H/Fv86yHcuLN96"
Content-Disposition: inline

--i/H/Fv86yHcuLN96
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 09:50:37AM +0000, Conor Dooley wrote:
> On Thu, Feb 16, 2023 at 10:27:17AM +0100, Emil Renner Berthing wrote:
> > On Wed, 15 Feb 2023 at 15:04, Hal Feng <hal.feng@starfivetech.com> wrot=
e:
> > > On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
> > > > On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> =
wrote:
>=20
> > > >> +       model =3D "StarFive VisionFive 2 VB";
> > > >> +       compatible =3D "starfive,visionfive-2-vb", "starfive,jh711=
0";
> > > >
> > > > Hi Hal,
> > > >
> > > > I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-v=
a"
> > > > and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
> > > > still think having these names match what is printed on the silkscr=
een
> > > > makes it a lot easier for everybody. Even your own releases calls t=
he
> > > > boards "v1.2A" and "v1.3B":
> > > > https://github.com/starfive-tech/VisionFive2/releases/
> > > >
> > > > So I'd suggest
> > > > model =3D "StarFive VisionFive 2 v1.3B";
> > > > compatible =3D "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> > > >
> > > > I haven't seen these "VA" and "VB" anywhere else, so if you don't w=
ant
> > > > the version numbers and can promise that there will be no incompati=
ble
> > > > future revisions of the boards then maybe just drop the "V". Eg.
> > > > model =3D "StarFive VisionFive 2 B";
> > > > compatible =3D "starfive,visionfive-2-b", "starfive,jh7110";
> > >
> > > The version A board has reached the end of life. As far as I know, the
> > > version B board will not update also unless there are some important
> > > requirements and StarFive decides to update. Furthermore, it's too la=
te
> > > to change the compatible as patch 1 was already accepted. Will it be
> > > easier to read if I modify it as below?
> > >
> > >         model =3D "StarFive VisionFive 2 vB";
> > >         compatible =3D "starfive,visionfive-2-vb", "starfive,jh7110";
> >=20
> > Oh, that's sad that the kernel will now end up calling the boards
> > something that's used nowhere else, even by StarFive :/
> > But yeah, I guess vA and vB are a little easier to read.
>=20
> Nothing has been released with that name so AFAIU we can change it
> still. If you sort it out today/tomorrow I'll try get it to Arnd before
> the merge window opens...
>=20
> I might've jumped the gun a bit here, I thought that it'd been changed
> to what you (Emil) had suggested.

?

-- >8 --
=46rom 4d44e8a83716d1caa314f25a95bd21ac8904909e Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 16 Feb 2023 09:58:22 +0000
Subject: [PATCH] dt-bindings: riscv: correct starfive visionfive 2 compatib=
les

Using "va" and "vb" doesn't match what's written on the board, or the
communications from StarFive.
Switching to using the silkscreened version number will ease confusion &
the risk of another spin of the board containing a "conflicting" version
identifier.

Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and Visio=
nFive 2 board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Docume=
ntation/devicetree/bindings/riscv/starfive.yaml
index 60c7c03fcdce..cc4d92f0a1bf 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,8 +26,8 @@ properties:
=20
       - items:
           - enum:
-              - starfive,visionfive-2-va
-              - starfive,visionfive-2-vb
+              - starfive,visionfive-2-v1.2a
+              - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
=20
 additionalProperties: true
--=20
2.39.0



--i/H/Fv86yHcuLN96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+4AxAAKCRB4tDGHoIJi
0pJ4AP9ERZQwjjUFDzf44Wkuo5eV6SuP2HENDoQ3cphNq/DeiAEAkYX1zGQvdLeV
Uinb7tr94apZb93E+d9KtfyO68mPYwI=
=i3CV
-----END PGP SIGNATURE-----

--i/H/Fv86yHcuLN96--


--===============6328575169271632114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6328575169271632114==--


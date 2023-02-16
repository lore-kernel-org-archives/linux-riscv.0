Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EF2C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ponrUzZvSE5/ySGMwZ6Hs8cxiNOVzCeJAmT80Xo8DnU=; b=KTy4fkHdheRs47E8fLS5TLXVHu
	iZxRdNKcMwiBgM7io+uKEfC0SPIH6NjY/Rqr5UDNhoxAcHV/D3KzwBJFcSB/nciC8FCa1aDmInq4f
	nioRt4DxolVBgp7ZlbEwgsrdotRW72pcGjffdPzAQowI/EFWSdwLZSRaohynJlaO2FFDs2GEiJ1vo
	7w6/0QgcEMYYgXN92zo7bT4JrMURsPXXNAOorjFHJ+6a93WX5N4axxHzPdOLP4ZhU7f/w+/bLwdWM
	U1jFcYq9So/c/dq7F0IxRR8Lg25t3kYPyypfeKrmS432fbgwi6ew7OhiknibuLdqoZcu7/zrrIbwZ
	5WidPhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSawo-009OAt-E4; Thu, 16 Feb 2023 09:53:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSav0-009NNu-4U
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 09:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676541069; x=1708077069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0quZqE37OKnLZiRcccGYteb93sZztfbNC4IDaS3+b8=;
  b=eP+cyN3NEC0tJAaCp+HxFUB+aUwvpoOgiobXBrpWxU6Uxr1APSbxZhMD
   Re8pPenG4OsSac6K1iCk/yAMJfomZOL5Hs1vzaf5o0Fi2ePEewcYsGWRO
   bpsuCN47u+eUayoXdsUv+KLRWFAVGjGTKYacBkDCNgkkPR67Mh7pRAVEZ
   jk+Gi6i5HJseAlDikl+KDhKz+7t4/wrWin7RplAGUz5aEITglq9Jes54T
   CQzk3ILDhrRWJSSaB8fYT73SULKxyp3CupKT8Y9IDGEgslNtcclbNNiKF
   QKFQOWPmG1BBPQaCwwlxaKHEWY9MngxJsLaJyYBvuqHav7426Qu2cggiw
   A==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="asc'?scan'208";a="212286070"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 02:51:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 02:51:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 02:51:03 -0700
Date: Thu, 16 Feb 2023 09:50:37 +0000
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
Message-ID: <Y+38bT8cnahu19bw@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
 <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
 <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-+Cz8d=YySRaFJSAffDfoZ4Madx322qCX100-nAcx+5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_015110_264261_1C258D55 
X-CRM114-Status: GOOD (  25.87  )
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
Content-Type: multipart/mixed; boundary="===============9189643606834252173=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9189643606834252173==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MCq7Ioh9lu0winhU"
Content-Disposition: inline

--MCq7Ioh9lu0winhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 10:27:17AM +0100, Emil Renner Berthing wrote:
> On Wed, 15 Feb 2023 at 15:04, Hal Feng <hal.feng@starfivetech.com> wrote:
> > On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
> > > On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wr=
ote:

> > >> +       model =3D "StarFive VisionFive 2 VB";
> > >> +       compatible =3D "starfive,visionfive-2-vb", "starfive,jh7110";
> > >
> > > Hi Hal,
> > >
> > > I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
> > > and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
> > > still think having these names match what is printed on the silkscreen
> > > makes it a lot easier for everybody. Even your own releases calls the
> > > boards "v1.2A" and "v1.3B":
> > > https://github.com/starfive-tech/VisionFive2/releases/
> > >
> > > So I'd suggest
> > > model =3D "StarFive VisionFive 2 v1.3B";
> > > compatible =3D "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> > >
> > > I haven't seen these "VA" and "VB" anywhere else, so if you don't want
> > > the version numbers and can promise that there will be no incompatible
> > > future revisions of the boards then maybe just drop the "V". Eg.
> > > model =3D "StarFive VisionFive 2 B";
> > > compatible =3D "starfive,visionfive-2-b", "starfive,jh7110";
> >
> > The version A board has reached the end of life. As far as I know, the
> > version B board will not update also unless there are some important
> > requirements and StarFive decides to update. Furthermore, it's too late
> > to change the compatible as patch 1 was already accepted. Will it be
> > easier to read if I modify it as below?
> >
> >         model =3D "StarFive VisionFive 2 vB";
> >         compatible =3D "starfive,visionfive-2-vb", "starfive,jh7110";
>=20
> Oh, that's sad that the kernel will now end up calling the boards
> something that's used nowhere else, even by StarFive :/
> But yeah, I guess vA and vB are a little easier to read.

Nothing has been released with that name so AFAIU we can change it
still. If you sort it out today/tomorrow I'll try get it to Arnd before
the merge window opens...

I might've jumped the gun a bit here, I thought that it'd been changed
to what you (Emil) had suggested.

--MCq7Ioh9lu0winhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+38YAAKCRB4tDGHoIJi
0t0MAQC/Tq689wJFuYOXq9iaO3V/AbREsP5e6akXTpANxCsMLwD7BdS46iUO7H+s
MvvOQNiEwrE6IYzV2ncyLU6zBp6qfgk=
=GmDi
-----END PGP SIGNATURE-----

--MCq7Ioh9lu0winhU--


--===============9189643606834252173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9189643606834252173==--


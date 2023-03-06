Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB347C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2dyQpMT+vumUipfZLndn51W9fCVqt0yDmm53ztvtp8=; b=GUDI9QkB5h01n0oUZOLCgb7NCs
	Gl849CEcomwfVLhl8atkg0aHjeIC3CQ6D4GqNZE7gUFfm6EjkXorceORq2/34ol7/ir4ejTxPKJHJ
	XpPzZ/W7S0OUZ6Th0/bi7N3NkmZHbXlxUVEa3GJaGgjWyzcYIwb/h2H1WCbf5XYSrWr/JamSPRBCO
	vXQ5v9uT4d1wPc5FTjxbn2LKtLEzTZKiz8CMjSpKsYEVNOoEMfMc7JK80vKTw9IM4xBtZ55MErRS+
	D6qfe7mBTjT8ExERHv2w7hbZyWuw2f2rEWVKvPMC39mso3Za5iZ/7BjEE210tGEE+v4/C4UEUtoMJ
	EVMjGCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ80k-00CIWx-2b; Mon, 06 Mar 2023 10:24:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ80e-00CIVF-RO; Mon, 06 Mar 2023 10:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678098240; x=1709634240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fAROdIHL4rwOPVUkhhOPISkKYjWoQ2xKz6j6/njHS2w=;
  b=Iwr2XJkGXYs6uzQvFXUzaBpO3YFsqYTME1ny1B7mjlLPLCypeKjaShGX
   pGOO6KtoA9SO3idBZiLlUJFGcLps0TitxXj8CTHcehsXz/4qwTpeORyYn
   AB6z2APedAc2iuy7+kENdsG8rnooN1Otu64oqS/zcTQxwOuABqg9oyD9g
   Cl8AxwRUKPVStZtCEcgQXJYdcwi3sAoNlkSScazNhtW6ZAlQvxt6I7fmq
   oKQbP7AWI4FKaYx7t1nFW2BGECrykgAIbf7OQHLG9x2tCR6s+VqupG3A+
   nSSSW+fVYFPeomnSmazE9R6w+I+gP34lCGlI7raxccs/mQ3aDcgtTrrEe
   A==;
X-IronPort-AV: E=Sophos;i="5.98,236,1673938800"; 
   d="asc'?scan'208";a="203456799"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Mar 2023 03:23:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Mar 2023 03:23:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 6 Mar 2023 03:23:38 -0700
Date: Mon, 6 Mar 2023 10:23:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Emil Renner Berthing <kernel@esmil.dk>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak
	<pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter
 Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Aswath
 Govindraju <a-govindraju@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 0/3] Add JH7110 USB driver support
Message-ID: <ZAW/DqprkKaop4bg@wendy>
References: <20230306095212.25840-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230306095212.25840-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022401_271727_2A1D65BE 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: multipart/mixed; boundary="===============0908909985783600944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0908909985783600944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zMsznMw5/Z/x33K0"
Content-Disposition: inline

--zMsznMw5/Z/x33K0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda!

On Mon, Mar 06, 2023 at 05:52:12PM +0800, Minda Chen wrote:
> This patchset adds USB driver for the StarFive JH7110 SoC.
> USB work mode is peripheral and using USB 2.0 PHY in VisionFive 2 board.
> The patch has been tested on the VisionFive 2 board.
>=20
> This patchset should be applied after the patchset [1] and patch [2]:
> [1] https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfiv=
etech.com/
> [2] https://lore.kernel.org/all/20230215113249.47727-4-william.qiu@starfi=
vetech.com/
>=20
> patch 1 is usb phy dt-binding document.
> patch 2 is the glue layer of Cadence USB3 and USB phy
> setting. USB controller IP is Cadence USB3.=20
> patch 3 is USB device tree configuration.
>=20
> Minda Chen (3):
>   dt-bindings: phy: Add StarFive JH7110 USB dt-binding
>   usb: cdns3: add StarFive JH7110 USB glue layer
>   dts: usb: add StarFive JH7110 USB dts configuration.

Unfortunately, this patchset hasn't really landed correctly.
Usually, in a series, patches are sent as replies to the cover letter.
Git's send-email will do this for you if you pass it multiple patches
and a cover letter (I do it by passing a directory, eg patches/foo/v1)

It appears that you have sent each patch separately, and to different
recipients, which makes this harder to review.
Please re-submit this with proper threading (and as v2 ideally, so that
Greg's bot doesn't complain).

Thanks,
Conor.

--zMsznMw5/Z/x33K0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAW/DgAKCRB4tDGHoIJi
0n+0AQD+Y8MI2RJ1ehfJEWSWYTvb547GcgP/f/R0S9BcWwWn8wEAynmRcm59mWRh
Rz7uCk7KLQh077VMvMhoUxx305X21gU=
=u/Bd
-----END PGP SIGNATURE-----

--zMsznMw5/Z/x33K0--


--===============0908909985783600944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0908909985783600944==--


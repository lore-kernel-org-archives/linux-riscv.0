Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A09C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlPvuqX/wvhZ0tAHWfABmm5dsvBWJETUKZmXCTgYS8E=; b=dSsktM2YBZ4AJg4bdp+VDozo4D
	c4sh7TDR5V8BQvf8ek69fCFmW6RXY7YyHYNS4+QIoZqTGHzNqwKgp0ISywr22XY0hmrqnzbGubo7s
	ISuL0yGa1EpwU/EwMJmO5xAoSrycKja9pIyNYqe+L9feD+JptdRMufA6pZM/upACF5QcbGiKVYcik
	P2Ah9fxIkKGnwe5CAoWXZhUiwJykEAyjQ5iSLGQR+S4AsxacN168lMdX3LHYDDvlsLtrTQvlIh9yy
	Ih+jWyGkU/+QG3guNS7ghhn+jGYj202VMbXBXS2CBNB95+4N2anIUeuIufJi423HQStqiDfrw4X9r
	CVkwgYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUKb-008cqB-BR; Tue, 21 Feb 2023 15:13:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUKX-008coW-Pb
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 15:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676992402; x=1708528402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnDPlbDJJoY2Lg/kH7OxLfS9ORWNHM0L/neyQshpFFI=;
  b=jEE3btrP6kPtD4tsOWbVvY3HqpOH5GKUSxP6GK65leI2i2Ry6LmUNq9r
   j713978xS5DwDKLYVp6fU/VREQot6cnl+S0jPEObNCcJofWTEaZKF4R8j
   ryCxDnCFXOQSXFLJoaqNzd1o1FhiC7aFhoLLNWxeki2tOFbsuM1Tx5Mc5
   pr7nFrnN37mKarOzqVppi+3cFXIuhW6OMpw8YUudxGJXTpfbSc0hqWvYJ
   yCuQ3IXHJvu5mbwFQfYLILRHtgOjJbd01A6nW1/OYosKswW3YDQkOHIbS
   LhYB333CAIXR1PYAPlDPHebyUczRJePvYunYhv+dA11kPS3RqsOLomTvq
   w==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="198012987"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 08:13:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 08:13:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 08:13:10 -0700
Date: Tue, 21 Feb 2023 15:12:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/19] clk: starfive: Add StarFive JH7110 system clock
 driver
Message-ID: <Y/Tfa8YU2LFxweyg@wendy>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-12-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-12-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_071321_921071_7BD969A4 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: multipart/mixed; boundary="===============5027633414575227522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5027633414575227522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AQrimqkSKEiTIFZh"
Content-Disposition: inline

--AQrimqkSKEiTIFZh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:37AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add driver for the StarFive JH7110 system clock controller and
> register an auxiliary device for system reset controller which
> is named as "reset-sys".
>=20
> Reported-by: kernel test robot <lkp@intel.com>

How is this Reported-by lkp?
If lkp responded to your patch saying there was a problem with it, it
doesn't get a Reported-by - just like how any other reviewer doesn't get
a Reported-by for pointing out build issues ;)
You only need to add that for bugs it reports on patches that have
already been applied ;)

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

--AQrimqkSKEiTIFZh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/TfawAKCRB4tDGHoIJi
0lNJAP0SbK6w7Vps303FR26iNg4SdF79TY597jKQSCp/GnfEFwEA+driPaG2p4tj
p73GNi4XNeTAim46zA7SqlaAAFyEQQk=
=M/aR
-----END PGP SIGNATURE-----

--AQrimqkSKEiTIFZh--


--===============5027633414575227522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5027633414575227522==--


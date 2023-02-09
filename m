Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924EC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBdtJWQY607O7k2z09noC1zY0nYtfTB79W8gb5qcYhY=; b=VOo9Yb+38X5wCaIJ5iJwyq1PEz
	Cp+U3XyC0JgcaO+R5douApGaj7qYYnAOYwkANUren0MwFwo9TiEDhzxSVfg9AhgQbRJ/XThk/1tlk
	SozYf20BWZgkaHQyMeutiACmTt2LY4S0tGRQ3TOsDKSWbk3CMI4xI790EpEwjCPPlG9YD40o1ME2V
	5UCP9yS6TmlSY7967SaGKLLOvHBUxwMdST56e2gAZr3PvTFu3rykH+1hbMz6JRYsCH6tHUY/fnp1Q
	ud3sncmaitqUz6IKYg2PzJeD5cb9LbrIwVlioT0JF14+ateC03g9nIPtmCWgh/c7D7NZk0n1IkPAl
	ZcFTQqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4ql-001Cat-M9; Thu, 09 Feb 2023 11:12:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4qi-001CYg-Sq
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 11:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675941140; x=1707477140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3v3T1RO8GO+qbSn+Gl7E77noF1h3fEPhedIwbOQFC3A=;
  b=BcBCnY8c8tOylDUb4QRf9j9/LhRYYIcFOR7U6yEZ5xXB++wRn2lt+uoH
   sxOYkYKj+MN3HoN4v2DUv6X6TRyGjfnQ3OoWQG5pULoWENY2jd9V9jAWJ
   vi1AI2pY/o5ZunoDNvrg0LoXd12Wt69vRghWxTM2nzabY9rHleJ5s6b2v
   2zTzhkfv1d6WB2rVXmTqiOfFEty8CGtEeiOxqwt9dKzwFVkoFwNnBBezn
   mf0S6TTfkf+nwBxwz4+OuggJhxuq9xQGPHYRNM313w2zUwHsxwjnv3RiQ
   hLWhu0jf7MgeiNzPI0pAZ4VzxwkpSsF6+JvprpE7QMvltEg2cY8Bjy0V7
   A==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="asc'?scan'208";a="200225984"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 04:12:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 04:12:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 04:12:16 -0700
Date: Thu, 9 Feb 2023 11:11:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y+TU98PLIvtkD8/R@wendy>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
 <Y9og8Q2UnJ452KH/@wendy>
 <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
 <Y9wR7Up+iObw5qoE@spud>
MIME-Version: 1.0
In-Reply-To: <Y9wR7Up+iObw5qoE@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_031220_958184_52767167 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Type: multipart/mixed; boundary="===============2030905952757809640=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2030905952757809640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MTMULKwH45x5IHVU"
Content-Disposition: inline

--MTMULKwH45x5IHVU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2023 at 07:41:33PM +0000, Conor Dooley wrote:
> On Fri, Feb 03, 2023 at 02:56:41AM +0800, Hal Feng wrote:
> > On Wed, 1 Feb 2023 08:21:05 +0000, Conor Dooley wrote:
> > > On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
> > >> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
> > >> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:

> FWIW, the deadline for getting material in for v6.3 has already passed,
> so you can send the next version of this series without waiting for
> clarification on the compatibles & ISA string. We should have plenty of
> time to get those fixed up before the series gets applied.

Also, as it looks like the pinctrl driver is going to land in time for
v6.3, that leaves just this series and the clock driver required for
base support.

In the original submission, you sent the clock driver and dt in the same
series & I think it might make the process a bit faster if you sent them
both together for the next version again.

That way, both the drivers and dts can go together as their have an
inter dependence.

That's my opinion anyway, will make trying to sequence things between
trees easier.

Cheers,
Conor.


--MTMULKwH45x5IHVU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+TU9wAKCRB4tDGHoIJi
0u9vAP0Xf4VDqqzWZ4yBX8QlUBK8vmtbnhR61S1/MxTyPlIRcwEAiTc0AaIbs07K
ETN+C6SSJIg4FTQiNJheaT1H5PhrYQI=
=w1v/
-----END PGP SIGNATURE-----

--MTMULKwH45x5IHVU--


--===============2030905952757809640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2030905952757809640==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F4C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 10:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA6eAms5lZhh42ldncOPR7xOkrVfSSTQ06KPX7JWXPs=; b=g4ZbzKLVMDaMk1fxriWmOufXgV
	0/x0DISlu16Q7pwrM8Hv7ufdlxUHLKgz6DUtcclljoGyDKybxWkV6Ljpe/8kDAxubwid7cR/GBPjC
	4vtYzphmO+kbu8UvfdsLxkTi8Q1mn7DODIsfVCsEDlnPTDBoXJSEs6bp+7PXgsoFL1ayAkQzNEnqm
	YxiuPXsLp7e2X8taepboznTiq2YlMEDaYupzPgZoexNtgQh2/TIy78NnX9QQhCbTNde0z+GSbrXib
	CbbmHBZd+Gs397q2YRu76daJzbTVD0v/TdGyo6MQkR0jrK+6BzSZap3+p4Fqi+O3m0v4VMMMRA+iT
	0jejXl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9BP-0000000DSsj-11pL;
	Fri, 28 Jun 2024 10:50:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9BM-0000000DSrP-3B9Y
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 10:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719571820; x=1751107820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewJYo5B5Gn5p+bUGXnTqJoyHMt2jjLTs26XZMLBY5ts=;
  b=DV0gp+l193R/VRKyLMsU932IDv3W1/6glLhKCL5oBQDNpWFoOF39JIWv
   d7s1eRcL3wj6M7mu82ZalC5ExSWJsYxjB7ZeGoZI6LOwh5AKOMCA1BerS
   xVGxIx0snFLZ+onX2PUKQkh4UMKgSnDmqLpSuXSxLBFA4ZVbMayUqCfzc
   YEfruaJb3ax9PxHTGhQjfTIn5fYfw241F3fEqDfHsU1x127wvJo1rL4vB
   bmoTvSBfCOalNwxICFdfH8Ry+cYkiDvLfO+4O3VrvxyN84bwk6UPDiM75
   OQiT0EoX0iYJGAJntc/WcBAPM8uaMhwc1YmPQK/+F4VzJ7N1UxIMaZZ7X
   g==;
X-CSE-ConnectionGUID: 1fcM70mTSxeGp3bdmK8x+A==
X-CSE-MsgGUID: 6jb0hYoOSIuLQoRgVTRgyQ==
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="asc'?scan'208";a="196017444"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 03:50:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 03:49:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 28 Jun 2024 03:49:39 -0700
Date: Fri, 28 Jun 2024 11:49:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Drew Fustini
	<dfustini@tenstorrent.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, Jarkko
 Nikula <jarkko.nikula@linux.intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?=
 Raynal <miquel.raynal@bootlin.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <20240628-joining-blooming-64aefbfd9897@wendy>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>
MIME-Version: 1.0
In-Reply-To: <xkdmrmtiizoqo6mpc7i6iyhilxlw57nawn6ogv6dryaveyqddc@ach3rwy4abpe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_035021_008430_0D4D6A67 
X-CRM114-Status: GOOD (  26.03  )
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
Content-Type: multipart/mixed; boundary="===============5339835625246651178=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5339835625246651178==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TjGWQMt2mYPYXnt4"
Content-Disposition: inline

--TjGWQMt2mYPYXnt4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 11:30:28AM +0200, Andi Shyti wrote:
> Hi,
>=20
> On Tue, Jun 18, 2024 at 09:42:37AM GMT, Thomas Bonnefille wrote:
> > This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> > and a default configuration for the BeagleV-Ahead. It appears that the
> > TH1520 I2C is already supported in the upstream kernel through the
> > Synopsis Designware I2C adapter driver.
> >=20
> > This patch depends on the clock patch from Drew Fustini
> > Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4=
978c4d6b@tenstorrent.com
> > and the pinctrl patch from Emil Renner Berthing
> > Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.=
renner.berthing@canonical.com
>=20
> I think after these two go in...
>=20
> > Changed from v1:
> > 1. Remove redundant example for Synopsis DesignWare-I2C bindings
> > 2. Remove Node Ordering commit as it has already been taken
> > 3. Remove EEPROM label
> > 4. Rebase on pinctrl and clock driver patches
> > 5. Add pinctrl configuration
> > 6. Replaced the fixed-clock with a correct configuration
> >=20
> > Changed from v2:
> > 1. Reorder nodes to conserve ascending register node ordering
> > 2. Add support for I2C2 as it probably use the same controller
> > 3. Format comments to match kernel coding style
> > 4. Reorder nodes to conserve alphabetical node ordering
> > 6. Declare I2C2
> > 6. Set pinctrl pull-up resistor to the highest value
> >=20
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > ---
> > Thomas Bonnefille (3):
> >       dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>=20
> ... this goes throught i2c...
>=20
> >       riscv: dts: thead: Add TH1520 I2C nodes
> >       riscv: dts: thead: Enable I2C on the BeagleV-Ahead
>=20
> ... and these two go thrhough Conor's branches.
>=20
> Do you mind sending a ping when Drew's patches are included in
> the merge window? I can put the first patch on a special branch
> to keep it under my watch.

I think you can apply the binding whenever you want actually, there's no
need for the i2c binding (or driver changes, were there to be any) to
be held until the clock binding/driver is accepted.

Thanks,
Conor.

--TjGWQMt2mYPYXnt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn6VMwAKCRB4tDGHoIJi
0jNHAP4m1oXXhAI8AJklzSf40W3ivqUXLHUeMZ8nHNOHB8i0pQD8CfKBFliZjMqv
1e2iWkfTxBaM5iXO5IGnLhbQWp5W1gw=
=AKI+
-----END PGP SIGNATURE-----

--TjGWQMt2mYPYXnt4--


--===============5339835625246651178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5339835625246651178==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3070C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm+xb6JEcUG6lZr1nG6EkcXBgNeNz7+vOdgti5/UlOY=; b=iHZXLZJKQDo7riSfcrFlA3sOqK
	TxE4zaMxoUA/igPtTWeJGQFFKb7TS5mtwnBOXke6MwRWdFUG+OjMrZz+TrmZRYsl2VcDxBYjAI+RY
	m6lDsJAnwd9/uPgHW9d7rvlwTpNiJmEtUDYj/P0M5ML+HjhGyBhSXte7YS5NBQQVbRQBDwKSthXKV
	UZG9b1mGe2nDg1b74JvTRKHHPfxSUFZLn0AXsi28UbdsfvMCevB402J1Vhvivuawcu5+54vj6IVRZ
	gY1+7sI0NUMdjK706HzXYq7NKuwRg+M10fOE9BsZ3K05LPxLf4LJ2vPYzZCOOoIPxe/30BBYHXcV9
	hlx4btfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R0T-00000002vDX-27et;
	Mon, 29 Apr 2024 13:25:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1R0P-00000002vCU-3jPi
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714397117; x=1745933117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ReUWuvp3j63mU5mLK71qhV6NxOMfe/wydGXDubH39Bk=;
  b=ZDWhTk9XjeOEYJU4wVMUpPXWoXJeQQCrRdc/saa+ezQDmTwL2pX/QFzy
   y1klU0DhFYDwhDQtz1IOQVZ/I1LG+FI1agENJAe8q8ZBE+kTFH6uc9b7s
   P7e5mnmcMHJD+9MfuPo4d9E1OuNArRT3w/eWyRz2wZmeV4iyg8xOzY+wh
   DdY2OkNpD6F+AyHob/glXnLpYiLpEKqpgJTW2owt+lQQ0+ybKB8Yqptkm
   zWxok38ddWPqqoNRtRlsnEPi1OtIE1iB3yTs/tm9XTryhApdAlnagfDhU
   x08Bwz22Qolkacv6btyUjDG/GtAWMJVfGaDJt+zmxXkqOoQ744RFi/IY7
   g==;
X-CSE-ConnectionGUID: lsMCiaZNTFiFfLX2QBA18Q==
X-CSE-MsgGUID: +t28GQKjQkea70Vosejh0Q==
X-IronPort-AV: E=Sophos;i="6.07,239,1708412400"; 
   d="asc'?scan'208";a="190520084"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Apr 2024 06:25:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:24:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 06:24:39 -0700
Date: Mon, 29 Apr 2024 14:24:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	<andi.shyti@kernel.org>, <jszhang@kernel.org>, <miquel.raynal@bootlin.com>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<thomas.petazzoni@bootlin.com>, <guoren@kernel.org>, <wefu@redhat.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <aou@eecs.berkeley.edu>,
	<krzk+dt@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240429-sports-crimson-8cb69c85bde8@wendy>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
 <20240425-script-fondness-0e80bfa31615@spud>
 <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>
 <20240426-patchy-grievance-e7103a344c82@spud>
 <1b7f9c68-32da-405f-add3-33e542406345@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <1b7f9c68-32da-405f-add3-33e542406345@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_062518_071140_8FC929A4 
X-CRM114-Status: GOOD (  28.00  )
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
Content-Type: multipart/mixed; boundary="===============4291261510412781349=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4291261510412781349==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3LIfIfhtU7qWwDW6"
Content-Disposition: inline

--3LIfIfhtU7qWwDW6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 03:07:55PM +0200, Thomas Bonnefille wrote:
> On 4/26/24 4:42 PM, Conor Dooley wrote:
> > On Fri, Apr 26, 2024 at 04:12:00PM +0200, Thomas Bonnefille wrote:
> > > On 4/25/24 6:35 PM, Conor Dooley wrote:
> > > > On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
> > > > > On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:

> > > > > New warnings running 'make CHECK_DTBS=3Dy thead/th1520-beaglev-ah=
ead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
> > > > >=20
> > > > > arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: cl=
ock-frequency:0:0: 50000000 is greater than the maximum of 5000000
> > > >=20
> > > > The bot is not freaking out here, 50 MHz is indeed more than 5 MHz =
:)
> > >=20
> > > 5MHz is the maximum clock-frequency, ie. the I2C bus frequency.
> > > This is actually set to 100kHz for I2C0 in the DT:
> > >=20
> > > &i2c0 {
> > >      status =3D "okay";
> > >      clock-frequency =3D <100000>; <----
> > > ...
> > > };
> > >=20
> > > 50MHz is the "fixed-clock" frequency, that is the clock feeding the I=
2C
> > > IP block:
> > >=20
> > > i2c_ic_clk: i2c-clock {
> > >      compatible =3D "fixed-clock";
> > >      clock-frequency =3D <50000000>; <-----
> > >      #clock-cells =3D <0>;
> > > };
> > >=20
> > > My guess is that the bot confused the clock-frequency parameter for t=
he bus
> > > clock (SCL) with the i2c-ic-clock value for the controller itself dur=
ing the
> > > checks.
> > >=20
> > > Do you agree with this or am I misunderstanding the error ?
> > >=20
> > > If I lower the fixed-clock frequency to eg. 100kHz, the error is gone=
=2E But I
> > > guess the 5MHz limit should probably not apply to the input clock?
> >=20
> > Heh, I know why that's happening - it's your node name.
> > The pattern for i2c controllers is "^i2c(@.*)?":
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
i2c/i2c-controller.yaml
> >=20
> > Rob co-incidentally (or maybe not) put out a patch for fixed-frequency
> > clock names, suggesting using clock as a prefix:
> > https://lore.kernel.org/all/20240425183810.3079069-1-robh@kernel.org/
> > If we switched to that format, I believe your problem goes away.

> Indeed it was the node name, when I switched the name of the fixed clock =
to
> clock-i2c-ic, the error was gone, thank you. :)
> But i2c_ic_clk shouldn't match "^i2c(@.*)?", one of my teammates suggested

The pattern in i2c-controller.yaml is only applied to nodenames, the label
(which is what i2c_ic_clk is) doesn't matter and could be left as-is.

> that the error may instead come from this line
> https://elixir.bootlin.com/linux/latest/source/scripts/dtc/checks.c#L1023.
>=20
> But as Drew is working on new iterations of the TH1520's clock driver I w=
ill
> just delete this fixed clock and publish a second version depending on his
> patch.

Sure, but you may be waiting a while for that to land :)

Cheers,
Conor.

--3LIfIfhtU7qWwDW6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZi+fegAKCRB4tDGHoIJi
0vZ8AQDpdqczbMq4FbUJQRNsBcF/Qx4wNcKvS7KBHixRVuYcaAEA3z+k3SB//ho7
9IEdoXTkeklfOeP8IHoGxzPVP6kmlg0=
=IY4G
-----END PGP SIGNATURE-----

--3LIfIfhtU7qWwDW6--


--===============4291261510412781349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4291261510412781349==--


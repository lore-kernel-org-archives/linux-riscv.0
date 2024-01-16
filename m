Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CEAC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrGBu0L8qBcZO3vOj1RY0Q4WaPMNuR3VAehd1CI8ZL8=; b=XWwB2VSkGb6bG807vf/BnCheUk
	q/K4QQ56FIM/MtOrTdV6B2oc/YVmNPq20/kHSl2/xod3nJFTTF5S7WI25rQe1IOKkI5v1s3vzGQ+W
	ZPGrSZNFBxjZ612UlSpDrLq5L5bCF9kl487z1/Jf9W9SSkHEPKe0OnxzDsR62NObqskRHuXgD845X
	bp4I5quzjbwPSBA1ar8RYf9Ty3H3OYVNvdfjjQ5tFgUlieB+JByWW8MjfAzzDEStyiDxRYbyc7k97
	yKO36ivT6RaSyQ61PLRNxtmPdGJoYUGXV08OBNr/TsUFzCPKcpbAGy6Eq/i3BMhZCUyw0DoM7mnmK
	gItY57CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgwS-00Bhco-0l;
	Tue, 16 Jan 2024 10:45:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgwP-00Bhbg-0M
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 10:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705401909; x=1736937909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jHGGpGh4/MgHAVgMxsA0r7UyDWvPUjd2U3iqvzqI5I4=;
  b=r1v5IsRIw46M5Yk51kRXzWXfuAJQ5RjMmYk3Fp1fZSTir25S+5pOUyIP
   HPfF8geJHxg8qhAXCNz838X7Z0Q/B6tT2OTlbV/kdMQBmK3s7ohcXGgtK
   SpVxVDzLEkKvA2/0jzxtjQMflt4xijBJP4LJF0IMaCo5YrCZjftaORTPZ
   L9unTmXPSfi/mXtfYee+2Nu2AqVslqFkvM6Ll3SFpZcISOzQDU81lHIv/
   3nWJTssYpiK8E7+gZBPIOLIXw/wVdq3ujthRptw3h867pUsWERtLW6cqY
   uhwa0F6Lw+j74292ARgG7fPngjtJB32uTHU8+iUEF75LIqPQi+wEJN/4V
   g==;
X-CSE-ConnectionGUID: OYl/i3GiRI22Pg4Ra+XJtQ==
X-CSE-MsgGUID: zKuPVUJwS3+E6LjSAt2uZA==
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="asc'?scan'208";a="14823470"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2024 03:45:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 03:44:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jan 2024 03:44:46 -0700
Date: Tue, 16 Jan 2024 10:44:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Nylon Chen <nylon.chen@sifive.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <conor+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <thierry.reding@gmail.com>,
	<aou@eecs.berkeley.edu>, <zong.li@sifve.com>, <vincent.chen@sifive.com>,
	<linux-pwm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<nylon7717@gmail.com>
Subject: Re: [v6 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
Message-ID: <20240116-custard-drew-9a02e83d538a@wendy>
References: <20240116041054.11641-1-nylon.chen@sifive.com>
 <20240116041054.11641-2-nylon.chen@sifive.com>
 <CAJM55Z9ZbmbPKaJ8LJ5KyoCW9fAEJaT3Q4PbcadwLNCq1NXbxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9ZbmbPKaJ8LJ5KyoCW9fAEJaT3Q4PbcadwLNCq1NXbxA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_024509_165686_8792C05A 
X-CRM114-Status: GOOD (  22.36  )
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
Content-Type: multipart/mixed; boundary="===============9016921604551135252=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9016921604551135252==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IllJYSRTwnK6qQf5"
Content-Disposition: inline

--IllJYSRTwnK6qQf5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 02:20:57AM -0800, Emil Renner Berthing wrote:
> Nylon Chen wrote:
> > This removes the active-low properties of the PWM-controlled LEDs in
> > the HiFive Unmatched device tree.
> >
> > The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schem=
atics-v3.pdf[1].
> >
> > Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8=
453f8698_hifive-unleashed-a00-schematics-1.pdf [0]
> > Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68c=
e76f4192_hifive-unmatched-schematics-v3.pdf [1]
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Co-developed-by: Zong Li <zong.li@sifve.com>
> > Signed-off-by: Zong Li <zong.li@sifve.com>
> > Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
> >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
> >  2 files changed, 8 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch=
/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > index 900a50526d77..11e7ac1c54bb 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > @@ -49,7 +49,7 @@ led-controller {
> >  		compatible =3D "pwm-leds";
> >
> >  		led-d1 {
> > -			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> > +			pwms =3D <&pwm0 0 7812500 0>;
> >  			active-low;
> >  			color =3D <LED_COLOR_ID_GREEN>;
> >  			max-brightness =3D <255>;
> > @@ -57,7 +57,7 @@ led-d1 {
> >  		};
> >
> >  		led-d2 {
> > -			pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> > +			pwms =3D <&pwm0 1 7812500 0>;
> >  			active-low;
> >  			color =3D <LED_COLOR_ID_GREEN>;
> >  			max-brightness =3D <255>;
> > @@ -65,7 +65,7 @@ led-d2 {
> >  		};
> >
> >  		led-d3 {
> > -			pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> > +			pwms =3D <&pwm0 2 7812500 0>;
> >  			active-low;
> >  			color =3D <LED_COLOR_ID_GREEN>;
> >  			max-brightness =3D <255>;
> > @@ -73,7 +73,7 @@ led-d3 {
> >  		};
> >
> >  		led-d4 {
> > -			pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> > +			pwms =3D <&pwm0 3 7812500 0>;
> >  			active-low;
> >  			color =3D <LED_COLOR_ID_GREEN>;
> >  			max-brightness =3D <255>;
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch=
/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index 07387f9c135c..b328ee80693f 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -51,8 +51,7 @@ led-controller-1 {
> >  		compatible =3D "pwm-leds";
> >
> >  		led-d12 {
> > -			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> > -			active-low;
> > +			pwms =3D <&pwm0 0 7812500 0>;
>=20
> Here you remove the active-low property, but you don't above. I'm not sure
> what's the right thing to do, but I would have expected the same change i=
n both
> places.

Just to note, the original version of this that I acked/reviewed removed
the property from all led nodes. I then apparently didn't look closely
enough at v5 and left acked/reviewed tags on it too. It did not remove
the active-low properties but this change was not mentioned in the
changelog for the series.

D4 on the unleashed and D12 on the unmatched have the same circuitry
(modulo the placement of the series resistor) so I don't get why the
property is being removed from only D12.

I rescind my ack/review until that is clarified and/or fixed.

Thanks,
Conor.


> >  			color =3D <LED_COLOR_ID_GREEN>;
> >  			max-brightness =3D <255>;
> >  			label =3D "d12";
> > @@ -68,20 +67,17 @@ multi-led {
> >  			label =3D "d2";
> >
> >  			led-red {
> > -				pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> > -				active-low;
> > +				pwms =3D <&pwm0 2 7812500 0>;
> >  				color =3D <LED_COLOR_ID_RED>;
> >  			};
> >
> >  			led-green {
> > -				pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> > -				active-low;
> > +				pwms =3D <&pwm0 1 7812500 0>;
> >  				color =3D <LED_COLOR_ID_GREEN>;
> >  			};
> >
> >  			led-blue {
> > -				pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> > -				active-low;
> > +				pwms =3D <&pwm0 3 7812500 0>;
> >  				color =3D <LED_COLOR_ID_BLUE>;
> >  			};
> >  		};
> > --
> > 2.42.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

--IllJYSRTwnK6qQf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaZd+QAKCRB4tDGHoIJi
0ojCAP9YNgYC4jBsQgF0fIM37HjeKwwrAxp5ishwLKUKa9BKYAD9HCzhM/N+Tc7h
NaSisFJ74M5IGYP0aZCDYgCf1EHv5gE=
=Qjx9
-----END PGP SIGNATURE-----

--IllJYSRTwnK6qQf5--


--===============9016921604551135252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9016921604551135252==--


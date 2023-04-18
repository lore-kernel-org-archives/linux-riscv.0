Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69103C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odSpytDaO2v4ziSN2unZxZVPhySy4oEgy3NaQ4SHYz4=; b=Djlw2LN61x5sbpit7L58H20Ri0
	qsCyn6YgE5kVvm0NlavRjpLtSxHHO7aNFFRLkOdpDCo9ZI95XM5hj4S9PIhHpbqx6On+d74pViEUs
	1RTAwEm/Ne0HjeWnAE4hgaUChKCzw143eCsjb1YEBpZSJWtjjNHPwrZmAcDlubzMtuIzpcxF8IPPu
	sVeDo7t89uzHahhNL2Kqtt+7HQmZOcluS9wVKzBINVMiKFQBPChkPEFWGcILdG9e9QYEaUe4kZ10o
	jvFgWhWKQ40/i0S6WG5+qb18d38HTJXpUeoRQE/gHw4FUy3ViGNTAzKEmwjsOyGujyI90cQQiSugR
	oC0/90jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1polMw-002HI3-2W;
	Tue, 18 Apr 2023 13:27:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1polMu-002HGr-0E
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 13:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681824456; x=1713360456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h3pmULgxsGgcQmyEbQYZ4K3bPzzzsFUw346+3srF8A0=;
  b=bIeGINUQF3q79rP3IoEDyQAafupkoOsfVagRSv3bVTd5vBLhZESjZwdG
   UZTa2Y7A/jlJ1uI0cAdFZI8HOglq4N8Uwt7ekoWbvMvfLddyaZ06BAOs2
   AUUSMXeYYfIYKsP+rFwnnETF1ViCVvyzRaKy/8WnLfsqq5Pl0f7RHJvPZ
   UbtTz0EnrArkz8yZRcFjDR1BjEc/ucXv8GS5pTUOpwaVUdgikOk8gTDmC
   Qm+O08aESPQV0ZZ6Cmy2QzhOZBIMTlEJ/bdDjI9btGYBUaPqeQzTqJgjG
   ThixC93tFbBw6GeXGWOlPPDVoloBWBKLHIB44TzVea+reW9Ev1kwItF+l
   w==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677567600"; 
   d="asc'?scan'208";a="207069346"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Apr 2023 06:27:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 18 Apr 2023 06:27:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 18 Apr 2023 06:27:25 -0700
Date: Tue, 18 Apr 2023 14:27:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v16 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230418-octagon-epilepsy-4d8516f91145@wendy>
References: <20230411-wizard-cautious-3c048db6b4d2@wendy>
 <20230411-bronzing-crust-d302408a1259@wendy>
 <20230411105547.ypkktubgfx4jfen3@pengutronix.de>
 <20230411-ligament-wagon-6c8cacb966e8@wendy>
 <20230411162554.4tl2z2tcbfg5hb7e@pengutronix.de>
 <20230418-armhole-cartwheel-cee37778a840@wendy>
 <20230418130837.zfueixeuxrallhtc@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230418130837.zfueixeuxrallhtc@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_062736_170823_20666786 
X-CRM114-Status: GOOD (  20.07  )
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
Content-Type: multipart/mixed; boundary="===============8163787751785386813=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8163787751785386813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FFx3KsBRxu5dYLgW"
Content-Disposition: inline

--FFx3KsBRxu5dYLgW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 03:08:37PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Apr 18, 2023 at 12:27:33PM +0100, Conor Dooley wrote:
> > On Tue, Apr 11, 2023 at 06:25:54PM +0200, Uwe Kleine-K=C3=B6nig wrote:


> I don't understand what you wanna say here. If tmp =3D 256 my suggestion
> is to pick prescale =3D 0 and period_steps =3D 254. Then
>=20
> 	 (prescale + 1) * (period_steps + 1) =E2=89=A4 tmp
>=20
> and period_steps is big enough to ensure a a finegrained choice for the
> duty_cycle.
>=20
> > That's then gonna give us one of the broken configurations from the
> > limitations.
> >=20
> > tmp =3D 257
> >=20
> > *prescale =3D 257 // (254 + 1) - 1
> >           =E2=89=88 0
> >=20
> > *prescale =3D 257 // (prescale + 1) - 1
> >           =3D 257 / (0 + 1) - 1
> > 	  =3D 256
> > 	  =3D 0 (registers are 8-bit)
>=20
> I think you mean s/prescale/period_steps/ in the second part, but that's
> not what I meant. I meant to suggest:

I did, yeah!

> 	*prescale =3D tmp / (MCHPCOREPWM_PERIOD_STEPS_MAX + 1) - 1
> 	period_steps =3D MCHPCOREPWM_PERIOD_STEPS_MAX =3D 254
>=20
> > I'm quite obviously missing something that you may think is obvious
> > here, but is not immediately clear to me.
>=20
> That would be an explanation, yes. :-)

Right, it makes a lot more sense now. Definitely was not clear to me
that that was what you were suggesting.
I'm not sure that disallowing tmp < 255 is something I want to do
though, as this is mainly used as a "soft" IP core in the FPGA fabric,
the clock provided to it may not be particularly high.
Probably not the end of the world though, once added to the limitations.

The implemented period is also going to be quite a ways off with this
method (compared to the method I have been using until now) - although
it is of course far simpler.
You're the PWM expert and are suggesting it, so maybe I should just shut
up and go do it...

--FFx3KsBRxu5dYLgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD6arQAKCRB4tDGHoIJi
0jl7AP9Ls13dfGN0ABcy+W/U0p3z6cT9QynfIh7jhcaBycLNvwEAsdfE/cj9Szpd
Tt229kUYqmnCZQVkwDtsIEp56dGU6g4=
=olu/
-----END PGP SIGNATURE-----

--FFx3KsBRxu5dYLgW--


--===============8163787751785386813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8163787751785386813==--


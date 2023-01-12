Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36CC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ultnntg4LRl8kVR+RZIBxkrMDAtktKMKsvTTJvgCGM=; b=GTQM5r0bgDj7PNkPPkPCtz2Ib3
	3CYb+317nEjS6BcklSWoLV0rlNj/ikrbr/D1ZEhIEd5+/zkN6LOdYcGdoGK6SHPzBs+2pIh9RBugC
	SJe2mbqK4jVCpmEcYkn0qvf2UrOsGhZ0gfG5YsUr8t5lMEWCcEK79c039qQKh4ClUWXWSIZKRx+ly
	NJ5MsriHrZcwbYsbeiSfR/CZs809ZLW/krm8oFOav7QSgxyClt9OojwIGGo7qSgV0dR6dslk7H7v2
	x2/iYIsfKeXFyA63rgH9chJYV3oRhKwW91/lAQmSEseRC/WnBX8u8msx8FR9P1lIfg8LjgUhhwTb8
	z5SNn7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzE8-00FXR6-HL; Thu, 12 Jan 2023 15:10:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzE0-00FXOG-Vv
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 15:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673536240; x=1705072240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mcC3ycvPUa6E240Qla/RTH3/APdFORNAqQ+R0bSawE4=;
  b=XtrB1bb4ojyzRFaitz2H8zE8wSTQcG1eiADMtTI5ybkMi4TwtGMn6Prl
   +fhNSo8NKVBqokFdBYQ2UVQiZxg+SdbA95bNzRa1fk/ZEf3nb5VLOclyz
   bgQgNYRafHHR5FmSo9LGofHfO0Q3jF05m3ImKXMQT/BRr+1VEUgGBroVP
   GGYrgSbU5UXzoZNujNUwNbFPt84dbHwnh8VJ/dfdMsPqUi3V2vSGa8CmV
   dvTCHuLafkkLwDa1WsuwfHRa2ZhY9nRUXiQ1dhQwpTzduJqOAdkW5ClUl
   oMH3Gvay5Afifz5iXBlZAySiJ2JV5vifRS0r2N3cWJnB4ayqeACYBU2Ml
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,211,1669100400"; 
   d="asc'?scan'208";a="196375836"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 08:10:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 08:10:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 12 Jan 2023 08:10:32 -0700
Date: Thu, 12 Jan 2023 15:10:09 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Conor Dooley <conor@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v13 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <Y8Ai0aF5A+O43kjZ@wendy>
References: <20221221112912.147210-1-conor@kernel.org>
 <20221221112912.147210-2-conor@kernel.org>
 <20230110224805.3pqxd3yv4wyci2zj@pengutronix.de>
 <20230112120141.fpjwhtjuaxrwqt5m@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230112120141.fpjwhtjuaxrwqt5m@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_071042_598046_C25AA973 
X-CRM114-Status: GOOD (  26.30  )
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
Content-Type: multipart/mixed; boundary="===============4814040034477210743=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4814040034477210743==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fVFk6pos5f7gI6TJ"
Content-Disposition: inline

--fVFk6pos5f7gI6TJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 01:01:41PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Tue, Jan 10, 2023 at 11:48:05PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello Conor,
> >=20
> > On Wed, Dec 21, 2022 at 11:29:12AM +0000, Conor Dooley wrote:
> > > +static void mchp_core_pwm_calc_period(const struct pwm_state *state,=
 unsigned long clk_rate,
> > > +				      u16 *prescale, u8 *period_steps)
> > > +{
> > > +	u64 tmp;
> > > +
> > > +	/*
> > > +	 * Calculate the period cycles and prescale values.
> > > +	 * The registers are each 8 bits wide & multiplied to compute the p=
eriod
> > > +	 * using the formula:
> > > +	 * (clock_period) * (prescale + 1) * (period_steps + 1)
> > > +	 * so the maximum period that can be generated is 0x10000 times the
> > > +	 * period of the input clock.
> > > +	 * However, due to the design of the "hardware", it is not possible=
 to
> > > +	 * attain a 100% duty cycle if the full range of period_steps is us=
ed.
> > > +	 * Therefore period_steps is restricted to 0xFE and the maximum mul=
tiple
> > > +	 * of the clock period attainable is 0xFF00.
> > > +	 */
> > > +	tmp =3D mul_u64_u64_div_u64(state->period, clk_rate, NSEC_PER_SEC);
> > > +
> > > +	/*
> > > +	 * The hardware adds one to the register value, so decrement by one=
 to
> > > +	 * account for the offset
> > > +	 */
> > > +	if (tmp >=3D MCHPCOREPWM_PERIOD_MAX) {
> > > +		*prescale =3D MCHPCOREPWM_PRESCALE_MAX - 1;
> > > +		*period_steps =3D MCHPCOREPWM_PERIOD_STEPS_MAX - 1;
> > > +
> > > +		return;
> > > +	}
> > > +
> > > +	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX);
> > > +	/* PREG_TO_VAL() can produce a value larger than UINT8_MAX */
> > > +	*period_steps =3D div_u64(tmp, PREG_TO_VAL(*prescale)) - 1;
> >=20
> > This looks wrong, but I didn't think long about that. Did we discuss
> > this already and/or are you sure this is correct?
> >=20
> > (We have:
> > 	          (prescale + 1) * (period_steps + 1)
> > 	period =3D ------------------------------------
> > 	                       clk_rate
> >=20
>=20
> We want prescale small such that period_steps can be big to give
> fine-grained control over the available duty_cycles. period_steps is a
> 8-bit value < 0xff, so we get:
>=20
>                     period * clk_rate  =20
> 	prescale =3D ------------------- - 1
>                    NSEC_PER_SEC * 0xff
>=20
> which in code then reads:
>=20
> 	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX)
> 	if (*prescale)
> 		*prescale -=3D 1;
>=20
>=20
> > You calculate
> > 	            period * clk_rate
> > 	prescale =3D -------------------
> > 	           NSEC_PER_SEC * 0xff
> >=20
> > 	                     period * clk_rate
> > 	period_steps =3D ----------------------------- - 1
> > 	               NSEC_PER_SEC * (prescale + 1)
>=20
> The formula for period_steps is right.

I stood in front of the whiteboard for a bit to puzzle it all out and
have come to the realisation that you are right. I was implicitly
converting in my head from "mathematical" values to register values &
therefore not subtracting. I must've hyperfocused on the underflow when
I adjusted your suggestion back in v5 or w/e it was.

I must also have got rather unlucky that the configurations I picked to
check whether the calculations worked out, happened to. I suppose as
well, the way in which it was mis-calculating also avoids the PWM_DEBUG
complaints too.

Perhaps I'll insert your nice formulae in the next version in comments,
so they're there for next time.

Thanks again & sorry for consuming so much of your time on this,
Conor.


--fVFk6pos5f7gI6TJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8Ai0QAKCRB4tDGHoIJi
0sQnAQDsop1eRPZcbZgK9DgYp3wSCMO28qbboB6YdQAdQMzbTQD/VPhbn4dHc/6C
yTsaXuUHVY4G3F0m8oPsFcTOlB0TeQ8=
=VQbM
-----END PGP SIGNATURE-----

--fVFk6pos5f7gI6TJ--


--===============4814040034477210743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4814040034477210743==--


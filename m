Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1769FC25B50
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 19:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yp2L1AUA1tz2sZkGByGUOzALY/EfDrPVKc8HdcGe2kY=; b=L6iRZL0cZhjquZWYKGa6LncjGo
	GVRzOCB5xJz66rJhMPLrIFWD8Fe8xsV2RKQWgPvwt5R4kFybtBLeyMZOmy6cxeS/+VjFZgxk3fr+9
	m13TWZ0zRU8H8Xj/oKzlPtp4xZP33zbc8MwiVSp0ekDRg06OyZU/G2FMoFqFMHGhloH6cu5NkR6JE
	G5TWAjvp+1ZYA3mWF3NySBy4MjZebUZgg5DmeBXgV1CuOEuyKqwNpwivllm7nqPa/qI0FUmCFmE5r
	OvR/CMCyfjzXshOxuTlH8NhuUKv7ee0mN9y1+GWLndvlEACuLS7P/5lkyT6SmGe9N+YWc2gu3vwww
	erX8vz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIxFk-00C7Wn-Fz; Fri, 20 Jan 2023 19:40:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIxFg-00C7Vg-OY
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 19:40:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A9ACB82940;
	Fri, 20 Jan 2023 19:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BED6C4339B;
	Fri, 20 Jan 2023 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674243636;
	bh=XwfKwgfengOAeie8NkJ0IoN7XbRpPslgW2u+/kjN/88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkxzIN8Uq3cBx2VVFviRHm52YUEz4ST4CEz5vRml9C+uVmn+iUnPQAF1sAb0K4XDg
	 CLTvnJzx+CAZ1IhF2jsmWyGf7FMmr2DCc+rETIKlSITl5ivK4UkKhlVz68gHgte8cq
	 +f53vT+vx46gH6QsKesjZ7Kms+d9i8fvfa8DAgeb4i4BLKm4ZkpbyN1CgxXz+NxX7+
	 xYVO6JaA1VWkXQwFukQ3EpE11ssN3D507hYNfEwWL+fR8Lv3lWzS8gmPbGnRb/onev
	 ipTEcb4DzUTHq/z6ot0cxVS+MIy40eW6+FpLgFjmAZzAno8ioPV8MibnhxwW+awAV/
	 v6eIkNsX/2Ruw==
Date: Fri, 20 Jan 2023 19:40:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <Y8ruML/XnJHjVWy/@spud>
References: <20221221112912.147210-1-conor@kernel.org>
 <20221221112912.147210-2-conor@kernel.org>
 <20230110224805.3pqxd3yv4wyci2zj@pengutronix.de>
 <20230112120141.fpjwhtjuaxrwqt5m@pengutronix.de>
 <Y8Ai0aF5A+O43kjZ@wendy>
MIME-Version: 1.0
In-Reply-To: <Y8Ai0aF5A+O43kjZ@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_114041_132204_96485B47 
X-CRM114-Status: GOOD (  41.28  )
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
Content-Type: multipart/mixed; boundary="===============2816042637934644643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2816042637934644643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3JjaQUEq6UBbiBW"
Content-Disposition: inline


--X3JjaQUEq6UBbiBW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 03:10:09PM +0000, Conor Dooley wrote:
> On Thu, Jan 12, 2023 at 01:01:41PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Tue, Jan 10, 2023 at 11:48:05PM +0100, Uwe Kleine-K=F6nig wrote:
> > > Hello Conor,
> > >=20
> > > On Wed, Dec 21, 2022 at 11:29:12AM +0000, Conor Dooley wrote:
> > > > +static void mchp_core_pwm_calc_period(const struct pwm_state *stat=
e, unsigned long clk_rate,
> > > > +				      u16 *prescale, u8 *period_steps)
> > > > +{
> > > > +	u64 tmp;
> > > > +
> > > > +	/*
> > > > +	 * Calculate the period cycles and prescale values.
> > > > +	 * The registers are each 8 bits wide & multiplied to compute the=
 period
> > > > +	 * using the formula:
> > > > +	 * (clock_period) * (prescale + 1) * (period_steps + 1)
> > > > +	 * so the maximum period that can be generated is 0x10000 times t=
he
> > > > +	 * period of the input clock.
> > > > +	 * However, due to the design of the "hardware", it is not possib=
le to
> > > > +	 * attain a 100% duty cycle if the full range of period_steps is =
used.
> > > > +	 * Therefore period_steps is restricted to 0xFE and the maximum m=
ultiple
> > > > +	 * of the clock period attainable is 0xFF00.
> > > > +	 */
> > > > +	tmp =3D mul_u64_u64_div_u64(state->period, clk_rate, NSEC_PER_SEC=
);
> > > > +
> > > > +	/*
> > > > +	 * The hardware adds one to the register value, so decrement by o=
ne to
> > > > +	 * account for the offset
> > > > +	 */
> > > > +	if (tmp >=3D MCHPCOREPWM_PERIOD_MAX) {
> > > > +		*prescale =3D MCHPCOREPWM_PRESCALE_MAX - 1;
> > > > +		*period_steps =3D MCHPCOREPWM_PERIOD_STEPS_MAX - 1;
> > > > +
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX);
> > > > +	/* PREG_TO_VAL() can produce a value larger than UINT8_MAX */
> > > > +	*period_steps =3D div_u64(tmp, PREG_TO_VAL(*prescale)) - 1;
> > >=20
> > > This looks wrong, but I didn't think long about that. Did we discuss
> > > this already and/or are you sure this is correct?
> > >=20
> > > (We have:
> > > 	          (prescale + 1) * (period_steps + 1)
> > > 	period =3D ------------------------------------
> > > 	                       clk_rate
> > >=20
> >=20
> > We want prescale small such that period_steps can be big to give
> > fine-grained control over the available duty_cycles. period_steps is a
> > 8-bit value < 0xff, so we get:
> >=20
> >                     period * clk_rate  =20
> > 	prescale =3D ------------------- - 1
> >                    NSEC_PER_SEC * 0xff
> >=20
> > which in code then reads:
> >=20
> > 	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX)
> > 	if (*prescale)
> > 		*prescale -=3D 1;
> >=20
> >=20
> > > You calculate
> > > 	            period * clk_rate
> > > 	prescale =3D -------------------
> > > 	           NSEC_PER_SEC * 0xff
> > >=20
> > > 	                     period * clk_rate
> > > 	period_steps =3D ----------------------------- - 1
> > > 	               NSEC_PER_SEC * (prescale + 1)
> >=20
> > The formula for period_steps is right.
>=20
> I stood in front of the whiteboard for a bit to puzzle it all out and
> have come to the realisation that you are right. I was implicitly
> converting in my head from "mathematical" values to register values &
> therefore not subtracting. I must've hyperfocused on the underflow when
> I adjusted your suggestion back in v5 or w/e it was.
>=20
> I must also have got rather unlucky that the configurations I picked to
> check whether the calculations worked out, happened to. I suppose as
> well, the way in which it was mis-calculating also avoids the PWM_DEBUG
> complaints too.
>=20
> Perhaps I'll insert your nice formulae in the next version in comments,
> so they're there for next time.

*sigh*, me again...

Picked this up this afternoon to try and respin a v14 and ran into a bit
of an issue with this suggestion:

> > 	*prescale =3D div_u64(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX)
> > 	if (*prescale)
> > 		*prescale -=3D 1;

In theory this works out, but with integer division it doesn't AFAICT.

Take for example:
period_ns =3D 10,000
clk_rate =3D 62.5 MHz

The prescale calculation is:
(10000 * 62.5E6) / (1E9 * 255) - 1 =3D 1.451 -> 1

For period_steps then:
(10000 * 62.5E6) / (1E9 * (1 + 1)) - 1 =3D 311.5 -> 311

prescale is a u16, since it's valid for that division to return 256.
The register is only 8 bits wide though, so 311 overflows it and 55 ends
up in the register.
The period then is:
(55 + 1) * (1 + 1) / 62.5E6, or a period of 1792 ns.

I think it needs to be a div_u64_round_up(), which I know is not a real
function, otherwise we compute invalid values for period steps.

Quoting you previously:
> I thought a bit about that (without pencil and paper on my way to work
> today), and the optimal solution is non-trivial. In fact you have to
> pick parameters A and B such that for a given C
>=20
> 	(A + 1) * (B + 1) is maximal with
>=20
> 	0 <=3D A < 0x100
> 	0 <=3D B < 0xff
> 	(A + 1) * (B + 1) <=3D C

As we need (period_steps + 1) * (prescale + 1) maximal, *but* also want
to maximise period_steps so that duty resolution etc is maximal too.
We pick prescale, using the formula below, by setting period_steps to
the maximum possible value:
> 	            period * clk_rate
> 	prescale =3D -------------------
> 	           NSEC_PER_SEC * 0xff

Given we set period_steps to the max here, we only actually pick the
lower bound on prescale, not the actual value of it.
We must round it to the nearest possible value before using it to go
back and calculate period_steps.

With the previous code, missing the -=3D 1, the division result was purely
truncated:
(10000 * 62.5E6) / (1E9 * 255) =3D 2.451 -> 2
That 2 was written into the register, and then the hardware rounds that
up to 3, as does the period_steps calculation.

period_steps here is:
(10000 * 62.5E6) / (1E9 * (2 + 1)) - 1 =3D 207.833 -> 207

Finally, the period:
(207 + 1) * (2 + 1) / 62.5E6, or a period of 9984 ns.

This is the same operation, unless I am yet again overlooking something,
as doing a div_u64_round_up() type thing, followed by a subtraction of 1

We don't need to worry about writing something too big into the register
either, as we are protected against values of tmp that, when divided by
0xff, would produce values larger than 255:
> /*
>  * The hardware adds one to the register value, so decrement by one to
>  * account for the offset
>  */
> if (tmp >=3D MCHPCOREPWM_PERIOD_MAX) { (PERIOD_MAX is 0xff00)
> 	*prescale =3D MCHPCOREPWM_PRESCALE_MAX - 1;
> 	*period_steps =3D MCHPCOREPWM_PERIOD_STEPS_MAX - 1;
>=20
> 	return;
> }

What am I missing this time? haha

Thanks,
Conor.


--X3JjaQUEq6UBbiBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8rt/gAKCRB4tDGHoIJi
0iatAQCiWUr71+kleFkmD8TZsQPgqyV+CuLMFzAXskATxG8f5wD9GL2ayz3Z6LYH
EyPlTYu1CUtEgw1sWG2MzlfWerdhOQY=
=1rPs
-----END PGP SIGNATURE-----

--X3JjaQUEq6UBbiBW--


--===============2816042637934644643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2816042637934644643==--


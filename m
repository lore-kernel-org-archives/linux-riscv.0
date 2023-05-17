Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38586C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIPggrGgxWkesl7yNaANFJDMoLyTTnx0ejTWA5i3O7I=; b=tjdQ3qYXVwft842LZp+Kl099cG
	W6E7i5RYJTvDBiMgw6ndwlxhDNvmm75wQfAPg+A1j+nxoQgAgu5IYkEfrMMj+xenPWq3dHS+8sX5E
	jpn+gSR9o0EB1uWg3JYA0jUb5Ysa2GqcJRRAPZZrKiJrOwl6Lvn8E5E2ahC/9oEbWEQH0PKof6i5P
	k9zjkES6uExFUGhfsAAot2W4g61QKN6c6jhjSSoKw3J9ebBDWCtq93+qYr5AajNsFr8hoYM+SDcA4
	UBjj+BwMP/nhrxAoLh7DHDTUbLsUYDKOAUDG22CuHSYT4UtvM68/oIp7EMFS3odkkummSwZJgMTr/
	ivopIKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEH7-009L82-00;
	Wed, 17 May 2023 10:20:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEH4-009L1d-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:20:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzEGm-0001Nd-Hf; Wed, 17 May 2023 12:20:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzEGl-000opd-MS; Wed, 17 May 2023 12:20:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzEGk-005JDj-UP; Wed, 17 May 2023 12:20:30 +0200
Date: Wed, 17 May 2023 12:20:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v17 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230517102030.b4nyo2dmpfl7v7fk@pengutronix.de>
References: <20230421-neurology-trapezoid-b4fa29923a23@wendy>
 <20230421-sleek-bottom-88b867f56609@wendy>
MIME-Version: 1.0
In-Reply-To: <20230421-sleek-bottom-88b867f56609@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_032050_827786_E207B572 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: multipart/mixed; boundary="===============0378969791518341679=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0378969791518341679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qa5qm3wv35pmobau"
Content-Disposition: inline


--qa5qm3wv35pmobau
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

I found one remaining issue:

On Fri, Apr 21, 2023 at 10:27:09AM +0100, Conor Dooley wrote:
> +static u64 mchp_core_pwm_calc_duty(const struct pwm_state *state, u64 cl=
k_rate,
> +				   u8 prescale, u8 period_steps)
> +{
> +	u64 duty_steps, tmp;
> +
> +	/*
> +	 * Calculate the duty cycle in multiples of the prescaled period:
> +	 * duty_steps =3D duty_in_ns / step_in_ns
> +	 * step_in_ns =3D (prescale * NSEC_PER_SEC) / clk_rate
> +	 * The code below is rearranged slightly to only divide once.
> +	 */
> +	tmp =3D (prescale + 1) * NSEC_PER_SEC;

If prescale > 4 this overflows on 32bit archs, doesn't it?
(I think prescale + 1 is promoted to unsigned int, then the
multiplication is done and only then the range is extended to u64.

> +	duty_steps =3D mul_u64_u64_div_u64(state->duty_cycle, clk_rate, tmp);
> +
> +	return duty_steps;
> +}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qa5qm3wv35pmobau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRkqm4ACgkQj4D7WH0S
/k6E4Af9GpPg42BTohU1ij/TFyI2WSTeDS3OHXIV92tExb/HLhS7FSfKT6abkvKE
ypK/1B9fnczOdqCjkkU1EetSh+RpLL7D9iQTmpbVKiH6RNP4yzpluiURsYPs/FkX
l13ixd0Twqfdm/YJC+I9bMxZMkSH/nQfz211qQXxdFDQ7gluRdNllcz0FZzx9goT
naOJE1VjjAqzXEpcuSojE7ghI/ZG8zQihqmYgSRQV88rQoqupN7u69vvAKS/ji9g
StJ3wFnLC3l5flUPz1ye32ZtXO/l7f7dewi+IpkDpcM54EY765Jiu4Mw53MTGUWm
1b8HNXWdrt2LqRG9/l/0pUd6nJAJkQ==
=4RDi
-----END PGP SIGNATURE-----

--qa5qm3wv35pmobau--


--===============0378969791518341679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0378969791518341679==--


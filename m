Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD478EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yXnDYb1kWSITiDQo9Vz+thPi0YWyZW0tDESEJUi98E=; b=Rk0VJ1q89wgj0POr9lVkctwtvx
	wCYyXZDSl6Wc16H81q8+ILPPWVKeZleMugcrn2xIJpJdYeTe7LSZ09KOMQkpI4mB0YdIZysVohXYW
	m5lOkszc7bhafipAEH24bPIYWpDgQm7p80vWQtO6zZaHDaLByuw1VryRr4xvPFJAxP61JqFayW7EA
	h0dncGYeuQ3jPGnbiqBJoBTUKw7620lg9MWX8I20ADKJAeSdxg3j2CDTVBd2SJBVchGs1J9U4yxlC
	gxJ0wLcFKcaxqISNEJEcLyGZWVtpI7qccpLbaP8baalk9vm1RNkE5P2mX+3TIPEQVdv3UrzBWgRCJ
	I75Zc9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNof-00A54e-1z;
	Thu, 20 Jul 2023 07:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoc-00A528-2z
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Jul 2023 07:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+QWsUXrWtU5h/XbFc8eS+I7mkzZNhuJQOPtwBdC2ghk=; b=LzSvUO18s3EH5+kzqSUOjgFO2W
	W981Tnz+PHPfaLYwEEwNDOx3ORqkVgkalz3ZSMOscZ6rOrFKgCIWXPfORBhX47jg5OqVtHZI+bpAj
	4P0N9tkHCzD3lc+Du5L1ejILuH5/aI9S2TbdOU9GJdlzzbZ8Sj0GVqkX2l89JWxu/n7kPfBGJz9hp
	wrKVAGIh37K2h1c9YfTaR5547rOsnif7CC9DPR/3tUCzfa+NShvVw0VVw4VfqlmFjDM5B0Bb2zHVG
	jqBbLBO5w7jfKAj/+ullHnrmAirwPhG6XIHppuaNjdd/ht+UegfinDd9JVBMwOMzqNBJ8E64ZBoP3
	6dpUHvUA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNoQ-00FN52-2f
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 07:11:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo5-0006Kw-7e; Thu, 20 Jul 2023 09:10:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo2-000mWW-K5; Thu, 20 Jul 2023 09:10:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qMNo1-006IQo-Re; Thu, 20 Jul 2023 09:10:33 +0200
Date: Thu, 20 Jul 2023 09:10:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guenter Roeck <groeck@chromium.org>,
	linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pwm@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Benson Leung <bleung@chromium.org>,
	linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
Message-ID: <20230720071033.e72hjkpghf5ooe73@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <ZLjYqwGh178EHrVY@orome>
MIME-Version: 1.0
In-Reply-To: <ZLjYqwGh178EHrVY@orome>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_081102_518682_36E3756A 
X-CRM114-Status: GOOD (  20.83  )
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
Content-Type: multipart/mixed; boundary="===============4541007511883173779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4541007511883173779==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icirkconcmfpuvh7"
Content-Disposition: inline


--icirkconcmfpuvh7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Thu, Jul 20, 2023 at 08:48:11AM +0200, Thierry Reding wrote:
> On Fri, Jul 14, 2023 at 10:56:13PM +0200, Uwe Kleine-K=F6nig wrote:
> > Uwe Kleine-K=F6nig (10):
> >   pwm: Use a consistent name for pwm_chip pointers in the core
> >   pwm: atmel-hlcdc: Use consistent variable naming
> >   pwm: bcm-kona: Consistenly name pwm_chip variables "chip"
> >   pwm: crc: Consistenly name pwm_chip variables "chip"
> >   pwm: cros-ec: Consistenly name pwm_chip variables "chip"
> >   pwm: lp3943: Consistenly name pwm_chip variables "chip"
> >   pwm: rockchip: Consistenly name pwm_chip variables "chip"
> >   pwm: sifive: Consistenly name pwm_chip variables "chip"
> >   pwm: sl28cpld: Consistenly name pwm_chip variables "chip"
> >   staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
>=20
> This would've been much easier if it had been a single patch. Now I have
> to either make you redo the whole series because you've misspelled PWM
> or I have to go and update it myself in most of the above patches. Hint:
> I'll do the latter.

I guess you want to do s/pwm driver/PWM driver/? Fine for me, thanks.

> There is really no reason to split this up into this many patches for
> such a trivial change.

Well, that's a subjective view. There are reasons to prefer several
small patches over one big one, too. A small patch can be indiviually
reviewed, so the "Reviewed-by: Alex Elder ..." tag only goes to the one
change that he actually looked at and if later a fix to the sifive
driver is to be backported to stable, the stable maintainers just pick
the sifive one instead of one big patch.

Did you skip the sl28cpld patch, or squash the fixup I sent in the reply
to Michael Walle?

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--icirkconcmfpuvh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS43egACgkQj4D7WH0S
/k4yxggAmA419LnNhUxGLLqAb6cq3dncldtmQs44Y7SOPuVmDMivbYjrghQCbQDx
cwIq9JAASH/o55NbwiCBI6HBa7YDerPZyLNvpCcQ6r2QmX2uw18V/orXxcwCRohr
yMtPxmgVImRc76bjnqpML3G0QIpJf0IbUKmZvkPIOBwj5c+rZQqsvjPcT4UQNWXf
sWT3KXf2sJopeeWGHpThCgHnJuTEB/NdZkXhr2MwM8rJyafJBj91f+d8JQgVl5Pb
MC250+Md3rZwtyDIO6yG1Ay2ViuXwSqvy7u57oGccS6zcU6ZjG63maJ3aUXSXe7i
hClf7akfWvZhZdqYQwJ5WgqC9c3vEw==
=PJgI
-----END PGP SIGNATURE-----

--icirkconcmfpuvh7--


--===============4541007511883173779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4541007511883173779==--


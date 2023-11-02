Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB944C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 11:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmjV1bBCbFof9JT52WoaKS4okX/IhI7IZZHAz/fh4rM=; b=R9flDw7hzDUKMECNehVPMjz2MO
	rCOb+vP431EdRdouQjZfDOypxhTABwyiBOzg/3cHTDyLbjJgTKMrx63nWQbYyu+UMWEoJGsUipFIU
	Yn6aYOeaLhwkGXwObxitL0OZQDsA0gF/CFi2i25UoI/Gj8nO4+vZcPy+1YakGoBGWvy/jcnlBJkBb
	Ov9vqyC9J+oQD3qVZDBafeSdCKaSxa+ekzqLtxtu0VwUEkpWegnwSX79M0xVYjOazsL5Tx7l2u9BW
	keP4HgeQuKJcLWFFUGEGpRldhA9IJw535Yk8Pr0uQ0AByDQTdLr4t3e3qLPjfjMZm/jLVyKqNyerS
	PJsAin0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVuA-009Lcs-0O;
	Thu, 02 Nov 2023 11:30:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVu5-009LcG-0D
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 11:30:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyVtz-0005lO-6l; Thu, 02 Nov 2023 12:30:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyVtw-0063ea-Mn; Thu, 02 Nov 2023 12:30:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyVtw-00BVjO-DL; Thu, 02 Nov 2023 12:30:16 +0100
Date: Thu, 2 Nov 2023 12:30:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v6 2/4] pwm: opencores: Add PWM driver support
Message-ID: <20231102113016.jgsh7jru6vjv4vsp@pengutronix.de>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-3-william.qiu@starfivetech.com>
 <20231020112539.gctx5uj2rrhryulo@pengutronix.de>
 <7d64ea1d-b573-4a69-ba0c-4cbfab638c5e@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <7d64ea1d-b573-4a69-ba0c-4cbfab638c5e@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_043025_129273_028CD993 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: multipart/mixed; boundary="===============3778735445081206959=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3778735445081206959==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltmjasklp4ngpzku"
Content-Disposition: inline


--ltmjasklp4ngpzku
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello William,

On Wed, Nov 01, 2023 at 10:22:44AM +0800, William Qiu wrote:
>=20
>=20
> On 2023/10/20 19:25, Uwe Kleine-K=C3=B6nig wrote:
> >> +	void __iomem *base =3D pwm->data->get_ch_base ?
> >> +			     pwm->data->get_ch_base(pwm->regs, dev->hwpwm) : pwm->regs;
> >> +	u32 period_data, duty_data, ctrl_data;
> >> +
> >> +	period_data =3D readl(REG_OCPWM_LRC(base));
> >> +	duty_data =3D readl(REG_OCPWM_HRC(base));
> >> +	ctrl_data =3D readl(REG_OCPWM_CTRL(base));
> >> +
> >> +	state->period =3D DIV_ROUND_CLOSEST_ULL((u64)period_data * NSEC_PER_=
SEC, pwm->clk_rate);
> >> +	state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL((u64)duty_data * NSEC_PE=
R_SEC, pwm->clk_rate);
> >=20
> > Please test your driver with PWM_DEBUG enabled. The rounding is wrong
> > here.
>=20
> The conclusion after checking is: when the period or duty_cycle value set
> by the user is not divisible (1000000000/49.5M), there will be an error.
> This error is due to hardware accuracy. So why is rounding is wrong?
> rockchip also has a similar implementation drivers/pwm/ pwm-rockchip.c

I fail to follow. Where is an error?

The general policy (for new drivers at least) is to implement the
biggest period possible not bigger than the requested period. That means
that .apply must round down and to make .apply =E2=88=98 .get_state idempot=
ent
=2Eget_state must round up to match.

Assuming a clkrate of 49500000 Hz the actual period for REG_OCPWM_LRC =3D
400 is 8080.808ns and for REG_OCPWM_LRC =3D 401 is 8101.010.

So with REG_OCPWM_LRC =3D 401 .get_state should report state.period =3D 8102
[ns] because if you call .apply with .period =3D 8101 [ns] you're supposed
to use REG_OCPWM_LRC =3D 400.

Rounding using DIV_ROUND_CLOSEST doesn't give consistent behaviour in
some cases. Consider a PWM that can implement the following periods (and
none in between):

	20.1 ns
	20.4 ns
	21.7 ns

With round-to-nearest a request to configure 21 ns will yield 20.4 ns.
If you call .get_state there the driver will return 20 ns. However
configuring 20 ns results in a period of 20.1 ns.

With rounding as requested above you get a consistent behaviour. After
=2Eapply_state(period=3D21) .get_state() returns period=3D21.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ltmjasklp4ngpzku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVDiEcACgkQj4D7WH0S
/k5P5Qf/czkHt1isZ7/ZX5Q+xUYicANztUd5HO2YB1j1TaGv02Q8gE7OomO6Nk/8
NYYx0uxugJPlJlUQ5omGaZzFBE0neKAIfZXuKL7OfIOIIL+dusgvYnY2TRGJWIBQ
o8z9IyZKGh46aUnC2ZToUYJAYqYAxpr3TkUkPl8xVgSlPvgM8uwWAAxyuJWWR/Pk
+rm6Kl2Hb3nZ1tnH1OpV2W8kisHQjtyBR0TWtpjioDSpO7IEp1wlg6ayVPcQQTJe
kHkf/l/RUEVqo7D3nzmg17qT8vzzPGjk2kgm42A9ce6jUAcemq0MOIQtLfS7vWjJ
vM/+J3PQqV+D4wuWImRyKwZ5chY6Pg==
=rI74
-----END PGP SIGNATURE-----

--ltmjasklp4ngpzku--


--===============3778735445081206959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3778735445081206959==--


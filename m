Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13687C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrE6vaSYtLWaveeM1hR7bwmDZkGRalKVsD98Bu1F2iY=; b=nVzEga46qBbej+cQVpm87YBwSu
	7D4pCoZEg+mV94W494pb9JPKYQ4F5/EXZMFLtdkgt6kISFDIUs0+ntOR4RzI5VNhIsvh0gBC8Rsk9
	nNRku3DizJgirvwlO6ZFZPByrE2GtoyrBv4Cge30Ro4WvDmTcXTvcgui16IcSI5XF43in5ZQU+nUL
	ZB0/+Ks1CXcjyiqbcnNM7flmra+AS6DNzXg+O5KVJioBEeXSoThqioBOzOKof1Ee9XlbFttuE8l2k
	giCQ1usFA1F0Amm7k8xu49nmAN5pAwrgECN6xcVr5iDir6m9uJhfJLwldVMIUCHwmo/qzSWLw4TkV
	wcTw8+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWOY-00FMkP-0A;
	Thu, 04 Jan 2024 22:40:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWOU-00FMjz-0l
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 22:40:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWOR-0001yE-9T; Thu, 04 Jan 2024 23:40:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWOO-000SX9-Bn; Thu, 04 Jan 2024 23:40:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWOO-003eP0-0q;
	Thu, 04 Jan 2024 23:40:48 +0100
Date: Thu, 4 Jan 2024 23:40:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 2/4] pwm: opencores: Add PWM driver support
Message-ID: <mtqzl3hdfivkty2gdwabfxpshz276fjke477eql3nua4west63@u53ruikv5hz2>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231222094548.54103-3-william.qiu@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_144054_275610_2C12FD17 
X-CRM114-Status: GOOD (  13.79  )
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
Content-Type: multipart/mixed; boundary="===============2588743578150426337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2588743578150426337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e6p2envurvrpju5r"
Content-Disposition: inline


--e6p2envurvrpju5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

On Fri, Dec 22, 2023 at 05:45:46PM +0800, William Qiu wrote:
> +static const struct ocores_pwm_data jh7100_pwm_data =3D {
> +	.get_ch_base =3D starfive_jh71x0_get_ch_base,
> +};
> +
> +static const struct ocores_pwm_data jh7110_pwm_data =3D {
> +	.get_ch_base =3D starfive_jh71x0_get_ch_base,
> +};
> +
> +static const struct of_device_id ocores_pwm_of_match[] =3D {
> +	{ .compatible =3D "opencores,pwm-v1" },
> +	{ .compatible =3D "starfive,jh7100-pwm", .data =3D &jh7100_pwm_data},
> +	{ .compatible =3D "starfive,jh7110-pwm", .data =3D &jh7110_pwm_data},
> +	{ /* sentinel */ }

Looking at the binding

	compatible =3D "opencores,pwm-v1";

isn't a valid configuration. If that is indeed the case and you always
have either starfive,jh7100-pwm or starfive,jh7110-pwm, you can drop the
logic to only use starfive_jh71x0_get_ch_base conditionally.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e6p2envurvrpju5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWXM+8ACgkQj4D7WH0S
/k5eqwf7BKGgncVgVmHDNmQfHHTNNfkRf4UToW1IVJgCDbsLtDvbBFJbN5tzdhb+
cL/gFmPxhwJBZ2rRDGTa0/5EBBkCfwVdIQ8jj1wqJEyx0bQuvxUKdNIVCjYtmvFJ
B0dSDdrYqvSQK3v5gHEYGfi1TOXWJ0P9LdIZxiIRAyF8eDfPVAHnvM3JhPxnkoX9
d0jC11XgWfuS/7PWg17j45Kr25+6WQD0gXxHTR+jFH3srzZPsgTjzoN1pUrMUUvU
9zfN8xZtRy9EZOQCDV5s9eP3PdaTJc3hNkkD4MzdD9ObrxGbfvqvzMtAOG2aEmMm
BtgpzOX0+0zOrVcwSvAO5Tp7FW3mJg==
=hIsf
-----END PGP SIGNATURE-----

--e6p2envurvrpju5r--


--===============2588743578150426337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2588743578150426337==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v69m+1WeaMGu+zux1T7CrR3+S+b12tP+/iLzr/IOeyI=; b=ztJelTQYdl8ZQiWzgUx0/nquVh
	4INVHoQNlQrWnOGqWBUwrJJS7K7dV82qa+2gBLasWsxSrJP7uB13X/zzQExb8XaND2RWzg97YSAli
	UEMUxhZJ4QUHQfh/XxqiiOAOiLUM5UJk8Y1sDDRDCg+XqrEqES+uTifiBJsPF5aMwencJ5cHWmygQ
	GXMeKi/XT/lVsYg9qNDR9yUBrNIyhTAzXL9ZGkC1MTlnrhJEhqUjasqUUz4X8wWGV2cGfC1lu/8P9
	aQRVpiJiLKUvzHjD7uJfl5wWqHJqz83rWHnthLuzWmPgnXGbrUlVYKGRjJIecsRLkS/2NkdNbY6lr
	44InnBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ed2-00Eksx-16;
	Mon, 13 Nov 2023 21:37:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ecz-00EksM-0O
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 21:37:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2ecs-0007NH-Iw; Mon, 13 Nov 2023 22:37:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2ecp-008qbU-3N; Mon, 13 Nov 2023 22:37:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2eco-0015ig-Q3; Mon, 13 Nov 2023 22:37:42 +0100
Date: Mon, 13 Nov 2023 22:37:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Message-ID: <20231113213739.xu4pi3akhxdgjjcb@pengutronix.de>
References: <20231005130519.3864-1-jszhang@kernel.org>
 <20231005130519.3864-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231005130519.3864-2-jszhang@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_133753_180955_CB60B421 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============6650138255813492602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6650138255813492602==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhoxaknal3j5qiqq"
Content-Disposition: inline


--mhoxaknal3j5qiqq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 09:05:18PM +0800, Jisheng Zhang wrote:
> T-HEAD SoCs such as the TH1520 contain a PWM controller used
> to control the LCD backlight, fan and so on.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mhoxaknal3j5qiqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVSlyMACgkQj4D7WH0S
/k4kgwf+NMxlQpmWTBFvvBMUZ0u4NTjS7FFi4tH9g9Yqf9t1J4seDD2Njdc3wqgJ
8aU0hh58zbFC1/gpGiXDSrOjYEcZPJtUEGFSgb5EIfN/xSmvcMzhdtrvM8RKQgoG
tzyOkYY5UBhfznRpypNNZDvm7+I9w923fSxC0VOsXwT5ln4FyzEs6mBsc8Az3N6l
je/JnuxYd+HmSnIe1ocxoJvmsTSOIndXqHGWZKGDsDzAgsYTYM+UiS9GIa2Fsv7F
15iH2NvTkKqLXUXsAntN/kck/4pdDCvyNEssD4qa8bWMnTpZq6voiYs14e+HzfkG
fIwJkg8PcYT7Z50Fu3YfF0ZtOLqueg==
=faeJ
-----END PGP SIGNATURE-----

--mhoxaknal3j5qiqq--


--===============6650138255813492602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6650138255813492602==--


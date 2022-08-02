Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A791C00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDClruwUhTLvFkf3gpUNzmGVEXIwaIEGZhG9Zw6WUbM=; b=nelOu71WXr8nYLXu6TNBNWQ25z
	9naUJgb8lu6W5uv+Oj4sJnkpUc4tWmiq1sIpMAFoBPUdlue9pUPPl5ks+BQ0jiJsCWyYtgglD8J/N
	MJIzQA6cHNn3W81Sfn/GwaaBuQJyRUdAazecnz8IjHoUAeMx/N7oqs9PRMCRRWOiHS0c4Mtp8HO8o
	DLdwLC80aXTqhI5FovOScUbCHZH+HEJqUxxSsIiDiHqo0Aukk22XJFDTzSzmzfAc0YRAcQABid9GV
	ZWcn9TG9Pjqul//xJJhUqqw3CaDiDgGKHYKs01XEeULGJQOXN3yhdmp9ZfsrbWlURPqE0O2LA5FrG
	aiAA8jdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImar-00BTll-QJ; Tue, 02 Aug 2022 07:45:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIman-00BTil-Fu
	for linux-riscv@lists.infradead.org; Tue, 02 Aug 2022 07:45:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImag-0008IG-9t; Tue, 02 Aug 2022 09:45:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImaf-001Gz2-GV; Tue, 02 Aug 2022 09:45:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImae-0095B7-Ow; Tue, 02 Aug 2022 09:45:20 +0200
Date: Tue, 2 Aug 2022 09:45:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	robh+dt@kernel.org, thierry.reding@gmail.com,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: fix microchip corePWM's
 pwm-cells
Message-ID: <20220802074520.ayyjl5sf332eta3o@pengutronix.de>
References: <20220721172109.941900-1-mail@conchuod.ie>
 <20220721172109.941900-2-mail@conchuod.ie>
MIME-Version: 1.0
In-Reply-To: <20220721172109.941900-2-mail@conchuod.ie>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_004529_596557_DE6CFE1F 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============6954594057833440410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6954594057833440410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qqmpwa5unzevycoi"
Content-Disposition: inline


--qqmpwa5unzevycoi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 06:21:07PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> corePWM is capable of inverted operation but the binding requires
> \#pwm-cells of 2. Expand the binding to support setting the polarity.
>=20
> Fixes: df77f7735786 ("dt-bindings: pwm: add microchip corepwm binding")
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I'm surprised by myself I didn't notice this when acking df77f7735786,
*shrug*.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qqmpwa5unzevycoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLo1g4ACgkQwfwUeK3K
7AnP5Af/XZhd73YIdx2wsJViugHNrfh9xObg6ePSOGVeE9RzkIizBUQuUxVZt+Gq
7imbuubQrntsS0HZqxkwl24eGRPrSbAJrN+jHY323LTl72X3MbLIRBMLHLN2eZ1P
pbu6kCeR425V36EMSaJOAsAMEHHKuia73rwxuUL2G674Y0brEcZ914XLqgqgC1V9
+zhH0KFx9rgzEPWPIozeZgVK9AYjhYVgIZC7wj8GEqME1ppslZQt2czTU16cB3PZ
IsDIseICnSi3YB8poYd/9Od6RkyDW0Lq7r+6HwpxmgIvAzLOjWYWtZad09q1aAKu
+HmVReWtq83sFOepD+uHUmgmpmZcjQ==
=Bu3F
-----END PGP SIGNATURE-----

--qqmpwa5unzevycoi--


--===============6954594057833440410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6954594057833440410==--


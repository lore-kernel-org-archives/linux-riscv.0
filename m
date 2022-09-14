Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C8EC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNqtbfjEmoVdH7WPjzx5MPE6t8l7tYc5giROr7QiC9U=; b=F5d7FzIrUJ9WohGtZfhAvj4R2x
	7y7Msvn0prGinvV4NDLBi1tB82pLOOlFLuI0bNO1+xuVNSVd3Vs9VQaFiia1Jjsl9SqV2FNtyaMLE
	ArV0JVdbNTjdoP/BIfflRvnTIo7qh1BZ4JnOGo8T8Yx3ml28msH9Vu9uc2KzN/UGzYpVHPFcCYQA6
	QodX3z9Qyz2jIQBUKGuqkB3HfzxERUwZ1IRbzZXcRmihxCxj1vWjxQAQiZ7C0IAUNh17DvkRDtNXS
	f/j2Y/rZE3JYTobmIgC5ppbPr0vjQ+QDOgm92gOaalVlWPnTS/xeCsSAsKQl6+6Prw5qj1ni9hQOV
	6FAaDXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYZq-008kWU-9Q; Wed, 14 Sep 2022 20:01:42 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYZn-008kTn-1C
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 20:01:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYZZ-000464-Mf; Wed, 14 Sep 2022 22:01:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYZa-000ksr-Dq; Wed, 14 Sep 2022 22:01:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oYYZY-000w0q-D0; Wed, 14 Sep 2022 22:01:24 +0200
Date: Wed, 14 Sep 2022 22:01:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <20220914200115.hhx5r3tguwslm2fw@pengutronix.de>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-5-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220824091215.141577-5-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_130139_095078_1A62A3E1 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: multipart/mixed; boundary="===============4933716675491715596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4933716675491715596==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bd4hjm5aplb6w2sh"
Content-Disposition: inline


--bd4hjm5aplb6w2sh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:12:15AM +0100, Conor Dooley wrote:
> Add the newly introduced pwm driver to the existing PolarFire SoC entry.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bd4hjm5aplb6w2sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMiMwcACgkQwfwUeK3K
7AmO3QgAneuvaT36XonRqDoM672ljzuvZLkg3bbxX+ysg0whd38IlovgislRyGtm
vubilfB519ja7Zy1RDjAQabMHj8aiP4RJ3PGt/+9ENPfqNCMGJOWQ4tbpsfkyg93
o44NMgVt04jLTQI3PDUghFb1IasOrJ7j/uNDUprcNPVstIBqsxLrBoxX0t0JF4PI
606V/q3p1jtKcca5slu5V6T23bz2/1Mh78CxX1qUCjJkibK40mWqs3Wztmb27EpH
MmqSUboRHLXB3sEAuOCm5X+Fy0YeTmIYNGK66mEJ5Rym4FIv7riJjTPOowuE0MCP
vmbHKcKkmjdVdBo2jTLn1SDy8GPB/Q==
=Yb2f
-----END PGP SIGNATURE-----

--bd4hjm5aplb6w2sh--


--===============4933716675491715596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4933716675491715596==--


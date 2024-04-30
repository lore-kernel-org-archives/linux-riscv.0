Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65232C10F16
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2RIFjDOso4ldcE4N4ENyGYW/n2mYb5+ovqUqinkep0=; b=zHIjPj0upSknT1EIcSzGFLKp0D
	5MtLHOxBQ1DGzdiR8tJdpig6MlHopcjHBAzTE/9exFPk0U+sp1n6TL5JGf4sbp5Y9YxgndU9tqrmk
	78OngAxdepTdZcO+J0arwLlUNMqBnRCxr0TRVZQdgqZvDcI1yi42lLrAiDhUx+VTOh5V8BZRLUlB6
	C1exFxfMYq32GLVFH8BWCCR0RDvigGKg72cMp7t5Hu2LfeMXZQ2myhcCSd5cFzdOpBuwEgsaf/yjn
	hDTCMoeDeGZzFYAH/0zfASxpTICEPqKEgSN6t9MpaDupoB+rUcITlOUc/LEg4FpNWren66/w1Qu7Z
	GeG0ANHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iWH-00000005Y7K-1BvE;
	Tue, 30 Apr 2024 08:07:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iWD-00000005Y3h-3Wqm
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 08:07:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1iVq-0003Ve-AI; Tue, 30 Apr 2024 10:06:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1iVp-00F85P-5q; Tue, 30 Apr 2024 10:06:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1iVp-00BzUv-0H;
	Tue, 30 Apr 2024 10:06:53 +0200
Date: Tue, 30 Apr 2024 10:06:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <vxolfkvbquiy2jllncjy3vbfl2jr26wkdvpxv65uz4dneln5jb@ozg6ejzgmj6f>
References: <20240406063413.3334639-1-qiujingbao.dlmu@gmail.com>
 <20240406063413.3334639-3-qiujingbao.dlmu@gmail.com>
 <njsvev4dxjln2guw3lr5zwvytzvvmj7qcuduo2v56dhvuxujs4@eqm4cmh6ddva>
 <CAJRtX8So3PifNFfsnq1BmP3+8kevhM6Fk6moMp=wFX4o8q89SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJRtX8So3PifNFfsnq1BmP3+8kevhM6Fk6moMp=wFX4o8q89SQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_010717_907498_C878ED33 
X-CRM114-Status: GOOD (  15.46  )
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
Content-Type: multipart/mixed; boundary="===============7068398646782881500=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7068398646782881500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6zw653cypgpdhtk"
Content-Disposition: inline


--l6zw653cypgpdhtk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jingbao,

On Tue, Apr 30, 2024 at 12:36:56PM +0800, Jingbao Qiu wrote:
> On Mon, Apr 29, 2024 at 10:54=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Sat, Apr 06, 2024 at 02:34:13PM +0800, Jingbao Qiu wrote:
> > > + * Limitations:
> > > + * - It output low when PWM channel disabled.
> >
> > Just to be sure: the output is low independant of the POLARITY register?
>=20
> When the value of the POLARITY register is 1, the PWM outputs a high leve=
l.
> When the value of the POLARITY register is 0, the PWM output is low.
> Should I make this point here?

So that's: The hardware emits the inactive level when disabled.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--l6zw653cypgpdhtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwppwACgkQj4D7WH0S
/k407wf/XEqAv+lfE2x1df8bBAO98sRXO0K23AiMkSaqemGqt0dnc3Plae17H1Uz
1U6g2M6M7JvkKCCdXcfkuekzcd9DF9f8OoQrQbyA0wkedI+rbxxci8JJIJFUvNjv
MoSt86M2sI0hIxAB4jDy2GoTVcrheo9P9pPI6QbLhVz20YFbs2uF0xP1/oVETwMN
DKghx1EVZOe4Xx32dXr35Cp1QuPpxFhvqvEnEO84bcU4Dk9jZmiHvf4hnl1yB/7O
4ICrIDwj9xlLd4CWGYgSAqKU2J6YhAc9PXRHKxEtJqixKiRTV5HnqihGbTGKHNFp
YbzbadVrS3rgPT3AU/gbpZDniis32Q==
=B9+q
-----END PGP SIGNATURE-----

--l6zw653cypgpdhtk--


--===============7068398646782881500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7068398646782881500==--


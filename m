Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D21AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyB5YAykPnKaQHn0EuHbDvaDipGmF4s2s1DCtFEAFwg=; b=fMUU+TqIJbFow+Cr2Kmlssg7NP
	QhKzOHMpeksYwOG59xoxQe7dJ1I7OLSC2Lh03AfV68J0dbT4XhLhpCy/AfCzDW+syXGNXwfsDM7zi
	frk9Vt65VknN7vRyNRlDgzrQvcv+94QSJmp9HyzfPXOpyKs96XRYZ3qGqemx17WEyb4Mf9Iq+q5dI
	Z3Is7kRGY7fv00XzXHWy1FlAK4XL+mdGC9tOE9EoZlnkuSWv+AwgYkyCYDCsS8YoVBZ5Omszcqvyz
	nj8YGiO1xiizYIyBcBFwkXQmk1glXyW1Y/o6yjzCuzP2bCfvovaW9FiemnycYlUhDr8PMQqBWnWxD
	MUKCJ3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAuw-0000000FiPF-3jJu;
	Fri, 12 Apr 2024 07:01:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAuo-0000000FiHa-1Asm
	for linux-riscv@bombadil.infradead.org;
	Fri, 12 Apr 2024 07:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a889H0Vl6ytfi953383tniC1cg7jwH0JMs+GF3iavPk=; b=nz7YVqIUZoKrVpPipgRoutLRTj
	9saZX2Dy9ATjowcv/OTZ2F2ZwEdc1lri0Cyl6YzLwG+CPaEDH6jmdMsAiisnQ89xAgEAvY+n7D47p
	+de2godO3I4B7IjX2iAIH7f4qGtcTNXN3Du9irkvOkcAH6SAH8Kq3zn4d+OT6EYImYa6AG51fCZQc
	OqS0zxxdgW8Lm8/cPLTuPl3ID6d0jfa7ZbK/NbHgRlhYw/TyIdQtIFHvR7ppVpqYlSHbYeAxQH1Z2
	fV3gOiq3qN54Uc6Ioq4F8+6Cokjkqz4cwbeDtQFVG2uc7GxwTrUqGZWxloxBJ4Tee480PmYueU+ZZ
	gSTD5Z5Q==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAuh-000000090jq-0mdn
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 07:01:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvAub-0000oP-1T; Fri, 12 Apr 2024 09:01:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvAuZ-00BpOm-Qd; Fri, 12 Apr 2024 09:01:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvAuZ-0011RJ-2H;
	Fri, 12 Apr 2024 09:01:23 +0200
Date: Fri, 12 Apr 2024 09:01:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, thierry.reding@gmail.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v9 2/3] pwm: sifive: change the PWM algorithm
Message-ID: <l5ymy3rlqdlkwonyxq7xqgxgk5zsgbadui7p4ehl7qeh3m2pef@ic2zyktdqcia>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-3-nylon.chen@sifive.com>
 <f5ukvah2ujko2iht3pd5jxq5kaukbs5z3pn5s7qwcnx4aqr3yv@mwtbwkcfa44a>
 <CAHh=Yk8MXy73d8M1J5bVu4spDMbjQDneVTqA=Ts=SGPDO7PXMQ@mail.gmail.com>
 <CAHh=Yk-WmzJe0vb+noX8Gb13BL2SOB=MwSB=F9nH_G-j9zi1Lw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk-WmzJe0vb+noX8Gb13BL2SOB=MwSB=F9nH_G-j9zi1Lw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_080131_831861_41AB2F6E 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: multipart/mixed; boundary="===============5481932867706110414=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5481932867706110414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26vwn4hmygkd27i7"
Content-Disposition: inline


--26vwn4hmygkd27i7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 12, 2024 at 10:07:12AM +0800, Nylon Chen wrote:
> Nylon Chen <nylon.chen@sifive.com> =E6=96=BC 2024=E5=B9=B44=E6=9C=882=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:08=E5=AF=AB=E9=81=93=EF=BC=9A
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> =E6=96=BC 2024=
=E5=B9=B43=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:16=E5=
=AF=AB=E9=81=93=EF=BC=9A
> > > On Thu, Feb 22, 2024 at 04:12:30PM +0800, Nylon Chen wrote:
> > > >       /* The hardware cannot generate a 100% duty cycle */
> Do you mean that if the inference is correct, this comment should be modi=
fied?

If the polarity was wrong before and the hardware was believed to not be
able to generate a 100% relative duty cycle, then maybe it's really a 0%
relative duty cycle that's impossible?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--26vwn4hmygkd27i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYY3EIACgkQj4D7WH0S
/k5rHwgAhpRRZGowKVE0iokFu7iytXC6fdzFLCzGGn8LC2r59oYV4X8E4ruZzGxi
KMljwKutSBOpirgQ7/8usYyYqlOfAO+x6BXkkg3SHBprmGPfq2+iVEGv5Tj95B7j
9t+GueFeOTR6xJRF++3pv88sp4zYLYHIhtRVSU5YZy1Wb8MbRjJfR5kI+dDy5xtF
UqW5uhIzpV54qyNHnwf8dV0pCooMilhcHS/eGiVa+nSTdoon6rlNJWs+YZgUr1Ud
lDiRWzbwQdju5xFUnoR2hGn/FO/6Jgmws9FKkM0ttnkWdgcYvzsBe7gk6qRPQGgr
kw8IV64UfIbDlmpcuiLqeNi7Iq08uA==
=KwIm
-----END PGP SIGNATURE-----

--26vwn4hmygkd27i7--


--===============5481932867706110414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5481932867706110414==--


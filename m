Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129C5C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 12:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7854222B2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 12:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9RQ6JbR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0dGi8AW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7854222B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xMqtZpoFJajud0dRzt0y/RZw9cOysPPedcpMN5KjSEc=; b=g9RQ6JbRjVWgOb0GWDlg7qmPJ
	4j1QOXZfmre43MauKz8eppkMzBchrtTZLOCzIjHBBjq3T051K2D+uo2oGDsEQASFcU9LwHHrCvMl7
	71hjnCIH6UA23/9a/tD3FcQ+ijpGxtCQShGQbaBgTp11JofTKyUkXOwyrqQ510uDBagnxMsNhhTWG
	XUKrh4Gr5k6UWbrp2bba2GWT+xM2QQvQsEJtqvDZMLpBOOCUB9rmCwInqQFz61eWaBIsY8fA898yd
	IK4SUxE8DdVP3ZjZcac0ILgA9utycx0DZjxxgRzriOo3Y+JgkXKNBynJgcpIUrmD10AY1irL9Vgxt
	uuzA5flvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gttk1-00062O-SG; Wed, 13 Feb 2019 12:34:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gttjt-0005tE-TT
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 12:34:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id t200so2253316wmt.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 04:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rsmCNVGzAnpXHSPd+c6QMEpoDXggl6kiPRAuT+bXYeY=;
 b=q0dGi8AWdNaKZ7SMDoxYa/hdX7GtgT/0UYJeSKvD5DUz/FN6StuxfWl/b/X90nhE8O
 e9tGHC+9Er6CY0E+zLGZ1cB9mfvD9XMfk0UeI/WYvJmlNgak6AeBvk/AEx4uCH6q+dOM
 iDifdrdA5+EAAupDHityeFWXuOx6DL5unHq88hzoiW54ZhPCYRLjnQ2BUkRsHiJbM3pr
 KQazKqBnhC2p5dMb9Hrccmi8WWZqN+uEBtC985UbhG58zF/g5DyCFXWAZrW0cK2+M5rD
 saElnly+lXPzV4kZ2JzFLlDM+Zj+Vh7cgxdL50RFbIKqi1xg2fZK86KKo5AKaZFxY1DS
 Z8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rsmCNVGzAnpXHSPd+c6QMEpoDXggl6kiPRAuT+bXYeY=;
 b=NojbGAxvk+ysqdnL1+H19jsFt6iZMEkmuGljpohmyL5npoR3a/qVKw/JjYwdSMDBcN
 AeybMj12RDi+MFgjJzM/6Ttws55tcXrKdQ/NALBzcLD6nHct3KRs5oVWn8MlqnkxHETC
 0Kq2plYGOL56DmiaZkiP+a4vvaMoM3fsJfEME9Uc6a9FKsAYwx9vh6+5m0LFO9iHu1UB
 n3f1yw9o0GoqCECwOmZDTxmNYPPSXBSdQS2emZOywuOUBk2e/APRqhaS8VfhrUef5esQ
 5YTU4SVCbs1Js9eb8Z9YatKMV9Okr9R8Lg2b8yzBIN4FNI+v5XLKvZ/UKPyrxLjOdd9M
 eOIQ==
X-Gm-Message-State: AHQUAubTBa9hSIXBP7TYuc8iSCDpdFNEprAXTIQexWVaea1oo5w9KMCw
 BG01BOG9RchhwsmKC9f2oMaUtCqM
X-Google-Smtp-Source: AHgI3IZ0ckmRdDpnKDSLABrk3rn2jzaMRJKXh7z9Pd4DhTiFpsDhyRqjlMnvCbhJeBoO9qJNVKipAQ==
X-Received: by 2002:a1c:35ca:: with SMTP id c193mr149103wma.146.1550061247486; 
 Wed, 13 Feb 2019 04:34:07 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
 by smtp.gmail.com with ESMTPSA id m21sm8100255wmi.43.2019.02.13.04.34.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Feb 2019 04:34:06 -0800 (PST)
Date: Wed, 13 Feb 2019 13:34:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190213123405.GD647@ulmo>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
 <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
 <CAJ2_jOGYkwb2QSUH1UU_QoGXE5LFoR0XGJmuYfNtYcZXHXyfaA@mail.gmail.com>
 <20190211122954.33thpip3yhtdw5x6@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190211122954.33thpip3yhtdw5x6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_043409_972152_7300BD0C 
X-CRM114-Status: GOOD (  29.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6335631106248595703=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6335631106248595703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 01:29:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Mon, Feb 11, 2019 at 04:56:27PM +0530, Yash Shah wrote:
> > On Thu, Feb 7, 2019 at 3:47 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
> > > > +struct pwm_sifive_ddata {
> > > > +     struct pwm_chip chip;
> > > > +     struct notifier_block notifier;
> > > > +     struct clk *clk;
> > > > +     void __iomem *regs;
> > > > +     unsigned int approx_period;
> > > > +     unsigned int real_period;
> > > > +};
> > > > +
> > > > +static inline struct pwm_sifive_ddata *to_pwm_sifive_chip(struct p=
wm_chip *c)
> > >
> > > even though this is inlined I would like this to have use the
> > > pwm_sifive_ prefix, too.
> >=20
> > Not sure what exactly you want me to do here.
>=20
> I want this function to be named something like pwm_sifive_chip_to_ddata.
> This way it has the common prefix (and is less confusing because
> to..chip suggests that is converts something to a chip, but the outcome
> is ...ddata).

We've got plenty of these cast functions that are named to_*(). I would
argue that naming this one differently is confusing.

Also, I think this may have come from earlier review comments where I
suggested to name this structure struct pwm_sifive_chip, or just struct
pwm_sifive.

> > > In a previous review round I had doubts about the calculation of frac
> > > and I think they were addressed wrongly.
> > > Looking at the figure at the start of chapter 14.9 in the reference
> > > manual: They use (different than the driver here) pwmcmp0=3D6 and
> > > pwmzerocmp=3D1. Then a period is 7 clock cycles long and pwmcmpX must=
 be 7
> > > (for X > 0) to yield a 100% signal. So pwmcmpX must be greater than or
> > > equal to the period (in clock cycles).
> > >
> > > Here we're using pwmzerocmp=3D0, still the constraint
> > >
> > >         pwmcmpX >=3D period
> > >
> > > must be true for a 100% cycle. (Right?) With pwmzerocmp=3D0 the perio=
d is
> > > 0x10000 clock cycles, so pwmcmpX must be >=3D 0x10000 to yield a 100%
> > > signal. As this is not possible (pwmcmpX is a 16 bit value that can o=
nly
> > > hold up to 0xffff) the output cannot yield 100%.
> > >
> > > So I think the most correct implementation here is:
> > >
> > >         frac =3D (duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) + (1 << PWM=
_SIFIVE_CMPWIDTH) / 2) / period;
> > >         /* Sorry, we cannot do 100% :-( */
> > >         frac =3D min(frac, (1 << PWM_SIFIVE_CMPWIDTH) - 1);
> > >
> >=20
> > I will once again go through the specs, if it seems correct I will
> > implement the above.
>=20
> I would just test this at runtime. Configure for 100% and check the wave
> form if it is constant.
>=20
> > > > +static int pwm_sifive_probe(struct platform_device *pdev)
> > > > +{
> > > > [...]
> > > > +     /* Watch for changes to underlying clock frequency */
> > > > +     pwm->notifier.notifier_call =3D pwm_sifive_clock_notifier;
> > > > +     ret =3D clk_notifier_register(pwm->clk, &pwm->notifier);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "failed to register clock notifier: %d\n=
", ret);
> > > > +             goto disable_clk;
> > > > +     }
> > >
> > > Would it make sense to only enable the clock when the pwm is enabled?
> > > (If yes, how does the output behave if the clock is disabled while the
> > > hardware is enabled? I assume the output just freezes at the state wh=
ere
> > > it happens to be?)
> >=20
> > Yes. Not sure about the behaviour of hardware when the clock is disable=
d.
> > The behaviour should be like you said. If there is no strong reason
> > then we can keep it as it is right now
> > or else if you want I can make the necessary change.
>=20
> I would prefer to only have the clock enabled when it is actually used.
> Note the common pitfall that you cannot disable the clk immediately
> after configureing the duty cycle to 100% or 0% though because you must
> only stop the clock when the newly configured parameters are active.

You can also disable the clock if the hardware will still apply the
configured parameters. This is really only an issue if disabling the
clock also stops the IP and prevents the configured parameters from
getting applied.

Thierry

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxkDr0ACgkQ3SOs138+
s6EltA//WyOsaTPYD52vSFENAJxCA/Bi4M7vQFZm2jQ2dmZRHBM0ngb1hqW4bGUD
6g19/elK1xAo6dzN/2WZtoMv8qRNyY2fOd0ifowshDuIa4KWAaQUHehg/HV5bI5W
dG8/41fiOgq92tZTrTXqOA8VBNyAlUMWv7QeLgMNBRvT1wUTf1AufccfSCFHrEdc
TGGLOlBUfOD83AFLS9DIT0ZSXvAtJQgq1KvQGVpOgfReqsIkCXxXEOcq3jD2N2Iy
0STbXSXh7qO4dOfpsfO4mgLJ4+B2XcipE1Soy81DjXpygf1kQQwm6vEF7wW86Gx0
b0U+9UbiLYrz/WgsgJGPjR/QF8MU3YDKeeq/et14xHfTX+eX2+326+9TFHJoOL8+
dn4AjVgBXFQ7hNf7LQ1dFZKgMHOSC6MRL98Rc6jN2nRevejQWlAKBLTZIsYR1giV
4znvMwGOPfDqWmPID9rTLsl0HKStf/WSB1UBJc74DX3ec+cFasVRsC1Y3KU5Q4uZ
sN//ZNc76p1Yy4+iKCQQCiehFyoT/U/V6gls7G3tN7va3QWcnnf0+I6tNJeLWwLs
FWjgMeuZ4xAKL+jdAEe9esoRp71C+7eecQPUpRqjUO7ku14se/tbGkmJWgNwbFkL
ScM23XTQ2CbfbGfwAE8VtIFh7zjfomjZER2PMCoXCUNQlIoJGaA=
=HKpM
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--


--===============6335631106248595703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6335631106248595703==--


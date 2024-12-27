Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7CE7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Am2/zhQ89nv4fJSI49mbz5ivGEhz98oRcoRIS07YQ=; b=4YKHVxI2Bpx/hG3CMIq/n4MkMW
	E5QNL3Zm9cWKHTL7n9KWkdo63o+TAqFurBwrAAQOzMiuM69QGebScrqoMwk+xXZg1a6R07zMkBJD1
	hHNonvuY1BuM8mwcE7q24H9i0FhZ8o193OPvoXbmMXR1CeMJICd8c679zTrKr4unv/OtlU7EE8tlS
	sPpjRyFxZ3D4OLfezA7I2UmojTLtLiyNjp4rNQAA5QnWtBAURC/r0Bo9UXgRom1kmsMpgIVf4VfJJ
	3dwGbNAES9rHfbSoaPLBt79MnWMVWuZu8FIh1VBjxGlxUijyTGFazUfqlHAppMUQxc9m2yNYHU+FB
	dEcTzoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCQy-00000000XrC-0nPu;
	Fri, 27 Dec 2024 15:39:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCQu-00000000XqO-2OXf
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 15:39:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67f31a858so1316682466b.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 07:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735313962; x=1735918762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0lMXEa6Tw7TwkHA1VHSoSpcx/RWhq+InGvdon8glzk=;
        b=IIPEhTn0NZtMSMU0uwMdh+F1ojPNF1sDuRHzFoZOYLptrNc7CpmRZ1y+6kCbl5n2LN
         6eatjhRPGXSaChqy5EuobaqbbsEH50BMMExZg91yEM/HvCyT7kZqfSyB+5e289IGOKPT
         bUBKqVrqkU1p28EYau9II3/KEjEL/5bAne3YwBqnOPScJorn5pytjfZFB55OOGBbhNMN
         cGuwIiLm4r9p30/W1Zp1sebcNGH3Jqzl1pesKzpNW4XydJ6CcC/k+JmvbangxjQknxKZ
         gVoZNKrwqYwZV4g1A8QMf9FuYYZGVUs3zrdLDU/3p9uukAKiwuwu0p5xeJUSgb++M5+A
         sZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735313962; x=1735918762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0lMXEa6Tw7TwkHA1VHSoSpcx/RWhq+InGvdon8glzk=;
        b=OG822xsWY2ZtHJ+kv+kEAI4tJwuBBatoyjWUHCUusxmkiyeO624sczGI7QW47rcPqr
         zSOcMA14vjPWbiczjAm1fYFJjrOjFC0MM2Mh39Y88NcaZHvVWozxBMS7loWZ69KvmoSU
         aixpbqPItxfgiSF0bvGoVii8BCK+ycrABJWbhm7oF3O0KHuU7/wBHfoASwhKuab3R6LB
         MImQ00Fxcr6+EDN2wHNaZzfm+3OqaliD6e2CPPhc1ZvvmEDbsk0NQIGdjvtgm3j+W4rM
         r5IjTSZ0ldBUD5vhT4QSdT6We3+Uf/0ATlarJoALEtZj4cR/M2wXHPqVdQhN+ErZslTx
         VKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1BfCLSXu1wfzexb+WwFaOvpPwfC2kEns8LFHEYwtO8H8PprvoA7FWGXqzgVhh5SYrxkkw3DLj8FBfMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOudhQpqg4A873k4UmsBikDAA7Visob8J1eFc9Cja8ezR8b11x
	MUMdXiv42KidhTk8cmlS9hvZag/RTGzZwMHnxVT7RkkKeW1cVZ8xtiLdoUdkin4=
X-Gm-Gg: ASbGncuZRxPR4FPJd5pM0jk81Ypaq6N91Hh7gOLwvbvnss1CVewFUc+6L+BVglJKFZ5
	xUWFWHedXk9SWCmG5gSETc4dqFWY+qX/pmpDADYKfVCy7eXkPt6SFK46UsAV4rmuxJyITwaMtIA
	vZzL6/eLgvr+AoR+by4+u1seuS2A28jvLY+qaY6GdJOyirAXvSGhoA/L5BXJyXP/zQSoQAQXvPh
	5PqfZOB7e0JQGGfGp+ySl4MaAyarngNNstG02QGh4zxzwWPTlBhXHaXUSgN6MFf332/zJagkJm9
	LGS1otxdlA==
X-Google-Smtp-Source: AGHT+IFr3iUy4FGCuYXw8gRc/suwxBNXvcAeKXPjd4u4k4dosH+FSGQNRDV0VYyIoG59cU0IzeV0Ug==
X-Received: by 2002:a17:907:7205:b0:aa6:7785:5485 with SMTP id a640c23a62f3a-aac334e5327mr2884724566b.38.1735313962555;
        Fri, 27 Dec 2024 07:39:22 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89490dsm1117792466b.45.2024.12.27.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 07:39:21 -0800 (PST)
Date: Fri, 27 Dec 2024 16:39:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon7717@gmail.com>
Cc: Nylon Chen <nylon.chen@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, vincent.chen@sifive.com, zong.li@sifive.com
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
Message-ID: <p6rqpx3yrn2ib4ulmby7tbnpbg4bjyt4dt6snrmhuyw6hx6izl@lywssban54et>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com>
 <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
 <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com>
 <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
 <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_073924_886555_FAF09D4A 
X-CRM114-Status: GOOD (  27.25  )
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
Content-Type: multipart/mixed; boundary="===============5977472860633246917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5977472860633246917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ac6tsvvravmk4q2"
Content-Disposition: inline


--5ac6tsvvravmk4q2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
MIME-Version: 1.0

On Tue, Dec 24, 2024 at 04:34:53PM +0800, Nylon Chen wrote:
> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> =E6=96=BC 2024=E5=
=B9=B44=E6=9C=8812=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:05=E5=AF=
=AB=E9=81=93=EF=BC=9A
> >
> > On Tue, Apr 02, 2024 at 10:01:39AM +0800, Nylon Chen wrote:
> > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> =E6=96=BC 2024=
=E5=B9=B43=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:17=E5=
=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > Hello,
> > > >
> > > > On Thu, Feb 22, 2024 at 04:12:31PM +0800, Nylon Chen wrote:
> > > > > Round the result to the nearest whole number. This ensures that
> > > > > real_period is always a reasonable integer that is not lower than=
 the
> > > > > actual value.
> > > > >
> > > > > e.g.
> > > > > $ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brig=
htness
> > > > > $ .apply is not idempotent (ena=3D1 pol=3D0 1739692/4032985) -> (=
ena=3D1 pol=3D0 1739630/4032985)
> > > > >
> > > > > Co-developed-by: Zong Li <zong.li@sifive.com>
> > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > > Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> > > > > ---
> > > > >  drivers/pwm/pwm-sifive.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> > > > > index a586cfe4191b..bebcbebacccd 100644
> > > > > --- a/drivers/pwm/pwm-sifive.c
> > > > > +++ b/drivers/pwm/pwm-sifive.c
> > > > > @@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pw=
m_sifive_ddata *ddata,
> > > > >
> > > > >       /* As scale <=3D 15 the shift operation cannot overflow. */
> > > > >       num =3D (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMP=
WIDTH + scale);
> > > > > -     ddata->real_period =3D div64_ul(num, rate);
> > > > > +     ddata->real_period =3D DIV_ROUND_UP_ULL(num, rate);
> > > > >       dev_dbg(ddata->chip.dev,
> > > > >               "New real_period =3D %u ns\n", ddata->real_period);
> > > > >  }
> > > Hi Uwe
> > > >
> > > > pwm_sifive_apply has a DIV64_U64_ROUND_CLOSEST(). I wonder if that =
needs
> > > > adaption, too?!
> > > According to my experiments, no adjustment is necessary.
> >
> > Did you enable PWM_DEBUG and tested with something like:
> >
> >         seq 5000 100000 | while read p; do echo p > /sys/class/pwm/pwmc=
hipX/pwmY/period; done
> >
> Hi Uwe,
> I apologize for the significant delay in responding to your query,
> I've now completed a thorough verification of the PWM_DEBUG
> functionality.
>=20
> The Period Testing:
> seq 5000 5000 100000 | while read p; do echo $p >
> /sys/class/pwm/pwmchip0/pwm0/period echo "Testing period: $p" done
>=20
> The Duty Cycle Testing:
> for percent in 0 25 50 75 100; do duty=3D$((100000 * percent / 100))
> echo $duty > /sys/class/pwm/pwmchip0/pwm0/duty_cycle done

This is unlikely to find the issues that I have in mind. If doing ~100k
assignments is too much, please keep the +1 step but restrict the
interval.

Best regards
Uwe

--5ac6tsvvravmk4q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmduyiUACgkQj4D7WH0S
/k58Wwf+LsAIYA7z5wl6BOdBApHwQXrQvFR+k8eZuODCKOlEz7+UAULywJzQsgtT
+WdckQF+y0+WvZes7SrycVvJXT68/3vC/rwLiTY8B9LHURsksEQIF6ubh1KlRjN5
3+Tim9NMEKYHTfu1WSz2Vx4Ej7b/VP4/ed3IVvdQdcN89qlQBYRCGw/n4kiBblc6
akItNdWHdhOmM5JRUKit8f6OLGmmN31KSZRY9FHpa10iZ/sQTNUDpTvW+jFMDwaz
acs+UYOX/ekUiBxdZHOhHSlg9ZRt+naWXWJAFjQhAUTgf2lN+bO+1vu9gqO6S2d4
ZWY+uWK/qAqtcXTGP8VVeDQC3h342A==
=Kthl
-----END PGP SIGNATURE-----

--5ac6tsvvravmk4q2--


--===============5977472860633246917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5977472860633246917==--


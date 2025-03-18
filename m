Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CF2C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exq+lTmGbz2u0F0drLoD4ReGRp5pHvvRtQQTSH+9G3E=; b=Jz8UItjeeypFtFMXG4iOqwdMli
	BhFhzd38p6eTvwxwVfw5gbiDgTAX4jkuy5L+jNnoERkV2GDWYcx0SDhX+4F7N6jhME++5BN5tBPr/
	gE6kNKyMUZM0H8TJV0NbTyRI+YOTr2u9O6ZgtZFDesUSCr5LIj+iU2B85H6aKI/3WbAZdA+ztHZlE
	AY5erPME8POA7p7HBnfD+Oju4lPmY1Cg3scm4o+b3SoK0K2k9qyuAzVEwxssZbYP0wlLfYVjYoV/T
	s/h6n6gl7xy4z0yo/HdfJVX+jvFe2yGuPFJM+U7ZCG1sLj4olZSYCE9c8OQUnyr4Gr0sZklKm8Vws
	iCCuQZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTAW-00000005Ixb-49om;
	Tue, 18 Mar 2025 09:23:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTAU-00000005Iwm-0278
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 09:23:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so9665028a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742289804; x=1742894604; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU/vvHDuGhTduZB0clQayUgjj8LXd6feyCcIDz4QkME=;
        b=cXzx4TXwdOPJ5E49FyVsChrnINnRVwjij3kzNHp+kbQPYXZOSpiMdYeXhtou2unnma
         4JtF8JtY02BW25r6V7Ef4qRSy5uWNzbmygKBVM3uOG17X7H1PoPM3xQKkJpccrTVYyNx
         62SYgUxItat+1zEaXViPwcFWm7aT7/a0xUfYzzlXnfgdYMBYg8Dc8BUoUmrj3V4jGEAK
         YRe8+Xi/efTsbiD75NkVvYjmK+f0gLvPDLQfi9+iSPDDYbc8vcb1e+ajmpK6/ZddjkL6
         hYi1EYhzD78GGmuVIAjRG6joZ9pK0pesngtYVzULu+IorbPMImOHjK0gm+vKG8OmTiPt
         VF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289804; x=1742894604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU/vvHDuGhTduZB0clQayUgjj8LXd6feyCcIDz4QkME=;
        b=St527Ph0VE5M38yEYEuPOUUZu7YB5EYcHWRXph6dPpcjwov3MRWJQinK2UAoO/kqS3
         PiRBCgCeEDjcLQe1aNnnTETq6/boBWnKBQe4ggETqJ1qCN+R2squdiSQGbqu4kxRNrrq
         /l8RMLMQeG2+5kDNqVXa51TBPeg78vmS0zoSaHcloJw8tQCADgrfwtVK8bBOEUwiCY3N
         sv8aAjYPx2lifhMNdT/HbnmVtyxMTmPbWq90exU4BOFoMvGLYvTx0kyNUSc9I17OmqJ2
         9NThpYLbrz3+WssLX7EOwZvpjiSvd/8UIDpKqIdSxPEwNenCXSxwI04IQg0XFWtPaJME
         dvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWir+mSm8Q0SldIjURR9aW2ZfhCtrajKhqkE7/N6r3ZB3ZQuf/mueggnjKDm0U/xrm0+616Krkk2C/vew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7MvdrBQ6g4+nx1tFlCqVMo9SMojGDY/jfw8irOy9H+olwCSmq
	rnBWvU9k7i2J5wwQ1xAL7cadLQKmT9fM5JM5wRURJyWx9E/fGDbSbpgJ7fp7+6c=
X-Gm-Gg: ASbGncu2MY6Z5xV1epueQwDwblbtYeJ2PipUCrSW9wkzh2sq0MyJgPV/xQwQ+Vieuov
	TJKzXT0QzFHETk3PfFugpq9n0iD7Tgz74a2aeEYu/1URZ8Iro9l7+9ju3/8svyX1E2JAT5lzIu8
	ZmQ4i37u15l+ulU0FWwNSUbG9k5j5VhYS0cA5IBT80PX3VFv+6M1wHE1GmGhN34/mX/B2a049eR
	d7B9M5SxYBbWUl8HMUOD3nOMTfftSn+tvwOjbj9L1cCoKqAOE6FfIVQeisZiCrHVi07YmLctabO
	ZoK2pm3G4CbC4l9+b8oWL53KK1b+WsY0NVEGOqGlLbfIjdhtB6oKWJf9UioDAQJEKfzODgFGCC+
	sSyGY8ABh/Uk=
X-Google-Smtp-Source: AGHT+IFwtT4t5BJ31fMOagUfAPcPJQ9nOWEjcwUgulSB82NQzjLhdlaZFO+fufBv9ePXiB8ie77s9g==
X-Received: by 2002:a05:6402:354a:b0:5e7:b00f:9fe6 with SMTP id 4fb4d7f45d1cf-5eb1df95a3dmr2487075a12.26.1742289803650;
        Tue, 18 Mar 2025 02:23:23 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b021bsm7635128a12.33.2025.03.18.02.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 02:23:22 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:23:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <ghdqkv33owyqngxlwuwjogqgaasilnakcqq3znv7ae5hsdi763@dpqzqtypgtkq>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
 <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
 <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
 <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm>
 <5robb7ipl346daf3lqaqnsi3fcgj3wzmch5dqit2dczdyeknmv@dqft77bhwryg>
 <CAHh=Yk-p69ppWWspEzzznhDnuk3i6dRGKzUaqZCwg_uAxB3FVA@mail.gmail.com>
 <CAHh=Yk8kC1+D4dPQ7iAtn1WSPSk+OU6vwEyGF9VZAS5o5gPHmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk8kC1+D4dPQ7iAtn1WSPSk+OU6vwEyGF9VZAS5o5gPHmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_022326_252425_DC3FAD45 
X-CRM114-Status: GOOD (  34.70  )
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
Content-Type: multipart/mixed; boundary="===============2442855577526789913=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2442855577526789913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zj2eh5wo3yw56vr"
Content-Disposition: inline


--7zj2eh5wo3yw56vr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello Nylon,

On Tue, Mar 04, 2025 at 05:02:13PM +0800, Nylon Chen wrote:
> Nylon Chen <nylon.chen@sifive.com> =E6=96=BC 2025=E5=B9=B41=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:20=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> =E6=96=BC 2025=E5=
=B9=B41=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:44=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > >
> > > Hello Nylon,
> > >
> > > I took another look in the driver and found another problem:
> > Hi Uwe, Thank you for the information.
> >
> > I'll need some time to verify and understand these details, as well as
> > conduct the relevant tests
> > >
> > > On Tue, Jan 21, 2025 at 07:12:10PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > > On Tue, Jan 21, 2025 at 04:47:46PM +0800, Nylon Chen wrote:
> > > > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> =E6=96=BC 20=
25=E5=B9=B41=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:47=
=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > On Sun, Jan 19, 2025 at 03:03:16PM +0800, Nylon Chen wrote:
> > > > > > > I ran some basic tests by changing the period and duty cycle =
in both
> > > > > > > decreasing and increasing sequences (see the script below).
> > > > > >
> > > > > > What is clk_get_rate(ddata->clk) for you?
> > > > > 130 MHz
> > > >
> > > > OK, so the possible period lengths are
> > > >
> > > >       (1 << (16 + scale)) / (130 MHz)
> > > >
> > > > for scale in [0, .. 15], right? That's
> > > >
> > > >       2^scale * 504123.07692307694 ns
> > > >
> > > > So testing period in the range between 5000 ns and 15000 ns isn't
> > > > sensible? Did I get something wrong? If the above is right, switchi=
ng
> > > > between period=3D1008246 ns and 1008247 ns is likely to trigger a
> > > > warning.
> > >
> > > The possible periods are of the form
> > >
> > >         2^scale * A
> > >
> > > where A is constant and only depends on the input clock rate. scale
> > > ranges over [0, ... 15]. (If I got it right in my last mail, we have =
A =3D
> > > 504123.07692307694 ns.)
> > >
> > > If you request say:
> > >
> > >         .period =3D 3.9 * A
> > >         .duty_cycle =3D 1.9 * A
> > >
> > > the period actually emitted by the PWM will be 2 * A. But to calculate
> > > frac the originally requested period (i.e. 3.9 * A) is used. So frac
> > > becomes 31927 resulting in .duty_cycle being ~0.974 A. A better value
> > > would be frac =3D 62259 which results in .duty_cycle =E2=89=85 1.9 * =
A.
> > > (Depending on A the values for frac might be off by one due to roundi=
ng
> > > differences.)
> > >
> > > So I would expect that PWM_DEBUG is angry with you if you go from
> > >
> > >         .period =3D 2 * A
> > >         .duty_cycle =3D 1.9 * A
> > >
> > > to
> > >
> > >         .period =3D 3.9 * A
> > >         .duty_cycle =3D 1.9 * A
> > >
> > > .
> > >
> > > Best regards
> > > Uwe
>=20
> Hi Uwe, Based on your suggestions, I conducted relevant tests and
> corrected algorithm errors.
>=20
> According to this test program, I can make the system generate related
> error messages on v10's patchset.
>=20
> e.g.
> [ 75.043652] pwm-sifive 10021000.pwm: .apply is supposed to round down
> duty_cycle (requested: 360/504000, applied: 361/504124)
> [ 75.055042] pwm-sifive 10021000.pwm: .apply is supposed to round down
> period (requested: 504000, applied: 504124)
>=20
> PWMCHIP=3D1
> PWMCHANNEL=3D0
> PERIOD=3D504000
> STEP=3D1
> MAX_DUTY=3D504000
>=20
> echo 0 > /sys/class/pwm/pwmchip${PWMCHIP}/export
>=20
> echo $PERIOD > /sys/class/pwm/pwmchip${PWMCHIP}/pwm${PWMCHANNEL}/period
> echo "Set period to $PERIOD ns (scale=3D0 region)"
>=20
> COUNT=3D$((MAX_DUTY / STEP))
> echo "Testing duty-cycle from 0 to $MAX_DUTY in step of $STEP..."
> echo "Total steps (forward): $((COUNT+1))"
>=20
>=20
> CURRENT=3D0
> while [ $CURRENT -le $MAX_DUTY ]; do
>     echo $CURRENT > /sys/class/pwm/pwmchip${PWMCHIP}/pwm${PWMCHANNEL}/dut=
y_cycle
>     CURRENT=3D$((CURRENT + STEP))
> done
>=20
> echo "Now do a backward test from $MAX_DUTY down to 0 in step of $STEP..."
> echo "Total steps (backward): $((COUNT+1))"
>=20
>=20
> CURRENT=3D$MAX_DUTY
> while [ $CURRENT -ge 0 ]; do
>     echo $CURRENT > /sys/class/pwm/pwmchip${PWMCHIP}/pwm${PWMCHANNEL}/dut=
y_cycle
>     CURRENT=3D$((CURRENT - STEP))
> done
>=20
>=20
> echo 0 > /sys/class/pwm/pwmchip${PWMCHIP}/pwm${PWMCHANNEL}/enable
> echo ${PWMCHANNEL} > /sys/class/pwm/pwmchip${PWMCHIP}/unexport
>=20
> echo "Done!"
>=20
> Based on your previous suggestions, I have made the following related
> modifications, and now I'm able to fix the relevant errors.
>=20
> But I want to make sure my understanding aligns with your suggestions,
> so I'd like to discuss with you first before sending the patch.
>=20
> - In .apply, use "round down" for calculations to ensure the value
> doesn't exceed what the user requested. (Never set a duty cycle higher
> than what the user requested.)
> pwm_sifive_apply() {
>     - frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);
>     +frac =3D num / state->period;
> }
> - When converting hardware values back to duty_cycle in .get_state,
> use "round up" to compensate for the errors introduced by .apply.()
> pwm_sifive_get_state() {
>     - state->duty_cycle =3D (u64)duty * ddata->real_period >> PWM_SIFIVE_=
CMPWIDTH;
>     + state->duty_cycle =3D DIV_ROUND_UP_ULL((u64)duty *
> ddata->real_period, (1U << PWM_SIFIVE_CMPWIDTH));
> }

That sounds right.

Best regards
Uwe

--7zj2eh5wo3yw56vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfZO4cACgkQj4D7WH0S
/k5aSgf/S+7QjofA+CHDa6zV1OUJbLv3VBQS1gX1YK4Mps+QnOK2hlrMQQOVDVk3
t28rjpcMJD8m70ZClOt+kfHM3O6DqlWJd2tl/AX/Wq0rETMNq2F3YFRecGs91xku
OF4rZwQVaSl5wr2VZP6j0k/8AilXmIHg6kHfvnMQrIqJwA4W/aVFbnt0sNlo+eGf
nB2Ju3+GNzUw6AiEUEgCHvIiD71aagqD90G772pT+OpGaiZmj8GIX0MxpaRiQ2V0
ZkdcM8lWic/7IbMkYoyHz4g6edbTJ+yhn9/RIAKeRNw+N6aK3VjZkOT/6WgggzZo
QzJe/nGspANnzvsW8QcLUPvEe+eVuQ==
=Mvcc
-----END PGP SIGNATURE-----

--7zj2eh5wo3yw56vr--


--===============2442855577526789913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2442855577526789913==--


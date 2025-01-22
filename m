Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B2C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tozRb+r6qxXVlQfc1LzvDwUi0OVaHCOTcEfTI64Q0N0=; b=qBnprFd/MGuNSNKEWjZk7ibURY
	er77b7rEanUbZiO9qFg+Inhf0bkOXA8nzEqCsGGtQf5QJOoXcsly7TZDYSMTKZOPPXgFHtcfbEnME
	UON6ywKwZ1/t7HDuSb6wvaK/EW2YFzDXd0qmnEAESI0uhUZZ0QUkd9fyPfg94DMqxs19wE2aDWQ3E
	nW+RlMahINgip7as9DcIx5T5AIzvPUHQYmUc6ty6r0FM3kCeRlLydLOTLZMvqugpZrFBm7QzC4RdD
	SvhiNUEPvSymwbLpbmnIA+4FGmLxWvzDVtfsskQLjlqqHAk+0AxzJZsKiyls870cMmltCgGnb6ikh
	wZw2WJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ9l-0000000A4wX-3oTP;
	Wed, 22 Jan 2025 11:44:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ9j-0000000A4vw-0wMT
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 11:44:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso49424055e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737546262; x=1738151062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkX0a57JR5odRnLVM5SFxw3AxDdDdOTq75/JTvBeTHA=;
        b=bcwcfXXZZk5F86IAeYlkzy/n5K/GLwEx56WNKfLS3jRIb/ILSjD3XVR1uqZsJsNTqE
         aoJIAP5k969oCyyBwjRH5dtavR/PtLd7XvWvpZQNnC7tAk23FunJALWB1iiOxla8mG7H
         dmDYZppp5nkbiLg6E7iixL2dOvkZosiH7p+DBWDR4+Tri3SoMBXXL5O8kH+A8QTioR3b
         IJSRMMDYsL8HEI8sZA4Zv+sQ1e4PLUkESXk5OUxLxJtIba5CeigqCjxkimnpv/G/GtKx
         wayU3krj+EeRn1To+0JXFp++pB7zwnAdFTBFgcTe/DvMXbz1MiY6von9aO/0cQMmOf0u
         8bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737546262; x=1738151062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkX0a57JR5odRnLVM5SFxw3AxDdDdOTq75/JTvBeTHA=;
        b=hrMifJSJtRlVuhWkxCDGwfrmpACY7sl+ZHJkF0MXXHUxb7Z7xdh52hoKlKiTUOPi/Q
         +/l6SO7V9kb1WBK2+akhsKHzcCMG88XPSK2isM1lvmQZtMd6Rr6YJfdivSepuAdexCuh
         wQ3Z2RDQlIXivGqB/U4yFvRWld1ZFOvOf+x17e/ZOKK7YhgTdp4FsY3BmurOJo8e7vf6
         21+3NLWer10I0ygggY2pwo8i3vylnTRsU7tygY6t3a5Q02D/IlzPlol7SkT291WW3f9y
         6Zim3ximG1kUeDMnvDVkIR7Pgz8K1p08bmt7vB3UmU4ZvygCFWM1VjJDUgTa1yayWXiA
         jQcw==
X-Forwarded-Encrypted: i=1; AJvYcCVcbmjRRqTT/7v+aajsnbywAtyXWuoK2hJ1eh0mBGemoPL+23AitpOply0FWvo1qhWn7f7oEqJZxlSibg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgeYWixd330IbcLeJIN+G/5Ci6Uq8BDLwRcLxWxpWtqNLS8FJq
	LZUw0+C8qw92hWOilJRA5+L9stM2+e+xhVBiFClDBux0JR6QfBWG2e1g0ihUzJY=
X-Gm-Gg: ASbGncva/tzImZELOOWVcSChLZz1FkpNHFPTxzYcwH1vysSISwJ5xtEUBkgO7EamWxD
	Z7nMPOgBYkv9m+6Pg8j4KJWHvSt6cP7FvIylB3gU0kv7gWYytwVIj3Zja8uMiiT0U+H86pPe3Fa
	P2OQZnbybxUnvw2+CTxCejwtCLDETTO2dRSdhYMTQMDYNyf0DOkdYhsrw1dv1CrEjD7gfycVQ4R
	ib3NVD3Vwn7kCXlnqhCqXjhTc/n+EbYWhPSaht16FSe/r0T1kJjThi3eEgwn6LsTFrrgHp3p3uf
	DvBAk7ArP74VoBiGE2VA/iVgHr0SHgXGXzUr
X-Google-Smtp-Source: AGHT+IFrcGALdmUCWHJnjpC2ZqVo8nSWD+sINVEmoB8Z7ocspefGnZvNbSf34XNo6+RE1LoNqfeAsw==
X-Received: by 2002:a5d:588e:0:b0:385:faec:d94d with SMTP id ffacd0b85a97d-38bf57bd65bmr21959293f8f.51.1737546261671;
        Wed, 22 Jan 2025 03:44:21 -0800 (PST)
Received: from localhost (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f0a:fb04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214c5csm16040267f8f.8.2025.01.22.03.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:44:21 -0800 (PST)
Date: Wed, 22 Jan 2025 12:44:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <5robb7ipl346daf3lqaqnsi3fcgj3wzmch5dqit2dczdyeknmv@dqft77bhwryg>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
 <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
 <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
 <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm>
MIME-Version: 1.0
In-Reply-To: <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_034423_474515_BE0BD91F 
X-CRM114-Status: GOOD (  18.97  )
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
Content-Type: multipart/mixed; boundary="===============5250139776969669604=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5250139776969669604==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tho7z5kisonnoiyk"
Content-Disposition: inline


--tho7z5kisonnoiyk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello Nylon,

I took another look in the driver and found another problem:

On Tue, Jan 21, 2025 at 07:12:10PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jan 21, 2025 at 04:47:46PM +0800, Nylon Chen wrote:
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> =E6=96=BC 2025=E5=
=B9=B41=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:47=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > >
> > > Hello,
> > >
> > > On Sun, Jan 19, 2025 at 03:03:16PM +0800, Nylon Chen wrote:
> > > > I ran some basic tests by changing the period and duty cycle in both
> > > > decreasing and increasing sequences (see the script below).
> > >
> > > What is clk_get_rate(ddata->clk) for you?
> > 130 MHz
>=20
> OK, so the possible period lengths are
>=20
> 	(1 << (16 + scale)) / (130 MHz)
>=20
> for scale in [0, .. 15], right? That's
>=20
> 	2^scale * 504123.07692307694 ns
>=20
> So testing period in the range between 5000 ns and 15000 ns isn't
> sensible? Did I get something wrong? If the above is right, switching
> between period=3D1008246 ns and 1008247 ns is likely to trigger a
> warning.

The possible periods are of the form

	2^scale * A

where A is constant and only depends on the input clock rate. scale
ranges over [0, ... 15]. (If I got it right in my last mail, we have A =3D
504123.07692307694 ns.)

If you request say:

	.period =3D 3.9 * A
	.duty_cycle =3D 1.9 * A

the period actually emitted by the PWM will be 2 * A. But to calculate
frac the originally requested period (i.e. 3.9 * A) is used. So frac
becomes 31927 resulting in .duty_cycle being ~0.974 A. A better value
would be frac =3D 62259 which results in .duty_cycle =E2=89=85 1.9 * A.
(Depending on A the values for frac might be off by one due to rounding
differences.)

So I would expect that PWM_DEBUG is angry with you if you go from

	.period =3D 2 * A
	.duty_cycle =3D 1.9 * A

to

	.period =3D 3.9 * A
	.duty_cycle =3D 1.9 * A

=2E

Best regards
Uwe

--tho7z5kisonnoiyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeQ2g8ACgkQj4D7WH0S
/k5U9gf/fa9SUu4MFWKVFQg0xDyHR0a5TFcnhPwNbhsahSrBoKcHfBTJqdyN6LqB
2pRHR7WPTzw3GOt/J51OUGi8BUSHLZzz+5y424M2FZ9FI6Vy4ELuZcr+lR2lJ7nt
Swjft+IqpbS+e9VhWBdzbUerJLyfVXltndFMGGjDHt/C9AFMwAJkhVVhPgNwLSTe
BPG3exdmnflmPh/jmyNBNHdJv0qCVWjM7XGMWr4ssgzjh/8X3VUjhQBjfVeHnNAe
rwP4csAuVk4n2eOGNgixYKYjd2iuH8CecQPZ2tn/OHY2YC92KsnqZDRJddfdUCs6
9aS0PKu/Mzm9nrkM8uD8a4usTzRonw==
=HH4I
-----END PGP SIGNATURE-----

--tho7z5kisonnoiyk--


--===============5250139776969669604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5250139776969669604==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582D7C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjrDRBJnj3Yl4/+cJiDyA8VWtZlgDw0DXj4pj6/txSs=; b=16AIxeYDQqpxQGtMj80YVnFywR
	BGts74zr9txuOHFt2frby2Q04W4uuNfRxIqNQ1VljL38U5dykfHhLB65mUJ431qXL8gk+GZTITQxA
	bNZ+XOtGaStAUlNJaDbzFv6ULkCtAbRAy4wAPp21+o0SA7+0aGN+3IV8fB7u+teaBdwpvVBrrablV
	ZZwYSO9RAXYjLiA6hKaqQxBg01nYSObSQnyb8rJTO6zEZcPFjyQwFukA4+i4uNd/D/LkiFkZIzQOF
	VcOQKoaFpR8obCulQcw8MA5FpXJ4IMwsHb8kBCVPS7Z51hw++b1GLVoZKN3GTuLUbAhAgidcalcS8
	mtH48aKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta91r-00000007AnX-3k2m;
	Tue, 21 Jan 2025 07:50:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8zC-00000007AND-2P65
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 07:47:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so7869719a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 23:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737445665; x=1738050465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHmkI/T2A61pfMW4kkHpuFAyeZJfqURmpjk9vDwC6vA=;
        b=VbmrvnGsXc8IHyIKlWOvriAnbPOUp3jX2zPEA00D4WrjCsj4Ft3YPiAuIM+JDplRQ1
         jE6w6gp38FWgwH/UYG5yooKyT0bAnXK9/Q35WbCepNd3hATSnA7QRJlBYgqW+5+t+pkS
         9EknLICGp1nig4GsHjiWA9ooCbcvCX4YJMokALdlHAYa234tz1gwnZ8FcpPy45nnozX2
         O/9fAg/6jF3OsFmVB/J4/CU5x9FXp0uaYoObiIAMTa2M/Di+xegeiefn4N/ArRX26Tcj
         PIfw6NgdvEsj+aLH1Mqvf1rAUVpsYbSCBMRTOJjN56HfmRmIQ1WyVxjceqStnGVcVHPr
         i8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737445665; x=1738050465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHmkI/T2A61pfMW4kkHpuFAyeZJfqURmpjk9vDwC6vA=;
        b=l53s7G4+PuyAN4cpwJHqaYef+vUr1fRyUJT/su3l2hsYaueyat+hJZ1Tw9pVkI4RYJ
         GqGW23L7vCx9MQuy5u6jIExdpRuleiKwHdqe/5hL1kMr2zPZe5RV5jt1VlxqGBfUHeb1
         OfYkT2PrQdwgKpzWxelrx2cwyXV+BhsdWCiZVehCjXTmShfQAX2kVJrTGY9l/Lt5CUgD
         I0UE5Ws5tcwXACziJmiqNcGjLrnUmX906a05SQDJs+vSeu/8d1riZZXEugQl0vTWfb8j
         c20Qk+vSxNJR3Nk8KbAknwDCI9hwkMGh21lL5QqPcB4CnUQaOGffSNVlG9PxObSYmyMd
         jGnA==
X-Forwarded-Encrypted: i=1; AJvYcCX6rjhi4aS6kn3/TElzl50yFNXofV2Efh99U7QJJRgQBIK7lh94Sb6gQBo6OAGLv3qhPbBaed2WpC8WQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKL83Rtt709G9Ll4QBA/cDtsHAkbaKaH/6KDYkNYqpzxrVrtkO
	mLW2rtD7YdjEsGIExzEokOjfFc1NPGV8/cDVNy41lWBfYdG+v0u+L5dNXx4AkTg=
X-Gm-Gg: ASbGncuhfIfY5hrZqsVrJDIcKbIZANnSXV9OE7gO00cxOYTJAEZntFJEReursybyGUE
	E9zHmj7wXKMp44ctgkUcI1zhf3NyGpTP7e+tRc8rp8jNPxZZANjWk0GFlwsBEmNELVtYItpnESB
	k8JNgP9qCTzCsypd3ombaQl97rad0vgjaxGrEAXhJ5Hhn99aaCChOERKdwWpIw6cziEsvqb4+yH
	X/RcQa6QhC/J09aqqymr7zNEt4uH797oiaspcj7kypd3jUyPkKBvN+QxAaiBXfvCs0XZ4yEba4=
X-Google-Smtp-Source: AGHT+IEUBI4P116ENXHw5hP8hTyNuBlon7g16FyxICqd0dia9ly16Gi5SE6Z2QYr/PYvdKeGO8w7jQ==
X-Received: by 2002:a05:6402:3487:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5db7d2f5b5cmr33434489a12.12.1737445665056;
        Mon, 20 Jan 2025 23:47:45 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86fa4sm717866666b.143.2025.01.20.23.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 23:47:44 -0800 (PST)
Date: Tue, 21 Jan 2025 08:47:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_234746_615873_F29E0AC1 
X-CRM114-Status: GOOD (  17.22  )
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
Content-Type: multipart/mixed; boundary="===============6962639236208895192=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6962639236208895192==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyaujgonqzvowikd"
Content-Disposition: inline


--dyaujgonqzvowikd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello,

On Sun, Jan 19, 2025 at 03:03:16PM +0800, Nylon Chen wrote:
> I ran some basic tests by changing the period and duty cycle in both
> decreasing and increasing sequences (see the script below).

What is clk_get_rate(ddata->clk) for you?

> # Backward testing for period (decreasing)
> echo "Testing period backward..."
>=20
> seq 15000 -1 5000 | while read p; do
>=20
>    echo $p > /sys/class/pwm/pwmchip1/pwm0/period
>=20
>    echo "Testing period: $p"
>=20
> done
>=20
>=20
> # Forward testing for period (increasing)
> echo "Testing period forward..."
>=20
> seq 5000 1 15000 | while read p; do
>=20
>    echo $p > /sys/class/pwm/pwmchip1/pwm0/period
>=20
>    echo "Testing period: $p"
>=20
> done
>=20
>=20
> # Backward testing for duty cycle (decreasing)
> echo "Testing duty cycle backward..."
>=20
> for duty in $(seq 10000 -1 0); do
>=20
>    echo $duty > /sys/class/pwm/pwmchip1/pwm0/duty_cycle
>=20
>    echo "Testing duty cycle: $duty"
>=20
> done
>=20
>=20
> # Forward testing for duty cycle (increasing)
>=20
> echo "Testing duty cycle forward..."
>=20
> for duty in $(seq 0 1 10000); do
>=20
>    echo $duty > /sys/class/pwm/pwmchip1/pwm0/duty_cycle
>=20
>    echo "Testing duty cycle: $duty"
>=20
> done
>=20
>=20
>=20
> In these particular tests, I didn=E2=80=99t see any functional difference=
 or
> unexpected behavior whether I used DIV64_U64_ROUND_CLOSEST() or
> DIV64_U64_ROUND_UP.
> Of course, there=E2=80=99s a chance my tests haven=E2=80=99t covered ever=
y scenario,
> so there could still be edge cases I missed.

Just to be sure: You have PWM_DEBUG enabled?

> From what I understand, your main concern is to ensure we never end up
> with a duty cycle that=E2=80=99s smaller than what the user requested, wh=
ich a
> round-up approach would help guarantee. If you still recommend making
> that change to achieve the desired behavior, I=E2=80=99m happy to update =
the
> code accordingly(CLOSEST->UP).

No, .apply should round down and so to ensure that

	pwm_get_state(mypwm, &state);
	pwm_apply(mypwm, &state);

doesn't modify the hardware setting, .get_state has to round up.

Best regards
Uwe

--dyaujgonqzvowikd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmePURwACgkQj4D7WH0S
/k4KHwgAksGlvkYerZMMatVBQBOBykMcM1jl46uNHrfephJDzn4WlDzbMVC1a2DO
15zT2WHJv5YKFuS3jSnB3xuq8cHdUze+weVYVvcKgroXGNhkuRwVARYajV847z/o
zWKaTl+rBY2tf5GMlnclyKZpxw/IvAKujAIgadlLC/Ui/l4GmZTNqTWzBORY1Xs6
57bSKt+b2LoOOS1s+I1xVHtwr+wvm8IGc8QG7zOMOBdnhNhV51urb4AYW4rEFjaI
OlaiLo65Q3dWDyzhRFI70Xqj8wZzGWdD9jrRIOLa7KpILC2D2R9j0QPh29nWiOVN
McjvrtGwuuEYx2N15HJvEx891ujqJw==
=DgUB
-----END PGP SIGNATURE-----

--dyaujgonqzvowikd--


--===============6962639236208895192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6962639236208895192==--


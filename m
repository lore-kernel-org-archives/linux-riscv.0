Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB2C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b3SYsiTG7gTVQZxFj37bPYOMfX5x4Os5vMUL4plWKM=; b=2aYs87dg6h1dlRTkeA6wlPCX5d
	d0Dar3wI0K2voWo0bAe9B9tH04m8w41+MSxj1/Yp+rU/n0DUqmT6RYmA0ULa2R9vXQk3d5/wyUUsL
	M+vF1MjYnJ5GRgRkIWqpQ5e2rg++99zfb6ZmGtKEL7zcx/MFwnjocLq5YaAMc/Nwt/ieWMMJicgaI
	oA2NS9YgrbpJK2UJq8vH4PkJIkzhoiSqkcIgoKpu9VPvczXD/d+parOXTlKILpQNpfqnmUfn67Zjw
	inIwGEDXAkkVK800cyJCCjDtEigs4GBescYgJ4s7up25h8w1os61R7wYlMys8WNsyaOY5CtcxuQbe
	99JMECDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH748-00CBKQ-Mm; Thu, 28 Jul 2022 17:12:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH746-00CB8O-D6
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 17:12:51 +0000
Received: by mail-ej1-x62e.google.com with SMTP id os14so4253032ejb.4
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iRXv/o/tEPc/IFMBLppVaug4hhzQG4OpT+eZXaXDDjo=;
        b=fXlNxiGl3upCTYc6STpmxDgPrvrCdEttpME2z7ZynOVXgzeSLQtKIxjtWFzJpxieOw
         ynYk824QHW8A9rp5QnXhc03aEGFbNPqVRriXSnJRaQpNWxji7EUJyFwUKEV+xJdgaumL
         1J/n24HyUS8Rg836OchMpjTxZXFCJv2xbTR3wCCdG9MSMMYBijdGZA7oRi5VE8pf7ESi
         k4C9lrk6oOhBZAd6Fz+y7reV+4F4JvsrGmdAWAM8AUlbqGFqPnLoumcTNYFHXN8j2nUZ
         gVLxA6b5TnRkZ8M/kf/JkLA1FxnuX6ytR4dGdXNBfWdSm+GkrdPDnJZwoDQPfJYQymSg
         iVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iRXv/o/tEPc/IFMBLppVaug4hhzQG4OpT+eZXaXDDjo=;
        b=3xPVf4DlmOzKNZKyyh76sT2u7QhyAvPSYWxpo0pL0RGNGpKCJSyzamxIBTl3JAd5Ce
         myHosvMTKbAzBeF0jRVW/vyCk7z1KrM7Q6nlC87qf2Cmq0P5IvUjgjkiUspXveAnzM/x
         P/pId/ePt8hZFI4/rMPBzHA5yEz2BOq43ew6eJbPKYUV9VgajQEU0alIiYbUViy+iIsy
         PZ6anr6d7wOX057cYEYpL3sItYUaNYA6Uz586WHXBoym+si1X1Soi8A0ruSGFawaEQhN
         VXho8+XpaXANcrrG8eUNAh9cMkL8ElpMjTAiCardBpn55n/6UFMj1QhqpJK+yMMA3sZ8
         SZJg==
X-Gm-Message-State: AJIora8MMUquEXuLhka3lAZdhV01KtMltU/9Ex/ghVaSOYS8Y60zHMJh
	y8RpgyarsWevQhTACk2TIRo=
X-Google-Smtp-Source: AGRyM1uxwYQnEZgrPBa3FzLFacTixssnnEi9sYVPYwtud0EOJPBGxj70Dg95PjeSz33OgkilGAIHFg==
X-Received: by 2002:a17:907:2d12:b0:72b:67fb:89a5 with SMTP id gs18-20020a1709072d1200b0072b67fb89a5mr21629960ejc.507.1659028366598;
        Thu, 28 Jul 2022 10:12:46 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170907778400b0072b85a735afsm621356ejc.113.2022.07.28.10.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 10:12:45 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:12:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wan Jiabing <wanjiabing@vivo.com>, kernel@pengutronix.de,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yash Shah <yash.shah@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>
Subject: Re: [PATCH 1/7] pwm: sifive: Simplify offset calculation for PWMCMP
 registers
Message-ID: <YuLDjCnlvJLSGX8r@orome>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_101250_464154_A61C743D 
X-CRM114-Status: GOOD (  12.91  )
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
Content-Type: multipart/mixed; boundary="===============0322109422414205662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0322109422414205662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jhe09fxtqgsxfC6D"
Content-Disposition: inline


--jhe09fxtqgsxfC6D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 12:31:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Instead of explicitly using PWM_SIFIVE_PWMCMP0 + pwm->hwpwm *
> PWM_SIFIVE_SIZE_PWMCMP for each access to one of the PWMCMP registers,
> introduce a macro that takes the hwpwm id as parameter.
>=20
> For the register definition using a plain 4 instead of the cpp constant
> PWM_SIFIVE_SIZE_PWMCMP is easier to read, so define the offset macro
> without the constant. The latter can then be dropped as there are no
> users left.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pwm/pwm-sifive.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

I've applied the whole series now, thanks.

Thierry

--jhe09fxtqgsxfC6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLiw4sACgkQ3SOs138+
s6GA0xAAj1hoJBcLORZIyy5jWZLSI47UtRYXkGoMFLCiA++GKaTxcS+77LNucWzt
2/WzCuvvNYvPb9kDz6uPZg5G1GSJU3VKdXkog6UFUVjhXOgw2pK6j7CClda6tBqB
VUeE10D2kXAr1WVTnlmBdTgBfQcnrwN3GkZEguQ4wCxIYJBSOqN80HJVRHgG2bNS
lfeF0sVa2ib3AdRoAnViJLwP3nFXBOa/VVdMpjwptL5L3BN4g0UIDhD5DGb2c1BC
IGIpqMUzxmTFPBBCj1eqkyIMyzph0K0B7ZUoxI3/YFgww7fbR4H016r5UUturs0W
JpEVPAaRUotVsbL6H2mGGvOcK6W9XSpDEhaHZnNE610fM8G7fn+7WqqGyND77HR9
KQ50FsuuFhbEXexhKpvN9ZA+UEHiCXv3COEVShKhsf3SSIGvErzkExP1i0ADjoxj
6jSy81KVO28axaMK6kWwILEKSISVn781M6TUMNCRTl36Yi0cwEDih5SZn3q1yUGD
r9WnLrVgABpLVSKyfrll2KuxWWvcIXOZ/1di2BiLFhsVNoUu7y6EZd8OLQW9SKze
DGdEMVo5QIPikrOEKXQxD31SipdCoXO6inTPGNk4/tmlCL0SEHIaUhzPoaf95fRs
HbJmtrT9Kpidbkv/bxSY5rTmJ67eIR99vEnvMlPKn77UvIW0BcE=
=sERE
-----END PGP SIGNATURE-----

--jhe09fxtqgsxfC6D--


--===============0322109422414205662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0322109422414205662==--


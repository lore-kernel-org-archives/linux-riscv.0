Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EDEC04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8sHNKyCyxC8KazimTR3vTcTULeO01GtoaiqpGglrN8=; b=IdYN70EZ31VzMlOsSFILItBOeu
	2Cf8kFkmDOduxG/U4EK/dRyChHGIXynxMjT3Vp0ZgTKg89R9CZhUIyYlIZEyH84zOMRqZJghwHND5
	Hqz9VsqIVCS8YQpCqoq8H4FsVBQNThYZctvcr7bXauP7FGy2FVqxBltIv3Pj5xkrwy8XPdXvDF7ne
	w6MbRTWCqWRnsUjsYASsqV62uKr/zs2+oWqzRoDYsWMFTPK8scBXzmS0nnyJxh478wBZ5q5HWm2GJ
	hJk0KyAH0Bggg7ucpSoHvFrti57Hu/IHqDEHd66L0tSPsMLd1U7OFQWkRS2Z9qx20NWe68egnBjns
	q+liQHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH71j-00Bx0G-SF; Thu, 28 Jul 2022 17:10:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH71g-00BwIk-Qd
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 17:10:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id os14so4241247ejb.4
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DPaVj85L+sFty8ivscMdof++1UUYZn+/8d+eAz7Grl0=;
        b=VqyqIdmAKxgyhkqVDUCGvpI7gkWce9ODf+kcWQB4tas1LZa7+C866nLGbT9pPI06qZ
         tPCXfANhNrFhEB7x6tBfZJc/R8k4sE7aVtNCA5+6rHL87pknnzqvpS4UTbWbFdazB8il
         JHqUNn3UdhQ2F6rctuUyNVfmp0a/AJrRSBTk0ct9h6Oeb2kilS3v+z/KhRAVchOWxFo3
         TubYpqA3z5MGchpDMTBWiOP8vzC870GCdlUYJy++mRle/JGf7HrQ07cZwwGtutVsksFG
         hhwaIdFdc7J7HBI9Z2+1kYftfr/1Nl4+aFaXamYORWllvQ3dmYaAEcJioNwlSI0jLHMx
         ZgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DPaVj85L+sFty8ivscMdof++1UUYZn+/8d+eAz7Grl0=;
        b=bFyWlmNXxdrO0oetIvctL6FAuyM9ehbVrDTgqrG+9HnYOPOOo7Ur78wRxSusJFoBvE
         dwgTpgrnJgNrQLZiSaHnas5i/jKNQ2jCdexnrjFGOLxthZCn59ib4g69lK/o4vbqtOws
         SleIkYsk+kJxug2UmFVsP6trSYeGxxohszDFxCV/P/4Nx/xW7Fdaj3X9ustUFf8+nSqn
         fImSh6nDE34Nia9YqnTMiHwXwnLgvhZaTHNv4DOi/atM6K0th3VqiEAli+3h6JjHiaOD
         ox0Xvt/BYy7dw2EITtf/flyai0j3Y/o8/JqKn6ltSLlDi086sVuOwQSkm7iFxvvvJsJV
         T2ow==
X-Gm-Message-State: AJIora+OlHKA/3QvbpVdGGpwkDnrPA7Z/VPSqkJQ75NKW/tPHPLnbqFQ
	xaWoZwgfFvdIBGbsMFEI+nM=
X-Google-Smtp-Source: AGRyM1tWCQzKBev5EHcvexeC1ISwWJ62VxldbLWNtSJxUvXMXoVr/1Y9j9PFsnlbZV9n2knPP1szPw==
X-Received: by 2002:a17:906:84e8:b0:72e:2f3c:6784 with SMTP id zp8-20020a17090684e800b0072e2f3c6784mr21954954ejb.390.1659028211397;
        Thu, 28 Jul 2022 10:10:11 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e15-20020a50fb8f000000b0043a6df72c11sm949787edq.63.2022.07.28.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 10:10:10 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:10:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, Wan Jiabing <wanjiabing@vivo.com>,
	"Wesley W. Terpstra" <wesley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 6/7] pwm: sifive: Ensure the clk is enabled exactly one
 per running PWM
Message-ID: <YuLC8IFNLQKY+IrO@orome>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
 <20220721103129.304697-6-u.kleine-koenig@pengutronix.de>
 <20220721204522.rxmah6k66e5qe2kb@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220721204522.rxmah6k66e5qe2kb@pengutronix.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_101020_902935_65478A5D 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: multipart/mixed; boundary="===============9056059841769259268=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9056059841769259268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cYboAQbv0PYEbGws"
Content-Disposition: inline


--cYboAQbv0PYEbGws
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 10:45:22PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> [dropped Yash Shah from Cc, their email address bounces]
>=20
> While browsing the list of open patches in patchwork, I noticed a typo:
>=20
> $Subject ~=3D s/one/once/
>=20
> @Thierry: Assuming you are otherwise happy with this patch, should I
> resend for this typo, or do you fixup while applying it?

I've fixed this up while applying, thanks.

Thierry

--cYboAQbv0PYEbGws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLiwu0ACgkQ3SOs138+
s6G7og/9FF9+VMbdRZoBPBnZnC2p5DKIYkq9L1h94GS08zisJw27ewLKy47H7ZRf
m/KUuT5v92QdfQG4DZ5/96F5wA+zcojVfF/Kj5OKFRP8NsoxB5pbJn4G6qjTcQ6J
MXdA8qX2GEE/wP7MoiL7nmGdfuJSmw9ov+z54uAr6uYMprGEdL8bby0cu1eEswhf
P2aMDopKwsoc0Iuegzqc8Mg4P6ESWi42ITBuQahtrw4sKAiwWSL/9OJoB9fQpfDv
nZpPdDceNy/jNq7lGNvUC0yO/fgLaWhWWBeX2t9cKROyaq3r5Oyw3dwCKdkShVUy
i+6btJLu7vXfQ34HdYDw8xbp+cM+Zlq4F9b791HdQ7ArXdBhy8WIw7N77qsWnbWn
kIU1dMKL4SJ/RopTBcof5NnTEQiPcmZIVirN5j/45c7lNJZ9VBvWkz00IlNM8sLc
iRIIMABacmjlBDIc7zThyQP96Zh/s6IV5Re0auZwdEy7ShylZumT+hmJcfNpAzsE
W7WeaRyZ2BzDak2Mi96V2Da9Q3nOpKEV1FiFUaCDSEL1RD7ld6zjmzJNDL6oJWlP
Od9Z+sQfDcnGqlLGBEFuAdwpUg3c0eCEASwc4iw/5Urac9qg1jP97LuOYiX1aIhd
P5VfNBgJXU90rcK5wCkVs9K3Eshpc5bibBQ81TJ8BeRPqxRJXGs=
=74I6
-----END PGP SIGNATURE-----

--cYboAQbv0PYEbGws--


--===============9056059841769259268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9056059841769259268==--


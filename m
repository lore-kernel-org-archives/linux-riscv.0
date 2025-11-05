Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20DBCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLbGJKRzQegqKH3bxVRcVTXX6Ma1C3gstbpyji95XGs=; b=cZvHppd3333zt6donb/I2RfE6e
	8+wgwBCqPxwt6e+8o+ZFLxWoBjgea9ionYqLeINLMsCuamhXqrMfLpk+ujZ47TgfwY0pnp6E9UuJn
	MApFGFLL7j/ExqcKykPpHzO7s9/8MOhonFWjzbAPfoMgHaGhxEjPwONVX/TDRJtKJP5Qt305Kl2hs
	4Jdt6zc6FAS7ZIpic/kbVK8do4I0p3Ps7bgCY6APvBrds6ekjnGAWaWLEb7mt/n5ZVh+QAxgXDCMt
	+VwHE0vSUq8K9pVfgmDvuZaVgcNda62LErT0maxplNTmV3AzwSZ+5uCRIGBP26IZxiSZnA0w5l8pW
	h0UUlYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgjx-0000000E6V7-2TWu;
	Wed, 05 Nov 2025 16:52:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgju-0000000E6Td-1PVE
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 16:52:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso1665e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361524; x=1762966324; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=GieOOprjK5I6Sta4p8T2L45iyTVa25DWchJGuXKNJwMq1riXK3doOn/nO3el70HJ3J
         Kn5MnT5joFFfvyxiQ2abFvlK1nXJoseLjOnKVYs1ojyidRKVp4/CIYK/X8Ha+k7/DNfH
         eyf3IPTxCjoaeOw5NHPHmoTlWRj/JfaSyLhHyXMnUJaKBAdfefNx/zRqBLDjjKjJEz5t
         qgFJ4KgG1NZ0XjzOhVQRnjoAZQgsEa2XBpU48oqzth2jU7mp2tDXbtvrUR7kIf6WwpJV
         6tWnzRuEGQMz7agF4yWxE+I1+qHbrUVHQ1VTO1eSZ6rQf+21R3MoD59x/B7fnniUAFc/
         vhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361524; x=1762966324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esO8jRq9uTUw55PJsW3htw0zar+bIhexF73TArzHxxk=;
        b=v7M3IDODNER+RWdPllsHq8TDp3VTE/ZaHgsttNTRrxPkgtNTz0cLw130u5ESqM9Rb0
         MHNmW6h0sJVV4qXPXaqmBqCuFXVKn6wujbv/dd3UW/zQRmSaPrvvPvwwD4tG7ybggZ34
         6+mxrPAPb0Kbl3QJHAPqdeRuqZ/Wx4dZjBTYm20k2KphGd6l2ZmkausKCem1tdnYyRMv
         9dGloLn15KC3L7UYJaHDp40N6rOt31xopkmUiB+pKC4HgmCf9NrirFL6zlSJzm+K/aqX
         i73gKj9lVDPE2XlD9Z/0kLbuIUKykcq28YMsvkvzH4lz3rgphC2gjQIN+J2W9ST8/yj3
         a9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXDbfYCPsFzOahN4KytJfwZ6RgluJr3sFke8RDtqfqVyc75Lou55Jylum6qT0Snhe0a0fh/lXneni4fFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXqs201ZzPhfKrDAAQHELd0GGQ4T81vdGIsOIwSwfBJYw7dWYJ
	WODdLj8KREEvDCDsLKlA/wy2cXj8qOLeYrlP6cSOOwjN0pYBx2uFPLV5
X-Gm-Gg: ASbGncsiAHhNkLrKVlK+VvgSvTJIT7PSJQNtjwJSOSJ9ZmxRYD8udanN+e/ydmrwTb+
	cgNaGn+o4qurzHhmVVF1Wrld55E/Yd1l137mFKMZA2MRgak+36AKS5eVwpLSYGulo1X7fTR6MJZ
	CIRgf5dS3GxfjeTpoIt0Q4GNzdGpJJztO6Uic7VjDnmf95M3FoyGbX69yBHtVZH0BwsL3N3fpcX
	OEMh2imebseIMdJC0M6mJaDwxc5XP5B4S8stTRMFMspmATJkjL9D2HzJg08+/jpbPJJSj13afrc
	PAU4K/hkbxF2ghroEbydBc+gFXvAqO8uB38f2R/TJL0tok7AmD3X1xNTWICxZkXObh7KPj/WW5f
	2rRaTW0qAN6Ps9MNE+xzqhsG3YAV2seNnE0VNB+UGcmejB7M0xyzphEf+86bZz2o4B6er1iv/UX
	PPiP+6Ju+EL5bfFakNiOFX8v1D1MxfuVvrtgLjmzqkimZW31AGGHeLb4TncubRM8Q=
X-Google-Smtp-Source: AGHT+IF1eT04urNHEfsD9kdCj32CNL1YcHJ6oGuMVK3cU2BLT/aQRFRmm7ox5OYZe77ML31HK9v5ow==
X-Received: by 2002:a05:600c:1c94:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4775ce23efemr42468465e9.17.1762361524090;
        Wed, 05 Nov 2025 08:52:04 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm59725725e9.12.2025.11.05.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:52:02 -0800 (PST)
Date: Wed, 5 Nov 2025 17:52:01 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_085206_398648_C77404E8 
X-CRM114-Status: GOOD (  19.93  )
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
Content-Type: multipart/mixed; boundary="===============1407086859761618244=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1407086859761618244==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykyajizgfjgayrmb"
Content-Disposition: inline


--ykyajizgfjgayrmb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Several drivers can benefit from registering per-instance data along
> > with the syscore operations. To achieve this, move the modifiable fields
> > out of the syscore_ops structure and into a separate struct syscore that
> > can be registered with the framework. Add a void * driver data field for
> > drivers to store contextual data that will be passed to the syscore ops.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> This change is fine with me, so I can apply it unless somebody has any
> specific heartburn related to it (Greg?), but in case you want to
> route it differently
>=20
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

I have a few follow-up patches for the Tegra PMC driver that depend on
this. 6.19 is what I was targetting, so if we could put this into a
stable branch that'd be the best solution. I can set that up via the
Tegra tree if you and Greg are okay with it.

If that's all too complicated, I can probably wait until the next cycle
to merge the PMC changes.

Thierry

--ykyajizgfjgayrmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLgLAACgkQ3SOs138+
s6F0Lg//dTn1/PUCYHRhF8cm1xB6JKggiLC40TRct49fcf9eF5gAdCqXm44qKoaF
67aqiXAiwzovTctJIu3rz8p71/FeXp/qGWDdPm/+wI7yD+BoCcVO0nmvXuPwCzhd
ZMwqeaRVm57JX4M9S5BdkOGtDLgAjyZ/6Qq/2isiQSPiWWl/IT3YiLyzw8vq8mcY
VoepQGK5hm7CHFf8FOBs+sMt6q5JJDm0VjNi+seVcCNg9U25GaXCRc2D9ztAqRib
3768/KMhlftnoJKsizCwWq2Gyw0Se7ifz66djjf51sHd064LLDv7OZpfeGyiFK01
MvVGXoPFuIJB0yqIoMRBbeRULm4kq+dkUkt1JWwYAMw9ZJnhXPJJI8bal2IASj8/
E6NADiYd9HS8kAXWYvLkm0xHv4FN5WXWG2a+Gf6K2vpBm07zG2xnI+eVjYQSnb9W
O9TcZf3jDWvgEQ31plH5JFY32sI4vjLAdcKS2oRfkbxFDJvTS+RRjj3EPqFshNXf
B5E6pXTCltOkUepuhbGDzIifVWzYgg/GyXNfwzdnJUXcAz7QPPJySfMraf/dn+8S
hggVgAivRFDEtaNEqKU6iqoePR3HIUJe/Ebjrb199RV9t4FcnVYOpviJRf5EWpsF
2YEUJPiA7neiac9fPLwCoRh33bJTIzanmWVxmFF1nQ2vozIt68U=
=3Mmd
-----END PGP SIGNATURE-----

--ykyajizgfjgayrmb--


--===============1407086859761618244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1407086859761618244==--


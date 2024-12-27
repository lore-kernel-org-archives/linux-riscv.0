Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E79E7718F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV+llpVvJrih/MJ1No2vc7C3ZBPXZkaQDKygiRUfbC8=; b=OisZBDLOwBjTHatrOGE18B4D0F
	50qizIOOmR41dEtYoeqQh/gQ73dxOgnsj0i4NHXw6rcaY+CdFUMew/eXFtLOMTt32YET0iaEfZ+7j
	P5tZEYIhS1wFt2gGkmS+I7gmzwZ7VtBMWaL1Yj/H/R0ODLp8cLpA5KSaEB6icISYL6gvDQMSrL0gm
	ou4tB/9K0JZLhQuFM+OdGLqjhBNo5Fr5Iw/CdZ94RM/l4GepYzB2jPp+aDnwIEA93sMJkQAoQmld4
	JshjkmH+EHJPjcItUOxVTYbKQY3lfm6I0ExqGdyST8QZoWQuHheoYciMCz9xAYY/NnCsXdVU1MOiB
	A2v7FKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5aj-0000000HM8w-3Ijy;
	Fri, 27 Dec 2024 08:21:05 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5a5-0000000HM2c-3vHb
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 08:20:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso13582520a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735287624; x=1735892424; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ymnkaFSKoa88cBBO+Aw6l4UGz2gfKbnPeK/qmnKF3M=;
        b=WuSwa2lWJtw2oNXmLJDUR1XlWaQO1EjVlKZIs7ggjZr3z9qeDMYNvdPZpO0dEAE/ax
         ZnvP5oGDxFh3VpshnpaL2OpS9Sb2UWTNo/K7fpH+xjUcl726CG1S9uixPDMS8310CWXR
         J0mAF+o+cAV96cFkl87+xdjMwrkAE/dXLPwP/yIxAsx3+j3d2eX9351/XmAYRx20GJ9y
         9dtcmRhRxzt67OmDpfEfS1cPYw2PRpvzuZU6C9jxoGOeuYUonUO69cwY8rQuQpNqO8ee
         MH1mls7vKQBNFMD8nUsc1LJ2Qwf0PvUfYpVzsqvqUB12K53a4LVqWzPZ0XQ4tf3BMCot
         SlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735287624; x=1735892424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ymnkaFSKoa88cBBO+Aw6l4UGz2gfKbnPeK/qmnKF3M=;
        b=KzyeHlMS/tWsicHA0v0Iy9UQsqX+QLYLKPTnd9dqEGEIO0Mw1DGDt5FqO4KZPdJMy1
         7/AZR+5X+2inHkLD5FOw+Ll/VGUALVwp4lr8j/jlsYHiw+1lfZq0NNLK4SQM1yXJrfhT
         +zSa1Sn5iDRdkpRvmNfUADslbsx29T+sTTGOfhuFH7UqiSikCiWN9rKbsnVSl9sUhlXm
         dzO3dNfpbb+4czv4CnqoHFGhXHLR3L5RQUPkmqg9FkQRi5mEqso57iEf2RehegFO6ENY
         2UjmG2kc4/6F8FJmhGArtZRlx+E0FOjg9BIrIZ0z0chzHCY4o2agBPTDnucsudXoiVgc
         7ziQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrtToHTvQF8fzzoyst7xZWy+a+JNPLNwMSvOEYR5AkU2J9252fqVH0YNrzUu4n99RvfsCCaKhWHIJCAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkWFp1a6u0Ws5pbCwJNIXqTmLEJuGwSLaoiXIWUUCHCx+PBimd
	UQ342767RD21+X3bRMn5oSYkxrKSZ2zrM/6ClQzKH29FHLR+5MZYR7CQ1ZKu1AQ=
X-Gm-Gg: ASbGncsyOqm1d3CeAEb0MZPLGDMPbYhTM+L1wFYIdDZ+/MqCG9R4/Zsq0vQje7x82bD
	n18r1CPUDoJ5lbjAUVFLZCmh4m28dHZDGCdrl+xb8TBF/Hu/wVjyDU75PSLBcv0wteXZtrw3ecT
	TTQ+yJdgS6gMeXsa5n2UWZ4L2YPtdsRERHRk42DEapt6H82f9zuPQncHhztXmlX+bMBqBbriks9
	HqFpJ3iu6Hw/RYDmEUgNjewzgcRr8cCV1hK42jlMBU4waXDctwoOPojfMCFUIWMVTtrI0fNbizX
	FuC74J1wBA==
X-Google-Smtp-Source: AGHT+IHuzMycdQyfPrvUmgREwzA9rbFsJHptvmQJmTsllJlTLnfiJ98OYmXuSGvqenqvilnQMWt6pA==
X-Received: by 2002:a17:907:1c0b:b0:aa6:7933:8b31 with SMTP id a640c23a62f3a-aac3352cef9mr2027761766b.46.1735287623480;
        Fri, 27 Dec 2024 00:20:23 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895366sm1072502266b.73.2024.12.27.00.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 00:20:22 -0800 (PST)
Date: Fri, 27 Dec 2024 09:20:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20241224093902.1632627-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_002026_188166_1DEFDFF8 
X-CRM114-Status: GOOD (  17.91  )
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
Content-Type: multipart/mixed; boundary="===============7164203374695270097=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7164203374695270097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxfkviocdptb27ky"
Content-Disposition: inline


--jxfkviocdptb27ky
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello Nylon,

On Tue, Dec 24, 2024 at 05:38:58PM +0800, Nylon Chen wrote:
> According to the circuit diagram of User LEDs - RGB described in the
> manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf=
[1].
>=20
> The behavior of PWM is acitve-high.
>=20
> According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual=
[2].
>=20
> The pwm algorithm is (PW) pulse active time  =3D (D) duty * (T) period.
> The `frac` variable is pulse "inactive" time so we need to invert it.

I'm trying to understand that. You're saying that the PWMCMP register
holds the inactive time. Looking at the logic diagram (Figure 29) of
"SiFive FU740-C000 Manual v1p6" that is because pwms is feed into the
comparator after going through that XNOR where the lower input is always
0 (as pwmcmpXcenter is always 0) and so effectively counts backwards,
right?
In that case the sentence "The output of each comparator is high
whenever the value of pwms is greater than or equal to the corresponding
pwmcmpX." from the description of the Compare Registers is wrong.

With that assumption there are a few issues with the second patch:

 - The Limitations paragraph still says "The hardware cannot generate a
   100% duty cycle."
 - If pwm_sifive_apply() is called with state->duty_cycle =3D 0 the PWMCMP
   register becomes (1U << PWM_SIFIVE_CMPWIDTH) - 1 which results in a
   wave form that is active for 1 clock tick each period. That's bogus.
   If duty_cycle =3D 0 is requested, either make sure the output is
   inactive the whole time, or return an error.
 - With the above error in the official documentation, I'd like to have
   a code comment that explains the mismatch such that a future reader
   of the code has a chance to understand the situation without in
   detail review of the manual and the driver.

Orthogonal to your patches, I wonder about

	frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);

=2E Round-closest is usually wrong in an .apply() callback. I didn't do
the detailed math, but I think you need to round up here.

Best regards
Uwe

--jxfkviocdptb27ky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmduY0IACgkQj4D7WH0S
/k4hLwf8DsoYI030gIP8IMTk9dgJdMG1D9J4fZJzTF3l7KOC2eyw0OZhH24H0ErS
Nzmepa8T48/V4wFWqVZ00Zv5JI21c+i+8v0Z+ihxTZDgtgsnEvseEYGDeRVkghaM
Fl3JjlknakL717HMTHLWkJFgS6Hm6VGlKJkinsyb1StbG9hEIP5cvcm8g/bKkfkV
cZsxboyTFSOAXpCQokSpuurM8kl9uyXfXLXhIKPj5j972SMqS7G5BB61MSktm1Cw
1gAH7Ym+E2f7DfqH+ebInOB7ErKsLJCM3UYSWV4OF5AtA9nit4Guc1FTZoEnzsv5
+paB1cp9aflfh05vZYS9tAXVt4tIYg==
=hGQh
-----END PGP SIGNATURE-----

--jxfkviocdptb27ky--


--===============7164203374695270097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7164203374695270097==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C32D2C55B
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqvPaAbWz1li1PB4YZ09jr4g328A+2K6ttV591a8aRc=; b=2BAdcwW3oiLtH79+DKLwmvAhF4
	EX4/t/wLFBJkQ1SGIjvGZvG3pPXXWsU7chvg7fYXKLsVFtelxNiuYCNChKtEHLcSwyWp3bhYKX1yi
	CSHZKRRNl6qYAJ14M3k18C8eP7PuWLI33rgFKT4osAhHHGCE/kNPuwvuBRiWNq+kGkCwtL/ooHCA8
	k2XVCH7bOgw82SjmkbL/sv3nD1XdlqIM/SaLkvF2/TZoGoriM3EP3vMXAiKGKhUiPcAnPa77Nbuzi
	tNSj1MkQbNrOSS/lFRa+zPc7ZdBg3n9TLrXx7JoO2l9wI2BgmGAiV1fZsXqXRnAB6uWFlg32oJeyF
	bWJv3HOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FYz-0000000B3Mp-3tGp;
	Tue, 22 Oct 2024 14:08:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3FYw-0000000B3Lg-2tiA
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 14:08:44 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso691342366b.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729606120; x=1730210920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjVA4wPBkfKQ6ZoNiKzIHXbVCvS7+Rbsc51rfzCNOx0=;
        b=cztHhwe4+iioB2c/yw5mAUDZHFkpu/lBDKhldbUM7dF3Bs2A+2fRU6i1H3Xz5Mvn59
         szkLpo8wTixgQYt9tyesrCLbQ4tgZsRLaz9HCkA9D+AqZCfV9vG7pVF2iPAedyVoDy5A
         hrVCfY+KljnIPIu//gc84kqCP0a8+uBx3fTEz8pz4LKSJho9idbI3c0TyhdyYY8ejhFY
         CC5Mx6mfAX739wMBYIv+xVnK7CL1VEWi60KzrHz/z//bwD3UMLY7tjEPg9kba+PI/7vf
         3waoRmgbocEfTUYyQvZVV4RunI0p3k/wGJGOJCzq3r8B08IYxrXPHZF892tRtWrxOTti
         a6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729606120; x=1730210920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjVA4wPBkfKQ6ZoNiKzIHXbVCvS7+Rbsc51rfzCNOx0=;
        b=NwO8qTB/L+ilpB2gfV6PkJw7F2KbI0NbBVAlwR4rFE5c93ejdMNLXN4mi/SrVuYQ3I
         yonL73qDOQgQInt8NXs416ICTx5Xjt21UiH4uqDUR9Ae1XW7bZXanReZfdoMzgBgNNy/
         vfo7ATdt7j6ob9r2jBjMygn9vvLcNwSciYOyMp7jJuSqTla8l9SUnkB8pQy7sHkdFeoj
         y9WE1ChLjL7xVx/MLvSikSEY9Cz2jKo1WVXJoHNRQgZhndnSmGn20C9FAy0sTYDw6vyl
         QD8IwnS1Xor3YEbNaNahyCNi5EzUecbTM87/5LAGtMV4/IN5A5+O+yE48DQUR6I1gNP4
         WIfg==
X-Forwarded-Encrypted: i=1; AJvYcCUSws2LaM5uoT7QuuvJaJBiwm2hEKEH35LhmMhCc/ZjsgJ7X9XrAIgpufqk0PBsgu4Foz9CDlU6t2nRPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiFedM2Qno+UXHps72EY6vjjXPnLeh+fBIUT8OQlY6Dw8lpp9z
	nkYkpiUu5mDh8GO416ziyA10HCj0XTG0zuRbFaOaW/zi/CwjBPbklrDKvnv8Zbk=
X-Google-Smtp-Source: AGHT+IHy1obOPdSFTH4jEevE5QmadRhAziwbxrTbJrKYjpgU+/yYf+kYZD5Q0NrExPaDKLAdoxSN8g==
X-Received: by 2002:a17:907:6ea8:b0:a99:c9a4:a4d5 with SMTP id a640c23a62f3a-a9a69ba3a3bmr1316016866b.29.1729606120245;
        Tue, 22 Oct 2024 07:08:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d633esm340973466b.43.2024.10.22.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:08:39 -0700 (PDT)
Date: Tue, 22 Oct 2024 16:08:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property
 for snps,dw-apb-gpio-port devices
Message-ID: <gtwdkkeckdtcfkovfljfoaplrhdjabqwagcvvub7zdnwp3dyqj@lztfrve6zhmh>
References: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
 <d5vjohhftbx5zlsay6hfij7p5qbcrrebnj2sspsdtkgrkz4scq@aifcdtxcqqqd>
MIME-Version: 1.0
In-Reply-To: <d5vjohhftbx5zlsay6hfij7p5qbcrrebnj2sspsdtkgrkz4scq@aifcdtxcqqqd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_070842_807438_D38EC542 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: multipart/mixed; boundary="===============8269076279814708928=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8269076279814708928==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5jtz4itd7bqp4n5"
Content-Disposition: inline


--x5jtz4itd7bqp4n5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property
 for snps,dw-apb-gpio-port devices
MIME-Version: 1.0

On Tue, Oct 22, 2024 at 06:04:17PM +0800, Inochi Amaoto wrote:
> On Tue, Oct 22, 2024 at 11:14:30AM +0200, Uwe Kleine-K=F6nig wrote:
> > snps,dw-apb-gpio-port is deprecated since commit ef42a8da3cf3
> > ("dt-bindings: gpio: dwapb: Add ngpios property support"). The
> > respective driver supports this since commit 7569486d79ae ("gpio: dwapb:
> > Add ngpios DT-property support") which is included in Linux v5.10-rc1.
>=20
> Please add Fixes tag.

Ah, I expected that the usage of snps,nr-gpios in the dts files predates
the deprecation. So we could add:

Fixes: a508d794f86e ("riscv: sophgo: dts: add gpio controllers for SG2042 S=
oC")

=2E That's a commit that just entered mainline in v6.12-rc1. But I'm not
entirely sure backporting to stable is sensible.

Best regards
Uwe

--x5jtz4itd7bqp4n5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcXsdkACgkQj4D7WH0S
/k7QPgf+JxwQoGZ/K4UUbdU+7wqGmzOQqJdDhhxUXWrsDBv3wjlgykocbHF1MBUU
Y9kF9HmpHU+KyNR4cEiVQlNeTjvd7NSLVaxhYGXxGC9de4O9jjyV/+Av7A1SRmzd
6laTt1pKt4YgTQfHKnxSNs6zY4JbZ9oXNaGE0xg9R3nCemaC1qKPtTTF6vQW9BGi
kHFCSCEyUqasnvIjFcF0+v5iuIyEGdbKfOn/LyZ5nJc1YGLzktcbW7/onZvPxabL
uXxEisOFZiy5Jq1JWoNIBDTheS6k2m0FLBbtCs3rPk9ucU8QpzTJfby6S/lIEWyS
fNuFcTmWcA2GAbfrw07KD9OttRL5Hg==
=8VtR
-----END PGP SIGNATURE-----

--x5jtz4itd7bqp4n5--


--===============8269076279814708928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8269076279814708928==--


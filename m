Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D64C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RONv+k5S/DtA8aPq98D8TezuG4TFNh/+WqPoMmABk3c=; b=ZghIm443nsVsTZlSpa7Lgy9vG5
	2JD5P+c41effeuFB/L3eokZZJLrpiSe8bV7PNqF5cGho3H3qDjXuBywRNOziCe/RDOlpJkTdMuveB
	MXV0vgqp6bzNhXrVTbuc8vJA9WzUXyehVANhLU5BGMu9TkRGIlXhBD4IgicTdgSnH7K8AZsYwc7iO
	IHEaM2mNzZ9SsLZNV66Wnp6UdklGDEQ3SMstr/vj5kGxPi+32chfeG14+byXellySLSeAzg3rNHvb
	yy5Fa7y+DaXvfHFe6ohfFGeBstPuv+ylsiNlxh/TANryfJ1oH8DXuR2qEzD8V8Cdp0qrMSSkAS64R
	JMKMlVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Gf-00000004Q6J-40pZ;
	Fri, 10 Jul 2026 08:07:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Gd-00000004Q5a-0suj
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 08:07:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so385618f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670845; x=1784275645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=pxrBHY9HQbfWo1OZtxQmpvKAiex7un5pTd6aYS2VW0G87iEgImhrAoZl1S8x1pGzjU
         r6Lye7bTomYOcpvq4i1vZABaizbdnbAtFrhxuf7KgX2kOn1yKNCyqtEe9ArGlpcgVXEm
         wP4Qk/VhmTAw3+3vRyQ6u1EYUcN70GU+JRN+yn6kYzcF+HNhAo3Vu59b07X0wu+B2XMU
         JjCZ9oP0Ksj3FNfaWPksAPG6EW36x8n1C9fGJju9JkX6vgQTCR1HvXC24Ba3Av6ZP1n+
         8teJEyk2aQLWWt6rpwnU2kqNbDdCrwaVAsAgUSXNPq4vOk6FMjYalTKLTrgpQdMtJpFg
         b7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670845; x=1784275645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=Zo/qWQ9Am3Y1sheQHHELlJAqF907WflxnopWmrXysQhV1UWedHZfYKjTwc6Z9tmsyv
         G6M+mtUQ8ACUctIYYdeGP9kmdJorU/xWJzU9oi2FJTb2GxWLozRq1+0dHmLdh8aF9AF6
         eOrr2Cdpv27y8BpfTHEaZpSiwbIkDURuKITy6px97TVSaXQjcAARnHvDq++xHywCXVYM
         p+t5q8Vu8b8jt9Wr3nR5KejwmFt0lr20wddBPj7TN4wzy2J7F1c/G6V2EZiDHsCOai0N
         chidOMe5xMUdRuo5K3G2fn7dau66aPx3ZPHhSrkDnoJu400lrKYymZnyNdBgJHgBcSdM
         SiTg==
X-Forwarded-Encrypted: i=1; AHgh+RpZrYf+RjB62PCcWm6jbkJSNN5r6gR76ov4QNsCBMb+K7rnjpJwgsWyF3lixXNxeCd2X8MXBG2szmeOaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwKUQ3+Hl/6ITe+hfNYemqUPlcXg/8wW/qMTkyZPCWT47ZppT
	HpEqHjWkp5OrBvBQg2GLDF/fk/9XWw3/94DbzUOUE2tEWyQdGBcDpX51jGaFRRqYCL0=
X-Gm-Gg: AfdE7clbwQOLcDQnbpl8c+2ruWOowSgPwPZxD8V332YES6LJy0RMxybZGRrqvgYwUrX
	aju3UWZg8f7em/EEEc4I1t91qpEQU40BkD4PZTLYe8Qx5wfViMBVJZd/64q4e6Acg7roxdcsK2E
	+dS6pEkckSwa2jjZPrArgxEdGOtxZHbVqZTFjnAvqC3zNDUKk3UdmMQ1QhA/QezelNqpzbcBGOR
	td8pNNrBJz90uuIaC78cvzvZE2sk+FwMOjzCC3tVE2OMPEG8TJL9O0sP5J3VtxKJlVyLmz5gJso
	8HO2VuHUa0XuM49NbmZEI3vq/PJ8q8BudzUOJki9Zvsp+MyN+IPGTTkwTbGezgiwRZqYhSHoopY
	XeoiOAaR4SgciDvfWadNFmP7KgUPdGC649EtCicsOh351M4QNUcm5j3N2vmDZsh9EBfmb+N35jw
	b4twIlYPbNKO8rVqWTxrB9n1avFoWSaAYgPbvZ/tN3RCBNwJ03Q9YLW7VJcAIZnVhToO6DK8o3+
	Kvr
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr11161402f8f.59.1783670845331;
        Fri, 10 Jul 2026 01:07:25 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm60375423f8f.21.2026.07.10.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:07:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:07:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lubomir Rintel <lkundrak@v3.sk>, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Message-ID: <alCn7yq5ltsRAP5j@monoceros>
References: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010727_262449_51EA170E 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============7866312268613634483=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7866312268613634483==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tb4hvlljts43piz"
Content-Disposition: inline


--5tb4hvlljts43piz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 10:39:08AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The SoCs that this driver actually works on all imply OF already. (ARM
> selects USE_OF unless some archs are enabled that cannot be selected
> together with ARCH_PXA or ARCH_MMP, ARM64 and RISCV select OF.)
>=20
> With OF known to be enabled a few conditionals in the driver can be
> simplified.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> while doing a treewide cleanup I wondered if these conditionals are
> relevant at all. A bit of research found they are not. We will get over
> losing compile coverage for COMPILE_TEST && !OF.

I applied this patch to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

for the next merge window.

Best regards
Uwe

--5tb4hvlljts43piz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQqDkACgkQj4D7WH0S
/k7m5Af9EqKXVKajJznf7LCaNjAtLjnYKXogyd5DJe9y4h12iiQ4E0L16zTpUquA
+d8H4y6WBqv5Sw/V1kHyXR4nva8Hjse/yb9oVj9PzSCs/bfseheHbPyKGgJ635V+
N0YEJAYFE9cyv9h1EFpkpJ0lr7jgjTfv/j/XGZ/jaX1o637SKwlYRu/UCVghyU9U
ddbPgQuE1VdQeFwHn71waBzEf1Pa4xboL1VKpqAxVJYl5YWYmyLhyG24Jy45VSzI
1RfIyMrMfBpcjhp7W74SmhrlceCWG4ihxmgGOOb+eDtQ8k2YRo9eT6Z1vc9efPFq
Pi3mXdk0vITyiipLDathqGOmy46Yuw==
=5MWJ
-----END PGP SIGNATURE-----

--5tb4hvlljts43piz--


--===============7866312268613634483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7866312268613634483==--


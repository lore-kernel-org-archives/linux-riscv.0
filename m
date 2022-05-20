Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE92C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQjpU6xvQ+yODJ81rBBzRfJ4gRxGjQWuQt+jhE9b4Hg=; b=3sjKH1hDh/zNVy7m8yKDCTP07E
	FNwmIO3fBjkKZOSuwqJzllAHs+rt7hQJ9WcJ3OxbsRdIavj1/bJe8R2FK2oJxO2qZSoV3Bajzmsv8
	+3rg0vXCcz2rM9bJydQcI1MrvPbBxDH8ZXZzTkIJf7cNxxWuNtOdNgwmX8z0iji+4a5CPn0Wtf2u8
	wkiFhB4BKg/zxele0mXbz3Ji724onhmfF1xNCAkN+ntirmnkEZy8DCubuwoc+tfYLJouoOsn7dYs6
	n8Asf7NbfH5OnF7tA4UoSq/k1SCrh7UBPif4X5oG59Z7aG1TrxJ0nR+QxI8LJjKYZZPsWlAnG5B2/
	K+iXynbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns39v-00Cn01-Gy; Fri, 20 May 2022 13:59:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns39s-00CmyA-Jg
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 13:59:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so4392043wmr.1
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5eZa0fayDa4SMYx+6wD0ONhwsd4HQa9fKkyr7QWMWC0=;
 b=k3/0kKjUk2dOT1S2zRwE7evdJw41bjc5HSwOA3qxwlUVsW3pGpz6kzCA8fwMCnMl8F
 B0fRrfr/orTI94p7lfgMryAP4SVUryXMOkMac0ysGmxUqIS3AtgdjxnfdUWxzTwwLU4F
 QwveYv89kROphbeb45q0OkVL1aHAz8iqMI3YGiBCyunnRj9VOiCrurPYrccdBAjXXnSy
 MlHydGnp14eSFWb7EcP4RbFvghxvlelzoyFqCQmZ1mGfr0jXLdIZhAZAYleQ2338Lmfq
 Ur39q3bHTzkLYSq7Fs5QKWAgVngCyR6HcJrSEsVJbewa37UxlfB0ZSSADR0Iw50bFJkh
 z8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5eZa0fayDa4SMYx+6wD0ONhwsd4HQa9fKkyr7QWMWC0=;
 b=jqCeb2ISwG2u5aFlXKsg6Fb3tm1K5JC/9qGsWKqg3+9Q2gIxR6N32fOChYbn4Oo4r3
 073bIBdKevN1x4ywVIV3yovOqUsnl79nVXb9mrzRkTff/ygse3mdtsDPREKzrxTyM1bp
 CPl4Hpxhvp3RsomCrjuo4EyV3Jxsm5tiu9SlGtPRDEQIxTlxX28iSMzPujUQG8AHuopZ
 bxwsvYuNq5yLoBqg8kClPz0pF3yPUy27yNq++z/PBBcKAa1FrqvvnDXWq8cXgQPvWcTo
 IfMmyNBRCtDNPpQe5AKOZUMClkmJNlEzG6SixXWiElZ4mPAACe915vly6V1O87zmeTQP
 Lurg==
X-Gm-Message-State: AOAM5329vhAWlnOp2BYZQQgbPCHI0AoBbs+tRpz6qlet5pSTc8fb8Da2
 PQ/N+BYvkACYTl1a0yigJPA=
X-Google-Smtp-Source: ABdhPJxdfNjmatlz59N4VJk+ceWjvV76huhczDmDh4PbPHoFYSQaYeqedfLmGm2adCgNuDDQVJ6KvA==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr8915140wmj.38.1653055147828; 
 Fri, 20 May 2022 06:59:07 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 d19-20020a1c7313000000b0039726196ad9sm2100611wmb.25.2022.05.20.06.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 06:59:06 -0700 (PDT)
Date: Fri, 20 May 2022 15:59:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: sifive: simplify if-if to if-else
Message-ID: <YoeeqIDGD6q9AIp5@orome>
References: <20220408083007.41538-1-wanjiabing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20220408083007.41538-1-wanjiabing@vivo.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_065912_702885_CF231E0C 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: multipart/mixed; boundary="===============3433328433862853204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3433328433862853204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VF2U9K2gNZBKelGd"
Content-Disposition: inline


--VF2U9K2gNZBKelGd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 04:30:07PM +0800, Wan Jiabing wrote:
> use if and else instead of if(A) and if (!A).
>=20
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/pwm/pwm-sifive.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--VF2U9K2gNZBKelGd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKHnqYACgkQ3SOs138+
s6EuehAAqLJlIb6miSHPhKIpKbfSum321qEsGFONKrUjf2saDwakaZKG0gwdIyDS
Ek3sNdMO6CRyKuTBQGHrWoD4NHarKtPCuGM/RgsR/dzcTcgWZ0006EPIWuOJbQWi
xLcqPHsEjbcHIOfpiE3FuIQBVKUng6gX2T6M8F2OXMMTbUlQObSx3U9DDhFjoXCW
BYERxGYmRBju9dLFkglwKUUBSxLPpObnRHSFRhWc9gmD9s0TaVr3HWNjReK2yzyk
HIQUavoNYC/lgvK1PPebcXdY/2Z2YKpa73MDEGNpRW7ogkBnWZcRzikWWCcK4hGv
AZ7WqqNqpiGg69WgmfoMLnvMifVMUIjYaYlo7dTcwjQRFMkX94TTBUUKLbVSwmo/
GmM8XSrnaiVSpBy/WchnnlyJvqoj0JxGbo7+qXQ9AoMuiAYTxdxc6IZnUqd7NeOy
Nawvnyv1XAoDCZdbvtssYSqSfEzUAn3qZjOhHA0sRfadoRdAnGBx3p9LVLqgRLPW
O4lRTpsTc/n7WgZMzqEUKYbBxCBysDo9DFRVFrH4NnnxaKNOTNeIorX7QvM1+3Pw
YItDly3Ihitb97JEQ8VC/eAnG3g5SUgz23SFMXCc5aAI00CoqEWyVJVQNtEh5lm2
P3c7+wkrhmJhqcCRRbmS1fw5H4qoVJq6c+tq4ajCs2abeCxaKEc=
=MadN
-----END PGP SIGNATURE-----

--VF2U9K2gNZBKelGd--


--===============3433328433862853204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3433328433862853204==--


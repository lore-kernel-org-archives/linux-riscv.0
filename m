Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46255606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A3I/Sek4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9GYloHx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VrWmYb1++J6x+/E1oi5WaW0otHu0+AqaUBuYG8DI7Vw=; b=A3I/Sek49yrg1PIivrDAfic1xW
	4hz/MWaqg1hi4/CN69oYNZbuRUZAbu+Ys5gjVp6TGZI4eVp798NndiMw9LjJ8/CHBKJN/48k+sDQW
	55XeBxpAjOEXNDZjcXzxBqXyhu6KtwRipiGf+KNOU2KXQ9ZL5mWS7288kejRmkh9onEMAqUOYHe6i
	zssK3p0ex0lmgyVtlxfSjrVmkO1nY5xzp2poGFbHAwQqLSLS41jjGaKgor6tD342onAy21M4tVcFT
	Ep5OCTWK+39Wn+S66lH2N+YjxC0uPBdQRLE5SirL29RLM8902Uk82+FRjB0LgeP5f8JqRNF0GZ1Ws
	3nLT3HjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScLt-000000009T9-34WB;
	Sun, 15 Nov 2026 15:41:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScLq-000000009SO-1r50
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 15:41:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-497614c95f0so1129767f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757264; x=1795362064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=Y9GYloHxMkVPMJfP+XWrbrQjxFppVBWkZmrhtxCzCBsGLFu5FEjn/vFL4mn1YoW/yF
         zHMMzS+jFyuZYi9MoN5Cj/zY2S7DasoJTjiONoHdJNVnTYOtw0cFLbi3yoKiHBhGG3I6
         ZRdu9Q0VZbSgj5rkdFcmQ3yA5OhuUSer4LMkodjpbzUNNVkw5VAQ3woA+RNft8SvlUAH
         7IaLKTiAouqAw0uwN2dVzz918Fi4YzZ9dpZoB6GkQCTvPa8rxomZArwwuNX87Wjj0TdQ
         1SE+jUMXiywmhHWItt5LT/9ZsDscCLVeoQDRVXx8eEh4j1atUkC1O812nM2EHjv4O4Zj
         G0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757264; x=1795362064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=Qi0++PKGt6S1pXCEUQMco22v9zHJdO6jOQpu93gSQ7gWZQW7aCCgJP7VRdRBr6sVAk
         qTBhpa2q6La1CwZB++IJ7eO3K3RgCEmszamp2So5pI9DurrPvEAgP4iv2Y1z2E7+mtHK
         gDUuk8GKu+neXNJFNEpu8evabw81Ukcw8l7jJ8t78saN3ia/9uxE1NHelUn5zLvGVcnR
         ry64AUAaXVRVp77pmG4p+w/671lO9semh8MzLJEGobBgm3sItaH7px0JC0VRThuZ6fux
         VfCwiwLVnMP3Vv/LfAt33F0VxWSEXGvKHfCCgjJKVMknUU7uRf9j80UIG3PevtKpfcKt
         KIDg==
X-Forwarded-Encrypted: i=1; AL+hErEW2E9l0YROKlQJn9CTbZsMfBihR6pgulZiVo6aWja14zgQg/1JpmG4pG3KH71ZBKnpgTlmTzIqCpzd5A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lLZxD0f5fphI0T0OW00BqVY6uXrmWTkRZIow8EcXdaK0cIkFh
	PmvcVFtMKA5k08J7n++2ladJqm3CF3yJ75X03bH6thO+CTFJQzUozGPKUfThT04sNPY=
X-Gm-Gg: AYBFou1YtqSy9mg0URTi5l0DTUFcZx4UmGa0I2ywZOtlqkN1g8Qjj06LnskNeFVct+w
	9zqqKHlNXCJOOVQr5MligorshsgXK6LNDsfDsq1cp3BpeUfdjL96KfGMlZWGwIKYTXjscIfnMgZ
	/7BV+eyiFy+p9ixN/HCt6iCofaPn7zuvZAYJLdDxtI4qGf6g+suoYnQLT28PgzYQSEUYzTIPCE9
	fv0+/42/BW3Ubs4PKJYjL3LHZO50D6xjGaGNiL/quk3JHPRyR5j0yc+jXjt/bSp5DjgVl4RtMuI
	E8gascG5vu/IPp3MByX4YYZZi8qQV4ZBqkIcNjbTSFTzSUYjE1l4j39qNOzEW5J08BATcjO6Ehx
	zmAFJN4disoyZJswhiqDy4ss5mZXuJJh2CzWACdTUUTnJSkFv/OjZtOC5OWc2FjoSLGxVSsfzWf
	BtT1VX0KvIG2REHvTAbZ7NBSzAvy8lyDdthIWWnXXytki1tq/g0BIFas9VbvUtpvjMoJHo/Afkd
	fJCpqYGVt44hLj1I1d8rd6Sm9/XcXA2K1v8h7ZLDQHUlwBWzdrGHoB3zI0bPcdE1lQaApTzX+sZ
	6H3VLnI7E4ikLssCY2hgup20DbV7l2MOuc4=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr19465481f8f.4.1794757264141;
        Sun, 15 Nov 2026 07:41:04 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c888b90d4sm16462060f8f.9.2026.11.15.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:41:03 -0800 (PST)
Date: Sun, 15 Nov 2026 16:41:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
Message-ID: <avnR67LnZo4Mo0Tf@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_074106_653626_3FDFA996 
X-CRM114-Status: GOOD (  14.64  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7429857784953767488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============7429857784953767488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgskattfdxvvv7hb"
Content-Disposition: inline


--fgskattfdxvvv7hb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
MIME-Version: 1.0

Hello,

On Sat, Nov 14, 2026 at 06:33:40AM +0800, Han Gao via B4 Relay wrote:
> new file mode 100644
> index 000000000000..742465076d86
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner V861 SoC pinctrl driver.
> + *
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id with less dependencies, so please just
drop including <linux/mod_devicetable.h>.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> [...]
> +static const struct of_device_id v861_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun252i-v861-pinctrl", },
> +	{}
> +};

Please drop the comma before the closing } and add a space in the list
terminator.

Best regards
Uwe

--fgskattfdxvvv7hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50okACgkQj4D7WH0S
/k78BwgAggANSfiR3lIax5U5QxcHapAeEwjkuu5kUUd7ThVymu6geBziPkTKM9LN
kV1vp14gkKuMuThllE6yPhDE+jBai3H2dmZPRAVxRmkHkRXaCGvN2Qy6QvjG7hn+
pKrIhNm9FD3gtJcf3syW5npYiRAxG/6TkK+Gz1PXPgmg9Yj7puOzJ5ZZsZ+kBOcS
xiSHHn5ujqEIP4jnBc7Dv7UpeDH4NxdbQ6ssuWEYpdmNKvGpbP4Xi4tlxo4RAMXF
XWXJcAtussx3dylMOghSQ5VBKABwOqksAb/tX5/oaY13ScR8Lg/M3WzfjwXPwvtR
yRXJHXEAk7lxYPB9WoXGrz3bVWm0dg==
=Eo1Y
-----END PGP SIGNATURE-----

--fgskattfdxvvv7hb--


--===============7429857784953767488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7429857784953767488==--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EC606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wn9jUZEJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NWAYSC0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sU70Kxwd+adFrkQSR6lLMdt2gMIIrmpup+h5O0jVlso=; b=wn9jUZEJaa7Zf3RQoTzbGWtGzd
	qKSisBYSPF/luPbWjQJoQI0R4z+2R/RVo5CS+v2NBOgzr7rRJLgMf58CaVmz4EtzjH+7ECGivZJK+
	ArrCJcSOll/LQqz6qIUGQtEdUlSspONVYGB2wopKxprG9DtnrYXFFqvuCO+nlpknqpxXRlXd6/LVo
	T3Yj4bA0ZOmhsa4uKJlgM322rzutruWAmXvEiF6skorG/Wg1V8sg+/0wlwRHA5x5CXE2BQly6K56S
	xHeUhgx/5StXFuwdN9nkF4jvK8iZdCjeY1BtIdxlONMx1Z5JU9ilhA8gC92ZMgeUt0dGGb4ophEwq
	Ta6fAsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBQt-0000000FzUn-3sR8;
	Fri, 23 Oct 2026 09:19:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBQr-0000000FzU8-12tc
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 09:19:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a208d93758so6595065e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747163; x=1793351963; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=NWAYSC0e34zz7AeU6QynUgziNe8YBGR1xfm+5HwkCqJjsqiksUrl5lVTBvCKvyy9d2
         Wzn8X4d9y8a2H5bS0ZVZVZsOtYuDZk+MWvrTrVQTozuRg26foxr7gFA/+9Lwi9nH3AEz
         eRAkJv4dMErtGC5ajrl2Y6gkeuGG5PhWBRdu5jT6QAU9uyb8QtS000V5n96svlMpe/KG
         F002mOwSzgIXKGF8CEvOpvL7dbgA98K/odAVROIQU3pdbkUAY48j8C4bKqW2L4MBWN1q
         Huwd1SAURKsN7a4ds9k/mjOJ6NXKrYkej69kBcHt5n6nQ/LDctbOm9/KUbV/U19s8QG8
         /LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747163; x=1793351963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=xBPnYue5Xl04aSLG/6kbTnXrFhoJzHwUeCZ3KZWjSa7ELn5VYPw4J1vvs2R2del/Np
         vfTv3dObulrR4OOJw8UkgXXzftl1T6bwfZOBqeq/LzWXs0P8McqYHxl/jC/qFWFBHo5p
         p/JX2svH4JbtcALCaTec/vEEpevntKK4TYfoNs/Js73Eu6znF8hn/oEfudpfsKDHHnlT
         832YPHbE8U78Mr1na7Kcoy+Xc3AsPl9XgWQ/QaYHLr+h88NsfYTwv0MgcGiz9uUV//YS
         P1WFjRyU6FshMlhMdf0oboDS5uuuxoxudZ2V088opS5uhB2aWnJTBPGhPrTUmr8hkGhy
         WyKg==
X-Forwarded-Encrypted: i=1; AKwUvBzwf5onDkqu/i+2x9oMjjYylMUBA9GHNb1u4PEAYoJHc00SKq5GYY2j9IqLnFdWwDvmxr8e2hMYOdU45g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKbYhmmOXKgXUg3CRgwKgcJGn1Bvhie377GbYlzeH4x5lmbJ1F0
	itue4VUsAZA3Qtx92WLNOTrXDPPRHvjUzam8lxbzWkZgQuVX5qMWJ3Vg1O+YOPCTNQs=
X-Gm-Gg: AYBFou2qnABA4Wi69P56rA/yrDDX2huh/5l/7BSQ572IuT3heIV2ZuYR1OOhtuwW8o8
	qIugpd8xGBOWW4a13Y8kwIwyj/XaA59inzUkBuiiP0psuYZK+oD1YqPqfZNkPr0eAkbEvLLYvVi
	PUHvhvGCIsQQPkCvONaFlm50FkXcnXxwKHjjL1at3/+zYTYR0Oai44Q9/Xwb3L9jmp/ZFjuovG1
	byYwiPLu18gLdlGpaq9KErpm6gkAfICEmqkYbocA3m4S3JhF4HPwderdErNRktY+afjr7Qoo99y
	TbJoyDhtpwkKmV2zeEV/n1Ee+MgoGiVGus4bKXkbnB3e1sOcC4qE3f5/gYhwmt7iY33cb1YLVl0
	cEkPvnFw11X3ttgQm5qM4zd4a6WePyM17EYxBxrOhDo2M7DSlQeOY2Vd4lI1oHEMHfQUmN8ph8j
	zQweK9XVZDhbbPJQfMarOF3TEv64tx9WiwO3wK4t7BfNpl+h1aNGe7ZR3Y82ED1q3Ka5lc8DoiB
	+OxTbi1VlJ4WTXWrqHk9Ihn0COi3MezUlmWJMIqwtvgR7RQm3noyvLvsl8YxqEfmqWmZCQ6/05B
	1f9w2uArz7j4bmLEZy/Qi60H+j0uLV95h7V7lGBj+lY=
X-Received: by 2002:a05:600c:8712:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a211cd5eb3mr28983755e9.7.1792747162862;
        Fri, 23 Oct 2026 02:19:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a211ba3e22sm53005535e9.8.2026.10.23.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:19:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:19:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
Message-ID: <atsmP_5sX5RFunft@monoceros>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
 <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_021925_307068_F4931DDB 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>
Content-Type: multipart/mixed; boundary="===============3103758857344514248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============3103758857344514248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="covttcbalrymohfa"
Content-Disposition: inline


--covttcbalrymohfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Thu, Oct 22, 2026 at 03:48:17AM +0800, Han Gao wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in many unneeded dependencies,
everything it provides that is relevant to your driver should already be
available via <linux/platform_device.h>. So please drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--covttcbalrymohfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJpUACgkQj4D7WH0S
/k7J6Af/akzqmN8ibSwrfi12ffHOWdI7Our+3A4vhm7xG5fLhDxm5RVyO9IOnbZF
hEEqQasZCXUckEd3P8maCUNMZrumlljeFYUKxiiGeUptwiJNhDfD5gwgvKN+QznX
WUBMP16Z+bJ04qU+9Jvxwu2AZERVCQgTDx7HM49rEY2meQdARZ+74mmtm7x3AKyE
LAf4maK05HpWCQtSPGWBSz9ZRiv/TrfMYyA43n2Say17TUHYMVEZfRooCn3JlUBB
TybkgcHqyHLbqU2SVAqhlZIuIVWIEQWz1aD92G51OANqUqboJ0wTWbGxYyrQMMd/
VqEBROgHbira21nt4uuVoVmMDk84zQ==
=XQ/k
-----END PGP SIGNATURE-----

--covttcbalrymohfa--


--===============3103758857344514248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3103758857344514248==--


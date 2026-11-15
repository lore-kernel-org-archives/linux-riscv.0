Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE876606A339
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=48F0gxeI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GwUzGXw6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gAXBEBs1K3nhTR+FWrMwTI7MO2XIskQvdi7L0+xiKOc=; b=48F0gxeIdlKlmeCJHjrv6sm0Fl
	XWvkebIbw+y3UVGGaQ81/9qkFLC3KsAh/6vrwQ451DmUZczjVlfh5hnT62IhKPxT4uOJ8JFE3eRSc
	OsicWiYoOaSJkGA2L9dUwl58RNDeRFJGxMxw16Q9YS3Qrmx8miUrn1Dysf8NV7eHspmKjW+73WnLB
	FOoQJmOvDv0FG3+THQ1vi5/gW46R16bI3+98hKgF16b4VZw3U+HXtxX9bBPSJul8T3wkOQK1GBxiv
	1TYx8uDQ2gGUoZoNtKprhm3hIjCfOFMwOI5abTVxX/NwMte0DS4dEkcIpcHnJf91CTK9oJ6uHLU61
	L8NlmqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScO3-000000009ov-09XY;
	Sun, 15 Nov 2026 15:43:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xScO0-000000009o3-3gJo
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 15:43:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20204735e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=GwUzGXw6+s0+Q1HAk9i4JsxMQ3U6gHPdxIt5r19IYynejirg7PjsNjXUZYXAtet4zd
         aV3gnODGChy3e2pJj7hjMx66Wx8LiekldDyxzzc5XiGQa8lcbn/MySiFw0ffT7jRdHw0
         oF+wBLKll2aaEwCaOpGAkpS4qlEppVbBwOW8nfNmt9sS+nEIdm47IFlHKThbu2lFXPXF
         Gli93YDuJRJpPo68g8e+l+dh/o7JF9Es38kqZvChVS+S5+2eFKiehJHKQvgwBV6j7VPD
         1gP7g68qvHnx00LUVnd/CcK7iNOlDhYxk66EPoghlB5JGnHmCCOnyPsq5IfFmMJFlF9r
         rLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=Fp3zYLBgnMhL8Wb5ptR6fw9fcV1qsFNx/WkiMAMeD/O+oDpamVji1KK3O1M/Fpq04k
         VyHWoIy3Ycktosxu63WSyY/ezdm1/7TDwvsaICWwpwZP+LomCLjKxBgIE6CYfJ/r4S+m
         E80CHc71yPEk/txL87c7PcTi/moPWt+HK0laNIjayxZoXXh3GWW1XVgnqE3pdYF/c0t3
         mCbAXGouhNf45/nLdZ78AnbxreVQw3bDwIJTDzj/7aL8A5MVjIA3aHyRdEKWu/iWsAlb
         CRHh2lMD8I7mCoVSH4YZwMYbAf+Xq1W6U2mTfRhi5zcz8odmlSAGp8pQpEwnGzpwkJLX
         CheA==
X-Forwarded-Encrypted: i=1; AL+hErE8TWFt/88KGFh7KuiqliFRc9npkpTtNAM9FEP9eky3UQKNnxDyRa+N/3U58IRsYUhRXlrAT5PZGI5fQg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8mhgb5T6RI7Ox77b4lRjdC7imS/0oDbbze5KQo9ez1vBfjdMvh
	YV+cwKvxp0NuKsL7S2yaKiTCMCoqOXgeYbO5z04/ai8dYLbGdkihiw92QYZp90nKvLg=
X-Gm-Gg: AYBFou05fkgg67Ds/jCLX5KnUPZMF/qTMyDgHWsVR053oEb/bTZ3waw7Lr5h7m9tlsR
	QY7fJXxCulUAhrcLc/TVrC1rN3rj1JjYfIDj4xWHImTYYtKIJY0rD1gU9d0z5jFSLgzckPtgznb
	TqDzDp9Kq7dP1BKUvz1M8LfNlIV7uVg30U+gCcaaZysWklW+0rqgVY/Dn2F0YS+unph1EDWHfp7
	/+Md5Bo9Y3Ov+8yQ07J3fPWVKqUKYbFP03ZPQX1OO+gLkuQrFaESbHSxX7JSPo60GO/CPF0KZ2m
	4u4KglHy0feJpbXNaW1PvCu28+0NP5U8R2toTLRuU+Qq2NSYPEmZNQGAhHTpvwkL7VpNMkc8El2
	6Hk3rPtAJVJQcjZElyEmiCKyDQvqY6MNC5n76RhGhmtEUbhJSAQKM5GP24Ps4YlWrVSOTqRxDlT
	b+MF7GyCLyFc2RzjeSBR9uAgBy2C1MEDt3tP+D48d2JvHMPyynV7a1pkgw3QAJ4wdaEpijNzogl
	Qox8F0ugX7S0bHtDJ9IfoMQMNF0bmaaW5l8KVRW70EvHL6uw7fA5pwip9/+Et8XqTEFcwlHBDzK
	0142m2kWnuXe9/P7vymvmgbn4d0D39bXB6iO/xwTiq6j/VjOkmkO2x9Y
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
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
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_074320_935492_4F6DDC25 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Type: multipart/mixed; boundary="===============8323630653427295880=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8323630653427295880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--


--===============8323630653427295880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8323630653427295880==--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F9F606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9pzxeeZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gQ6jHYFe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ER+/SbWRaGa+yZAafGjqz2fXkQ8VCBT38Dvib42UMkw=; b=d9pzxeeZiwplB6hg1BD8+JI3w3
	+1wb4mJxld6M3z7hqMMqEfnvi+4xZK9UvxVVe2Oq2hNAVu6o9DyNg653mdgDGFtBkHQ/3r2P3FIVh
	GR0tngnNtjmZoxuYBcWFgth5ug+ciR3WuHfT897Rk6IirbM6nl10G59D+xHgte65d7tSDngDBoUNh
	QJESSqPv3LeeqFvaoDt/EoOUsjLNF4gtUM5k4F02IIYVfzmD4Zj7QkRkPj4J93lCMSXo3b9BxOtKe
	gmlonaCxAXEqJ9DRCLgbeR+yz4c27pl5yk6Wpov/fQolQY0iDmdWZhR95DquYxgPW6bAszcMvvh40
	jARJA8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxuq-00000006SS6-3zdX;
	Wed, 28 Oct 2026 07:17:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxun-00000006SRL-0pp5
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 07:17:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3767995e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=gQ6jHYFelp6MH/kyUIPE8IqJRhYd4U9+CAJvM0N7klinVapSnt9NPEfeMIlAeCWBIm
         8wGyZMeKESLN/smGCU8WQwp/EMQxLSvNA3RHdYNE/esYPV/eqYfgQEHDQswQ7V97qL6J
         pMqNycUgWH0Ai7as9sDczo8vt1+5hcGM2E1uaxtD1g8DNgFBumbULAsraZfxnOQtclvs
         zD/CrvIjVcoieWWQOz/9elyjOYW0/U3zlBIEjGlohEp1sh4hnY8wW5w3FlKrmywjF9Cy
         Hv2DWC8VVL3T+MtdmZ+XVWRTwsGmTGZVfl+/Vxe19B+qqvrPbDonaXyca8MR3rL5X+j6
         Y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=pD09ERIx9dIWON+tQi04GoaXIsEYni8HM+cR4DLPhySc7CccYxET2VRBQCTzqSUDyn
         VtYh2oGBCecV2OgQvG3nfo6tmIKquMu2oymWPvI3RG/xnyORAQKo40wMmGl0JGIfrkC4
         sqrGVAMZmKpicym/AUMp2PuNXqv+FC3In8f8uHG1RyjdB6BeB5lV0xmy8ifKFCCZ1Arx
         IZvGmcMZ97ckc8NuGTHTp9AKtWVJeBgm5S+hvfvYeDohsUgqWQ7S2imEgKWyJPlk5InT
         JdYBGKHeSYsM7Z0DhguLiqDWcVpxhd3oFteFINoX+bZ8V6nBcexQVYABxcmGzxrN4f0O
         Lozw==
X-Forwarded-Encrypted: i=1; AKwUvBxoa78Pe0abwlSQZQRBZU+zLDSz9OfXKa/DpcaO7PzTi43/i7GroH+Nrh6BXK5ch5Ht5wZ4f/rB1O4OFw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIVvt6S9QcHQ92/X5BJ+35Gg/yTzoweXj5kfFyRClq8525tlcBA
	EDgoghBKKVC8cNEdaqlAWy+NmTBLjwQN6VGLx4oiwDHCMx3Lyc6eLvM+EejpGMOu2jM=
X-Gm-Gg: AYBFou25XwI3Rnm42ohWdkyqO6CHSH/i4p4AMm9bszfYm8Ym6/GsSVR8auHqE1JAxy2
	pneQFQWIL2WAsuOF2VLSUnLc98EKph+jbjWH5CgJI+i/JvlW0D01x+wxeuD3PxPnXJHXRk5KrIQ
	n42JAo4GZm2UrsnHkiAMRgFtB1IB5FHOiv/6abFtYdRztDF4NkFrpZTt6otZxo60WfHAlrJv9Pk
	eytSSK+P6WSRlBYnwmVw3A7p4CxRBopFLhRYY67BNWCMDS50Tr/liB5lzd+GR1Gtte8QUTpnKRu
	R7Xw2kJgQODEbQ2yPWfY6KSsFC+iNiUx8Kl3xZ9jdWM9V6MHSINFp5EREe5qYgdghiNAx10n2+r
	8GtDcLdLf+2+ug5liCpvcI6wh9uC1/vVoyphz4OvrVTk+WEbJeRYrD6k6F3G11VloiGcm4VjATg
	seNUB2cf54LLKYS9yrHbxZJuY+K3+8M3+g3iABhul0vFa1heYpcjxnw8nwIPrE6Ym8do7DvOMp2
	CMucaG5Asw03pSpY2N0PGgfS+vBD42OrdspracVAETTK0e7Yhxe2+kN2p63uzFDcYzUUxnxLMgH
	GaYLoEUtKWvMNxM9WeHeW4kfOWgNP/Fzm6zT4YQ/jnjozquAZ48qqFjls2lUhz+5QIYjvOp2ThF
	H+my6l539awQL4I4=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_001741_255316_F1D9EB4C 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============3653823707387981613=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============3653823707387981613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--


--===============3653823707387981613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3653823707387981613==--


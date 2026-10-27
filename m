Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC76606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xC2GOWXt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jewdpYyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GztHdmpLx4vaTZmheFBmf/w/8bUBPrcdBQ6zqmqqb2w=; b=xC2GOWXt1LZpm4HTIfra5i+lDi
	y8U+dq2igiLqvncB7G4rcBokalZlkHsXOno9yB792RrhOgUlNtwmcF8kv9D0Ufa6dmsaIBjMvD7Af
	KqQkKDfBJSoPuLsjTHlVHs9+O8n1mNSV0cn7nsW3pwWIAB1qzfM9i9v0ict8xcu4mJ59IAIxT1dWi
	Yf/Mh9PeaSOZ6mrYmHgpY2t68TdB1qS6JXh7KD7vcg9lFAiMT3OO/MNsoEP8iW+cLYRa/9tUqnd8l
	wGUK5Puisp1mVkJwq3uUDdxosV0bvHw5eZzJCVLUN0uq65S2M3a0pLQl/vnCoB5VWmEktv7lSJcBb
	CUg965oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdgw-00000004C2D-1EVC;
	Tue, 27 Oct 2026 09:42:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdgq-00000004BzK-2EMn
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 09:41:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18163655e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793094114; x=1793698914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=jewdpYyLtftn9ZPsCWm7UwIuRs0ewu+zYlYGI1MjCsNW2gRdwJiPIAnBvhzN96NTW5
         QwrTYM9F4fxeEWKpTiLZ8XQuf8Pw5lJWv6cgB73qRL1uvN1wEPI38AdcXtu5dHOTTRfu
         hSpa/VAZxNJGv4IOzMPOpLBuZ2zxhYUpktx6OpcDQ85xmBNJHw3HA9lLhX8+wLK4IWDf
         ZTdw8BgfworKpYQg1uMUTmBxs+uQnFRo+1eI2xE22y+qEj+3uMsYOwHsTDNZBTxcpSon
         YBz6+wcGLl3GuM4ODOxvPTRjbt1avbgfmTjrPdvUlKtiJJWiPi73u1M9HeOMYsK9mKkw
         ekNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094115; x=1793698915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=Rd+Yd9eJqwyZlvqGiCzi7kIaBedF5IFktzrlK67fj/hZPDoUS3AaZ1WJARIcFy+6WX
         c8ZTDbT15O9fBMuehU34t8I/9UAr8iYH3Wsq43xH9FKWxJhtjCBGiSHxewbOyzn2Dqq6
         2fLtWDAD2bThIHYYJ3H3p+1NVD5y2e9xsceItgboT1Ge72/fd0nbdwaRSF2dtrS57Jgg
         8Efg6KmEBYzW8rpFbnJkz7xHDQdmH0Pu3/q3Ds146hpxWr+OmucsuDImAhn5AgiE/uzo
         GrhnY6Cdt37eLxdO1QB0ZOW6dsyERAN8Fkr9rJxqWjeiE6boEkGwwDhkjHWue2xCKSYa
         EfHw==
X-Forwarded-Encrypted: i=1; AKwUvBzATDjZ26TDI0LeHNrn6pGqirhvVGGvMV2tXqvY1dojrecZT9QLVART3rryt4PP+0SXjE4C4Kic3vC8CQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0K+bt+6v8fghwtaiy1JUDyjE9uaBClOIG1kKJ8NJ8GJ/mqBmD
	Or1KXoHq0mnvejSYAolyxXSWNjzP6q20MvQhGcWvm8aqwqdDh+8uvV7o1qxHAKyv7Gk=
X-Gm-Gg: AYBFou24k+2WFWfoVeVS8lby9yqGKz+IecIotmetGfQ/Zte9/rUCvifipBOlWyp6Kp4
	kLQ2uNAMR5L5m6BDSSBJ4koSFD5wHNdiPVgINuQddQslDR45p9Eae/77/rxewi+Wwd1Aq7lKmyC
	Gh0P+lJMTuCc3UVlgf8CWNZqvUvUKqqrPIItKfnco6bdbpVBS8RNUDyKwxbaAKcWO2rGKwQaDTq
	E2TaoCGn7e/NUOSrGNaYl0RWMm8nZlTaGh9IrEGV72ikMDsKcev/94vQ9JiZMmX/NhyuA6q8pxQ
	KaD+sw+E4zlEa9MeMGWWCNfalTjHPsP9laxEORL/SP5yw43rdbWVfWK81R36u6h731X4Ly0I1/1
	fIniRO54g9DQZmPUR8FNr66mbvZqen2MTmVqNxubJuFInfmgVFncsnzMb37oWjBbz/IaPMYQxiS
	VP7YUX1OX92P0uiAA62iQl/ZztBVDlL6myuZE7XlaxEF/ZUA8i9HxYMwWgdQjapGfJKlLTw6Xi2
	0YMFOWT5TIko7YQ9isyZI1RTWvry0pSj7VrgnxRHfPXj0yUW9Ypnlt+19o2c1aEvAc4dS081SFG
	aYPPCank8kbO+968N6LpTobuSoCthWm0JS2YGQTH1q0=
X-Received: by 2002:a05:600c:8a08:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a47a8dc93bmr110335135e9.9.1793094114509;
        Tue, 27 Oct 2026 02:41:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm263939065e9.15.2026.10.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:41:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
Message-ID: <auBxfVzkveb7KlEk@monoceros>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <at-CGVq5jVsMQief@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <at-CGVq5jVsMQief@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024156_603909_AE7ACCEB 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: multipart/mixed; boundary="===============0711521378158498046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============0711521378158498046==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlk6jmpzfns64bdk"
Content-Disposition: inline


--qlk6jmpzfns64bdk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
MIME-Version: 1.0

Hello,

On Mon, Oct 26, 2026 at 11:38:49AM -0500, Frank Li wrote:
> On Mon, Oct 26, 2026 at 05:28:11PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > [...]
> >  drivers/gpio/gpio-imx-scu.c         |  1 +
> > [...]
> >  drivers/gpio/gpio-mxc.c             |  2 +-
> >  drivers/gpio/gpio-mxs.c             |  4 ++--
>=20
> For all imx part:
>=20
> Acked-by: Frank Li <Frank.Li@nxp.com>

I'll apply this to all patches touching the three files left in my
quote.

Best regards
Uwe

--qlk6jmpzfns64bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgcd0ACgkQj4D7WH0S
/k4RSwf+IK0Zg4d+0uYc5szRXc18DV2GOQKuWytvc6Mb7rb8wBUlhLcCzHXfHJw5
GKyFFUIrW1GHu/p4aSlsaOLm8RjGYbgR1RTnxQySdf79td9IxG/EXqQcp6FcxSH5
30Ema9IFNIy1Z1fLQlqcQWR4FaujBuohFx12psbgjzkhMn3OY0x3w6FsZddRxBu6
hjb1B8M89jP2R7VcM2CC+KYKqlxNoQYiS/XOiE7oyKj9CqBRDIrGPNwKtLxUelaD
kKhTCJUSL4uTa26RZDC42xIr79ip8u0RW/+hzEwjtlicpsH0uFemsO1TO74xS/ol
PbKbBRoQJlRhoDMBJ7sTb6K4gJHPEA==
=KSfn
-----END PGP SIGNATURE-----

--qlk6jmpzfns64bdk--


--===============0711521378158498046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0711521378158498046==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B7C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhrsHi++QYAPv+98ikOe3JqkyDQudGZ+GTWaeXjZAXc=; b=UdNAYOS+bSzb59v/URkOV8sH7H
	q4D8bXruNl4As0rfZzjVctul5wde9Xy76/8G2E6RjZU1nY5KusCEjB4OmyTu1OZ6EZO/8EMfZ8T/I
	G67HNstQZueqU9CwIOwAmVoKlQCX1pTZZd94uYkmmXIdzUZDfeheM8NOuC424LpsAxyqOiIut55hI
	y/akZzc7+V9sclpy2olzUahnFaLA9Um6OcpQz7bDXTD7vKOMXbbr0UTtm56yhj8GCLHlLS+Hxy7mC
	viyOWCocjxgibQQsISQN4RoTWcQ8MGIkvcrLZSo5Ku+HJVc5C3hwQMaMO+32hbnh89FS82VUQ1bEz
	rnwb284Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdcU-0000000BiOw-05hj;
	Mon, 06 Jul 2026 07:19:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdcO-0000000BiKx-1pL7
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 07:19:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-474560436c3so2591962f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783322390; x=1783927190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=m9ANpRyHkZO0DNPZ5tpdKb0G3H+1KfZJD+iijO0+3zVOCMeat9lBhEHGTgN3E7M8XZ
         WXh7qCsaJBM+yO/5fkUF0Lu0pCcNCLbOWhCgrOszKtcULKYXcyc00lP3rZufIl7SwMrU
         ykyCW0/4gevAjru7WnD5k76uK5Wq2JAgykYL7h0CviZ7+wSV+8R6vL3bD8D10u5dTFJv
         173DwNZa8s64Wr116PGM3q+fo3wm8zefAgLyq0KnGcc2oRlTxgNbwFocN7ECat6AH0hH
         lxeyz0kz3lsUWkeEISCGaAA/xVzvhTEhHXC44s0E0d27RjGEp7dGrPwUdFruXU2pV86A
         SGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322390; x=1783927190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=UhwJ4LaONLZGjYA5w56ZaMx4Zy9Nu+F9r29XvJYtz6KNJKr1FvFcqNTf9bBxlQIdM4
         HDbw0jq37R2iJ4namL+KsibBwaqyMgG0jgYRHqivgMbPsucyU2JU2BM/u7+bWi5jaNVp
         9F4dsv90ybzyIAFPQ/mMf7Lf0UZbYh3i/dHay5AdWzSeWTqcffyvkLCaEOwjy5e5p4q6
         ePi/H24SOWpE32FUrYnFux3LwpWOPi1+77hvLxcjUMUhhWr1bZeom2riXyXBycDbxy8P
         C0f4HHYbJjMdyZ7wvcGyfG/cefwIf65PnxQ2I+29XD9r14B9/7Lpm/Bhw+R9HajYrnnZ
         YUgw==
X-Forwarded-Encrypted: i=1; AHgh+RqKp+QKucUkAN8AH2TPYo7dgOrdZ+BnpTTYXyvKQAREK/aWD8RAhIPPBoQgW4lnjzJIFzMKDTV46Fy2Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJuK1LaY1OO7L330O5bM5BanX8lCiM0YYLMFYe9p5FH8PNXGBx
	mYOPMXtcHUqGtJ6yF8K5IhLKwe/yolnPdkLPbDu0phoEIQ/qTLzhYSI6JrRmdx/dYEk=
X-Gm-Gg: AfdE7cmbWh4uC3kf8K9pJTBK8plFxx2okunnuOYRs4rVFoHdzpagxDnPV400Rg3jpfT
	6lwFNq6FfqXJ+OsdsoUfvU0zlASYha78akxcPevAD3hT+nL1jDga5udwEzUHbKlA/ngAGSirOGu
	QfVuYv7RkSFqQ2ylNtCnADqcksDDIlbZA0yKbK6F0OiL0iTv6+1mF3fyrixm5W0RZR2oeFy9uN2
	D6/RU1Jf+ju3BoPExtKG+9Qs27UQsFURM9hzxZq/C7jwlhDVT8B8W+yHQVpOX097+E/Ox8GY0cw
	pILbVVa0/sYejAO0CIihNK6L+i5rMKcaw2I9SNNe/xjblHCXzMikOJOfH9Sal3ifs/ppexeyo1v
	XkNHIGO7pekOLjy86riU49tWv8WLQwhhny2bAveNwYemaOVNS4T2zBujS32JrDsrVPB5/QNoQ28
	nR9OXjrj+BGWa/qTxW1HJNP67hszpObAejmc8P72E2IhoAgHJZfH9KR3+0sgM5EU/Uoti1a5fFJ
	gHR
X-Received: by 2002:a05:6000:d4f:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47aac7d018dmr7577860f8f.41.1783322390409;
        Mon, 06 Jul 2026 00:19:50 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm23183058f8f.21.2026.07.06.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:19:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:19:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Message-ID: <aktWoIfY_DdO6gb4@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
MIME-Version: 1.0
In-Reply-To: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_001952_555403_54DDA9F7 
X-CRM114-Status: GOOD (  19.45  )
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
Content-Type: multipart/mixed; boundary="===============3330912436483706350=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3330912436483706350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64vjgbl764osolti"
Content-Disposition: inline


--64vjgbl764osolti
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello Chen,

On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> On 7/5/2026 11:14 PM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> >   - Use a single space in a of_device_id array terminator; A single spa=
ce
> >     after the opening { and before the closing } in non-empty
> >     initializers;
> >   - No comma after an array terminator;
> >   - Also no trailing comma after a named initializer iff the
> iff -> if

This is actually intended. iff =3D "if and only if", see e.g.
https://en.wikipedia.org/wiki/If_and_only_if .

> >     closing } is on the same line;
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
>=20
> [......]
>=20
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index 7d07b0ca7d29..0b6461172e6a 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -225,11 +225,10 @@ static const struct sg2042_chip_data sg2044_chip_=
data =3D {
> >   static const struct of_device_id sg2042_pwm_ids[] =3D {
> >   	{
> >   		.compatible =3D "sophgo,sg2042-pwm",
> > -		.data =3D &sg2042_chip_data
> > -	},
> > -	{
> > +		.data =3D &sg2042_chip_data,
> > +	}, {
> >   		.compatible =3D "sophgo,sg2044-pwm",
> > -		.data =3D &sg2044_chip_data
> > +		.data =3D &sg2044_chip_data,
> >   	},
> >   	{ }
> >   };
>=20
> Changes to sophgo related files=EF=BC=9A
>=20
> Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks
Uwe

--64vjgbl764osolti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLVxEACgkQj4D7WH0S
/k6otAf+MDN98V1OLHB7JSvapxuE4DwDpddJFumdMe3z/vu/P/VdI1oEao4PKhGo
2fMsJUgJT4k/6wIfoB6C3asAQFoEg3UirigbTf0d26+LpcWXfr+MJ/e2tzlX/Yzn
2dH88yKAhOR4HFj73YAi1FscS6vtyPmk7w2A84lWRMvteeY+zJan75O9xwgRC7FX
gEMJExnAEBHY9tEW8dgB3EK07MFFQWLlVpGQll6BbLHxOcMIz17Pj/sI6+7Sv0xW
cahUhiwZ1m+Y0EElAHIwQFoWyyyg7KINbFYsCsnyL1ev/EbUFyGCMRuR270OEIJW
bKMoVE2keTYc8IQjmKqk7x/VPRLsTw==
=LX/u
-----END PGP SIGNATURE-----

--64vjgbl764osolti--


--===============3330912436483706350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3330912436483706350==--


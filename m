Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280A8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxjvPQ03s8FZjfcxhxPvELE56Z6p24j49oxMknEaNQc=; b=h6MFYloaarRC96ppbeKtyZqYKx
	VtHMHcUoSYAz8rZ45TzCQrz3ulUszUel+GMVnSmDIgvhMHkhm5KfVBPz451fFKoXOR/TF8Oi+UYca
	b2ExQJlsMLi8/513rjJp7AkQURaesuou1UThLTNkC4Jz3SORwSc4JO7gh0ztWVv3QXRqI4vLmTUYx
	TXzRGar0rDnLNGZ2Kn2QVDLonUaogqaKdwNlkA/rZQVPCsw7pP5ugExO6r83vmZHt/JhR99kXIn25
	udvQ2f5nkR3lCs9hHE3zFEThS4DvotqsDy0oUacxWs39t0YeaHTtOtloMkzlfJg8sfUaPcCh5Xcd8
	ll/v9j3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvPW-002MbN-Rz; Tue, 15 Feb 2022 10:50:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvPT-002MXo-Ni
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 10:50:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJvPE-0000Mj-FZ; Tue, 15 Feb 2022 11:50:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJvP7-00GjUe-Ml; Tue, 15 Feb 2022 11:49:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJvP6-003Jg7-77; Tue, 15 Feb 2022 11:49:52 +0100
Date: Tue, 15 Feb 2022 11:49:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Rahul Tanwar <rtanwar@maxlinear.com>,
 bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Message-ID: <20220215104952.3z7y2t5udwab64kh@pengutronix.de>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
 <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
 <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
 <20220215094106.k35pmoxt2nk44dsj@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220215094106.k35pmoxt2nk44dsj@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_025015_801933_702EF76C 
X-CRM114-Status: GOOD (  28.14  )
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
Content-Type: multipart/mixed; boundary="===============2999817377070850094=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2999817377070850094==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ik55s7cffiwjwpg"
Content-Disposition: inline


--6ik55s7cffiwjwpg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 10:41:06AM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Feb 15, 2022 at 09:02:25AM +0100, Krzysztof Kozlowski wrote:
> > On 15/02/2022 08:59, Krzysztof Kozlowski wrote:
> > > On Tue, 15 Feb 2022 at 08:40, Uwe Kleine-K=F6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > >>
> > >> Hello,
> > >>
> > >> [dropped Anson Huang and Yash Shah from Cc: which were not reachable=
 for
> > >> my last mail]
> > >>
> > >> On Mon, Feb 14, 2022 at 10:21:39PM +0100, Krzysztof Kozlowski wrote:
> > >>> Hi,
> > >>>
> > >>> Changes since v1:
> > >>> 1. Add tags.
> > >>> 2. Adjust subject (Uwe).
> > >>
> > >> However you only took a part of my suggestion ...
> > >>
> > >>> Krzysztof Kozlowski (15):
> > >>>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
> > >>>   dt-bindings: pwm: imx: Include generic pwm schema
> > >>>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
> > >>>   dt-bindings: pwm: iqs620a: Include generic pwm schema
> > >>>   dt-bindings: pwm: mxs: Include generic pwm schema
> > >>>   dt-bindings: pwm: rockchip: Include generic pwm schema
> > >>>   dt-bindings: pwm: sifive: Include generic pwm schema
> > >>>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
> > >>>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
> > >>>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
> > >>>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
> > >>
> > >> ... The actual patch has a space after the comma, I like this variant
> > >> without comma better as this is a compatible string.
> > >=20
> > > I am confused. My patch does not have comma after space. Your reply
> > > had such in the subject, but not in the proposed new subject you wrote
> > > in msg, so I left it as is. Without comma. If you still see comma, it
> > > is something with your mail client.
> > >=20
> > > See:
> > > https://lore.kernel.org/linux-devicetree/20220214212154.8853-12-krzys=
ztof.kozlowski@canonical.com/T/#u
> > >=20
> > > Also reply from Vijayakannan does not have comma:
> > > https://lore.kernel.org/linux-devicetree/20220214081605.161394-11-krz=
ysztof.kozlowski@canonical.com/T/#m80af695f2c751341bc971114aefa00ccc929a3ec
>=20
> Strange: I have this mail four times in my mailboxes (via
> linux-arm-kernel, linux-pwm, kernel@pengutronix.de and directly). In the
> two latter the Subject line is broken in two:

I was wrong. The ones to kernel@pengutronix.de and the linux-arm-kernel
one are the ones with the linebreak.

Hmm,

http://lists.infradead.org/pipermail/linux-arm-kernel/2022-February/717310.=
html
http://lists.infradead.org/pipermail/linux-arm-kernel/2022-February/717304.=
html

has the linebreaks, too. Still I wonder what is different between
kernel@pengutronix.de and u.kleine-koenig@pengutronix.de.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6ik55s7cffiwjwpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmILhU0ACgkQwfwUeK3K
7Ak2jwf/YTZ2xphcIavG03zlKIE2aHmvTuLH2QJWSh+YE/vZDTs5qA96uHK4qJqE
X5r25Qqby7C8Tb1gyOYSZJDoaiVnoe2XNyzDJeCG0QZnqYsj7bFKez3mmdKv7c/8
7K4TeGdcWrOhVv6QFW+v8RrPWx5WkvSJT9PQ0CTgpmknr/9wX0YgO5yEGZcP3IYk
265zktNZnG3rg+p1qb+qt98fkLQWvy+wtaGH2Sd9kzVM82ukJ0neX0fQxndvOHWW
SbbXcy+HJWwBbUKiST0AvQCjqeo+O1LR5qn8+sLfNAADN6sjmZW09vX2rxC+DNXs
G7dnLE2XCT/BaFyxHPQanXfYkZxb3w==
=Rrce
-----END PGP SIGNATURE-----

--6ik55s7cffiwjwpg--


--===============2999817377070850094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2999817377070850094==--


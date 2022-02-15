Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF74C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F839JzGj0RIXMr4hzR+EBvN6pXvMir21Y8jU7K/r218=; b=Syr7uIitnAYiV85FD/2Sf5/YlQ
	Q6b9fGRxZh1Sve6Wd4USCGMeJx5JGo7gJhYbcgNyEJxvOYT8uWlkzXx9Rsx2HvJ8QUG5tJoXMMQ2T
	s+QjirD8Ts86tANhDzpjx6AGAh5eqUaIoLE0bXvJKql/o1VmVfrXv3YthILrxbQhiXcaurM8fTW04
	f/FtNiLFHp3Tg6SRReBjTrydufPTX5E0epQjMY/xGoz53xPCbRcUr28oQEyzCQEorRstXUqyhJay8
	yElZWeu1Duz1isaHl5DLYs9dWDI4wwTzislFAdowtqVq5VmYfAk11JpJdiOAOD6mQ5Vh+RMUwy+3P
	mo2vos2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuL2-0024io-S6; Tue, 15 Feb 2022 09:41:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuKz-0024gc-RO
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:41:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJuKh-0007uR-49; Tue, 15 Feb 2022 10:41:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJuKa-00Gixt-Lc; Tue, 15 Feb 2022 10:41:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJuKZ-003J7g-4B; Tue, 15 Feb 2022 10:41:07 +0100
Date: Tue, 15 Feb 2022 10:41:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Rahul Tanwar <rtanwar@maxlinear.com>,
 bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Message-ID: <20220215094106.k35pmoxt2nk44dsj@pengutronix.de>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
 <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
 <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
MIME-Version: 1.0
In-Reply-To: <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_014133_910210_8E58499F 
X-CRM114-Status: GOOD (  27.59  )
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
Content-Type: multipart/mixed; boundary="===============0445548307102257544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0445548307102257544==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oa7qtfm672zzictn"
Content-Disposition: inline


--oa7qtfm672zzictn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 09:02:25AM +0100, Krzysztof Kozlowski wrote:
> On 15/02/2022 08:59, Krzysztof Kozlowski wrote:
> > On Tue, 15 Feb 2022 at 08:40, Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> >>
> >> Hello,
> >>
> >> [dropped Anson Huang and Yash Shah from Cc: which were not reachable f=
or
> >> my last mail]
> >>
> >> On Mon, Feb 14, 2022 at 10:21:39PM +0100, Krzysztof Kozlowski wrote:
> >>> Hi,
> >>>
> >>> Changes since v1:
> >>> 1. Add tags.
> >>> 2. Adjust subject (Uwe).
> >>
> >> However you only took a part of my suggestion ...
> >>
> >>> Krzysztof Kozlowski (15):
> >>>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
> >>>   dt-bindings: pwm: imx: Include generic pwm schema
> >>>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
> >>>   dt-bindings: pwm: iqs620a: Include generic pwm schema
> >>>   dt-bindings: pwm: mxs: Include generic pwm schema
> >>>   dt-bindings: pwm: rockchip: Include generic pwm schema
> >>>   dt-bindings: pwm: sifive: Include generic pwm schema
> >>>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
> >>>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
> >>>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
> >>>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
> >>
> >> ... The actual patch has a space after the comma, I like this variant
> >> without comma better as this is a compatible string.
> >=20
> > I am confused. My patch does not have comma after space. Your reply
> > had such in the subject, but not in the proposed new subject you wrote
> > in msg, so I left it as is. Without comma. If you still see comma, it
> > is something with your mail client.
> >=20
> > See:
> > https://lore.kernel.org/linux-devicetree/20220214212154.8853-12-krzyszt=
of.kozlowski@canonical.com/T/#u
> >=20
> > Also reply from Vijayakannan does not have comma:
> > https://lore.kernel.org/linux-devicetree/20220214081605.161394-11-krzys=
ztof.kozlowski@canonical.com/T/#m80af695f2c751341bc971114aefa00ccc929a3ec

Strange: I have this mail four times in my mailboxes (via
linux-arm-kernel, linux-pwm, kernel@pengutronix.de and directly). In the
two latter the Subject line is broken in two:

	Subject: [PATCH v2 08/15] dt-bindings: pwm: renesas,
	 pwm: Include generic pwm schema

So this is indeed a problem near my side.

> Just one more clarification - you proposed also to remove "pwm:"
> middle-prefix. Shall I remove it from every patch and use instead full
> file name?

I did that to save some vertical space in the Subject line. I don't feel
strong here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--oa7qtfm672zzictn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmILdS8ACgkQwfwUeK3K
7Algegf/dBLzT9R46q44cuy81Jhbw+cPq5TJjsxMzatiOW6z9KMgzITY+3sdf4tR
wPwWoOZRYJOlQVK2OsQIBh+fF6w6J2rW+ij4RW9FGM6nBkAE4mp4Ac4xqhCovwl6
e6hv7eF8br7+c4hXNxTa43gX7KS5JorkySK+4v0qE+iNDy0+vD81laV3sILWFaPm
e9PWjHuuKzHsWK2iVcoQlLCmbhFHcgBwSarOx8ytG9525zLDq0RwZG8mws1Udn18
SILWaO0/zphzHlX0Fl3VbShlGLhZBHLHI0HdwAjSg8iyj4GhjTUZSxnwXKZw0G/k
fa+SMHLCyStkxfK/oN1jkKah5Fl4TQ==
=9Zp/
-----END PGP SIGNATURE-----

--oa7qtfm672zzictn--


--===============0445548307102257544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0445548307102257544==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6295C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GMXIDGPbhFGyOzazcgpYSGJHD+ZjTkD71QlxmKN4eo=; b=QvDhvDsxuddYe6sw1M14oamiSI
	tfyTgQDEeh/SDjGkqo2Tjx/35g64viReD8G9PKXEPEV/jJ5Uc7Eoiaxt+FfQB2iZA+e7J+JwFHEQm
	YdrE2dJ+OtiOHNFazJ6HdTg+pnzUbH3ICfNRucQTHaDXhzBLTjjaMZoDd+MsHdYSGD5T6kuR6k1AU
	Lzwfg5/98ONCI4mML3WiqJCX+uVHle2mydLXHXAqmbTU4w2WnTXEE4n+DQYD+kPZ0kRRB0cBOKHdx
	W8I8ySUxsm7aBZsk0nIkCZOLGXZI8rQmAs5DUpjal3elxEPtC3aHc7HLIkcwJ46Gahg7MIcr69L8J
	WliRjRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2GL-00414f-Mx; Tue, 15 Feb 2022 18:09:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2GI-00413p-KE
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 18:09:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nK2Fy-0001wD-JJ; Tue, 15 Feb 2022 19:08:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nK2Fq-00GnTY-RA; Tue, 15 Feb 2022 19:08:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nK2Fp-003OCR-H8; Tue, 15 Feb 2022 19:08:45 +0100
Date: Tue, 15 Feb 2022 19:08:45 +0100
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
Message-ID: <20220215180845.vzzqwdaiaj7aqxry@pengutronix.de>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
 <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
 <CA+Eumj42Hojp1m4deuWnqMOaaNaupTSkzPaNbL_0eyBL-aDi_g@mail.gmail.com>
 <7df71f8d-cdc3-4b2e-cf0a-7112eff28142@canonical.com>
 <20220215094106.k35pmoxt2nk44dsj@pengutronix.de>
 <20220215104952.3z7y2t5udwab64kh@pengutronix.de>
 <d042abb2-e5df-42b9-824a-6fc3b9c6df6c@canonical.com>
 <20220215125856.es2euyoqo6mp4y2t@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220215125856.es2euyoqo6mp4y2t@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_100914_687773_23C9EF62 
X-CRM114-Status: GOOD (  17.86  )
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
Content-Type: multipart/mixed; boundary="===============4738860400389365156=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4738860400389365156==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgr56zm67yyqodt4"
Content-Disposition: inline


--lgr56zm67yyqodt4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 15, 2022 at 01:58:56PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Feb 15, 2022 at 01:41:20PM +0100, Krzysztof Kozlowski wrote:
> > On 15/02/2022 11:49, Uwe Kleine-K=F6nig wrote:
> > > [... Something inserted a space in Subject lines ...]
> >=20
> > Other threads - not only mine - are also affected:
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2022-February/714=
311.html
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2022-February/714=
316.html
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2022-February/714=
364.html
>=20
> In the meantime I'm confident that mailman2 is the culprit.

For the record: Using python2 (which is what mailman2 uses):

>>> from email.header import Header
>>> h =3D Header('[PATCH v2 08/15] dt-bindings: pwm: renesas,pwm: Include g=
eneric pwm schema', maxlinelen=3D76, header_name=3D'Subject')
>>> h.encode()
'[PATCH v2 08/15] dt-bindings: pwm: renesas,\n pwm: Include generic pwm sch=
ema'

This is the inner source of the problem, mailman just does something
like:

>>> import email
>>> a =3D email.message_from_file(open('message'))
>>> open('message-mangled', 'w').write(a.as_string())

So we just have to wait until all mailserver admins migrate away from
mailman2. I bet this will happen no later than when Python2 will become
EOL. :-\

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lgr56zm67yyqodt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIL7CkACgkQwfwUeK3K
7Am22wf/QGAYOVL7Or/wGAw+w38cz+S2A17cswpSeUgQ9tVBFPsz54e2W/VEZWVo
dXdS7jXz+yJ994+aOj0azyG0HVLpSFWm4w6bMQwUF/mKMDTBmEQblGYTgRA+ZKog
LS2KEE3tSItn2cgXgzDvsS3jj6ONyOGipMEfFU3o/3Wy9FnTrX/bAy6kxDIDwTVH
KfTm1YMQFP77eyXEueSNZl9ALHubGZqGXwNJ0Fy+IBE/OydoX2AC3oNzslvrPrMw
7dy18agIIqzJ0as+OMD8kpIzxLfU/r4jcqmfSWHF7WNYfE5kfL8A7i+c/JiWtJaO
y4RH/KCKM0Jmb58rB6611pS1iRadyA==
=AUvf
-----END PGP SIGNATURE-----

--lgr56zm67yyqodt4--


--===============4738860400389365156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4738860400389365156==--


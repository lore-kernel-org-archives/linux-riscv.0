Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774AFC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2CD6128B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2CD6128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5B69zKmmwrfKc3brKD7NyIdZGNCEXyxuthAZuIBXMKU=; b=laMo36+jwZPTfrGP9TA6qVUhcp
	YlQ5+a/Bnlo6bZ0UiV5jMBIg9pXon93DF4ufjKUrGAqkCXmKXpK+wjYCNqE4zeilYzS99zZykKpHe
	z1wn0jQaew4PCUOv6AfIvw6nmamAg1PhpepGz/JwPylkkqp/937VJ8m0niVUeVzSWf1cmB5nz1HYn
	n1SY8c4Hzeh6nmjc97aMIlv4tRtVInzuk5f2P59WqbNuHUCOt0j3yYA7yWEBA2SRMGhC5Z57Nvdv1
	m2KKCTStopXK/saTfW3v+zFhdWERhr4yCvA7A8pp67I+hY+10w0ckD5SuaCiRvR4bWj5SVsBXfPbQ
	hVKzAcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltT1M-005t3j-CY; Wed, 16 Jun 2021 10:43:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltSzw-005sRu-Ij
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 10:42:18 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ltSzV-0004RW-VS; Wed, 16 Jun 2021 12:41:50 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a03:f580:87bc:d400:27:4a54:dbae:b593])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 9048463D23F;
 Wed, 16 Jun 2021 10:41:36 +0000 (UTC)
Date: Wed, 16 Jun 2021 12:41:35 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, iommu@lists.linux-foundation.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
Message-ID: <20210616104135.z5bjalhan4ui2ibz@pengutronix.de>
References: <20210615191543.1043414-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_034216_647845_2485ADFF 
X-CRM114-Status: GOOD (  18.78  )
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
Content-Type: multipart/mixed; boundary="===============4614366809829337086=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4614366809829337086==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agvztsrh6izyn335"
Content-Disposition: inline


--agvztsrh6izyn335
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15.06.2021 13:15:43, Rob Herring wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>=20
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
[...]
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml  | 2 --

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--agvztsrh6izyn335
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmDJ1V0ACgkQqclaivrt
76nTUAf+NueTtFpURzEcaqcVzU9on1r9+EA8Cl4Mxhgg3Nw3TGp6enDeBSGPVR5B
MaJtsub8PAEbECezUQxWPaNPa5uvS7dCW5eygZ2z3lDMGZGhYjtv67LVAJgCDq3q
BWNuKMkKu25Ccsxl33ItHRrAmrlcwBcZMfzN+E9OgZ60GySlRv+AxcLR2XiwST9t
kWlEW417Mj0P+cvwFo/3Ms4zRddEiw92YruesAK73pkxrB2u2xqaSy9BqNHZCG/J
F9Q0VsjhTwLAI/7VQohXgcrL2yHsMRJt0M1+XMaxNncf1amrPNo8eWjyNDNbbIIi
s6uvO8FoLgDLRqbX7Q14cLQ+uQmadw==
=ZOig
-----END PGP SIGNATURE-----

--agvztsrh6izyn335--


--===============4614366809829337086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4614366809829337086==--


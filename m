Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5B4C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26A9F229C7
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A9F229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YXWz3TNQ4uiJHwRn8dUp8s6ZTHWnCOF+panE5Q6FYOw=; b=vi/h3sIgUbTy5MOByuq49bjIH
	zML9y1JChfes9n74ZIbf/m8HiO7p+Vu/QwkYpyf1RgitONuUxRhIRO6+2fsh8tM1XtiDMmvdaEpF6
	Lkn5cTEPe7caz4Vrh7YAuxlGRpoWEcy8ypZYXX+udeiLzAFEbTmgSySOqRV/jEx7DbKMolII3tgjx
	YrtcH2EZOK2LOAxzaFIe806YzjBM6AZjt0VkOgT/oFXpWnaT/zMDNbVKzvnbmYG78FbdYNKrIUkPG
	pHgPe7GMtvbAVagslPtjBZ210hBPemrfF0CBb+CSEiMFDeF+kIrCh9+GWuMJoNCpottjsPMWf3/iK
	qei0kZM2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkLz-0004Ud-Ei; Tue, 05 Jan 2021 11:18:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkLu-0004T1-Co; Tue, 05 Jan 2021 11:18:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 736B5229C5;
 Tue,  5 Jan 2021 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609845492;
 bh=GDmYQRHGn/AcnFt3hdxGi1mf2d4j0SgudD/3lB6HiLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGoc1AfjFEcjnH2LG9n6lBEYoM6Ri+jtRDQ3pMETkgkS4xWatgY5WzBCv7tGFTTX4
 9deGZUIgeLAhm1VPGBdYES++ZORJDj29LOoOSG8tACOto7uS1nWJwFUZ5fw3Q/9+7t
 9Rnjcz0F86y/qp986vAfUr6GinSVP0XwPgyXu3vSEN7cNL4OxE10chjJdGA85/nxVF
 lPpoMqPvAHjIz+Tazlv2fQtQtSQARqHG/OYlCfxgVMRWyanIC2bLCSGkFIWiXyTy98
 QR/IH6Kj4pkkDkHe387Q3RpA+JZkCdNIme8yoaM7itWnaNn71YrIoqeYgceFoOyLsB
 SI0+F1HbHOM4g==
Received: by earth.universe (Postfix, from userid 1000)
 id 4BD5B3C0C94; Tue,  5 Jan 2021 12:18:10 +0100 (CET)
Date: Tue, 5 Jan 2021 12:18:10 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <20210105111810.5sdfmjga5in5wgvx@earth.universe>
References: <20210104230253.2805217-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_061814_617057_4486BB47 
X-CRM114-Status: GOOD (  16.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============4119480794287532838=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4119480794287532838==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyuzhxvp4ms2cjlb"
Content-Disposition: inline


--vyuzhxvp4ms2cjlb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>=20
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>=20
> [...]
>  .../bindings/power/supply/bq25980.yaml        |  1 +
> [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--vyuzhxvp4ms2cjlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/0SucACgkQ2O7X88g7
+ppIAQ/8CwCUtes2Mr7K09stdBuNtR3gBayMxcQnnIM6AQvBexKzq6gM2xpDIPB8
YVpTjaGQkOcwS3BMu7BsRT4t2s3KXy9lVS5jkChykskjyAyr9a7QPsK7MVZVRh2Q
U896qS+zI2nsNdeX6+kT10+29b7PcoEvTJRtEPEFlsq4UoFbMAsdJhtHBo9v1oUP
cJMT7NSkqtcHM9HeSPZFCTLyAsoGFPYMTneKdN9ZVlPHoQRkCH0k3vyHMmKKPWAQ
uafDLlP+nvs9Ug/FSsFsoaLcixHHAI+GkVj48muZL7EVAygGTbrRA27r0txduvfj
DOxfT7BdNOMkmDge0RR2vk29V/2WYsEg4vwi3uyP2BDQsdXEYpwTn00IJ5IJgcqE
EAjq7hWsSo7zd8VkMc/CLN1a1W+PEpIJ0CGfS4cLtAMwRLNLdPA+FS4UaBCAoS4k
T9AZGFXABwtQQHyOAHD8/Hjs5vexDnWdvcRyCuDqgt6YeUX6Lu8pRTWx5lkWPkLy
GZf/jppVAnP/gtnsOOJnPL37jxbOpelu+4UopYZ/j9YLJb+M7P2xYhsYuRlnKn0r
aAgoNpEXu3TNpex2apw+Cm70EiidWAGcWqvrOCWhdqWBulGJ+O4v1DYe536LLoZN
rdX4Hbkx7kBMNJ1ZZVIA3x9YzLwGKo/1nnV2q7fUdTzUEobcJWQ=
=gWL0
-----END PGP SIGNATURE-----

--vyuzhxvp4ms2cjlb--


--===============4119480794287532838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4119480794287532838==--


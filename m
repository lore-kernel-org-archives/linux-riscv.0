Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119DDC4741F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 20:03:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A597E2100A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 20:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsDu3ZsG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbgBQYYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A597E2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PadtTcGmaZlUVoeLWX4flmISLjiJozSfli2F6YdajGE=; b=FsDu3ZsGt3Jq7G+w182H4h10x
	eOxNJeIbTNl0QuQrT4QfJm3xB4aEj6GF3/9rca+Pbp+p5MY/2MbVv6lu4rGzbwC5516a0OzAVTMQU
	RQ86seT2EMvsI0n136jNy3p5l5SEPiVOZ2mPwdv5wCM6Nel7ZjIbiNv+yTZuo+CCyR6uh0CnBVsff
	c6CkpajO+WpYn9ph4cFm+bnuUUMzPkJMo+17IACnmdFLUMb4lFYRdiajmbJ+zo/pRPizNHT9d2gbD
	mqDGLp1rsp5JMr8fslSSP7kPKnDSTFF8jdyyGv7Ijv6t7VUI9z79Hrj7ZSZvQf53ek6gduj2fq2n1
	uwseMW8FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPWhP-00022v-G0; Mon, 05 Oct 2020 20:03:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPWhL-000211-8g; Mon, 05 Oct 2020 20:03:04 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F4C920848;
 Mon,  5 Oct 2020 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601928181;
 bh=LDBMzSKRgXu0amszn1omwesfIy1frb2RvkSUHKCGJBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbgBQYYNY8Z0bctQfKlo46vuzwcO7cAJTUA6WI13L1pEYpu6vA8L99qk3PZzFWPH2
 fgJHuHFAkVTZdQ53sCs+i/L1PeWZsSHlt6UaHeg3IMRhnUNJ4vPDlRp6puBpdniGsC
 UK6eoAqXgECVDuSR5AsDUKOCMwvFsyrqkopv5GUw=
Date: Mon, 5 Oct 2020 21:01:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Message-ID: <20201005200158.GG5139@sirena.org.uk>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_160303_491754_A3E24FDD 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============2635330228244206072=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2635330228244206072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Content-Disposition: inline


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:38:27PM -0500, Rob Herring wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.

Acked-by: Mark Brown <broonie@kernel.org>

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97e7UACgkQJNaLcl1U
h9Cm0Af/WUxMT7VSA2xsxQr5K/rX2H6z1aD4Hr9f+lQLJCFBiUYhNvb9mQnNDvLq
GQeaW1Z1gDtmjIiEOvan3CP1ZUF3VENvyt8orPUmES76eFXx7xEyryHHut1YFimr
3LEvyKzDAcn3KGj/wv37knBc5sifrmqjF+Y1eYYZD6yKKVPbgpA7kKZ0EAqOLxiv
/FbGoxWGWbB7Vfyaboo2dDw/SyuwkZ9+0pr+IhFWbCjIjgkeUq0v857luuRCJMxH
GyPjPkM7+KaeIBbXlY1hRHLTKKbBL7G+dXQ16uS4Ny/DYIf8LXyitPDAfosxQisG
FhLawubQBH3MNzD5RRYvcLznUaJJJA==
=+I0x
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--


--===============2635330228244206072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2635330228244206072==--


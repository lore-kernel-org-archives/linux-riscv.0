Return-Path: <SRS0=YukA=6A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811D9C2BB85
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 10:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DDA21D92
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 10:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EOVl6SJY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLx+neJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DDA21D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbIJJBCyxb0zjE+EsVUIseBGje2iBqdBzd3TawdCtII=; b=EOVl6SJYZqCw/Am84Jc3MWdl6
	AGZNZcRLV0ZthPncr0VstZxInvirmzl0ei15x/JZOjKW0O+419oM2MAQr0/k6PjFmUHNAJNdYJ1A8
	zla1nctlsDyewGkW53Na+XiUIF5INdzfRocSl/Re6KStjkBPMKx9LIfVLrMOF64Xu5qMXZMFxqfnr
	BMYbh2Axipu+gqNnXTr0T5DO3Ce4LP8djAMvEzvvI4PoB/e9f7BX6crfQ7T/JuD76iD97l3XftNWa
	1jnTcVDklzOa5zdqDJc4Ckve133FYXVU2k2ODwejn4EuT2ApwESOYRlpHpHOeeZ8WVrGLWbSHvHLc
	Id9aFcAoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1wn-0003Xx-FT; Thu, 16 Apr 2020 10:40:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1wa-0003NR-3m; Thu, 16 Apr 2020 10:40:29 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BEA4206B9;
 Thu, 16 Apr 2020 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587033627;
 bh=PbIJJBCyxb0zjE+EsVUIseBGje2iBqdBzd3TawdCtII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLx+neJh2XiUym52/Y5To6wDkJdF+YfeO3N39IXBEI/aglNs6bS7P/uMNiV4FoJl3
 TMp7QxwJIyoECwfzV+F5isAyTkbeACxvuyoa8MrjQkJVF1B64098yNWGLrS06i/htu
 0dOZ+2iYr9R63yIwg4ubkL8oPIU3RmTo6iLh2Iwc=
Date: Thu, 16 Apr 2020 11:40:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416104024.GD5354@sirena.org.uk>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_034028_196939_54FC2F8A 
X-CRM114-Status: GOOD (  11.51  )
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
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.

Acked-by: Mark Brown <broonie@kernel.org>

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YNhcACgkQJNaLcl1U
h9CTpAf+IW4icH5zPKy5c7TecTxfEyWNDjNTt8Pa69ga67NVmMDHKzueRcPb7D3e
ihhK7zM0HDSd8aebO5YtW3GiVBBUyJ0m1CNYvbcsJscIhoOoco+NPJUss00w/0Zs
L0RHGHcgc6lhNve8n+r6QbzSYEeeT9QhqTaPtyPnvMDRUkAYgShAD0ejHjNQWYOt
3KuH8RD18xfK/PWSRsrrxCY3flOTx0RIpS9+oyO+JWIcKd6Y5lCZiBAXGrXEdEjx
bgRsC/mO1YSE03iuDgQnodKThzIoJrygjOkGGDJuYsKY5erh8JZ93l5KPoLkyKCT
SSA9qjNaVs+wMuSlq8WJ3w8m+z5cOA==
=dNaD
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D1CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heQ0inuggcAzD1JtRhDwpufAXkOxbLXKL03zpynZzfk=; b=h9fxrea9b/5kqsoG3uxnw+wql8
	7s9MF5xTVomRI2quO2CBc0nDUTUJD3/s75v1vBAKwo2XCh6PeO45NBX4QkJNKxaP6Dp1/wteOxRqR
	NrAZZQOjBwPBe2TbWa0f6AI88cUtCpqmCnv2EdKTeULBMZqRn8xqb4Yow7uOACkARy1GhhGiCq2nL
	cHVu8a3z1+J55cnRPpKH/VPKk5uFqLLt4EwtJjpbFKjyRsGMkXgIL51hAdpsk9lwBOcIyr9ADNZZk
	Q9w0hgC+RX4GsQpRokKGiL8opAS4wPZJhAKb3BGI8SUshiJb2aUdziW7WqjTdV3807AJn/ZmQzha0
	9v4/SB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrp2-000VW6-R6; Wed, 23 Nov 2022 15:38:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxroU-000VHt-CZ; Wed, 23 Nov 2022 15:37:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B618861DA6;
	Wed, 23 Nov 2022 15:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47180C433D6;
	Wed, 23 Nov 2022 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669217845;
	bh=UanCtzyfyh7s6GC+lB/BgGuUYEuJMVRrxquRNUED7QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6P+8V1/dZMe1Sdy38Jer2Kq0kWOQcWPpch/6FCsgX7mogbRiZx+nRYmaqo4cOT5c
	 2VBhRCgyAp1QZeQHA3EETx8HSmmQjCOuPPa172HaY1MAN9akX9CNVq37lxVTz8BMr8
	 BBLccHPaIU6D7mYb41M582jELquyQZxntjmwvKYXyotA//5tW/2MbJATyer9nFW/f0
	 ufcjB46KzIThaQo20IBXLl20DeebxUayijZK5CPRM4y+7O6LBfTdsu4RRUcLHP5KOK
	 b4r/lHFcNKfmA5EJjEfSCvbMR52QJimK5ICXr91dLn0KonGcS4j6q3bU+aNI+8DhYx
	 YzSjHFJvVHfAg==
Date: Wed, 23 Nov 2022 15:37:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
Message-ID: <Y34+KaMMI5H/qBlI@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073726_483899_45B4CC16 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Type: multipart/mixed; boundary="===============0558211369403547850=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0558211369403547850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3/TYdFfqHAXL0OZ"
Content-Disposition: inline


--c3/TYdFfqHAXL0OZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:10PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--c3/TYdFfqHAXL0OZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+PikACgkQJNaLcl1U
h9Axvwf9HW9i1/TYYTLxyy8fUtu5a3P9a9v1aqZ5Vk5GOoY4gLBJ+Nn6TQz4e3WA
B/mLs0ELXPm3nJVTGPQfpqgCN3STLaUwDcVJIskltCSFn08YUWFcyfkQWyBkAWym
cNTiF+sk8z6Aw5orSNcjJFWhpEZejA/1yQ+eBJbfm3d44vR/G2D5tMGJXmbE3rEA
bRa98QZef1l34JDi6+gadC0w7LX4jj8Q41K/mjRuLqdmV6BUstQvCsKC/8YIeoua
G3jLmit5vd8KXG2eEiqK2lY2t5FBYlNLXqLoaE2yjZFcmvABd6Vh/2JDcOOFeBpK
sPr6SAIesrsLQzCHS/nuT/saF9E/UA==
=p0qY
-----END PGP SIGNATURE-----

--c3/TYdFfqHAXL0OZ--


--===============0558211369403547850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0558211369403547850==--


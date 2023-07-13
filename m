Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E068C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIVhlqmyk2gRjXzJYQeebtdhtrmndbKI2+WqOGWpgug=; b=bYHZIuEA6iiPMQVRAOugabsbcQ
	loX0kau9OfhF+6lMjq9027FYAlHN+rvDh4QSVCMUlowEWwkU2Hbv1NV20739h/roSzlMD/+CNqTL7
	YQCIrOf91/GrmIMAzA31K3a+SRiTFy1NGfVEELzpdIQBEOoMR/62UoyLUbnUO6mHl5fK8BmX/Yg44
	KlQgYcucC/Xj/E3AkjylSYjuwdgQNQ7im2u1ksXA13o8dG1gKV49qcpvbZv5qhV8Aief3KgHzlCBW
	vo34rs7Ny7SOQPVSmPAXLtTs58MXo0lmVWZMIlLUX6FhMCcWpdMnyliHb1tAZPJEt7Q0pDjMXXT9b
	qSc39Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwgK-003Seo-1C;
	Thu, 13 Jul 2023 13:48:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwgH-003SeQ-23
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 164F061539;
	Thu, 13 Jul 2023 13:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EBEC433C8;
	Thu, 13 Jul 2023 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689256108;
	bh=aVFkOdZiMIHWVq2IMmFdy8HY77pkeHTrC64KlWEXfQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KW+LnXsT5S4/XdZXg2Un2kQeTTXap5cG0rVSxTcMqCwnkZ0VH8wOYZviKW3+Pw+dG
	 GhtNrnE6pF7HU9UMRkgLvopDXWUio5yGWcLNuswitR9UtV0gLLm6fO476wfyzWhljU
	 npDfKMQI4bRV8cmJAxvIUSCgsBCCKQMWiOGBHTWDxtk4M3taVPmmDVbV0KtK5dwP3l
	 6tFJ30y5QT/TC/UYTn/fFWAyYoSKwudLuYkP26lFQrARkZvKVk9medyApVYoObHSBD
	 fokyi0gTpieaRBqWTl77Uqq1ULCOjWl0SKnWtdZ7aZRENhGDj/+bLwYAhnmVk1wX27
	 FroSouUHpSbWA==
Date: Thu, 13 Jul 2023 14:48:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks
 and clock-names
Message-ID: <5ef17d53-460c-4281-a241-1622a24bac5b@sirena.org.uk>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
 <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_064829_712885_85AF5DCE 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: multipart/mixed; boundary="===============7576792950068165567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7576792950068165567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dpyDkCLVucMmtixK"
Content-Disposition: inline


--dpyDkCLVucMmtixK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 02:39:19PM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2023 14:28, Mark Brown wrote:
> > On Thu, Jul 13, 2023 at 05:00:14PM +0800, William Qiu wrote:

> >> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
> >> so there add minItems whose value is equal to 1. Other platforms do not
> >> have this constraint.

> > Presumably this means that this is some variant of the usual pl022 IP,

> Hm, in such case this could mean we need dedicated compatible.

Yes, indeed.

--dpyDkCLVucMmtixK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSwAKYACgkQJNaLcl1U
h9BpEgf9EY0uJQAMe4MnptnRo7jvpMoIHgFT017s7FDsYZ5NJtmMdV+t/R0nQUg/
gVRSsP2/f4GMNQokTmIV0RlLIQMBS7CrTlds5WQ31ok7G9fdsTEv/n5BWikmbCuH
nFlnrUws6Ag7LUsFR0rFdL/uq/zbFOAMzykz5YLuEXVpdSb9OoPJQOrEBQk6asui
bmhE12NziQo0hSVP1pLaUxOz8RLw6PqJUBHp8QFQ+5N7dXgtp6ALRHEWftboRZiX
+RFT/oUiscAXFtGDobmLvCHkPSCbLflxkaXuYUSdZP9AStWND38s9uFV6OE9O2hZ
U1BGVb2xUcGVvWdal9BSvSnAHxYS4w==
=sgri
-----END PGP SIGNATURE-----

--dpyDkCLVucMmtixK--


--===============7576792950068165567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7576792950068165567==--


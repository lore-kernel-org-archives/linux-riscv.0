Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4E9FEE4EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfaAbvgBVVRaHmr+E5athiiO3NUtx/5E4q4BYT35/Hs=; b=gVlHRux3Kee8ZApqoh2HRfrfzh
	Y2u5l6A2NUYCXZzwqJMgP/DquivU+vzLkO9JMNn1dgPIc8GXIQAVxV39gdzuNT7RquLrlSjndh8dQ
	YK+dQOfX4HsIe8l+7NONiYzkMUWKS8RzqzK7vQMXJenrIuW93+eruIGXUC+oQcwu4OjGJ6tvWMha6
	wAkgQbTgGGPoA+QS3Ce8gGZ6zODLr7AiwkYLne+0VbC17AKowTbKdloLBSIPR3MGQf4/OBtymSaSe
	kzTwmXI4/6jiVahNHXrluS+mrCA3t9UBse9EBZNhMXBw7HTuilRqeD4sjkWiqEFBgrSqSnv2BtzrR
	eh6PCK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKxc-00000009uCu-0LrW;
	Sat, 28 Feb 2026 14:06:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKxZ-00000009uCV-2cIK
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 14:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9555C43693;
	Sat, 28 Feb 2026 14:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D03FC116D0;
	Sat, 28 Feb 2026 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772287580;
	bh=OuFpW7GoYGTResxLjAuhGe5ht2LqnEjTTjg2Wm355z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UC1HyZPZ6K81+9o2WbodhgeeZgbiP5jYg2ezeKlI9Ad/06eCbBOiOsab4ujyebXmX
	 E8uxvwXTntA94y6B80mdKygAKY7FOKh+1Iww7EEc5I16PNJ/O3HmehP8dxUF/Vmws3
	 VPgELYmQDr9phquflqG4h2kxpYzg4KMjEC+pwM4eCwf6Oxc9TGoFHK5UBMt3xtLPIP
	 QlLbIPDBaXmKY0FPghbiHlYl+7C8VlffH039ErvGuvl+gp/a7nww8eP2k4ONdq3SBa
	 8Fp7tKzAery8zHt787jJF91m/7ENAGaxEp8nl/lW1tdHJENCCqseU5qJHNUV4vUEc3
	 xLpwpXIy8lRhw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 899191AC58E7; Sat, 28 Feb 2026 14:06:17 +0000 (GMT)
Date: Sat, 28 Feb 2026 14:06:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Ron Economos <re@w6rz.net>
Cc: miquel.raynal@bootlin.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	wsa+renesas@sang-engineering.com
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
Message-ID: <aaL2WVO_7bl6vNp5@sirena.co.uk>
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
MIME-Version: 1.0
In-Reply-To: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
X-Cookie: Think big.  Pollute the Mississippi.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060621_687821_6B18BCF5 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2480585401852447518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2480585401852447518==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1QHX/mME2VFCCv5m"
Content-Disposition: inline


--1QHX/mME2VFCCv5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2026 at 05:54:06AM -0800, Ron Economos wrote:

> I'm getting an SPI failure with Linux v7.0-rc1 on the VisionFive 2 RISC-V board.

> Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
> Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: detected FIFO depth (1) different from config (256)
> Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
> Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is still busy after 500ms timeout.
> Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: operation failed with -110
> Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: probe with driver spi-nor failed with error -110

FWIW confirmed on my system:

   https://lava.sirena.org.uk/scheduler/job/2504026#L715

(which I didn't notice as that was just buildroot and not running
kselftest-dt...).

--1QHX/mME2VFCCv5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi9lgACgkQJNaLcl1U
h9Cahwf/X2lWZ02gUZqBzCRlGgqNNOrt3hhesJOQcaCTKwNfhs0mVUNOpqMJcyrp
dZO/ehDwr4ofNwYqVa2qr/zbs7CMFqJTnaTbJTp5n5AHVX8WIy0ZHa1JQ2Z39iVP
MjjE4TNPfZ/ht7r44Isttib+S98V+JOvKHO8vXfqcqeqiLQ0ARIVbHKzTL1gAoeK
z3TftTfqmZuLPQgzu5zPRzoaiMuXWtzYwgkgC3QnyWK5RM13K+kXRMFcG42kNnqk
O+b/YICZI1uhBq8I2rxzsXg194+Znqq9k0Q6xNDG0CzJboQielUBeTdm+mb5BVO8
pHvPrFtV9RPaymjIl4Bb2jYklAai+w==
=MOC1
-----END PGP SIGNATURE-----

--1QHX/mME2VFCCv5m--


--===============2480585401852447518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2480585401852447518==--


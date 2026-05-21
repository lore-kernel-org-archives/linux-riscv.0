Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D3CD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuJja9DKQblhWxFkrP2BC6Sbbo738hmBdn1PUAnFxxM=; b=GnC8pkOWMWkiFKCPM5JkfEBBHE
	zcw5HjGGUWsTDnoj8VCl4Td+IBlykWUIUr4CBp7mR8aMSV+z/CVyuRbqvog2/KHg+XWTUZuop7eQS
	uzceeRlqpMMmLA3/elBskPSpWoXvfHK3WfbqOG0BfR09WB5EtWSx8gOFVpJvBOMhbAMpgT+DcvPg4
	e3EhOh/+fj81vhZFNHMg3Vz0BviF+MqDvlhq3GEipL2zZDEb4F1nxtDbNWH0MZfKVmJUye6nECOZ3
	1Kce5z/BG9G6pk8VljasZB79IebynD5t8duWjTQr4zKsNOweOR0JRAmnkC7vkGcyd47eCEFtkUHa5
	HnM6//0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9LQ-00000008wbo-2bcW;
	Thu, 21 May 2026 19:46:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9LP-00000008wba-13an
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 19:46:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DFDC60098;
	Thu, 21 May 2026 19:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E29D1F000E9;
	Thu, 21 May 2026 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779392770;
	bh=Fl5Rt2JQDBkzN2IYCYCNYaDmr7KbbjfvidjX3o3GvT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmDSF4YxGK5lwh/3XI1QId7FTwnvYtyg5GcUHSUYLjdVDqUTh+tz9sXyQZRnVa36W
	 FLZgDGbkeXI5aKbhlWW0rdho0Z+rUjF6Si7m2ePcBUSRKf3sUYHlsTPho0wvE/7Acq
	 efzddQ1TtpyTLtcNg6KO5bIDIJM21Z0ffOGgF1wmWUSWCIhUH4C+hGwWxmaJReYQh8
	 FoN0z0TqL3bpiURNqKHOiMo9W4wLXZi/MKKzX80wFo9nqNrQds0ajaPN6KfzvwMlp6
	 a6+yIEDdcsYwJdeTZ7QIQdjw+4oioynjwxqZZB4VL2ZIbn+IGU+OEyxRPjsT3nY0bl
	 f6/jbTabO8O5Q==
Date: Thu, 21 May 2026 20:46:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Wei Fu <wefu@redhat.com>, Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Message-ID: <20260521-justly-power-2cc7ebc7b71e@spud>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
 <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-1-52bce26e5fd8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-1-52bce26e5fd8@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6771651465200054742=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6771651465200054742==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q1v/qv2VOGr4z9Xj"
Content-Disposition: inline


--Q1v/qv2VOGr4z9Xj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Q1v/qv2VOGr4z9Xj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9g/AAKCRB4tDGHoIJi
0vF6AP9gFrzDNEgWZsaPmwdKK3f9biN7qcrDFQj/muohigql/gD+Ka6ru1AwIEwJ
P070LTEI8edHNAQk8SECkFyTMhMHlgM=
=VhWP
-----END PGP SIGNATURE-----

--Q1v/qv2VOGr4z9Xj--


--===============6771651465200054742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6771651465200054742==--


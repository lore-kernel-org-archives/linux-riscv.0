Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954A606D839
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+MQGLtR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A02QhSiN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gN4oAtNQzapy7yL8EDEJw7+nxmw1JelXmeDVYUThioE=; b=B+MQGLtRHU07o7ZqKhXSkjSVif
	VmlRzCqEMnm6+0LIL7+Fr8RDQTCZdS+ciqSGYFDS2G2K+4f7omrtJv0mA59MHsXP21Dt9ZfamBok2
	eYUiRDzElHoXbAHwWZpRlQIhdP0bjwEPrTHh87DuLrcvSP+jzHVznLz4fdggSSU27uQFxWkOzsf/O
	KavBRkk16KZxmZgJIGOJtyFfZ+1JgQRixhy/+my/TwjvjnjSTsQm8o1tIhGP9KGr47IpT84VfIWDx
	omeL4sxmR4wvWkIEBJnop0SAnd3Ca3T4093+xT9YXXuaaHbYm/8gtH4L9QqzpiPZsRw8/9BAI97JA
	HpV0Y70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHue-0000000C77i-3ajj;
	Fri, 06 Nov 2026 11:15:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHud-0000000C77D-1A2a;
	Fri, 06 Nov 2026 11:15:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9C040AA2;
	Fri,  6 Nov 2026 11:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399231F00901;
	Fri,  6 Nov 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963714;
	bh=dVDv9rKtKm3uc/SRgdflJogWFO4h+MZZZBsSymmU5Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A02QhSiNE4NGPTUQCuGzj1iVBhYgM6BX6b8C1BIi1P8xENfZS5qBw5xYcHmUU7yJP
	 QFiY3BpNAKalSkeV6ypjfhFpcaz30JAR4nzP1PSqb9v8YLjXnULCpKqSXLMBgN0a6E
	 +xX8B0Bl8zinzI1WnT5W9ohsnY7q6YagJ1Fy6yRVzgnbY7JmhZKsCg6PJFe2dsggRX
	 9glf8NfRlxGp5aI9VRxmURiWvXy47HuWg9e86W8yQJgePIoPguxJNDYdFzi2rf4zTa
	 CqYqM7X8GaDsWXsS4wG1R/+EufT/LXMzUPt4Rr+2fhTzNvRr12X0jGqRNusji+xoVT
	 VbYMqHs96NyZg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D1AA127E856E; Fri, 06 Nov 2026 11:15:09 +0000 (GMT)
Date: Fri, 6 Nov 2026 11:15:09 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jun Chang <jun.chang@metanoia-comm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/25] riscv: add support for the Metanoia MT2824 SoC and
 MT5824 EVB
Message-ID: <f6bb6461-c9d0-4685-8c93-7e62691a93b8@sirena.org.uk>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2357517218207985953=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============2357517218207985953==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZXWeqLAvAJo/GorL"
Content-Disposition: inline


--ZXWeqLAvAJo/GorL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 10:29:57AM +0100, Beno=EEt Monin wrote:

> The series is organised as:

> - patches 1-14 add the device tree bindings, the Metanoia vendor prefix,
>   the RISC-V board schema and the SoC block compatibles
> - patch 15 adds ARCH_METANOIA and selects the AX45MP errata
> - patches 16-23 add the reset, SPI, watchdog, MMC, PHY and USB changes
>   needed to build and probe on this SoC
> - patch 24 adds the MT2824 SoC and MT5824 EVB device trees
> - patch 25 adds the MAINTAINERS entry

This sort of thing tends to work better if you submit the patches for
subsystems as separate serieses, it avoids enormous CC lists and keeps
the individual serieses a managable size.

--ZXWeqLAvAJo/GorL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau22vQAKCRAv73Ows9A4
iSNTAP4rU2Xrvxi8fy+eP8UEYNGho+uarNFSdWt9hM96/9EozgEApzMYGgxBMFYZ
W99aAqcYjlf4CTh09AToNdhaBlDyUwY=
=kTKE
-----END PGP SIGNATURE-----

--ZXWeqLAvAJo/GorL--


--===============2357517218207985953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2357517218207985953==--


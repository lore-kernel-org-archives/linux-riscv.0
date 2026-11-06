Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2E606D808
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vwAPvW0E;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ag0eQnT6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDROn1y7+hkGCoHhwDjkYUtfMrdRSELfNa6kcwIHonQ=; b=vwAPvW0EgZYj8FXD5aLJ4ZDAAt
	OpEunLvPbR72llYJQqALJE24v65DgR4o7dEar9WYJKkJedtUyrc+kzY3Xw8/yDfEFmYF4U7fGC99J
	C0VUhwfIyzSn7aQn12od7JdATYfv+D7se668Yzx4pRE45jL/d9lXY5EnTXQImOoPFh4T8fCm7tjgh
	afHhcJ9PSA1Wy7WhvU84Hj7sybZeodkExWZxiEtjz3ootbBFikfxB5nn/F3KeS3Bz5sO3bGxQPJEG
	mXxA5Jcdn32oJLzMiPxaBC4UI5GBDj4NRpwB8xKFyrNP6/hiey/Z2zkQVnJOjYwZSPIKSO2XtUKQJ
	8p9DKJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOx3-0000000DR50-3EWr;
	Fri, 06 Nov 2026 18:46:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOx2-0000000DR4X-1fNj;
	Fri, 06 Nov 2026 18:46:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A09D601E1;
	Fri,  6 Nov 2026 18:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74ED11F0089F;
	Fri,  6 Nov 2026 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990770;
	bh=6TYaT587yULVEsFdUlV21e0IlEIkrM/S8nTlyyj5duE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ag0eQnT68Qn48+lD/gKwyNvXHdwktPEYZRXu+mkFQY9vzL7wiMhYgWeuG+JY3KsEF
	 gI3XCn0aWsviJENdO79ADtBJ4wfZIqOpW7bHvPyXu5Yx7OAaI64goY95XQoscGuga3
	 RiRZJJ+z/HCAmj4OreqwgRKM+/JYt0+pMQU8Vi4xBe9mSgJSOH8KtXW9Mw/WQ3o4OY
	 mrux7OQRSU/obswR+R8vfPypl/xQz/SLtQ2oRx1EySjeD+3V+DGTpGrrAHC+sqD+48
	 zU0B/50JD3C7b1U4wU/hmZFCOReDSKirjZePi9z/7MbizoMhTqfACiM30W+Y2YprUi
	 C/pdfJQ6qj/LQ==
Date: Fri, 6 Nov 2026 18:46:01 +0000
From: Conor Dooley <conor@kernel.org>
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
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
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
Message-ID: <20261106-annotate-roundup-3cdf03205a91@spud>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2569583604152175919=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2569583604152175919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O+KStvozO2m15yOI"
Content-Disposition: inline

--O+KStvozO2m15yOI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 10:29:57AM +0100, Beno=EEt Monin wrote:
> Hi all,
>=20
> This series adds initial upstream support for the Metanoia MT2824 SoC
> and its MT5824 evaluation board.
>=20
> The MT2824 is a dual-core RISC-V SoC built on Andes AX45MP cores. It
> integrates two 8250-compatible UARTs, the Andes PLIC/PLICSW/PLMT interrupt
> and timer blocks, the AX45MP L2 cache controller, a simple reset controll=
er
> and a system reboot controller, the ATCWDT200 watchdog, one QSPI and eight
> ATCSPI200 SPI controllers, a Synopsys DWC MSHC 2.00a eMMC/SD controller,
> and a Synopsys DWC2 USB2 host controller with a reset-only USB2 PHY.
>=20
> The series is organised as:
>=20
> - patches 1-14 add the device tree bindings, the Metanoia vendor prefix,
>   the RISC-V board schema and the SoC block compatibles
> - patch 15 adds ARCH_METANOIA and selects the AX45MP errata
> - patches 16-23 add the reset, SPI, watchdog, MMC, PHY and USB changes
>   needed to build and probe on this SoC
> - patch 24 adds the MT2824 SoC and MT5824 EVB device trees
> - patch 25 adds the MAINTAINERS entry
>=20
> The ATCSPI200 driver gains optional interrupt support for PIO transfers:
> when the controller IRQ is wired, the FIFOs and the end of transfer
> are serviced from the handler, with a fallback to polling when no IRQ
> is available.
>=20
> The DWC MSHC controller on the evaluation board is wired to either an
> SD slot or an eMMC through a board jumper that the SoC cannot read. In
> the absence of a fixed card type in the device tree, the driver probes
> the eMMC first at 1.8 V and falls back to the SD slot at 3.3 V. The
> controller also needs custom tuning and HS400 PHY DLL handling, which
> is why it has its own sdhci_ops.
>=20
> The MT2824 SoC contains other controllers not yet exposed (I2C, GPIO,
> pinctrl, Ethernet, DSP, ...). This first series allows accessing the
> evaluation board via its serial console, and all its storage options
> (SPI-NOR, eMMC, SD card). The watchdog and the USB port are also
> available.
>=20
> The driver changes do not depend on the DTS at build time and are gated
> on the new compatible strings. For merge ordering, the DTS depends on the
> ARCH_METANOIA Kconfig entry (patch 15) and on the binding compatibles
> being accepted. The patches can therefore go through their respective
> subsystem trees, with the Kconfig, DTS and MAINTAINERS patches going
> through the RISC-V tree once the driver and binding patches have landed.

I kinda pointed it out elsewhere, but that's not actually the path for
the Kconfig, dts and MAINTAINERS bits. They go via the soc tree, after
being applied by a metanoia specific maintainer.

>=20
> The series is based on v7.4-rc1.
>=20
> Signed-off-by: Beno=EEt Monin <benoit.monin@bootlin.com>
> ---
> Beno=EEt Monin (25):
>       dt-bindings: vendor-prefixes: add Metanoia Communications
>       dt-bindings: riscv: add Metanoia SoC-based boards
>       dt-bindings: reset: add Metanoia MT2824
>       dt-bindings: power: reset: add Metanoia MT2824 reboot
>       dt-bindings: phy: add Metanoia USB2 PHY
>       dt-bindings: cache: andestech,ax45mp-cache: add MT2824 compatible
>       dt-bindings: interrupt-controller: sifive,plic-1.0.0: add Metanoia =
MT2824
>       dt-bindings: interrupt-controller: andestech,plicsw: add Metanoia M=
T2824
>       dt-bindings: timer: andestech,plmt0: add Metanoia MT2824
>       dt-bindings: mmc: snps,dwcmshc-sdhci: add Metanoia MT2824
>       dt-bindings: spi: andestech,ae350-spi: make DMA and interrupts opti=
onal
>       dt-bindings: spi: andestech,ae350-spi: add Metanoia MT2824
>       dt-bindings: usb: dwc2: add Metanoia MT2824
>       dt-bindings: watchdog: andestech,ae350-wdt: add Metanoia MT2824

Other than the tag issues in most of these, riscv and dt wise this looks
mostly fine. The reset/reboot stuff and probably missing clock support
are the only real problems.

Probably, I would split this series up into multiple smaller
submissions. spi, mmc, phy, usb, watchdog at least should be their own
mini series. clock/reset should probably be another, presumably also
with the reboot thing. What's left (interrupts, timer, cache I think)
can stay part of the dts series and probably go through the soc tree
together. For interrupts and timer, the maintainers are usually not
super responsive in terms of binding only series which is why they may
go via soc.

Cheers,
Conor.

>       riscv: add ARCH_METANOIA Kconfig entry
>       reset: simple: add Metanoia MT2824 support
>       spi: atcspi200: add optional interrupt support
>       spi: atcspi200: allow building for Metanoia SoCs
>       watchdog: atcwdt200: allow building for Metanoia SoCs
>       mmc: sdhci-of-dwcmshc: add MT2824 support
>       mmc: sdhci-of-dwcmshc: add MT2824 tuning and HS400 support
>       phy: metanoia: add USB2 PHY driver
>       usb: dwc2: add support for Metanoia MT2824
>       riscv: add Metanoia MT2824 SoC and MT5824 EVB support
>       MAINTAINERS: add RISC-V Metanoia SoC support

--O+KStvozO2m15yOI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4gaQAKCRB4tDGHoIJi
0nenAQDXOOACr5dTLojlsekDLPEmerVvDKLX9MTt2AL32IK7ugD+NliqmV6l2V/K
f/dhIRRWsafkCoQptXJ5wafLha8CkAM=
=fT+J
-----END PGP SIGNATURE-----

--O+KStvozO2m15yOI--


--===============2569583604152175919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2569583604152175919==--


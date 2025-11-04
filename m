Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F6DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY3STG2HBiDDLcA7iz7aiU+WOxY2PEB1FHw7gyHQDyM=; b=HnAgOb4VJNaKgp1xt5oQFnZFVy
	HPWplorD5nKDL3sz7cA8nUK+bQ/ULY+fRb+dZsAdov60GjjlgJSM7Ji+MDG+UOnCK58/4gREHHeBh
	i/a7FR5LlR8wi/I3epB0mTGjrn6NSxTU7mCRy7SibC8jdatKyd7dZFgOvo+rFNqOlPiZsZJ9Vbvu8
	9QotnhZna2rR/1lD/fgBEQo6Wu59dpYCw9qIrE4c40OtsCIGaa9RNr7pQGDrL6ChfXpjcq+xUOUVJ
	ax4LgBoXN1JEBDudWA+Riyl0TsQNpoB6gt970Im2wKcqUgwQR+JBOcjyTSOu3wYGnUJDl2N21DaFx
	pflQW6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCiS-0000000BSaP-3OKP;
	Tue, 04 Nov 2025 08:48:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCiQ-0000000BSZs-237y
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 08:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762246114; x=1793782114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TTQr+0R+W0AqrqEoPVc7J5rpzXqWM5mmludeeFcg23Q=;
  b=xCDGulkj7G3MU4lQjBZO7C0bRJnEeJ7kHdKqXt9EsnVaJgW2k7o6XSOn
   oZVlyH4kdwHbUHZ7cffIJqsYg4pxdZFDPfat0Bj7N4npd4Uk1Kq1gRL02
   +A+KH6FDKZoV38nfMqEa9LLUFG8HcwjN9EpNdTaw1yqHxfzEfB7jtp1/X
   ILVFe4+0ZuiVLl2mF/bq7tt6/5DVO8rBSUzVMDkdiVZyMo+vb25L86EQo
   fiqZtzhNU0U7zl3rFqvThIZeHna64JQyLh8EfN9RyDfl6FENKZdQy1UUA
   bE1nScCBoluCSUnUzIbUZ1YrHIKWA6A7kvEZh3SGh0ygEI1/aRetuHLqj
   w==;
X-CSE-ConnectionGUID: cuBV7z19QNieLgsXxlf1Vg==
X-CSE-MsgGUID: AMkxw+pPTB+e2XdkMflsTQ==
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="asc'?scan'208";a="215994660"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:48:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 4 Nov 2025 01:48:08 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 4 Nov 2025 01:48:06 -0700
Date: Tue, 4 Nov 2025 08:46:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>
Subject: Re: [PATCH v1 1/3] spi: microchip: rename driver file and internal
 identifiers
Message-ID: <20251104-paralyze-creature-d2ab0ce2566a@wendy>
References: <20251103160515.412706-1-prajna.rajendrakumar@microchip.com>
 <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20251103160515.412706-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_004834_709990_92D03237 
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
Content-Type: multipart/mixed; boundary="===============7198457429622519016=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7198457429622519016==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dbyOFFU7ujEIU9/Y"
Content-Disposition: inline

--dbyOFFU7ujEIU9/Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:05:13PM +0000, Prajna Rajendra Kumar wrote:
> The spi-microchip-core.c driver provides support for the Microchip
> PolarFire SoC (MPFS) "hard" SPI controller. It was originally named
> "core" with the expectation that it might also cover Microchip's
> CoreSPI "soft" IP, but that never materialized.
>=20
> The CoreSPI IP cannot be supported by this driver because its register
> layout differs substantially from the MPFS SPI controller. In practice
> most of the code would need to be replaced to handle those differences
> so keeping the drivers separate is the simpler approach.
>=20
> The file and internal symbols are renamed to reflect MPFS support and
> to free up "spi-microchip-core.c" for CoreSPI driver.
>=20
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers=
")
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Renaming the driver from spi-mpfs to spi-microchip-core was my mistake,
based on the knowledge that the coreSPI IP is what had been hardened and
use in the mpfs device. I didn't expect that the register layout had
been changed so dramatically between the two, when all other "hardened" IP
just added extra bits in registers or whole new registers.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dbyOFFU7ujEIU9/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQm9XwAKCRB4tDGHoIJi
0mN6AP9OaCb3FGGYqtgk+5W1t+1MWt58dVr1qbwzn5K6+yOO9gD8Cf6jDATNSvyc
0SnFN+sA0OZ52EDvffH7yuSTGCJV3gs=
=cXn0
-----END PGP SIGNATURE-----

--dbyOFFU7ujEIU9/Y--


--===============7198457429622519016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7198457429622519016==--


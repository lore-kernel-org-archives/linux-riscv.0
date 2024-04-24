Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445ACC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0MF/lPGkT65PIaqOlSII5+f7zjRQJuY5gzx7UYMVQM=; b=of1zH23FPffEUnTvs8hgDS0hzo
	Z7U0Y0oK+wfg2HbNPOFJpBkiHmHGgzkpi6dIZpy8hgGbGGPuBglB4/dznaJE/nyw4AD2IJmcriwGg
	cC4tK2ant7RxmksuagtHTbFVFubdW23iXm49eOkuYj89gpQVc/UVlUMbl+J9hkQxh5ao9fMDhlB9e
	rGwnCdF2V62XWYLE56DFOSfTq9OE7DR9rJ7fqkxYOyLNszIWkJegkulD5mE9sneTDXa2P9NtdxKOG
	IZtjBNfMPIBmzcTEjL8lzBi9gMVezo8xN45priI+Y3mGxYixVfi733mn78eOIvmE2tC6zf7VVQP5t
	drIFN5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaKv-00000003njy-436H;
	Wed, 24 Apr 2024 10:58:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaKt-00000003njF-23wg
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD7BFCE165A;
	Wed, 24 Apr 2024 10:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33512C32782;
	Wed, 24 Apr 2024 10:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713956324;
	bh=oWizCb7BdyW9M3jIy6WM++409fA6jIXbKrGaSbTxVwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZuuJjBcyr0Euwq0h3lI+jyUHHBU6LiWtQ5ZTOsU6dbgwKvUDZDlw6qkmwkVkNSsH
	 zysbaSuxX4jx4jlWELLvy8wrmyj/jR72DHP3uWtM5SY5OyPea0SKGWqh0Wvi0zGJqr
	 CLdChROgNCYsqywynomrhXYXge92QLv4n6QrgwWRRk2XzKkENP266ngSCCn7WxrHFk
	 iWbFDAVwz/X8hgvl7lZgs7lE9kl+GM7xA56b4FkFEcKlRmxETyFNi7rHv+ldiWiAFj
	 on/oENY+Qn7vKO2qliiONz17leVsAsxyoDyERxswra0b66fv2Qs+wB0PwcdWyK9j62
	 hZhpSzamkdFDQ==
Date: Wed, 24 Apr 2024 11:58:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
Message-ID: <20240424-semicolon-stainless-4647035a30ec@spud>
References: <20240403060902.42834-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240403060902.42834-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_035847_739557_61591EDE 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: multipart/mixed; boundary="===============5667907847944977843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5667907847944977843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fSzVW4N5Z1t33Sze"
Content-Disposition: inline


--fSzVW4N5Z1t33Sze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 02:09:02PM +0800, Hal Feng wrote:
> Add support for StarFive JH7110 SoC and VisionFive 2 board.
> - Clock & reset
> - Cache
> - Temperature sensor
> - PMIC (AXP15060)
> - Restart GPIO
> - RNG
> - I2C
> - SPI
> - Quad SPI
> - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> - Audio (I2S / TDM / PWM-DAC)
> - Camera Subsystem & MIPI-CSI2 RX & D-PHY RX
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>=20
> Hi,
>=20
> As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> add support for them in riscv defconfig.

Don't think we ever discussed sending this kind of material via the soc
tree, so this one is for you Palmer :)

--fSzVW4N5Z1t33Sze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijl4AAKCRB4tDGHoIJi
0msRAQDayDsgCUh+dVh/+2XHjcsCkv2bNYW3CpxtHoKJDyWU3wEAlNAUmTBYJiVu
UavaCz9gh/JuEjZ2GFw1Ly0z/8W5ngo=
=viBE
-----END PGP SIGNATURE-----

--fSzVW4N5Z1t33Sze--


--===============5667907847944977843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5667907847944977843==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27154CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLKgu3YkrtLktUcsm/kWcP+AeoEGmJr3P0/a31/ltJ0=; b=1tf0sDu8ltrk+oSgrLR8ZziGFg
	BApl0fm3tOFrI5FLCXFbTux/cvQ6U2IKwbCSOxsHJdpYhfIVrspy+xo6hoyi3qQMpIex//+90GnzO
	70LZiCYLjfEF53uRVSr6Kmk36S3e4Y7BvdOWI8JJuhkxoaW+TFhyo0RnjvLuMQLJzJXEvzgcFzWlq
	WKkysuiZXzVORD1Fyl3u/0rOEcZEgmzbcTkZq9fumc5KDjuJH9SFBNJlNpBzS6QCle46uNSHTjwZG
	pzu+4Aw4Tzjl1QyvNsWw/TrMeBEynK6mbRpWvAJzgH4x0P/e3bzNtK0ExBVfSMepTa247DBvGHM/J
	WDE/za7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ECz-00000008hZQ-2W6W;
	Fri, 10 Oct 2025 14:35:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ECx-00000008hYn-2T5h
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 14:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F412C417A1;
	Fri, 10 Oct 2025 14:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E593C4CEFE;
	Fri, 10 Oct 2025 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106898;
	bh=tX2MX2Rqu4g/qCApJ10pxKsv/9FWn2QhZo8crhSgRyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuM9idKyJ64Ns5XMFl5Nf1Vv7BWmSTuM0nOT1vs2jlozQ0nnbqG2FhNGe5ZvUyWkU
	 cagctN2vf50FllgByHsqBwRz6pX68f5fZTw3X1ucoLdNlRbq5TmW2EbWI00snUX5/x
	 YDtXzGGR+VBBSx0ITdgMtS1QGTbsUfvd21V7fai6qKRtvccTqvN+3I7ZIsex5dNU5i
	 T136wKWYHqi3wYGGfPrfzhqqGbcnE8fvKqQG/uTiBTX7GYieJk8xxJB/9QJGhrf0/v
	 ZOmcf25iSjh8pZKXS2ZIJUTOUQ9C4n66wliKl8SCKEcNRd42BfKp+U/ID3lVfjA9nv
	 zqvWdC1wCmzxg==
Date: Fri, 10 Oct 2025 15:34:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: riscv: spacemit: add MusePi Pro board
Message-ID: <20251010-headstand-gloomy-c7d702f978a9@spud>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_073459_667711_7910DA0F 
X-CRM114-Status: GOOD (  18.02  )
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
Content-Type: multipart/mixed; boundary="===============3892907805975964209=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3892907805975964209==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h8lD4lIYVpPgecKX"
Content-Disposition: inline


--h8lD4lIYVpPgecKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 09:56:30AM +0800, Troy Mitchell wrote:
> Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
> single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].
>=20
> Here's a refined list of its core features for consideration:
>   - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
>          This suggests potential for light AI/ML workloads on-device.
>   - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
>             Sufficient for various workloads.
>   - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
>              SSD (2230 size), and a microSD slot (UHS-II) for expansion.
>              Good variety for boot and data.
>   - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
>              Standard display options.
>   - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
>                   Ethernet port (RJ45). Given the stated markets,
>                   this should cover basic networking.
>   - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
>          Decent host capabilities.
>   - Expansion: Full-size miniPCIe slot for assorted modules
>                (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
>                general PCIe devices (SSD, PCIe-to-SATA, comm boards).
>   - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
>   - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
>           for cameras and displays.
>   - Clock: Onboard RTC with battery support.
>=20
> Link: https://developer.spacemit.com/documentation?token=3DYJtdwnvvViPVcm=
koPDpcvwfVnrh&type=3Dpdf [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: not-applicable

> ---
> Changelog in v2:
> - modify commit message
> - Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-1=
-5efcca0ce3ae@linux.spacemit.com/
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Docu=
mentation/devicetree/bindings/riscv/spacemit.yaml
> index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1e=
a5ca9fe28caf45a 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -22,6 +22,7 @@ properties:
>            - enum:
>                - bananapi,bpi-f3
>                - milkv,jupiter
> +              - spacemit,musepi-pro
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
> =20
>=20
> --=20
> 2.51.0
>=20
>=20

--h8lD4lIYVpPgecKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOkZjgAKCRB4tDGHoIJi
0lJbAQCI1n2tmq/PHDkU8WxwsDfOyXgh61XIyz27ArEkr9KRzgD/aJWVigJcDUU+
bgAkMJ90tRNk6VJx28B6jm/5O7BqeQo=
=rlWN
-----END PGP SIGNATURE-----

--h8lD4lIYVpPgecKX--


--===============3892907805975964209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3892907805975964209==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5EFCD37B2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5OpXQ/ZM+3GAWU6PcbswlGoVvLfK7AWQeWHQ+AhS7E=; b=jiA2XGblxiB+htPl36keWPfUrO
	oLqpyvLUia4hY+HAeGewHpbY3PmxrS8rzH/xRfN7omc03M478jU3yJq+ZqlmQQvknngCePBAU/tgk
	8pQS0bwjENU27XE+PW5ZyK8I+Jl1g45rpFGmlhtSB4ckZwQ4oHUwERR23/y1CXDUnhIcs7wzEyR1G
	PagExpB4CM6sy2SOxvVP857fdmgPsDE8GTVlAxOITS56mVaUTUctRYjws41sFxFrTK2ifpBOcazq2
	IbAj6kU+61zPrS7ABWbN+hpAX6pYzpoxL0KswBuCgGHdDUgDXOWgkOZTpm2kkHXzMlfn4RuPd6fQd
	pWcCsDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT65-0000000E8hi-2hvd;
	Mon, 11 May 2026 16:03:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT64-0000000E8h7-0qzs
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 16:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 726C46001A;
	Mon, 11 May 2026 16:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC24C2BCB0;
	Mon, 11 May 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515387;
	bh=BsBc4RLCe0pZ1tapkSrfPmLjK+4hJx4ENCrw3f1tS0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsxFeY8qOVENKd9VBkUy21SWWd+nV1JIZyGjBjdjlgsdXF7e9O3m8/FIGBEsoQULg
	 oYMUjXGECrAqMtYEDJJ0qC1bx28UTAUE7NMqIQ0GA7fyDsrM4un/ucOIOL4wDRr4aM
	 HkjUCKqiU6kxl7Jgo/xAc8Ag8qKQEtG5MJYUb++kyFnyBJ4WVbO78KcPGti+lAgZsd
	 3QvzvjWhQOpBvoNk258KWofRduwjd0mjxUSdq0DpxRwnQS2RhTh1cHJKmP3qgADdZE
	 OFgpEQd76uc/K3t+t3yle06sKVUsR7bbh5/pxnhGqtRgR0/9mItaWEK5Evh35kXA7g
	 o7u08YbyJBwPA==
Date: Mon, 11 May 2026 17:03:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: spacemit: k3: Fix PCIe clock register offset
Message-ID: <20260511-emperor-washtub-15fba36bad60@spud>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
 <20260511-06-pci-clk-fix-v2-2-c9a5e563bab3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260511-06-pci-clk-fix-v2-2-c9a5e563bab3@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2948048419990117989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2948048419990117989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fWRW5TuUHiA2tmNM"
Content-Disposition: inline


--fWRW5TuUHiA2tmNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:59:10AM +0000, Yixun Lan wrote:
> The offset of PCIe Clock CTRL register for port B and C controller was
> wrongly swapped, correct it here.
>=20
> Fixes: 091d19cc2401 ("clk: spacemit: k3: extract common header")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>  include/soc/spacemit/k3-syscon.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-s=
yscon.h
> index 0299bea065a0..a68255dd641f 100644
> --- a/include/soc/spacemit/k3-syscon.h
> +++ b/include/soc/spacemit/k3-syscon.h
> @@ -168,8 +168,8 @@
>  #define APMU_CPU_C2_CLK_CTRL		0x394
>  #define APMU_CPU_C3_CLK_CTRL		0x208
>  #define APMU_PCIE_CLK_RES_CTRL_A	0x1f0
> -#define APMU_PCIE_CLK_RES_CTRL_B	0x1c8
> -#define APMU_PCIE_CLK_RES_CTRL_C	0x1d0
> +#define APMU_PCIE_CLK_RES_CTRL_B	0x1d0
> +#define APMU_PCIE_CLK_RES_CTRL_C	0x1c8
>  #define APMU_PCIE_CLK_RES_CTRL_D	0x1e0
>  #define APMU_PCIE_CLK_RES_CTRL_E	0x1e8
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>=20
> --=20
> 2.54.0
>=20

--fWRW5TuUHiA2tmNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH9tgAKCRB4tDGHoIJi
0vaQAP48Kryv4oiIIywKTZrtlJBoXWha9X2EIyDK9bNcucrjQAEA6h0D6DGM7ZQH
rRGPLGzFqFWbZnchRVV2n43wt3IX3gA=
=zt8J
-----END PGP SIGNATURE-----

--fWRW5TuUHiA2tmNM--


--===============2948048419990117989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2948048419990117989==--


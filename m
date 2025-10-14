Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD6BCCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgWK7CNHID9ODwak+mEDDuI07M7LtkEbc/MEfIzqVCM=; b=GxXoepc2zEnoie2XnYZWPvaT+4
	kqd2bA+MG7v62bYGKUmbLLf75PN0yViwE88sY5ar6PJGBkZyOxQGwKaNbPn4WNdKm7nXSilCXlTnL
	ld3u8rvvn5Opg/X36B+hlsMQO9ezO5eLEYGt/3YX0tQj7R0+8KN7mh5UGN0D549A1/YJ9qEtmNu+W
	5MkGUtQR4tNYz+u02+K/X/XiPaSS19P01H6fQMb1/Tpyd5DLESxIEFC0kgG0D1RZ3Cuni7ze06uaG
	bwGMpKL5dl0dAm1VV1uNfBhn9wOjyw0MRjrts3zw2BYHaLpKKl+7SFl/tiJjnz9YtarjWvbRfJEXJ
	9rvB8Aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8b7J-0000000FiiS-21oZ;
	Tue, 14 Oct 2025 09:14:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8b7H-0000000Fii5-0iFd
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD13D45086;
	Tue, 14 Oct 2025 09:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD61C4CEE7;
	Tue, 14 Oct 2025 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433286;
	bh=IBkCqz1KQ1uX83QuJ3HllJmulH8qpC3R2cWzYAaQB/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKZxf22Qjtehf9Ju4hs4d1ZMls1QVC7xp1pg19tXZDUQGb2nMv21rX7z/REtSlZnn
	 wdhZGctfOsCWA9ciC70TZNp9kr+a2rqxnEMKifOapN7x5EA3zolq/NQnJkZAJppQRs
	 vN+2MI68O+Z6k7v8gSxVxBKjmzOynSflXzuDdH+Tp/pMAWfSXRKg9ML0HHI9XoLDo0
	 gLZ+wE46cDHUuqsOuymef9yyVINznxtQIgzfjCc7kwee4kkI9zQ7A4k7a9BqOfRAKZ
	 1KUsGf4Pkc3K2Bf7aET6QtHfXzDY8krzRLjehgxV2AakTlYjkVjMWbmoVDXqpa6YtG
	 I1P5+AKe9VnHg==
Date: Tue, 14 Oct 2025 10:14:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 17/18] riscv: dts: starfive: jh7100: Use physical
 memory ranges for DMA
Message-ID: <20251014-unsocial-composer-880ea10cc1d1@spud>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-18-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20251009015839.3460231-18-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_021447_250544_E0A997F9 
X-CRM114-Status: GOOD (  25.44  )
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
Content-Type: multipart/mixed; boundary="===============5981549486865683847=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5981549486865683847==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kExO0No+kM/nXpTw"
Content-Disposition: inline


--kExO0No+kM/nXpTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 06:57:53PM -0700, Samuel Holland wrote:
> JH7100 provides a physical memory region which is a noncached alias of
> normal cacheable DRAM. Now that Linux can apply PMAs by selecting
> between aliases of a physical memory region, any page of DRAM can be
> marked as noncached for use with DMA, and the preallocated DMA pool is
> no longer needed. This allows portable kernels to boot on JH7100 boards.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
> Changes in v2:
>  - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
>  - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected
>=20
>  arch/riscv/Kconfig.errata                     | 19 ---------------
>  arch/riscv/Kconfig.socs                       |  2 ++
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 -------------------
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  4 ++++
>  4 files changed, 6 insertions(+), 43 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570de..62700631a5c5d 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
> =20
>  	  If you don't know what to do here, say "Y".
> =20
> -config ERRATA_STARFIVE_JH7100
> -	bool "StarFive JH7100 support"
> -	depends on ARCH_STARFIVE
> -	depends on !DMA_DIRECT_REMAP
> -	depends on NONPORTABLE
> -	select DMA_GLOBAL_POOL
> -	select RISCV_DMA_NONCOHERENT
> -	select RISCV_NONSTANDARD_CACHE_OPS
> -	select SIFIVE_CCACHE
> -	default n
> -	help
> -	  The StarFive JH7100 was a test chip for the JH7110 and has
> -	  caches that are non-coherent with respect to peripheral DMAs.
> -	  It was designed before the Zicbom extension so needs non-standard
> -	  cache operations through the SiFive cache controller.
> -
> -	  Say "Y" if you want to support the BeagleV Starlight and/or
> -	  StarFive VisionFive V1 boards.

Hmm, removing this is going to break old devicetrees, right? Shouldn't we
just keep this with a wording change stating that it has been replaced,
rather than removing it right away?

Cheers,
Conor.

> -
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 848e7149e4435..a8950206fb750 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -50,6 +50,8 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
>  	select ARM_AMBA
>  	help
>  	  This enables support for StarFive SoC platform hardware.
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7100-common.dtsi
> index ae1a6aeb0aeaa..47d0cf55bfc02 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -42,30 +42,6 @@ led-ack {
>  		};
>  	};
> =20
> -	reserved-memory {
> -		#address-cells =3D <2>;
> -		#size-cells =3D <2>;
> -		ranges;
> -
> -		dma-reserved@fa000000 {
> -			reg =3D <0x0 0xfa000000 0x0 0x1000000>;
> -			no-map;
> -		};
> -
> -		linux,dma@107a000000 {
> -			compatible =3D "shared-dma-pool";
> -			reg =3D <0x10 0x7a000000 0x0 0x1000000>;
> -			no-map;
> -			linux,dma-default;
> -		};
> -	};
> -
> -	soc {
> -		dma-ranges =3D <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
> -			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
> -			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
> -	};
> -
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible =3D "mmc-pwrseq-simple";
>  		reset-gpios =3D <&gpio 37 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7100.dtsi
> index 7de0732b8eabe..34ff65d65ac7e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -7,11 +7,15 @@
>  /dts-v1/;
>  #include <dt-bindings/clock/starfive-jh7100.h>
>  #include <dt-bindings/reset/starfive-jh7100.h>
> +#include <dt-bindings/riscv/physical-memory.h>
> =20
>  / {
>  	compatible =3D "starfive,jh7100";
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> +	riscv,physical-memory-regions =3D
> +		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0=
x0>,
> +		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | =
PMR_ALIAS(1)) 0x0>;
> =20
>  	cpus: cpus {
>  		#address-cells =3D <1>;
> --=20
> 2.47.2
>=20

--kExO0No+kM/nXpTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO4UgQAKCRB4tDGHoIJi
0uKUAQD80+kPIuFiDo0jFL5AOngNkEUr28ECrOoIkr5OlYN8UgEAh9hDrsZWp8fb
oE38JjdP0xJl6Q+HfnlMtSej1XDlZws=
=jxde
-----END PGP SIGNATURE-----

--kExO0No+kM/nXpTw--


--===============5981549486865683847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5981549486865683847==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D7CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVEqS53KuiQy23acjIsuqog9YqsnYnBfAvAepnF0EEE=; b=KRXkdnqHVO2QLa0KItcawZB94Z
	BG4EpVXKlu6XCHxCiMrHlEsUr9BfxEaqLTPJ5TarrOlTwb08a9R9IN5Thr04UWe92rdCLY05oHyTk
	FgWPTNF6EuxP/Lu9oPfH6LdprV3DJeCmGi+NrfX0Ote6PZPqmbweFacdePXYpPQH6IkIqZYjGnvZT
	lc9IEcYJ4G/kGD7ZROnKQKJSMJsFensoxNtQ0xYiY/LBQc1v2/aqItZUL4WcNICEE0spMgxmgkt5G
	/w70NiNBjge26LVoGcKf/RGYGKZtdV0kGtMJ2a8o1nB0h3qDyn3TM/f8E4Vb0AXX42RQEGjueXNRa
	w32vgitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCMH-00000005AJJ-46PD;
	Mon, 15 Sep 2025 16:47:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCMG-00000005AHj-06Jn
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 16:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CEB744D2F;
	Mon, 15 Sep 2025 16:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278ADC4CEFD;
	Mon, 15 Sep 2025 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757954835;
	bh=AYGzSlRsXTSxiB0nCeZZldU8jcbwpn+7WX58ynn8QzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KR2CIY9kKmW1I2C+wNwOfFy1Cimq4ycroixQFv0gnodTaYRtelUrHsaV7Gsfrkvdd
	 TtagClzYFPTy25O34F+AscdKuRvYoQLUjBJehcEoE5o19eDrs+gaP/Mcv70bKkkgRq
	 12z6+y/aMyWoYlES+3K26xQDxN6W8AmwwwE87JnxwXnKVdjM27AZvyh0gKxBakfiSw
	 ZzqUbgT149Wlz6mLCF1GAqE9fVHn1YxzMdDptqK5uhUgRG8W6XXmzINLT4g6yE4faK
	 Q8aGTE7rUyPlWBBC8LLXll6Aw/pKfuVn+LEF2v4+sn5Ne2erVo99NzVTKuSQnnRa99
	 2AoGZhVTIKh7w==
Date: Mon, 15 Sep 2025 17:47:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 6/7] riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe
 cards
Message-ID: <20250915-mouth-banner-ddfb2e48bdb3@spud>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_094716_109334_BACFFD9E 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Type: multipart/mixed; boundary="===============4567405847638028145=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4567405847638028145==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iHNPxCzVrL8Nj8IA"
Content-Disposition: inline


--iHNPxCzVrL8Nj8IA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 13, 2025 at 02:31:05PM -0700, Drew Fustini wrote:
> new file mode 100644
> index 0000000000000000000000000000000000000000..b2b08023643a2cebd4f924579024290bb355c9b3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +
> +#include "blackhole-a0.dtsi"
> +
> +/ {
> +	model = "Tenstorrent Blackhole A0 SoC PCIe card";
> +	compatible = "tenstorrent,blackhole-a0-card", "tenstorrent,blackhole-a0";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x4000 0x30000000 0x1 0x00000000>;

This isn't at address zero as the node address claims.

> +	};
> +};
> diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi b/arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..517b6442ff0fe61659069e29318ad3f01bc504e2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0.dtsi
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +// Copyright 2025 Tenstorrent AI ULC
> +/dts-v1/;
> +
> +/ {
> +	compatible = "tenstorrent,blackhole-a0";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +		timebase-frequency = <50000000>;
> +
> +		cpu@0 {
> +			compatible = "sifive,x280", "sifive,rocket0", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			mmu-type = "riscv,sv57";

> +			riscv,isa = "rv64imafdcv_zicsr_zifencei_zfh_zba_zbb_sscofpmf";

What's the benefit of retaining this property?

> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
> +					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
> +			riscv,cboz-block-size = <0x40>;

cboz block size, but no zicboz in your extensions list?

--iHNPxCzVrL8Nj8IA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhDCAAKCRB4tDGHoIJi
0pMaAP9p1TqTxoGqAjuErcVPuS5xegEUGST8rXU3p5YRl2CUTAEAtTVesw+pKK3+
WxaX6WKQ5s5k4Ny2jsJ6byBiC4PHbQ4=
=+taw
-----END PGP SIGNATURE-----

--iHNPxCzVrL8Nj8IA--


--===============4567405847638028145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4567405847638028145==--


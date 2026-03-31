Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFACFF60D0
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LcyvMqGd4DaYO5GsiPJ7GaJ9HCrgzhzb9NILGWdFAM=; b=YjhOwZ+nZHVhwp
	MYfoTNF6UCnDQkJAFn0tOTEx8xl57KaCtDAQUNeDEtG7AwklevWEyJPiLAsDUrZrgUjt8q+ct7n4O
	vqIiUeCzgWBrU1IR5ekwdG+pNCDAnGh/mDotjGBZtfT+zRrJYA5OE4bdvftYqtVKLdh0+Sv22u5+t
	ueYbbwQRf9UlbBVDTx0ttIaHQD4T2WFSAciLKv/RkDAm+A6gt67NBs1FtdX9KASSuEcxC+p0KNeC/
	rMxe3dJWcY7oGJHYqoc3yrhlHsjFURZVUpWg6H6QZWjpYfnqhnxwitG+ixJ3geJN/LDq3YEKHyGY5
	t2WMpEwYmp6fRf6UX8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uwe-0000000Ce0n-3tZ0;
	Tue, 31 Mar 2026 08:59:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uwc-0000000Ce0B-0XDN
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E1F143DA5;
	Tue, 31 Mar 2026 08:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2ADC2BCB0;
	Tue, 31 Mar 2026 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774947569;
	bh=UEHMh340GjMDCxS3W8eMpmo3ANyUtjeKXah84mLvkAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtPxsrCOLGXQRJ4k3+VG7iWp9SoWGImeuyZKVF7PUX/KPD9z3r3zbpdfBhFu1O1G8
	 7xIphfhH1UtGhfCt/VTjqC+kHZBurQSatTE2CkCPOihvhXHEx/LSXWXW9RtCHk20N5
	 z70At07CbyQYqEBCHTk9X5HN/ENt7sxVL+X0t1GAl+56bzRgRTZSLgzMSwLV7nCr+t
	 qZv89kQSDRLcAakjxs0jZZ94AY1aqgtcOX1MqUvHKKNOiaL55rn+ni9APXMktZlMQb
	 J77IzECvHVB0uMFKkvANI2rew4XyvNmf7S1KRvO+FDtfpbpKN6MQHomu6+j5yG1o3m
	 mNF0yQrTojiVw==
Date: Tue, 31 Mar 2026 16:59:25 +0800
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
Message-ID: <20260331085925-GKB976850@kernel.org>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331034616.67183-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_015930_206410_F01E482C 
X-CRM114-Status: GOOD (  18.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sandie, 

On 11:46 Tue 31 Mar     , Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>
> 
> The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> which has (Framework) SKU FRANHQ0001.
> 
> The FML13V05 board features:
> - SpacemiT K3 RISC-V SoC
> - LPDDR5 16GB or 32GB
> - eMMC 32GB ~128GB (Optional)
> - UFS 3.1 256G (Optional)
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>  - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>  - Port 3 & 4: USB 3.2 Gen 1
> 
> This minimal device tree enables booting into a serial console with UART
> output.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
should put your own signed-off at the end.

> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 7e2b87702571..acb993c452ba 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> new file mode 100644
> index 000000000000..2343ae3acc2d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
should cover current year, which is 2026 now..

> + */
> +
> +#include "k3.dtsi"
> +
> +/ {
> +	model = "DeepComputing FML13V05";
> +	compatible = "deepcomputing,fml13v05", "spacemit,k3";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	memory@100000000 {
> +		device_type = "memory";
> +		reg = <0x1 0x00000000 0x4 0x00000000>;
> +	};
> +};
> +
> +&uart0 {
Can you also add pinctrl data explicitly?

> +	status = "okay";
> +};
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

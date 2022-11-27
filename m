Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D8C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+MfUgIQWw3vdGDlyHgNRfeGgVzd1GhkJVC3+oZ2ERs=; b=k8+z6nOWVHfVEr
	DmKwa55THgzJY8tIcst2maMMsH9SdIqRIwBiKwEuS+Uw4Kc/8LK6WzeVIfSk6gtxe1m5hrGIcgnag
	vSs2PMB/365gh6WG+KkwHxZ46ktHXd3ULt9v3KzA7fGvHwuKBEeCoiUj1UQF51sBUkM7mXK1HuACZ
	D7L45egXqVqzNifVEjBAQvYfRA6rYV50wK70RKaZNnQYCN0GXqIVX6mEIbHEsoGkMxG9DSVmt154/
	29t8TxdOTqovginYyB9fsyD87haLFOUZM4DHoksjigsRK2FkERyyfXxGZDzUkEZtfFQ1H8hlmJTnh
	HU401HGyTAduYSSs298A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLWV-00CfxD-KN; Sun, 27 Nov 2022 17:32:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLWS-00CfvM-PJ
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:32:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2CC33B80AEE;
	Sun, 27 Nov 2022 17:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CEEC433C1;
	Sun, 27 Nov 2022 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669570373;
	bh=8w7VTx/8jnLMeTpaw70+gwklXuYHAobZHbYwgVJCREs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ahn1SrHeINF3qv1+cDrCi+yH7iT990ujHVAUbRgVKTjNJqznGydQht/i/S5k0bf+c
	 7uTvDH3zxxfBNHrNEaXJBbCYqhF5KEvHAkgVQRrY1jnC58sc2OLbFTGBsf0bn6f5EX
	 yirayZxcq1mzFnFU0n2pzzhxIDXlf/ozqsfo2VI6TKYM7Mx3y7Dxstu98RHH5npQXZ
	 8Ica5TIopPkkafuy8v7juZwYkLM5QkwgaJu6dnG+zaDQrW3DFAKIw7gA61nB8xkOSm
	 CcLvZvVqtDfTzPMKOHVnCECYzbiqxFez8vNFVEGxJfHhjviEhS2Jwdpog/97kmd+Y+
	 bKwfkwr0HEIHg==
Date: Sun, 27 Nov 2022 17:32:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 7/9] riscv: dts: bouffalolab: add Sipeed M1s SoM and
 Dock devicetree
Message-ID: <Y4OfQLfAmYOucKdq@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-8-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093257_142510_B48DFBAC 
X-CRM114-Status: GOOD (  20.80  )
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

On Sun, Nov 27, 2022 at 09:24:46PM +0800, Jisheng Zhang wrote:
> Sipeed manufactures a M1s system-on-module and dock board, add basic
> support for them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Other than the plic compatibe in 5/9 needing a fix one way or another,
the dts looks fine so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
>  .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts | 25 +++++++++++++++++++
>  .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     | 21 ++++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b525467152b2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += bouffalolab
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> new file mode 100644
> index 000000000000..5419964e892d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> new file mode 100644
> index 000000000000..c6b4894a7b88
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808-sipeed-m1s.dtsi"
> +
> +/ {
> +	model = "Sipeed M1s Dock";
> +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bouffalolab,bl808";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:2000000n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> new file mode 100644
> index 000000000000..5026de768534
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +	compatible = "sipeed,m1s", "bouffalolab,bl808";
> +
> +	memory@50000000 {
> +		device_type = "memory";
> +		reg = <0x50000000 0x04000000>;
> +	};
> +};
> +
> +&xtal {
> +	clock-frequency = <40000000>;
> +};
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB3C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMEvpnQf8Hg93b0TGfbt/9oqZZgP/PvhooG0VX/9TFc=; b=K2CGsT5vqHfVQg
	bR8GOQZ9IRVm8tuj5pIu08OusUs/L0nau/qvxAychvKYSuTBjfDOoHS1+qSbgikSDadv2h1Yf7e9r
	P9WpGGngUMwn4kB8Nmjzpi8TljIS2e2OIkBqWISFz9CPIu7ikfpWOuVHzeOQ2GK3KljcQGb6T+vCy
	8T17bJjZai7zqHNCJB1Og+OlDWQndAIfgrW8yb54ztIrdS3zCe7TXV8znfapljEgEpI/KbUjOzq81
	ZcRRLXlZxBFXK/3rbOqUZ+4sLRwwh0A2sNiIYTXCLHJzK1jcqupfee7EDiLa6/nO1ZxnDBUEEjXqw
	cDoMmC0wD3prLHTIakqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsMp-00H34q-5I; Tue, 16 Aug 2022 08:56:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsMj-00H2xC-2i
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 08:56:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNsMa-0002iz-Fr; Tue, 16 Aug 2022 10:55:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
Date: Tue, 16 Aug 2022 10:55:51 +0200
Message-ID: <2114701.GUh0CODmnK@diego>
In-Reply-To: <20220815050815.22340-8-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org> <20220815050815.22340-8-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_015601_663177_30F33341 
X-CRM114-Status: GOOD (  17.67  )
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

Am Montag, 15. August 2022, 07:08:10 CEST schrieb Samuel Holland:
> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
> plus low-speed I/O from the SoC and a GPIO expander chip.
> 
> Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
> powered by the SoCs internal LDOA, analog domains powered by ALDO, and
> the rest of the board powered by always-on fixed regulators. Some (but
> not all) boards also copied the PWM CPU regulator. To avoid duplication,
> factor out the out the regulator references that are common across all
> known boards.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../sun20i-d1-common-regulators.dtsi          |  51 ++++++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++++++++++++++++
>  3 files changed, 223 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> 
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> index f66554cd5c45..b0a15e8c8d82 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> new file mode 100644
> index 000000000000..143a3e710c3c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>

in (most/all) other devicetrees this is looks more like

// SPDX-License-Identifier: (GPL-2.0+ or MIT)
/* Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org> */

otherwise
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

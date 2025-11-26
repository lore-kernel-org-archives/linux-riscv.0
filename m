Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6307BD10372
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL00HBSDCsJa+2bNMKi0gdd445e2TO38d9bbrjqVU98=; b=TQGoqxZOP49p7R
	PqgnwQc0fT3JoDIWo76noj6/oM5B+WRgkqTfkzEQcDQ8DFd0uqxAQkd9VNMi0oQVl9JrVsyowfJxj
	7P/ZVTfekLGX3v69OkRibf+YGeGBQfDRMB9PdtR/FGnUZYzxXU41Pp9Bd/wbebXxIT76FT8MO9K+w
	xJyMZ1ZwzGUJiAJJDYFsh7qT7JH8ZWCZw+YpmMhy2+MZ2EwBkGPL1J3ktdHb1MwN/m4chdmYDwhja
	/Nd6Kdx1qN94Dh4j9+5ens+9qRV6kx40r2WuDUEdv/XzUCyMX7crKQ44FDT5nMu6+siagD2YLs+BL
	7gB+hWEqclV1gOFdX4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4b5-0000000EBjh-3H0O;
	Wed, 26 Nov 2025 01:45:31 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4b2-0000000EBib-2UaO
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 01:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764121510;
	bh=6jZ3fYnM1SUryJBt+UAWY3sfU2Uv3tDGw4uMv3KY72g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eSKtMKOengyYwTaQaIyLUovIJwqZvdod8idCJH7/x8q4GJtfgvFXh8Q+fw3SaieXS
	 6xpCvoOGspt3m6EPdgTfuZug1hiTaSl0qsRp8A6Pz8oOCbizsEdhuBBRJmQ7nz3BA2
	 tHKCy3JE3ooGD0JnmtMM+3YzIVCcx+roAS0N3XsG3DC94fIYMzi9rs2rXDXOwkFNVo
	 lZZI74EbQni1RzMZW6pp1JJbctLvzzKg3lNBZ8Nj3ePlRK9T8qoXCU0h6eOIQ8qHk5
	 S/UnANE0lU/Nqyg5cJ+WyPT/g69NudN8YYJg8oFAURDqzxUxwPYSKXfeaJ5XwwkGKy
	 KUJbk4VYW2waA==
Received: from [192.168.2.54] (unknown [98.97.63.250])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 136F8B2204B1;
	Wed, 26 Nov 2025 02:45:05 +0100 (CET)
Message-ID: <8e422318-1600-4321-928e-1033190d5890@freeshell.de>
Date: Tue, 25 Nov 2025 17:45:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] riscv: dts: starfive: Add VisionFive 2 Lite eMMC
 board device tree
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-7-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251125075604.69370-7-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_174528_782667_1D9D9DF3 
X-CRM114-Status: GOOD (  14.17  )
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



On 11/24/25 23:56, Hal Feng wrote:
> VisionFive 2 Lite eMMC board uses a non-removable onboard 64GiB eMMC
> instead of the MicroSD slot.
> 
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Tested-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  ...jh7110-starfive-visionfive-2-lite-emmc.dts | 22 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 2b1e7fcd6f84..a640ed5dc5a1 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -14,5 +14,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite-emmc.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
> new file mode 100644
> index 000000000000..e27a662d4022
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-starfive-visionfive-2-lite.dtsi"
> +
> +/ {
> +	model = "StarFive VisionFive 2 Lite eMMC";

> +	compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s";

Add "starfive,jh7110" to the compatible list as the least-compatible
(left-to-right order last item):

compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s",
"starfive,jh7110";

or if there is review feedback that no new compatible should be added,
then as usual for new JH-7110 boards:

compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110";

> +};
> +
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

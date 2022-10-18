Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE70C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Xu7S6LJm3zlI//Mnqi3s7SpY9kgq5fMs9IOT+1cevE=; b=2KxPBYnMHrZTBr
	mh5YBgJF5NQFBkJn+yr5Cl+njewQXz3TwwBOJ5CKcTIFIeMiAph7XV+UORA8mXLckLZxg9749yTTC
	JN1YZSJ7coSbs9dgzXKt+dzMe6FDbE+7nzKVXZM916nBChFym8VXXMGPeXw/3PPKwQKKeYjcAouDW
	fl4uu2tnVeIVz0y4hhArDQIruN1WGMGDjKs51v8AhKtZvLQMOeTXnsWwiPBYYIgDjjiNPrl58YQB5
	QCsF/2fEaqhXTJBqz9R8jgxg7XuiAeHv0+guotQMp76hSG67XOfpqO1BdCd+hLk0jx0eCEA0ZwG+7
	QcdIfcw6ZwAouToNMOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhvk-004Nzu-Jv; Tue, 18 Oct 2022 08:26:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhvh-004Nz2-4r
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 08:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1FA6B81CF5;
	Tue, 18 Oct 2022 08:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE012C433C1;
	Tue, 18 Oct 2022 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666081586;
	bh=UowTUUvEVmL7Nt2IJNzxp9eCQ0n5rjbDsLqZOF2gprs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqUvoCfo3fLUef5sdX9Tsr9E5gjICAMab8NI0jZ32ODhv5hAbs8GpRr6VBjnTVMvm
	 e1tUU7Rg99YoPJ74Q+MEj/ZOajC8/tYAQ0UEru5IjFTSUfUpgl7Q/RH8jp1zM31Alu
	 AgO15qzgx6+ytjMgKAU4FvGKDcXuyYwQqDk8YDX3fmvEjSe8YNfS40RLSO1xqiJ5ll
	 vlRiF0LWw2TrzAy4TvzTtmxwrvBexgUxLABSxLLVRNRNK3wkUBPgr8uM2MC+bpKCjS
	 lFJOMUos77609fv0+91fG8VdHgW6xAX52iSqGCrdal5O0Ljdraz3iPsc4rJ0Y8hhb/
	 ALHQGCYOOfHxQ==
Date: Tue, 18 Oct 2022 10:26:20 +0200
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: Add StarFive VisionFive V1
 device tree
Message-ID: <Y05jLAjYR+JldAqD@ziggy.stardust>
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
 <20221017210542.979051-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017210542.979051-4-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_012629_498753_03357AB1 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Oct 18, 2022 at 12:05:42AM +0300, Cristian Ciocaltea wrote:
> Add initial device tree for the StarFive VisionFive V1 SBC [1], which
> is similar with the already supported BeagleV Starlight Beta board,
> both being based on the StarFive JH7100 SoC.
> 
> [1] https://github.com/starfive-tech/VisionFive
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  2 +-
>  .../jh7100-starfive-visionfive-v1.dts         | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 0ea1bc15ab30..039c143cba33 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
> +dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> new file mode 100644
> index 000000000000..e82af72f1aaf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2021 StarFive Technology Co., Ltd.
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7100-common.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "StarFive VisionFive V1";
> +	compatible = "starfive,visionfive-v1", "starfive,jh7100";
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio 63 GPIO_ACTIVE_HIGH>;
> +		priority = <224>;
> +	};
> +};
> -- 
> 2.38.0
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

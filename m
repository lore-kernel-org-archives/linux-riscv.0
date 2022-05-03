Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFBDC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sRTbHI8W1gMG4VqPJ0V8p2md23ogAByZU4K7tOkMUo=; b=EYiAxAWVwNjp3U
	/JlGiLvGO7PlFd04BIyU62KlJw5buWgr0LbxFTvan9CiBSbyKqWDb/gvBjuWTRNXny03BG31vSiFv
	5JPMxuNrICjSZ+NeAIIYRe2VCZ9ibHQKWyWsw55xecT9klllFFLL1zwj55dE8DxytWYNwxkbPqNDn
	eITyAsSOgxuKvMtEf1XFgKPNIUYUFCZtLZGC83pRCRxlG9RTDeCWGfMglPjK9A/ol9HBfynvcrrZZ
	u23SgeaWKue+bRqEo5xobMEqXQJkoK7CqXuTYBxA9352DaXY2aQIKAFstok46BFumu61Uj68L0vgb
	HcF2E7djbM50G2MR74ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm27b-0084g2-0j; Tue, 03 May 2022 23:39:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm27Y-0084ez-7m
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:39:57 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm27O-0004cu-SF; Wed, 04 May 2022 01:39:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 3/8] riscv: dts: microchip: remove soc vendor from
 filenames
Date: Wed, 04 May 2022 01:39:45 +0200
Message-ID: <8058972.T7Z3S40VBb@phil>
In-Reply-To: <20220501192557.2631936-4-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-4-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_163956_326224_4D442FF4 
X-CRM114-Status: GOOD (  15.61  )
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

Am Sonntag, 1. Mai 2022, 21:25:54 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Having the SoC vendor both as the directory and in the filename adds
> little. Remove microchip from the filenames so that the files will
> resemble the other directories in riscv (and arm64). The new names
> follow a soc-board.dts & soc{,-fabric}.dtsi pattern.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Nice cleanup

> ---
>  arch/riscv/boot/dts/microchip/Makefile                          | 2 +-
>  .../microchip/{microchip-mpfs-fabric.dtsi => mpfs-fabric.dtsi}  | 0
>  .../{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts}      | 2 +-
>  .../riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-fabric.dtsi} (100%)
>  rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (98%)
>  rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (99%)
> 
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> index 855c1502d912..af3a5059b350 100644
> --- a/arch/riscv/boot/dts/microchip/Makefile
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
>  obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> similarity index 100%
> rename from arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> rename to arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> similarity index 98%
> rename from arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index c71d6aa6137a..84b0015dfd47 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -3,7 +3,7 @@
>  
>  /dts-v1/;
>  
> -#include "microchip-mpfs.dtsi"
> +#include "mpfs.dtsi"
>  
>  /* Clock frequency (in Hz) of the rtcclk */
>  #define RTCCLK_FREQ		1000000
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> similarity index 99%
> rename from arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> rename to arch/riscv/boot/dts/microchip/mpfs.dtsi
> index bf21a2edd180..cc3386068c2d 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -3,7 +3,7 @@
>  
>  /dts-v1/;
>  #include "dt-bindings/clock/microchip,mpfs-clock.h"
> -#include "microchip-mpfs-fabric.dtsi"
> +#include "mpfs-fabric.dtsi"
>  
>  / {
>  	#address-cells = <2>;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

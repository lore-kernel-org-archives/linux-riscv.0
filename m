Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D30ED46600
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p04fYSDbLRs0lbbCPoFc1LkI1A40w0QE44djmkZR2PU=; b=YYoTguQLgV/whq
	M/aUL5t1h8uTLHHzM4ap8PTEIrOc2ylg+Nc+/toW0Yibmc8SXQ21fxtgRvBXmH7TjMs5UACrL64Sk
	ETb4mfBkuPnFRQT+Vh5ejaPQNuGxUJBh/EW5FoOmsq3H3C5Z8eO5Mrl5ec+fWTWFZZ6OEhAH/G0i5
	SoN01vm4o3PbckYIhbFYRskw0O731VbVAgioN8UnPY5MRDV2OMPYonL5Y3TEjUJnehsKUlPZovPrV
	npKaI/+xRsOwZjrKlWM74by0pB7E6fkvbIlt6tni0AEqBbK7gBtgG91KVyOJux4weeRTTK+ndkJjn
	yAdcLTv7eMltXSSMjqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR85-0000000Cqqo-0mfS;
	Thu, 15 Jan 2026 17:27:29 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR83-0000000CqqQ-3KJN
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 17:27:28 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso100738685a.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498046; x=1769102846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42fAL/1UEBk2EFpKCupqsTCz/+HBIO5aB7bXsjRGPhg=;
        b=v4Edxim5oxYiJQL+cbSLfEpEGHzXfqeL8LtP6Gq7MhwqNrhu9LIui6fQVWf01JVVK3
         WMSz2neD/phpYVd/uY+5cYdkML68braZCfM7GAFYSh226Q4MAmOAS0n/GuwueWz+8xp1
         j0z2ZJ1bVSaRmu3+B/23T022yezlf0+Y4tncl6vAoWk4H0zuRW59HJ3JVDVZkMMF/LZr
         h52wp4cZ8zLva2K6pO91YaCnOHbhb1rdn104Ca3F1UaR2UioTtXj49HUO/W5pXTJtDrC
         bumcRaCjw0xcWr9XbnRZAQhyB29ClaNLpKXlr5G2qnNWaQVfDEmE9qSg8BK16o1kLOcA
         tkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498046; x=1769102846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42fAL/1UEBk2EFpKCupqsTCz/+HBIO5aB7bXsjRGPhg=;
        b=SkBDFVI5xrFL32+8Gkuq/6aUlaAC1pEbqdxYpoRKTLWm2FJnEud8csKiVnkoOQoPvT
         qEAw79Sea9s/my6lXgcYJqqEoF+v3HO7/icn+waP1LoG39Iw02i+i46YjXXxbn65GVZT
         k63+U7k1rC9+Vw7BVrIKescGi+Epv6ugglfKK91H239V1Y0JlHiQpwXWYPRStU8uCch7
         KShqqN/IGNb1vcYSG+24aXzezixqCiTMnvWnzRVQQrcgtLX0nEuPOahUZ3H8EhcQQGL/
         P1KzA/gvxF75z88beycLeYE6BBn73DIZlSg7aGs6zgRChPFDL83yMjzuqNSyRFS+gfmq
         Uohw==
X-Forwarded-Encrypted: i=1; AJvYcCXA/1OGlQQQ9iXuuyBCjmVZacWVjz6EuCY+pi6QDTcGEu4DFoEBr0Y2mH6jWieL0YsNoauvuBi6+3EKXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pBkgZPf04fXMswqSOM1lf5KLvym1W1Rl1ufxBWKiUKmX98ba
	UfFPp/xWbn8t6WNyZL/YsXDLk9yIxi3UWYFJgZIu7+ka+XWoIZwfeLiRJSBlCcWCajA=
X-Gm-Gg: AY/fxX6Xg+LnKTF4GoP2LgnzrIa42bwprvgIO0ryM7JqlTXHYA4Q/+cXOE86Wh8vTkL
	vmnuc4KddqaykG6D4StMkBtKqs8xn/v3Bp6ZEQWpGxOOt3T0JvJxLN3VeftoG6i0aY6Ui1xinpA
	QbsTCoun8fiITsfbjOxwwqfBUO4kida4x5rnJmy/nf/EYYET3I0RvBjKC1reBGIovibSqlvvbWm
	AfkJ+q9ys0Y+5gmmR5ISbuHIHrgijpqg+zZjjduGRL1whZr38x39KjpCGIcIBWeZhpHFsPMvZej
	dslw9RPTMB8E4A1GLckZP5UUqplWSIX3ZkOHSiTIjSM3WuGVf/8YM73EEhmdCS7kwpZdzTsJDBp
	xH2eSejcOslH8qKXBvUZITlkxT/j/VMfELpYxDUJ8HiAHkCusxPaRJAsi7A7UI/gSh8LSzqqd/u
	2KsB4sZsE80qJJ9ljn00ErV41Pxp0yCxJa1xzYQc8a6RSMeoyRjPZb
X-Received: by 2002:a05:620a:489a:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8c589b97a57mr523819285a.16.1768498046417;
        Thu, 15 Jan 2026 09:27:26 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:26 -0800 (PST)
Message-ID: <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] reset: Create subdirectory for SpacemiT drivers
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-2-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-2-457df235efe9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_092727_876608_4B8CA2CA 
X-CRM114-Status: GOOD (  24.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Create a dedicated subdirectory for SpacemiT reset drivers to allow
> for better organization as support for more SoCs is added.
> 
> Move the existing K1 reset driver into this new directory and rename
> it to reset-spacemit-k1.c.
> 
> Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
> from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
> clock driver to register reset devices as an auxiliary device, so the
> default should reflect this dependency.
> 
> Also sort the drivers/reset/Kconfig entries alphabetically.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

At first I thought this was too many things for one patch, but
they're all pretty simple so I guess it's OK.

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: No change.
> ---
>   drivers/reset/Kconfig                                      | 12 ++----------
>   drivers/reset/Makefile                                     |  2 +-
>   drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
>   drivers/reset/spacemit/Makefile                            |  3 +++
>   .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
>   5 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 6e5d6deffa7d367040b0b380b78ce02d775a3a63..b110f0fa7bb13eff63e1939e50a926cd0106db3f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -299,15 +299,6 @@ config RESET_SOCFPGA
>   	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
>   	  driver gets initialized early during platform init calls.
>   
> -config RESET_SPACEMIT
> -	tristate "SpacemiT reset driver"
> -	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select AUXILIARY_BUS
> -	default ARCH_SPACEMIT
> -	help
> -	  This enables the reset controller driver for SpacemiT SoCs,
> -	  including the K1.
> -
>   config RESET_SUNPLUS
>   	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
>   	default ARCH_SUNPLUS
> @@ -406,9 +397,10 @@ config RESET_ZYNQMP
>   	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
>   
>   source "drivers/reset/amlogic/Kconfig"
> +source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/spacemit/Kconfig"
>   source "drivers/reset/starfive/Kconfig"
>   source "drivers/reset/sti/Kconfig"
> -source "drivers/reset/hisilicon/Kconfig"
>   source "drivers/reset/tegra/Kconfig"
>   
>   endif
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 9c3e484dfd81a4f7b2f156a6226d5fa233600f9f..fc0cc99f8514cac161af59389ba1cbd5490209c8 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>   obj-y += core.o
>   obj-y += amlogic/
>   obj-y += hisilicon/
> +obj-y += spacemit/
>   obj-y += starfive/
>   obj-y += sti/
>   obj-y += tegra/
> @@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
>   obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>   obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>   obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> -obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
>   obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>   obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>   obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..552884e8b72afeb05cdb9b6565ad8e7fd32f990b
> --- /dev/null
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SPACEMIT_K1
> +	tristate "SpacemiT K1 reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on SPACEMIT_K1_CCU
> +	select AUXILIARY_BUS
> +	default SPACEMIT_K1_CCU
> +	help
> +	  Support for reset controller in SpacemiT K1 SoC.
> +	  This driver works with the SpacemiT K1 clock controller
> +	  unit (CCU) driver to provide reset control functionality
> +	  for various peripherals and subsystems in the SoC.
> +
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..de7e358c74fd7b0fac3ec2c18d985331af64fcbb
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
> +

Didn't git shout at you for having a blank line at the end of this file?

> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> similarity index 100%
> rename from drivers/reset/reset-spacemit.c
> rename to drivers/reset/spacemit/reset-spacemit-k1.c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

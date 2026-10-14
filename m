Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD675CC6B19
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 00:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJq6VCEr5LqFGeoD/Pkqg2j1dfjljt/t72pw4kUk5pY=; b=LNSKzlSPBIcFrT
	hYkbEOiJmlCQCjpiq1r3rA6ViMK90y2xI9bfBjR1qw+I834mogZblZ2VKrQ/NuG+95kXcq7BYYOA6
	Mpd8iEgAFKkcr8m5YprdPQTIupJI/4eLrdl+4CJdJw6/S5t/Qx8nDA5lTOi7TejjYuWuK9gPWtAe8
	psXfhsfsUmzamsp8oF1495yf7HGfGmrPBANSofKNm1+noW+iaixTd+/wODtDTyECeVRzRfPj3Nzuv
	5Bdy6CSiQ7+U2pKNbiKzw8+QvtCTQch1IbampDO73o/J/G2nvvY0TlCy8bxk0OBuQ/rlEisQEgCtd
	fNwzDB3dRpKPgC/JboHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmya-0000000EHpr-2QWp;
	Wed, 14 Oct 2026 00:36:23 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGmyN-0000000EHoU-0N8H
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 00:36:10 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7c02791cadcso1105097137.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791938147; x=1792542947; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fETuRtPje6LTC2rIz2bJlcHYx0+4RuHZEXBtVbxeG+A=;
        b=l3Hj/ZqS3DqkMi5MK63+aD/oSNfi28stJ/5KEOa5s8zQ1SeDAo+5v2wOhIEVShOSrf
         23h/gzzObXvCpIREEzIgMY76GZjVzKYpS2b2DnKvP6x9/04q7Av/s8RZ3f6aV+9dhjxY
         ZGsy5UmX91jsiFkn362qdsJ0G5i2FE2qUZM17luNZbls571KhRcfMRKdSLTF3zW8p5j0
         PHQKpswBEIPz1xq7JAkLWWeQG5g/A9vy9Z9sELP7FaksqnpjhH+0myg+ZZlj8v4ovdxO
         wBV64OknEZNykwaGtb7dfc8MkNViDPx6zokhLPfB2kPrnANE6mrD9PQ2H/IshmeWzVzU
         nx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791938147; x=1792542947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fETuRtPje6LTC2rIz2bJlcHYx0+4RuHZEXBtVbxeG+A=;
        b=ub60Kp+xZc8cP/Us9/ghIN4i57szg7ZaoDtY72k2Z5zWj+cmdatiuYo4YeOD1hSTzE
         MwOJbQQ6x+MtXcjFz2xN9XHfUKKL+uGtwVnaDf0FPLohBUJdgG0YK052zGBzM/w+aBe/
         CgZTaxbwhskWLRb/XVICvvvru9aF5cp5Y4CE+lkTr6YwGjbFjdkrbHJh/D7YKoXdcD3Y
         vZWww3ECUP/Ub5hdpKhwLs0pYkoFcUIY3dnTGom+e3ufnrDMVxTX8f+fS5gy51yRl4rG
         hhYttBRnVKlH5uOQ35R4npcopohb9NE+9qjXFG7me7wQiQOJYQzHe4wrwPMzMtDDk5lh
         qaCg==
X-Forwarded-Encrypted: i=1; AKwUvBybZlR/693TaWc+xGN01oAgno7bvO1wnw4oZPLHPbjvhcNS/LN8Nm7qv2zPO6Ej77WzOROfXW1i493sGA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJk4Xtkjad2Xf56EPSQR5lsMXBpU23yEe0rQ/42PjXidcrpV9Lu
	7gWY0vPj9MpOLAzIHhgMCkPjfirWzAUOvcqKQwPCJ7xu7X7XdRDjEQfr9bMJNcLYcEU=
X-Gm-Gg: AYBFou3Zfou2JLPtWARRwDXpFr/kBsnvn0DnWWTsalpvaGQjwFB262B3symJTrECMUr
	/+SQFwswxSALDmdCO0Bc3IHy8nmBNq5v9a3+/85uuxgI6DkxM1XEJcDmAhEg+tN/aMJCaPPZOYU
	dB5tRkOV8QYHhugEjy3kAv2xqWjGF6T/cZva3KECuzCW+LjAH8eVbdY7RmsZsMrbolxKqj4DVZC
	mQDJ0JyAfCrHObmkjaTD5dgG0a74LshvCSx5/OuFrEWzOi0xwCI5H9DfVFkyAT1BxQQbBrhsoLN
	hG3K0jhJAU5bw03kflf1WvlUEhvf6X+wG0ub1RdDrM9E+KN2td5fmRCl/Nul1s4TfFOO3LPl0Jj
	U84CfF59m2E1XpSIl6LdhMVYci9Ctl5CezzrsB8GC2kEPdFdiwoWa37dN+FiGqsVoaZZ6R3lLAs
	8V1kHwvmu/lzl1oaTyfgYnsAuK9NQ4hsSpss6+RSboJouEBKx+wmIUTICmoyUydl8CxiDuL70+j
	iBs3q03sKaWfvxzZ/WZuKAtzD343rPKLfqACvvAirs=
X-Received: by 2002:a05:6102:5121:b0:7c3:6466:3155 with SMTP id ada2fe7eead31-7cb375fcf5cmr3438386137.33.1791938147238;
        Tue, 13 Oct 2026 17:35:47 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cbbd178e4csm4108537137.2.2026.10.13.17.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:35:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 21:35:40 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Message-ID: <as7OCfOlcnqvvE2y@hiagonb>
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_173609_152852_55B995A0 
X-CRM114-Status: GOOD (  28.66  )
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

Hi Inochi Amaoto,

Just a friendly ping about this patch. Not sure if it was picked up by
you already.

Thanks!

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> The CV1800B SoC has a DWMAC controller connected to an internal 10/100
> Ethernet PHY. Both the MAC (gmac0) and the MDIO multiplexer used to
> reach the internal PHY are already described in cv180x.dtsi, but are
> disabled by default.
> 
> Enable gmac0 and the MDIO multiplexer to make ethernet work.
> 
> Tested on a Milk-V Duo (CV1800B) with its IO base board. The link comes
> up at 100Mbps/Full and the interface gets an address via DHCP.
> 
> This can not be enabled by default as others may want to use the same
> pins as GPIO, that is the reason an overlay is being used.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
> Hi,
> 
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.
> 
> U-Boot logs:
> 
> milkv_duo# setenv fdtoverlay_addr_r 0x82480000
> milkv_duo# boot
> ** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
> 1:	Poky (Yocto Project Reference Distro)
> Retrieving file: /Image.gz
> append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
> Retrieving file: /cv1800b-milkv-duo.dtb
> Retrieving file: /cv1800b-milkv-duo-eth.dtbo
>    Uncompressing Kernel Image to 0
> \## Flattened Device Tree blob at 82200000
>    Booting using the fdt blob at 0x82200000
> Working FDT set to 82200000
>    Loading Device Tree to 0000000083560000, end 0000000083568fff ... OK
> Working FDT set to 83560000
> 
> Kernel logs:
> 
> root@milkv-duo:~# ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq qlen 1000
>     link/ether 22:9c:5e:8d:3b:0c brd ff:ff:ff:ff:ff:ff
>     inet 192.168.0.124/24 brd 192.168.0.255 scope global eth0
>        valid_lft forever preferred_lft forever
> root@milkv-duo:~# dmesg | grep stmmaceth
> [    0.580448] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
> [    0.587750] stmmaceth 4070000.ethernet: IRQ sfty not found
> [    0.594165] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
> [    0.604856] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
> [    0.612359] stmmaceth 4070000.ethernet: 	DWMAC1000
> [    0.617641] stmmaceth 4070000.ethernet: DMA HW capability register supported
> [    0.625189] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
> [    0.632191] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
> [    0.639720] stmmaceth 4070000.ethernet: COE Type 2
> [    0.644915] stmmaceth 4070000.ethernet: TX Checksum insertion supported
> [    0.651995] stmmaceth 4070000.ethernet: Normal descriptors
> [    0.657911] stmmaceth 4070000.ethernet: Ring mode enabled
> [    0.663737] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> [    0.671939] stmmaceth 4070000.ethernet: device MAC address 22:9c:5e:8d:3b:0c
> [   13.104870] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [   13.125037] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
> [   13.172421] stmmaceth 4070000.ethernet eth0: No Safety Features support found
> [   13.203664] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
> [   13.229963] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
> [   15.278278] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> 
> [1] https://lore.kernel.org/sophgo/20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com/
> [2] https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> ---
>  arch/riscv/boot/dts/sophgo/Makefile                   |  3 +++
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index d5c80d4ff005..adea990ad912 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv1800b-milkv-duo-eth.dtbo
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtbo
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> new file mode 100644
> index 000000000000..52c85b4e0155
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo-eth.dtso
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Enable ethernet support on Milk-V Duo (CV1800B).
> + *
> + * Copyright (c) 2026, Hiago De Franco <hfranco@baylibre.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> 
> ---
> base-commit: d24e8ac715de2e16a53c144005b1863660a5fbea
> change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40
> 
> Best regards,
> --  
> Hiago
> 

Best regards,
-- 
Hiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

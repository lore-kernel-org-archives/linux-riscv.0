Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3754C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2eLHPi+Uo4VdjD4XDrvHp5g+rFSEqWowPLdAjIhJhw=; b=yJBeUlIakW5Nrh
	3rOf0GggI0Bv7YQQgEN+CU+DB3/IAQyg4edznjoNajANDQKKqEfajLw8RwcDKebcBROzuYAK+Z1vU
	mFfyg8YKYKKKAX3I5J5eEV4T4nfMtJqT6LnG6uZvgwc+DPGFpRw8eTlI7QEcycATSdDjX3rwFHe8y
	4Ccvv0RKe0KAuXKM9vkRbgDbiG+sxPTJ/JzJeBRp5AbO3fldaJsgFrZLAhCk/40gOm8upWdE7AF2z
	/HqIZGiBnc7DMLga35qui6HmwhAS8lZJLvMEMvvvJ6xztxNvJXuAvYSaBTkvOXotHusOUxpAb2BR1
	u3eAnsrMzCHBd+YnRquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVJk-00H0OQ-IR; Mon, 14 Nov 2022 08:59:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVJi-00H0MJ-3Q
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 08:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668416385; x=1699952385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4ZUDBICbMDZqlh25FYQGX210sivr3l1viVzgWGRSaEA=;
  b=tnmn7NadOVEHb5263tQ2nvW1+rnOzcf+z6AfYD/yRbhL2f25/vf6vNFG
   txcVVNAkC5znLApbuvmf8kKLLyAKWVfVo3YkSU6cEDBGNas+W/aBImnGW
   JJbfypwK9icIEo5YBdoWPRGrlnEQkfWC3lDUTBCTk4/sL1puybEY0UIdx
   bITtcBjJL/o4MAs0290YPei00hrGW34NMT26XOb1/A+HLyC66XcT3k2O/
   EcBT/m9zby16i9pMEfuHPwnC5rvdhT0F1xZcZnzsBiLqhHssv5DWuh8+k
   6NOj0qQjiMLT2wt0heQxzFHmE9xVbpzQTTzPmyWAlom2ZqBvZVAaPLDN4
   A==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="199668596"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Nov 2022 01:59:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 14 Nov 2022 01:59:41 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 01:59:39 -0700
Message-ID: <4be97a62-4749-c3a3-5401-6e440c24c3f4@microchip.com>
Date: Mon, 14 Nov 2022 09:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/4] MAINTAINERS: add entries for misc. RISC-V SoC
 drivers and devicetrees
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <soc@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
References: <20221109212219.1598355-1-conor@kernel.org>
 <20221109212219.1598355-2-conor@kernel.org>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20221109212219.1598355-2-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_005946_187553_408EF9A8 
X-CRM114-Status: GOOD (  20.58  )
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

On 09/11/2022 at 22:22, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Following some discussion both on & off list, I have volunteered to take
> over maintaining the miscellaneous RISC-V devicetrees & soc drivers from
> Palmer to ease his load.
> 
> So far only SiFive and Microchip have stuff in drivers/soc. For the
> former, a SiFive entry exists with a dead GitHub repo - so remove that
> to avoid confusion since the patches for drivers/soc & devicetrees will
> be routed via my tree & other drivers go through their subsystem trees.
> The Microchip directory only contains a RISC-V driver for now, but is
> likely to contain drivers for other archs in the future. To that end,
> change the PolarFire SoC entry to specifically mention the RISC-V driver
> & the new directory level entry does not mention an architecture.
> 
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Conor, best regards,
   Nicolas

> CC: Palmer Dabbelt <palmer@dabbelt.com>
> Link: https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   MAINTAINERS | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 046ff06ff97f..b88ced1ff72c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13627,6 +13627,12 @@ S:     Supported
>   F:     drivers/misc/atmel-ssc.c
>   F:     include/linux/atmel-ssc.h
> 
> +MICROCHIP SOC DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +S:     Supported
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     drivers/soc/microchip/
> +
>   MICROCHIP USB251XB DRIVER
>   M:     Richard Leitner <richard.leitner@skidata.com>
>   L:     linux-usb@vger.kernel.org
> @@ -17749,12 +17755,21 @@ F:    drivers/mailbox/mailbox-mpfs.c
>   F:     drivers/pci/controller/pcie-microchip-host.c
>   F:     drivers/reset/reset-mpfs.c
>   F:     drivers/rtc/rtc-mpfs.c
> -F:     drivers/soc/microchip/
> +F:     drivers/soc/microchip/mpfs-sys-controller.c
>   F:     drivers/spi/spi-microchip-core-qspi.c
>   F:     drivers/spi/spi-microchip-core.c
>   F:     drivers/usb/musb/mpfs.c
>   F:     include/soc/microchip/mpfs.h
> 
> +RISC-V MISC SOC SUPPORT
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +Q:     https://patchwork.kernel.org/project/linux-riscv/list/
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     Documentation/devicetree/bindings/riscv/
> +F:     arch/riscv/boot/dts/
> +
>   RNBD BLOCK DRIVERS
>   M:     Md. Haris Iqbal <haris.iqbal@ionos.com>
>   M:     Jack Wang <jinpu.wang@ionos.com>
> @@ -18781,7 +18796,6 @@ M:      Palmer Dabbelt <palmer@dabbelt.com>
>   M:     Paul Walmsley <paul.walmsley@sifive.com>
>   L:     linux-riscv@lists.infradead.org
>   S:     Supported
> -T:     git https://github.com/sifive/riscv-linux.git
>   N:     sifive
>   K:     [^@]sifive
> 
> @@ -18800,6 +18814,13 @@ S:     Maintained
>   F:     Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>   F:     drivers/dma/sf-pdma/
> 
> +SIFIVE SOC DRIVERS
> +M:     Conor Dooley <conor@kernel.org>
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     drivers/soc/sifive/
> +
>   SILEAD TOUCHSCREEN DRIVER
>   M:     Hans de Goede <hdegoede@redhat.com>
>   L:     linux-input@vger.kernel.org
> --
> 2.37.2
> 

-- 
Nicolas Ferre


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

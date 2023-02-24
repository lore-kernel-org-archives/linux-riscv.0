Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24B9C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE57ckWEOXttD4aRbqJElex1xgouvlWAsny0m0wtcWA=; b=vGhZEbrcBIfUxq
	sh6mJhUuRlPhmF6u0akaHALR/Jk1KINHJTxM4Ka3v94OKXBDSkljbtLRdVdTUjJgERQqvD581dtnC
	rJAlS6/hsqNZ4lzcZccodMMj61wNze6P1mOS7AS5AS7hoxRuKaUtGRtER3Vl36K10bolHKMyZfgKF
	PCb5VYNYT0PiCrMpVqftaiE+8tPJPynitpyHpv+EVU69pj0ExJ1JGkuoJ1dUYecyhIf+mTgxM55t9
	Xs3e5/fGi0RpQLFtCA1zvHxKc+v54wV2p3J14cKTy+sTGV5VJtpkIN590B1pmSggfLKHax2wjpVHL
	wpYO+1Eg/6TWzX3NBD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT7p-001U1T-Lo; Fri, 24 Feb 2023 08:08:17 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT7m-001U01-Ew
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677226094; x=1708762094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tK3PjEZic4TnRDEQrMnzOsYQnpHOQ7k2HFJWHp2ltd0=;
  b=bHuwR5r4Y5ZJYIrFLgmd80tiNlvoJaoodH3WBQcfS2mIHARxig9A7lGl
   iWysgGAjaH76QUquWWcVTbcfmJhBbbjGfps1z0cfmoQW6LgV49XPDYbb7
   0y6iiQMa+TDvuc61ESJSTVrro7YtTypZV66RQcbwVkFN7y/m5Irk5EPxD
   O+ggC1y1DX+V8kLU10dWAE1Wb6lqs+GX8uiqZe/N2Y5Cc3HtumqZlGst8
   PY0nHTz3m+pz6qkJVyjLQ++bGEltiqcvf6yYuD2Bk2bM8lk33d6i4/QuR
   DhYaFVwATxvN/EFr2vnNStwlvbjM/eLe0pIh4iWbFLZdvFwJwwgTg+NBy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332108178"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="332108178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 00:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736718256"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="736718256"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2023 00:08:08 -0800
Date: Fri, 24 Feb 2023 15:57:09 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: Re: [PATCH v1 0/6] PolarFire SoC Auto Update Support
Message-ID: <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_000814_532694_F01BA456 
X-CRM114-Status: GOOD (  29.11  )
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

On 2023-02-17 at 16:40:17 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> This patchset adds support for the "Auto Update" feature on PolarFire
> SoC that allows for writing an FPGA bistream to the SPI flash connected
> to the system controller.

I haven't fully checked the patches yet, just some quick comments:

Since this feature is just to R/W the flash, and would not affect the
runtime FPGA region, I don't think an FPGA manager is actually needed.
Why not just use the MTD uAPI? There is a set of exsiting MTD uAPI &
MTD tool if I remember correctly.

Thanks,
Yilun

> On powercycle (or reboot depending on how the firmware implements the
> openSBI SRST extension) "Auto Update" will take place, and program the
> FPGA with the contents of the SPI flash - provided that that image is
> valid and an actual upgrade from that already programmed!
> 
> Unfortunately, this series is not really testable yet - the Engineering
> Sample silicon on most dev boards has a bug in the QSPI controller
> connected to the system controller's flash and cannot access it.
> Pre-production and later silicon has this bug fixed.
> 
> I previously posted an RFC about my approach in this driver, since as a
> flash-based FPGA we are somewhat different to the existing
> self-reprogramming drivers here. That RFC is here:
> https://lore.kernel.org/linux-fpga/20221121225748.124900-1-conor@kernel.org/
> 
> This series depends on the following fixes:
> https://patchwork.kernel.org/project/linux-riscv/list/?series=714160
> 
> The patch adding the driver depends on the soc patches earlier in the
> series, so taking both through the same tree makes sense. Depending on
> sequencing with the dependencies, me taking it through the soc tree
> (with Acks etc of course) may make the most sense.
> 
> The other caveat here I guess is that this uses debugfs to trigger the
> write, as we do not yet have a userspace for this yet!
> 
> Cheers,
> Conor.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Moritz Fischer <mdf@kernel.org>
> CC: Wu Hao <hao.wu@intel.com>
> CC: Xu Yilun <yilun.xu@intel.com>
> CC: Tom Rix <trix@redhat.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-fpga@vger.kernel.org
> 
> Conor Dooley (6):
>   soc: microchip: mpfs: add a prefix to rx_callback()
>   dt-bindings: soc: microchip: add a property for system controller
>     flash
>   soc: microchip: mpfs: enable access to the system controller's flash
>   soc: microchip: mpfs: add auto-update subdev to system controller
>   fpga: add PolarFire SoC Auto Update support
>   riscv: dts: microchip: add the mpfs' system controller qspi &
>     associated flash
> 
>  .../microchip,mpfs-sys-controller.yaml        |  10 +
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  24 +-
>  drivers/fpga/Kconfig                          |   9 +
>  drivers/fpga/Makefile                         |   1 +
>  drivers/fpga/microchip-auto-update.c          | 495 ++++++++++++++++++
>  drivers/soc/microchip/Kconfig                 |   1 +
>  drivers/soc/microchip/mpfs-sys-controller.c   |  33 +-
>  include/soc/microchip/mpfs.h                  |   2 +
>  9 files changed, 586 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/fpga/microchip-auto-update.c
> 
> -- 
> 2.39.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

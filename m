Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96C9C76196
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Apr 2023 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R54iDjkJSserpePCVor/86a/5M8pB4eKFtR/eDYjm0g=; b=1RRV8ghBuxmCMx
	GNEa/VNC9VCP9UOwfVJZzN8zYpnnZ/IXy/WgTvyfDP9P/+v/yhdJoRxX9QaKZEzrd7Vaheh6i3vp9
	2SoOcpY5w0jhnURV5MUF/XcBcSFiAWH40gF5pXCssEr6ESEbeComKnDUcHpwOHEl/m8aUb6HwsWyq
	BwM23HzXGuxk+2FM0FTaTs7epcyWnij3lVv+m4MSH25DQIFRmPRirCUBBiGNC6VSi2pxsVhtVrh5W
	QcWj/56O9KGzV7bVuEZLBQkgD2N6fA0pw8FwX7/Rcc8xI3CYoCvQkEJJioXw/LHr8gCYkStnw1akY
	S2k/Rvsw97Sp3T1Xn5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pisp6-00C1UZ-2Z;
	Sun, 02 Apr 2023 08:12:24 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pisp3-00C1Tc-2U
	for linux-riscv@lists.infradead.org;
	Sun, 02 Apr 2023 08:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680423141; x=1711959141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vJzYzObt+0tswbNIyNBkxTex9FQdktq8tuwEvNZt8w8=;
  b=kA5h6Arjq5iz55HJpSDIZaDJoH2UYN9wNHpGfxc3jk6Jfu/yoj/H5uH0
   uU4As4CKKJRgmxeryZydmKJgb4qk3hyrY+xuX3FORZZaeLd35+Qf8PB4Y
   JpC/qzeyfjZed0ydImM5RpKVI8lKorJccfAw4coChhDee3Y4djBThD44Z
   OOFWqwgLjbbFxth2Rbu2NAoLKf0yqoIgYl+TbnIIuOFfo+zhI3cDLlouj
   9X4GCrJBp5lBDn2RRo9+mPAcm1byCYAi10pgEfnX21+jzaTHXhZJ3Cla7
   xxw9VMPYkNbfAyCOPlgaSEIFUq0o7nJQZTBwSGE1IyyKxtRJZJXPA0T58
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340444911"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="340444911"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 01:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="931673352"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="931673352"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2023 01:12:14 -0700
Date: Sun, 2 Apr 2023 16:00:34 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-fpga@vger.kernel.org, conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] PolarFire SoC Auto Update Support
Message-ID: <ZCk2IgDjHRUlyD+t@yilunxu-OptiPlex-7050>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_011221_823302_CAD6E81B 
X-CRM114-Status: GOOD (  30.16  )
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

On 2023-03-31 at 08:18:16 +0100, Conor Dooley wrote:
> Hey all,
> 
> This patchset adds support for the "Auto Update" feature on PolarFire
> SoC that allows for writing an FPGA bistream to the SPI flash connected
> to the system controller.
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
> https://lore.kernel.org/all/d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud/

Is that series already merged? If yes, just remove this line.
If no, either put all of them in one series, or still make this series
as RFC until the dependency is resolved.

Thanks,
Yilun

> 
> The patch adding the driver depends on the soc patches earlier in the
> series, so taking both through the same tree makes sense. Depending on
> sequencing with the dependencies, me taking it through the soc tree
> (with Acks etc of course) may make the most sense.
> 
> Cheers,
> Conor.
> 
> Changes in v2:
> - per Russ' suggestion, the driver has been switched to using the
>   firmware-upload API rather than the fpga one
> - as a result of that change, the structure of the driver has changed
>   significantly, although most of that is reshuffling existing code
>   around
> - check if the upgrade is possible in probe and fail if it isn't
> - only write the image index if it is not already set
> - delete the now unneeded debugfs bits
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Moritz Fischer <mdf@kernel.org>
> CC: Wu Hao <hao.wu@intel.com>
> CC: Xu Yilun <yilun.xu@intel.com>
> CC: Tom Rix <trix@redhat.com>
> CC; Russ Weight <russell.h.weight@intel.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-fpga@vger.kernel.org
> 
> Conor Dooley (7):
>   soc: microchip: mpfs: add a prefix to rx_callback()
>   dt-bindings: soc: microchip: add a property for system controller
>     flash
>   soc: microchip: mpfs: enable access to the system controller's flash
>   soc: microchip: mpfs: print service status in warning message
>   soc: microchip: mpfs: add auto-update subdev to system controller
>   fpga: add PolarFire SoC Auto Update support
>   riscv: dts: microchip: add the mpfs' system controller qspi &
>     associated flash
> 
>  .../microchip,mpfs-sys-controller.yaml        |  10 +
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  24 +-
>  drivers/fpga/Kconfig                          |  11 +
>  drivers/fpga/Makefile                         |   3 +-
>  drivers/fpga/microchip-auto-update.c          | 494 ++++++++++++++++++
>  drivers/soc/microchip/Kconfig                 |   1 +
>  drivers/soc/microchip/mpfs-sys-controller.c   |  37 +-
>  include/soc/microchip/mpfs.h                  |   2 +
>  9 files changed, 591 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/fpga/microchip-auto-update.c
> 
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

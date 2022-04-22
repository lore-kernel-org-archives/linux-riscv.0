Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76321C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GO/rglfK5Bgoyi+S5DtmSGg5jSyhVvwed5WE4ev161U=; b=iPXKXNqrMpPb6leHU3hxRdfp1R
	db+8c0PT52AIYcJf+n/90fO5RUTIFfffdMUli0Qcx1hW77j3lc3I//rjWA8kWLm/HHyIBSsciIafW
	qkNEq52IEPnM49j0FilTLfln6d+xJrZpTJUn8xrM2/4PDAiy+zgmXH8BXa+cyjEouuDYiumEy4Wp+
	U956L74TY2r+tg4g356eL5v8V63lvNnOi0DC/uNlmaM/OpDFgjaZrmZN97CssRlV+UxuPSYou2Kfx
	h4/E1HTdnhQbh0nqi+ss4rHeladMq2QDjOu44TsW2GD9o8saop4/erOm+XS45uH3Ui9IGeizZLoZw
	wd20vfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhz7o-0029a4-QJ; Fri, 22 Apr 2022 19:39:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhz7j-0029X9-QM
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 19:39:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j8so12997530pll.11
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HUMQ8dOwWcozf0T8hyC7PrAL47Bqnr3PZuCCA3VDyQ8=;
 b=67m2EolxDI3u9U8jdfMMCm41tCPw6FMxg+fnkdtSbwlJM4k4eP9W3LbDIKh3AhJxs7
 5qZNjt6QYsglpHq/suVtVCLxrzzCpxJGw6rQWPL6JRc9iW6vSWoLtwOQuuZCtwFLVQUO
 H05xbTinKEH6Lwyvg5MdlCVc+AdFGtNC3IAz/SfpNS22x7cR3oyaOuN0UANm6sH146jv
 muw+9aZR2Ey8x+YcFiCoURseMa90IhIXX3VRZaMRIG3sa5EsXDEcFXMcTLG3Qd9S8uxg
 C02xg/sP6xPdLUKEBbrTK5WNBPTvZTEC3wq7NoEjIJqe0VhIBcUGzFpKYwjW3gvhty0d
 xCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HUMQ8dOwWcozf0T8hyC7PrAL47Bqnr3PZuCCA3VDyQ8=;
 b=pj9r5+lW9HFV7IXTsOAdW4PYBRfVTADvACoP2CFkcJpjFWrc96owHS3AE4nGE4T81C
 UVmJ+cj4iMa4h3cEpQ/vsZBvUKgs9JcVAwmy1CNNrc/2cuBtsMSly7uAOGex1DrIF61c
 BLCfCE6WGOaBT+biRw8zWvxpnaIm0fq34IWChXNNcdM9H7IfyAnT3UkcX/gatqMjGjuu
 wZ+Bhfa1vO1l8sQ499m8Ex20KNwTYnynMRjKvGtgFJq6HCOztvj98Ihjg+g0/DXVTmIF
 4kcXoQgPATeDk9mTq1n9Qu81LPxTe2aqlyF87GtlJTjDncEwP6+Us4RPJP2f116GgS2G
 w+hA==
X-Gm-Message-State: AOAM5339P0+7Ob+KIqxFt4f2MosCsHY/o/FOzb8covkq6MLcMGSrzQs9
 VdEb9DER8jaesP+EXT/QxE1hwg==
X-Google-Smtp-Source: ABdhPJz91Vr1VWL78e6GXi1sN4DfrxfIkWJFZuUB5PF2qPCekCsORokaFVPX1JbXifzQAib4CZoXKQ==
X-Received: by 2002:a17:90a:d082:b0:1ca:be58:c692 with SMTP id
 k2-20020a17090ad08200b001cabe58c692mr18098614pju.238.1650656359441; 
 Fri, 22 Apr 2022 12:39:19 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 dw16-20020a17090b095000b001cd4989ff66sm6951168pjb.45.2022.04.22.12.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:39:18 -0700 (PDT)
Date: Fri, 22 Apr 2022 12:39:18 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 12:39:14 PDT (-0700)
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
CC: mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
 krzk+dt@kernel.org, daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: conor.dooley@microchip.com, atulkhare@rivosinc.com
Message-ID: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_123924_089200_CD951856 
X-CRM114-Status: GOOD (  36.68  )
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

On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wrote:
> Hey all,
> After the clock driver for the PolarFire SoC was accepted I started work
> on the onboard RTC & found out that the reference clock for the rtc was
> actually missing from the clock driver.
>
> While restructuring the clock driver to add support for the rtc
> reference, I also noticed that there were some problems with how the FIC
> clocks were being used. The FIC clocks are the cpu side inputs to the
> AXI fabric interconnections & are not the clocks for any peripherals.
>
> This first three patches in this series fixes the problems with the FICs:
> - the fic clocks incorrectly had the AHB clock as their parents
> - the last fic, named differently to the others, had not been set as
>   a critical clock
> - some peripherals on the fabric side were incorrectly using the cpu
>   side fic clocks, resulting in incorrect rates.
>
> The second part of the series fixes the missing rtc reference clock.
> There are three main changes:
> - Changing the reference clock in the dt to the external 125 MHz
>   oscillator rather than using the output of an internal pll. This has
>   the added benefit of not requiring changes to the device tree if this
>   part of the bitstream changes.
> - Adding a new clock into the driver that sits above the existing
>   configurable clocks & has the external reference as a parent. The new
>   clock provides the parent for the AHB/AXI clocks which formerly came
>   from the device tree.
> - Adding the rtc reference clock to the dt bindings, device tree and
>   clock driver at the configurable clock level, alongside AXI and AHB.
>
> I kept series separate from [0] since that's tied to the CONFIG_PM stuff
> & fixes a specific problem.
>
> Changes since v1:
> After speaking with Krzysztof, I have merged the rtc reference changes
> [1] with these fixes for 5.18. This was done since the relevant drivers
> and bindings only arrived in v5.18 & there'll now be no issue with
> breaking the ABI.
> Backwards compatiblity with the device tree from before 5.18 will be
> broken by these changes, but the board did not boot then anyway... If
> that is not okay, please lmk.
>
> The patch renaming sys_base was dropped since that's not a fix.
>
> Version 1 would not apply without [0] & that should be fixed too.
>
> Thanks,
> Conor.
>
> Changes since v2:
> - Wrapped text in dt-binding changes at 80 cols
> - Ordered the clock defines numerically in the binding header
> - Fixed the Fixes tag on the last patch and added the second tag
>
> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com
>
> Conor Dooley (9):
>   clk: microchip: mpfs: fix parents for FIC clocks
>   clk: microchip: mpfs: mark CLK_ATHENA as critical
>   riscv: dts: microchip: fix usage of fic clocks on mpfs
>   dt-bindings: clk: mpfs document msspll dri registers
>   dt-bindings: clk: mpfs: add defines for two new clocks
>   dt-bindings: rtc: add refclk to mpfs-rtc
>   clk: microchip: mpfs: re-parent the configurable clocks
>   clk: microchip: mpfs: add RTCREF clock control
>   riscv: dts: microchip: reparent mpfs clocks
>
>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
>  7 files changed, 211 insertions(+), 41 deletions(-)

Thanks.  These generally look good to me, but I don't see acks from 
everyone.  I'm perfectly fine treating these as fixes and taking them 
through the RISC-V tree, but looks like it's mostly clk stuff so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone else wants to take it.  I've put these over at 
palmer/riscv-pfsoc-clk but haven't merged that anywhere, I'll hold off 
until at least next week to give everyone time to chime in.

On a somewhat related note, I'm getting some DT schema failures 

    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
    
Looks like none of them are new from this patch set, though.  Atul's 
been chasing down various DT schema failures so they might be fixed 
already.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

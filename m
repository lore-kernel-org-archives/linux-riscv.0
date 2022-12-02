Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B0C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iz8WQxN3rPhkrMdHZtRe/ChD2Pi1JcNUq1B//tbKSIA=; b=2DhT6d5kfxB5dKHrFX4wDnc+UP
	Iq3A9oIxISJVBtVDaRMe0ai9yzatpNVclywrqAt3H1iGCbC7rLAS495mvYG2Dj1qE73fn+M9vtnjg
	yMcd1OWwhHWrUHpz2Kyt/LrBs1u5tR+Sgm1IqAXltTPL0EsJfuJiXLPQ0OfAAgs88V4+hBbvMrGSu
	3JGEian0kuJAbzdacy6+tuzLwEunLF80vBse2o/CZ9YvEeLXzHMOBEVHvRKE8ln9DvXMTYOIeL50q
	zjRKSNwcrKq+UsvcyXPmhfo9UCT24BDZkp/iOxz3Cti41kn7oPGp4TuS6xtj3cdAxji43oQd6FuqM
	YZITrtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AGW-000T15-CK; Fri, 02 Dec 2022 17:56:00 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AGT-000SyF-9p
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:55:59 +0000
Received: by mail-pf1-x433.google.com with SMTP id 130so5565480pfu.8
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIVCJI4jD1lIjbiWMRsp91OMq2mxFp6avInoFAKoGjM=;
        b=cSgWXMsX1RoL+5udQvWDt9Mzvb/GUkxb7lr4QjFRjq0oQ59uO6vge7FL7/XlwOvtm1
         KugaNQO3/UuThGRpVOYcUYoIXI6Q7h8VmvxxPyMsbJBwnMn8czIub5EC28QJ8sEzTnKy
         dpAHLr6UKIm6MPlD26SKrgxRG8F3IPA0RrQ032XDPKYEOVleaIwxrWV5LxEF1QpbaHZV
         HJyFvVF7u+x8Xd26T2lpr8S5EICPJbooGXlNggHXyBxCQVQbBSSrCfOLFlbsm71EJ/SV
         j5L39oEFJlvJ238eIdswWataHaHR+WZcY25yeumHaQTMj/G4FoMUIXnRkZ6W5nIy7VKn
         mhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIVCJI4jD1lIjbiWMRsp91OMq2mxFp6avInoFAKoGjM=;
        b=bQ7gY9VaXiek5pK7zVXnaWbc2j9zc37NEFji5Gg+7CYkLJ/Z2mQdmRu5y7k3NPhQlK
         zVH3/xtv7FhDcaKZBamXpbC0O7/hfJDzIlgqcuYj7/MuDaG4RKPRUQJ+0kMYpJWnl2Pq
         6sfX5435oYy1AfPw+F8jnYhl8Bu1gpgksU5vdcosHwQPWCup2hn2ujdd60Mk44il9TwF
         DYAzKwSHqoV8RZsM50DZC7xT+8kbnHVY75FN3GXFWwlT9yK77SAprWb++/LjM6T1F88M
         Zt66mmsn6nqcZVSQBbblLNXAkj++0oz66tZMISOCb4I7CHHqLMyvKf1ZhhoE5+xaVi8I
         x+hQ==
X-Gm-Message-State: ANoB5plt/knjR3AkQyECpdAIbqebTDZF2NWRK41EddGO5HEmRnwhYW09
	mDnA355dBHe+APPUtWFUnWsh3Q==
X-Google-Smtp-Source: AA0mqf6AN+4E7ElGbSgBrSB9mToe2z3WVKE97IxqU5sJzaCssDYU0m+RqxwGgAjeYvlEoEAlPHgq6A==
X-Received: by 2002:aa7:8685:0:b0:574:b4a2:bc5d with SMTP id d5-20020aa78685000000b00574b4a2bc5dmr39035823pfo.2.1670003754271;
        Fri, 02 Dec 2022 09:55:54 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z186-20020a6265c3000000b0056bc5ad4862sm5361617pfb.28.2022.12.02.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:55:53 -0800 (PST)
Date: Fri, 02 Dec 2022 09:55:53 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:55:35 PST (-0800)
Subject: Re: [PATCH v2 00/12] riscv: Allwinner D1/D1s platform support
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
CC: wens@csie.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
  Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, heiko@sntech.de, jszhang@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, andre.przywara@arm.com, samuel@sholland.org,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  christianshewitt@gmail.com, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
  heinrich.schuchardt@canonical.com, linus.walleij@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  stano.jakubek@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-1d8384a6-0b34-45e5-aef6-00865a2b840b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_095557_378753_CD612279 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri, 25 Nov 2022 15:46:44 PST (-0800), samuel@sholland.org wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
>
> The devicetrees use bindings from the following series which have not
> yet been merged:
>  - In-package LDO regulators:
>    https://lore.kernel.org/lkml/20221125040112.18160-1-samuel@sholland.org/
>  - Ethernet MAC binding fixes (not a new issue with D1):
>    https://lore.kernel.org/lkml/20221125202008.64595-1-samuel@sholland.org/
>  - RTL8723DS Bluetooth (has driver support, missing documentation):
>    https://lore.kernel.org/lkml/20221125040956.18648-1-samuel@sholland.org/
>  - TI ADC101C ADC (has driver support, missing documentation):
>    https://lore.kernel.org/lkml/20221125220903.8632-1-samuel@sholland.org/
>
> The only remaining DT validation issue is that gpio-fan is missing a
> YAML conversion, although one is on the list here:
> https://lore.kernel.org/lkml/20220126200350.3633576-1-clabbe@baylibre.com/
>
> $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-musl- dtbs_check
>   SYNC    include/config/auto.conf.cmd
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb
> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:0:0: /fan: failed to match any schema with compatible: ['gpio-fan']
>
> I tested this series (DMIC, Ethernet, LEDs, MMC, PMIC, touch, and USB,
> all where available) on the following boards:
>  - sun20i-d1-devterm-v3.14
>  - sun20i-d1-dongshan-nezha-stu
>  - sun20i-d1-lichee-rv-86-panel-480p
>  - sun20i-d1-mangopi-mq-pro
>  - sun20i-d1-nezha
>  - sun20i-d1s-mangopi-mq
>
> Changes in v2:
>  - Add MangoPi MQ (non-Pro) board
>  - Split into separate files for sharing with D1s/R528/T113
>  - Use SOC_PERIPHERAL_IRQ macro for interrupts
>  - Rename osc24M to dcxo and move the frequency to the board DTs
>  - Drop analog LDOs due to the missing binding
>  - Correct tcon_top DSI clock reference
>  - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
>  - Add CPU OPP table
>  - Common regulators moved to MangoPi MQ patch, removed analog LDOs
>  - Removed LRADC (depends on analog LDOs)
>  - Added XR829 host-wake interrupt
>  - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
>  - Removed LRADC (depends on analog LDOs)
>  - Added LED (GPIO shared between onboard LED and backlight regulator)
>  - Added PMIC GPIO controller node (binding merged for 6.2)
>  - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing
>
> Samuel Holland (12):
>   MAINTAINERS: Match the sun20i family of Allwinner SoCs
>   dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
>   dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
>   riscv: dts: allwinner: Add the D1/D1s SoC devicetree
>   riscv: dts: allwinner: Add MangoPi MQ devicetree
>   riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
>   riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
>   riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
>   riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
>   riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
>   riscv: Add the Allwinner SoC family Kconfig option
>   riscv: defconfig: Enable the Allwinner D1 platform and drivers
>
>  .../devicetree/bindings/riscv/sunxi.yaml      |  69 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
>  MAINTAINERS                                   |   2 +-
>  arch/riscv/Kconfig.socs                       |   9 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/allwinner/Makefile        |  11 +
>  .../allwinner/sun20i-common-regulators.dtsi   |  35 +
>  .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 253 ++++++
>  .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  36 +
>  .../sun20i-d1-dongshan-nezha-stu.dts          | 118 +++
>  .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
>  .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
>  .../sun20i-d1-lichee-rv-86-panel.dtsi         | 118 +++
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  96 ++
>  .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  88 ++
>  .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 143 +++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 167 ++++
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
>  .../dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 135 +++
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
>  .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 844 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  23 +-
>  23 files changed, 2346 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

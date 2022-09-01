Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C219EECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MB1v6yjLYAsXp5vTwSVgpR3EvoloqLJIVgFKqNKR84w=; b=EVgTsBsNUMIpIlTv9U5m4sYpNr
	MDepE4ew48TOFQrlWnFcsbB0fsfi8Ln7iqOKy1BG9GReLTX9X0qlanjrn5B9CgMOHEDURh4JhAEnN
	AWIt0dRAMQibee+FKQj2FwYe6JwInVkggfxFsqp/jnQS5d/ignlR8I2fgKfMKDjOlPzJRcC3OHzCO
	hxTq2EN7j/W+XpNfe5edG0ynKXLzisnzU6A2GdksAPVA6rUOhg+LebLItm7VQCT3RVAYzJ+aj2wKQ
	72WtVfkRpiqE98OaCNMXw1+UxsHCL1TqEjMCu7lTxAuG609aXWWnA810Owllu1VGpovMUFTUd7PhG
	31Wznfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTohK-00DqpL-Tk; Thu, 01 Sep 2022 18:13:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTodu-00DpG0-8c
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 18:10:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id f12so17624690plb.11
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=lY3VTHB6YVTIIgZzaayFIL1rgC3z2UNKaC3PZ0i8jJk=;
        b=yIxbnQHwAZ9CufCZUcHz0JsAdm30gGUIv9S5VtbaZM0dN5UnFM5bTbPYpKRguqnC4J
         vXZ4OvvU8hWUtO7RKJWPJxi2HMg9p/LA5cCEfQ8DVZobcCQt0xqnrEv+y8wOWyAbNKV4
         qTpRWmunQxaIywfV8p7HWGn0Rje9FG+4jiNrZ/fruK0jmB+21YsPKykeRIP1JlQ1PiGL
         JHemifGJiUFnJwIA/UofINXbR0JW44yGKCI8eD8X/JuMs6A5vao/Fh3qyJHUYuGD0TIf
         Ux3FeI0c/C2QDu85hUAJdH9pKhN/MLWEdvT6pZD4yUNQQM5s/dR8uTB4Pe9c06a+1C3x
         q/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lY3VTHB6YVTIIgZzaayFIL1rgC3z2UNKaC3PZ0i8jJk=;
        b=KVGpUvWrQzBOcO7ltkuY8Ddoc2nmEoYvc1kHu7H0/oXpS+nmm8/GuFOtJeSB1MSvh8
         5dcSSV3QEoL8s+wTRyQwPHaoaWRnmlJOjnGyYl+NbMC3W3QuBG5czGP4dxLT7X3hWqzj
         PGXQyKoHx433dsGzq2dOEiGg+BrBgX4HSonqhxYcPD59ijncGlHY3XH/pZ+IfQbtfI6w
         hd9fWCVTcIHrnew4pwjH7aYTQiVJUjaqdYSaCszXZEW2hYsOs/dM10EbUTk0q+BRiBNd
         uE0mEmyGkpMiacAsVoTIBCPTf5nFCZZSc+Igf9edk7kt4WTEt+RWnwdbuVjlsYsDSSd6
         1VxQ==
X-Gm-Message-State: ACgBeo3YRrIERXmo7T8JIYobijn0oiZful9EWG4kgCc2VjYAhkNr7dCw
	ziEI0XMDR6f3GhhG4i7pj+7gPQ==
X-Google-Smtp-Source: AA6agR5ODczNCIuopf0Fb0Uq7kPEMaZUQNrpir2XxOhi73xuol9EshAzF2ee5rzoX+VZFQBOBQ4Xsg==
X-Received: by 2002:a17:902:c651:b0:174:36ce:49ce with SMTP id s17-20020a170902c65100b0017436ce49cemr31800364pls.87.1662055814225;
        Thu, 01 Sep 2022 11:10:14 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902680600b001749381ed8csm10527560plk.254.2022.09.01.11.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:10:13 -0700 (PDT)
Date: Thu, 01 Sep 2022 11:10:13 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Sep 2022 11:10:11 PDT (-0700)
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
In-Reply-To: <20220815050815.22340-1-samuel@sholland.org>
CC: wens@csie.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, robh+dt@kernel.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
  samuel@sholland.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_111018_575952_B5348825 
X-CRM114-Status: GOOD (  20.50  )
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

On Sun, 14 Aug 2022 22:08:03 PDT (-0700), samuel@sholland.org wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1-based boards. Many features are already enabled,
> including USB, Ethernet, and WiFi.
>
> The SoC devicetree uses bindings from the following series which have
> not yet been merged:
> - SRAM controller:
>   https://lore.kernel.org/lkml/20220815041248.53268-1-samuel@sholland.org/
> - NVMEM cell bits property change:
>   https://lore.kernel.org/lkml/20220814173656.11856-1-samuel@sholland.org/
> - In-package LDO regulators:
>   https://lore.kernel.org/lkml/20220815043436.20170-1-samuel@sholland.org/
>
> All three of these are required to set the correct I/O domain voltages
> in the pin controller, which I would consider important to have in the
> initial version of the devicetree.
>
> The SoC devicetree does contain one small hack to avoid a dependency on
> the audio codec binding, since that is not ready yet: the codec node
> uses a bare "simple-mfd", "syscon" compatible.
>
>
> Samuel Holland (12):
>   MAINTAINERS: Match the sun20i family of Allwinner SoCs
>   dt-bindings: riscv: Add T-HEAD C906 and C910 compatibles
>   dt-bindings: vendor-prefixes: Add Allwinner D1 board vendors
>   dt-bindings: riscv: Add Allwinner D1 board compatibles
>   riscv: Add the Allwinner SoC family Kconfig option
>   riscv: dts: allwinner: Add the D1 SoC base devicetree
>   riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
>   riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
>   riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
>   riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
>   riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
>   riscv: defconfig: Enable the Allwinner D1 platform and drivers
>
>  .../devicetree/bindings/riscv/cpus.yaml       |   2 +
>  .../devicetree/bindings/riscv/sunxi.yaml      |  64 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
>  MAINTAINERS                                   |   2 +-
>  arch/riscv/Kconfig.socs                       |   9 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/allwinner/Makefile        |  10 +
>  .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 242 +++++
>  .../sun20i-d1-common-regulators.dtsi          |  51 +
>  .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  37 +
>  .../sun20i-d1-dongshan-nezha-stu.dts          | 114 +++
>  .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
>  .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
>  .../sun20i-d1-lichee-rv-86-panel.dtsi         |  92 ++
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  74 ++
>  .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  84 ++
>  .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 128 +++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  | 900 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  23 +-
>  20 files changed, 2045 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
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

I'm assuming these are aimed at the RISC-V tree?  I'm generally OK with 
that, though the DT folks have pointed out a handful of issues that look 
pretty reasonable to me.

I can't find a v2, not sure if I missed it.  No rush on my end, just 
want to make sure I'm not dropping the ball on anything.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

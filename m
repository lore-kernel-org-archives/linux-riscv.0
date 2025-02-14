Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A6AC021A4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ztOTc8sozqE6oRhVFVyNoH3Jofy8/C3dxVcyM2lq8I=; b=l6Z0KZhMTC2rS/
	OpeSjRwQp1fIDQmWsiVVXhqwTOY5aG4ylOBXI+qFm3exnmDoh3bSCJn55ybmFX8DT/f2R4hVcHZOz
	5C5Sivku7v+M9kthbslddZc6+Hnm+SoCCPzgNv6Vy9LTw+lhhv6fivZQ7OqalfJDZ6MXVl+awiOAV
	xdup5yOaKawu0dgOCIVoryyS/5aVQcXNFGd2LM9O6HMTLat+Y0J/7p5oRF+Mb/PAq+FPikb1NVdIj
	SK69WxRTxUZnGLgwI0fdVgqzlfyxUhHrdkrqMfUFUbYVo5MVGut3x+Ihniljfi0/+Vxixj645kEn4
	b/vX/zzACukkOoDJJyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu7b-0000000EitJ-13Du;
	Fri, 14 Feb 2025 11:44:39 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titq5-0000000EfZF-0l0b
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:26:34 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ef9b8b4f13so17595717b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532392; x=1740137192; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=eI55O4Z9/+C8EXUyL0zhDNa0gjOKvtdVxVw80aMHRG/elcw3fyHUkrLQgwp8L9kaz/
         HTmA9xyoo62PHsSvrNCjTVWd0BMxyp+hcLqRxenGKaLp90T02xVFpdrXJr5z2/Dp2hc1
         poYA1dPF2UPyxWIbtVMv+Q8a/BuhcCLLi6W3Q9bvdFmPD1VMJcSak/Fmx908WWjLO9Nt
         iAbwNtrFul/AU1LIifxUeiuAn63xF+IZMu8UARTmIhxtOVksVJFD2zgeEGxUFN7W3U36
         +M455oYXd+fFhYQ3YrK0pI0YhUyjRO+0XFnj/7oLCxAQhyhwhb0y1YK6/w7R/JOIEdXQ
         KGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532392; x=1740137192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0lFTwfZZcUWkq9fJmOvcld23qYjy5biwQLrQr9JB8A=;
        b=oJ2YY8vbLPlYCM95/sv//SPC+0leV/d3ue2xrfhs+ZZNNoutwR50rq5u8M+NeAQeUN
         EhRPB+hACUEpPva0cGmUlpl3t7VkLwk9WNvRIBhcpycBU1rcmBsROAbcHvtsJeDWIwVJ
         be40+ceKNDZzVtIlKdDceXl2APR4dUg3iPbE6DtSkMM9VeeXPq92pMwCu3ru+0GIWVS9
         gKEPLY8vVlnJoFwsFJv8+ANUvquPjb4/0QzdPQPyuKJJZ95zUUKUBQpifEEaC9CLuiek
         m2EVZswRtLIVqY1UROLAwNd5jXt/J9WU3fzLNh+hua/GAeqrj4OWUBPA4uWaNud7wbCA
         dGUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0BgY15HvcWMhPJZ2NP732o7waek0UTK+WurPCIhOGnjPXV48MI3pVjatxElOEXX0QJuGMTtA1zp3Q/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHDvbFvI9ffowzBT+MGaLjaBrRR0RMqAlSC7n4fVsZyhOS0Cts
	Ku7GhCjKPdTzdVi9vly+NWVR5n/gjTK+6b8UxubUH6bSlagKpOKgfxQCD0/6JmB6aHkY/TULeGo
	cR+M83qj8WVXBvhNBl71Pa3MWk+HTbzUxNdeIww==
X-Gm-Gg: ASbGncu99YPtP3m2M20Iue47AbFIwaiQA7cytPFp9jJcau2TZ4NlzBjt+zRoh+nH2Pz
	OZiJflZtmtEkR0NVjkioizaWGL4Uxp2bUqqAHVVWAw8ao2xdqBXLnFm/49DSIi4Nb4jKPlAfPjw
	==
X-Google-Smtp-Source: AGHT+IHgAlZM0IOqZW2VzEw1FYIV10AUY+XwYeC5PGfb6gr8KMhdCaMYxrQJlkGON4FNOU8B5yXkDtD2hxcjbR8IEvM=
X-Received: by 2002:a05:6902:2b11:b0:e5b:18ff:8cf4 with SMTP id
 3f1490d57ef6-e5d9f0c85afmr10803625276.5.1739532391918; Fri, 14 Feb 2025
 03:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:25:55 +0100
X-Gm-Features: AWEUYZkzFAbsbuTJhoDDXcEDwXJNLijMk4rdL9iJXNhVee2PTovAo1vxRBOIWOQ
Message-ID: <CAPDyKFq72fqa9xOOw3m2z2ceTj18JFn42PaqxA4Ks+o9dd3FXg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Support for Allwinner V853 SoC
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_032633_225430_BB73E9E7 
X-CRM114-Status: GOOD (  21.96  )
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

On Wed, 5 Feb 2025 at 13:52, Andras Szemzo <szemzo.andras@gmail.com> wrote:
>
> V85x is a SoC from Allwinner with video encoding targeted for the field of
> IP Camera. It integrates the single CA7 core, and a T-Head E907 RISC-V mcu.
> The SoC has the usual Allwinner peripherals and a Vivante NPU.
> V853 is a BGA package without DRAM, V851s/V851s3 has the same die with
> co-packaged 64MB/128MB DRAM (in a QFN88 package).
>
> This patchset tries to add basical support for the V853 device family.

Patch5 and patch6 applied for next via my pmdomain tree, thanks!

Note, patch5 (the DT patch) is also available on the immutable dt
branch, if soc maintainers need to pull it.

Kind regards
Uffe



>
> Changelog - v2:
>  - rebased on 6.14-rc1
>  - add a needed gate with key support to sunxi clk
>  - rewrite the ccu-r driver
>  - fix license issues
>  - remove the pinctrl binding, as it has beed applied
>  - rework the pinctrl driver, use the new sunxi dt based mux support. This new pinctrl
>    driver depends on the new sunxi device-tree based mux support patch series [1].
>  - remove the new usb phy binding, as the v853's usb phy is very close to d1/a64
>  - add a board dts
>  - ccu: add module description
>  - ccu: fix PLL enable bits, and min multipliers
>  - ccu: change PLL flags to CLK_SET_RATE_GATE
>  - ccu: use SUNXI_CCU_M_HWS at peripheral PLLs
>  - ccu: convert the VIDEO and CSI PLLs from nm type to nkmp according to BSP
>  - ccu: cpu axi clk use pointer
>  - ccu: fix comments
>  - ccu: swap i2s1 and i2s0 bus clocks
>  - ccu: fix indentation
>  - ccu: fix RST_BUS_SPIF order
>  - ccu: convert RST_RISCV_CLK_GATING from reset to gate
>
> [1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/
>
> Andras Szemzo (10):
>   clk: sunxi-ng: allow key feature in ccu reset and gate
>   pinctrl: sunxi: add driver for Allwinner V853
>   dt-bindings: clock: sunxi-ng: add compatibles for V853
>   clk: sunxi-ng: add CCU drivers for V853
>   dt-bindings: power: add V853 ppu bindings
>   pmdomain: sunxi: add V853 ppu support
>   dt-bindings: phy: allwinner: add v853 usb phy
>   phy: allwinner: add v853 usb phy compatible
>   ARM: dts: sun8i: add DTSI file for V853
>   ARM: dts: sun8i: add DTS file for yuzuki-lizard V851s
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |    3 +
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     |    2 +
>  .../power/allwinner,sun20i-d1-ppu.yaml        |    1 +
>  arch/arm/boot/dts/allwinner/Makefile          |    1 +
>  .../boot/dts/allwinner/sun8i-v851s-lizard.dts |  196 +++
>  arch/arm/boot/dts/allwinner/sun8i-v853.dtsi   |  656 ++++++++++
>  drivers/clk/sunxi-ng/Kconfig                  |   10 +
>  drivers/clk/sunxi-ng/Makefile                 |    4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c       |  120 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h       |   14 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.c         | 1145 +++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.h         |   14 +
>  drivers/clk/sunxi-ng/ccu_common.h             |    2 +
>  drivers/clk/sunxi-ng/ccu_gate.c               |    6 +
>  drivers/clk/sunxi-ng/ccu_gate.h               |   14 +
>  drivers/clk/sunxi-ng/ccu_mux.c                |    4 +-
>  drivers/clk/sunxi-ng/ccu_reset.c              |    7 +
>  drivers/clk/sunxi-ng/ccu_reset.h              |    2 +-
>  drivers/phy/allwinner/phy-sun4i-usb.c         |   10 +
>  drivers/pinctrl/sunxi/Kconfig                 |    5 +
>  drivers/pinctrl/sunxi/Makefile                |    1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c    |   53 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |   15 +
>  .../clock/allwinner,sun8i-v853-ccu.h          |  132 ++
>  .../clock/allwinner,sun8i-v853-r-ccu.h        |   16 +
>  .../power/allwinner,sun8i-v853-ppu.h          |   10 +
>  .../reset/allwinner,sun8i-v853-ccu.h          |   60 +
>  .../reset/allwinner,sun8i-v853-r-ccu.h        |   14 +
>  28 files changed, 2513 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v851s-lizard.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v853.dtsi
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun8i-v853-ppu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
>
> --
> 2.39.5
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

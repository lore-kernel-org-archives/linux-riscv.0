Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E2C021B2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 01:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aHGdCOOAhiAYCUp//PH+190BrIApCeORrPBh3DWCsY=; b=bS7i/gO4PUS8uu
	dy9DgDG9WhSo7pF4xfIdRiApfGP4U2Eq6Idea7GXgkdHCQCYTSvz8P4FrfhCdtlcRMIz08ZOLJY9A
	3cpL2aEP5kPBUK6MsEDzhXmbowih62csiQfyms8YmzIpUSPxv6QKa9O+n6W/HtoMzSSu6qh55tiHq
	0SRlja5kLMrKa5PhEKZzs6KneWmbHTv6sZXx+tLM4UAaJIEKCaioNz/3DXGKl1dPnoYT5sEB6jREY
	5uXYg3lP4VBZimCA5lBEQ8csEnHh/0gpWnhB8RmA2Sq+Eyxp55vzSc9nYGck7aTfT0/zHQCcV7qSM
	6Qr7UKcYjWmG+gbU8GHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5nY-00000001xqR-3lq9;
	Wed, 26 Feb 2025 01:01:16 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5nW-00000001xq1-1KbX
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 01:01:15 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 22AB134300C;
	Wed, 26 Feb 2025 01:01:12 +0000 (UTC)
Date: Wed, 26 Feb 2025 01:01:08 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
Message-ID: <20250226010108-GYA44567@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_170114_384169_9B7373FA 
X-CRM114-Status: GOOD (  31.24  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Linus Walleij:

  I'm quite satisfied with this version, but there is still one problem
of irq parsing that haven't been resolved, although it probably is 
an independent patch that we can submit it later.

  For this, I'm not sure what's the approach we should proceed,
1) if we can get current version merged first then solve it later, or 
2) find a solution now and get it eventually fixed in this cycle

for the detail problem, see comments below

On 08:41 Wed 26 Feb     , Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> 
> The GPIO controller request the clock source from APBC block,
> In this series, I haven't added the clock support, but plan
> to fix it after clock driver is merged.
> 
> Due to first three GPIO ports has interleave register settings, some
> resources (IRQ, clock) are shared by all pins.
> 
> The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]
> 
> Note, this patch is rebased to v6.14-rc1.
> 
> This patch series has been tested on Bananapi-F3 board,
> with following GPIO cases passed:
>  1) gpio input
>  2) gpio output - set to high, low
>  3) gpio interrupt - rising trigger, falling trigger, both edge trigger
> 
> This version should resolve DT related concern in V4, and register each bank as
> indepedent gpio chip in driver, no more sub children gpio DT node needed.
> 
> One problem is still not resolved, the interrupt cells parsing isn't correct.
> but it works if request gpio irq via gpiod_get() + gpiod_to_irq()
> 

Let me iterate a little bit more detail on this..

Current this v7 version work great with request irq from gpio, like:
	pin = devm_gpiod_get_optional(dev, "myirq", GPIOD_IN);
	irq = gpiod_to_irq(pin);
	devm_request_threaded_irq(dev, irq, ..)

but have problem if request irq via of_irq_get(), something like this:
DT part 
	mytst {
		..
		interrupt-parent = <&gpio>;
		interrupts = <1 28 IRQ_TYPE_EDGE_RISING>;
		interrupt-names = "wakeup";
	}

In source code
	irq = of_irq_get_byname(dev->of_node, "wakeup");

I've made an attempt to patch gpiolib to support three cells "interrupts"
syntax, but still fail, it always get last gpio irqchip of four, thus using
the wrong pin (e.g: will always get 3 from gpiochips 0, 1, 2, 3)


> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
> Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
> Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
> Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v7:
> - dt-binding: fix 80 column, drop unneeded dependencies
> - tested with patch v3 of "gpiolib: of: Handle threecell gpios" [5]
> - collect review tags
> - Link to v6: https://lore.kernel.org/r/20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org
> 
> Changes in v6:
> - rebase to threecell gpio patch which proposed by LinusW at [4], 
>   drop unneeded *xlate(), *add_pin_range() function
> - add SPACEMIT prefix to macro
> - adjust register comments
> - drop 'index' member, instead calculate from offset
> - add IRQCHIP_SKIP_SET_WAKE as gpio doesn't support irq wake up
> - drop #ifdef CONFIG_OF_GPIO
> - move interrupt mask disabling/enabling into irq_*mask()
> - Link to v5: https://lore.kernel.org/r/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org
> 
> Changes in v5:
> - export add_pin_range() from gpio core, support to add custom version
> - change to 3 gpio cells, model to <bank number>, <bank offset>, <gpio flag>
> - fold children DT nodes into parent
> - Link to v4: https://lore.kernel.org/r/20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org
> 
> Changes in v4:
> - gpio: re-construct gpio as four independent ports, also leverage gpio mmio API
> - gpio interrupt: convert to generic gpio irqchip
> - Link to v3: https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
> 
> Changes in v3:
> - dt: drop ranges, interrupt-names property
> - Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org
> 
> Changes in v2:
> - address dt-bindings comments, simplify example
> - rebase to 6.13-rc3 
> - Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org
> 
> ---
> Yixun Lan (4):
>       dt-bindings: gpio: spacemit: add support for K1 SoC
>       gpio: spacemit: add support for K1 SoC
>       riscv: dts: spacemit: add gpio support for K1 SoC
>       riscv: dts: spacemit: add gpio LED for system heartbeat
> 
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  79 ++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
>  drivers/gpio/Kconfig                               |   8 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-spacemit-k1.c                    | 277 +++++++++++++++++++++
>  7 files changed, 394 insertions(+)
> ---
> base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
> change-id: 20240828-03-k1-gpio-61bf92f9032c
> prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
> prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
> prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7
> 
> Best regards,
> -- 
> Yixun Lan
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

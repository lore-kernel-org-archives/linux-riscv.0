Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ED5FF885D
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HK5bK74Myz18rsYvAOo7TdIpt9WFtbydRiYZhaO408=; b=caw3wt+o0yjz2y
	qbcVHLYk0ksbcT3f7d1X1irjzVzeiMmIfZZsS61bd5a7J9QCeaceePfWuYd5LYF9vh1QeW5gq/sZP
	xnlxKLdGwCoqFjvKYvufCcFPFlr7Sl0ROXm68fpAhx7qNBQGbaZWlpokqVoUKwIVVLTgk1PnqTk75
	BHGxO/wYn0RihPpV/RoxYcCOt3eR6KAbj5K6Nn+EJUBwfYf3pWxFbWuTkkM+m+1Nhw0HGGgBiOtJ4
	WamF6SufzfdConK2MYrmtcqQbkpORL4iYGcBz4UnbRjX9BKHmuRx5YGYLkEVES65m41wrO8R0RMVh
	PfPxgBpLikXI7OrbUV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaFK-0000000ELNp-19hY;
	Sat, 25 Apr 2026 10:28:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaFI-0000000ELN3-0qO7
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 10:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F93541A83;
	Sat, 25 Apr 2026 10:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609B2C2BCB0;
	Sat, 25 Apr 2026 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777112899;
	bh=WlYDlFfUUzFaRHeGD4iH6v+lOpnT6yZ/E73ow4hkmvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG5qN5p1YOXTbi8hrAatRnVtI9aDmhk1wURWmX+P/VtTeHp3J2OaeET1sF8r5oSkL
	 HKNj2Fga+ghyFspQOtAJVd7AiX/tr4J+bmDJVRDkl57yOCz060IQp0ZrYRgE6EfPcU
	 tOOJBPQVlm6zD/g2nkRuumH+NwWyip0yk1faFpkqQxq4KqXB5CfWYQvj5Nlj4Sbhcj
	 3p8+bahZJItL2yYREYmM+rCFneP5rcvE2XVTTAuYl0v5qRhAQeG0eqhFDDcqs6qBhW
	 uke4r2M7WrsmbOhKB+jYKL6e8CKmW78yWmsyvDK8I6/77+yCZRmGJzIUXvxIyHK05L
	 D/BfE+q20oq1A==
Date: Sat, 25 Apr 2026 12:28:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 07/20] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260425-excellent-radiant-weasel-9f99be@quoll>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-8-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424111330.702272-8-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_032820_262930_CF2A8FD2 
X-CRM114-Status: GOOD (  12.13  )
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

On Fri, Apr 24, 2026 at 04:13:17AM -0700, Changhuang Liang wrote:
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "sys2" pinctrl domain.
> +
> +  The "sys2" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of them can be
> +  multiplexed to different hardware blocks through function selection. Each iopad has a maximum
> +  of up to 4 functions - 0, 1, 2, and 3. Function 0 is the default function which is the GPIO
> +  function. Function 1, 2, and 3 are the alternate functions or peripheral signals that can be
> +  routed to the iopad. The function selection can be carried out by writing the function number
> +  to the iopad function select register.
> +  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
> +  bias, drive strength, schmitt trigger, slew rate, and debounce width.
> +
> +  This domain contains an IO group which support voltage levels 1.8V and 3.3V
> +  1. gpiow - comprises PAD_GPIO_A36 through PAD_GPIO_A39.
> +  2. gpiow-inner - comprises PAD_GPIO_A40 through PAD_GPIO_A43.
> +
> +  This IO group must be configured with a voltage setting that matches the external voltage level
> +  provided to the IO group.

Wrap at 80.

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

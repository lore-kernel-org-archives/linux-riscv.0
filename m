Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1EBCC6B00
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm7jeHvos8EJn6+6z22VW4XQ2TwU/wVdAQOoHne4jqA=; b=uKpLIcJ3SQzDN6
	HjRJxQisuIuXU+trKq8T/TXOS3LgYAC137jmdngb2pY2sEZgmKFijXewix1JzNMkKv4oG7UNGquZF
	WxrP/7FnZyeXxfSvtERtVBMdvj3b5gB11Ge6q/mb09Xt7Jl3rTTJad/JXze3IUK/Tk9gzFn1dRvVx
	kuXDZvyqajgszs5Qp43k+E8fYQb0dEV103DBu2SD5bhMjvMXMhfsLvIubrKjmvHCtm+D639WrZaNe
	W3g84vnIuAu0TeYVFPnOMKTqN2k7hbPmd7T7HpNCFtDuKQOxSUblfxUaBwyCmq1uj3VZed0Ja/+8Y
	7e0uvpfc2FyVORxJyNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAW-0000000AD2m-0wLG;
	Mon, 12 Oct 2026 10:22:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAP-0000000ACuA-1RFH
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so13918865e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800519; x=1792405319; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQ8apU/TC78OUyWBg16BbmC/9tMwONU/mzWyf8HFPDg=;
        b=YEo41En8QxdZPNB9CoaE8U0S7sGW6awRpio5sRW0aXW4qSVYfG+vnbxogNaHdYdqfp
         S3qjYz6wpiywfbA/H7yPPx2EHPKH5JHrD8eSbRjt/EfTON7bN9Y3FqB2xcRt0FEPvRgp
         g0ZxbnXDoVoABW4Aj8TJG6xI8j/bX+woLEh152qcHNufUIWBPC87ejiN/EZa7m0cHc53
         2P0Aclw9UJpGR/PRkumlPZgeo3QYcTCIpsR/+umJAMnze7WN7GXvVtly6AdR8Co0ChMz
         r05aQsx7gSw6vVaeKha+TXSWeNAa3Hm1xSc/Hzs0GKXmZ8yxfjpTMsz1W4WKXmzcUc8x
         4N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800519; x=1792405319;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ8apU/TC78OUyWBg16BbmC/9tMwONU/mzWyf8HFPDg=;
        b=0QU6s7QUf01UqbbksB2mN4Tu88m4iOLhkRhQwBitzqLGJIq5HNAcPW1CAZNPfTkTi0
         X+pLqdGu3MUFRks1EAlI0LViEDL8a1A9gPli6E0NQPdZkPRuT4UaOnOeqMkVgykz1nci
         Yv/VwhvgUTWxMzPBrW3jc3/WOjgu0chzE6m9GbR9siCF0dJ449FbOAuwczLvjEAsufXs
         K70jsivwcU0SUW30Tc4gSHxwYa7U8Adr9hKWjD9KnOWiEu1uuIHBD+j96io6KqxXWd/c
         c10nsjlnLNhASGUh3BinSShmmrj1+E+rYOI0jpY0v6/6oxNNOHCSpMtSxhFbZyPdW3JF
         BoBw==
X-Forwarded-Encrypted: i=1; AKwUvBwf7v9gCLtrkcUE044MBaowe9uHp+8RqdsvHWff/8Z9t2e4uLfVl5X6vxpml4d07njprkhEeYjqJ5T8dg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI1T9pyAKhRmdVTXvd6IdfdusT6NXDN3bHoggXulRkSiJ8RlIQF
	5lj0BkeMSSZ3MwNtmlj8S3kzyl5IiSXRqejVtFrJskIK1RNRktaSjvuqy7iT7T+rNfZbuKPoqaI
	/d2Tmh+4=
X-Gm-Gg: AYBFou2EGD1ydjQv0P4j1TZeLIpdHOcXlAlnQjiNd6VhR2X+mrhhBG7j2ZvYwHZBrIa
	QTwqFS2b9YlJfC3PDpXUopkkH8DGh4pJ2zysVmJAVT8GSQzhvQIOa7NMzu2PKInCzyPoKeHMVeF
	54iYh5AYiogrqgvhw5Z5dt0Np2NmPiYeKFrUfHthQPFs45RkKY2yGuhW5cRpI4G1VrsZ5/BiGgZ
	zDuXP6bWl3tKyiX9UGOToYSwbv1lPVvbxzwI54tHNcnN0d16nr50vMOn9MjLpY6hvW9NF0zYJFG
	udAW24pM6/rhbSnaNOWvlHRRCxb9QGb+lU5EgKlZiL9wrq3f54txDxe0clYhnyCsMxED0/e0jrO
	+rUW+UTYSvgXF+qYU9MhIZoVgpXn0tq9lTmo6lD4/ecLEmfS3XulshaxKld7fIyZ//TfQfu55iz
	/ws94cId4rJqY1AwzXIRMB7DCESqIWvIybOy4fQkfHDGPXS3XIF4aREHXUl8pYD1njI4zLEB1aC
	0Yg+Q4vSFXetSwqFA==
X-Received: by 2002:a05:600c:1909:b0:4a0:2391:6529 with SMTP id 5b1f17b1804b1-4a18e4d3f12mr185023125e9.29.1791800519433;
        Mon, 12 Oct 2026 03:21:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm157509785e9.2.2026.10.12.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:59 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 06/15] clk: starfive: Add JHB100 System-1 clock
 generator driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-7-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-7-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.3501923081079835549.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YyoMrHD861VVJe+iGivxq1ZHVntN1q/d1zW1Rds/nog=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuz/OvmOF/+PdIvvq15Kvru33VB0vvWu2u6yyRuPi
 7Tr3lYR6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEwr4yMmx47H9k33SjzKWC
 bxPfrBdz/X540yORr1XnfNk3bffc2SzD8E95Jffi+BLeqcIv406da9VQudt6IN/+6hTZJxl5UaJ
 7+zgB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032201_658758_15F44624 
X-CRM114-Status: GOOD (  23.72  )
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

> Add support for JHB100 System-1 clock generator (SYS1CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 ++
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-sys1.c   | 118 ++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index cd5b7754403e..11da8bcc4046 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -82,3 +82,13 @@ config CLK_STARFIVE_JHB100_SYS0
>  	help
>  	  Say yes here to support the system-0 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS1
> +	bool "StarFive JHB100 system-1 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-1 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index d2ba83d7d02c..0061550e0f7e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys1.c b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
> new file mode 100644
> index 000000000000..db37b243db18
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-1 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_SYS1CLK_NUM_CLKS			(JHB100_SYS1CLK_BMCPER3_CFG_125 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS1CLK_OSC			(JHB100_SYS1CLK_NUM_CLKS + 0)
> +#define JHB100_SYS1CLK_PLL0			(JHB100_SYS1CLK_NUM_CLKS + 1)
> +#define JHB100_SYS1CLK_PLL1			(JHB100_SYS1CLK_NUM_CLKS + 2)
> +#define JHB100_SYS1CLK_PLL2			(JHB100_SYS1CLK_NUM_CLKS + 3)
> +#define JHB100_SYS1CLK_PLL4			(JHB100_SYS1CLK_NUM_CLKS + 4)
> +#define JHB100_SYS1CLK_PLL5			(JHB100_SYS1CLK_NUM_CLKS + 5)
> +#define JHB100_SYS1CLK_NPU_NCNOC_INIT		(JHB100_SYS1CLK_NUM_CLKS + 6)
> +
> +static const char * const jhb100_sys1_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +	"pll4",
> +	"pll5",
> +	"npu_ncnoc_init",
> +};
> +
> +/*
> + * Regarding the CLK_IS_CRITICAL flag:
> + *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
> + *   or not a consumer holds them, such as the bus interconnect and always-on
> + *   blocks. Gating them hangs the system, so they must never be disabled.
> + *
> + * Regarding the CLK_IGNORE_UNUSED flag:
> + *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
> + *   keeps them in their hardware default state (enabled) instead of letting
> + *   the clock framework gate them once it disables unused clocks.  If this
> + *   flag needs to be removed later, it must be ensured that these clocks will
> + *   not be disabled even if they are not consumed.

Those comments you are using are too generic and not really helpful as they are.

For example there is no CLK_IGNORE_UNUSED below but the comment mention it.

On the previous patch you've mention CLK_IS_CRITICAL and the fact the clock must stay on.
It is the flag definition so it does not help much.

For each clock with this flag, adding a quick comment explain *WHY* is must stay
ON would be a lot more helpful for a future contributor wondering why it was
put there and how it can possibly be removed. IOW, what device does this clock and
why doesn't it have a driver ?

... and again, I don't think a USB clock should be critical.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

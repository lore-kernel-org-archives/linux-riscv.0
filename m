Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00094C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:59:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8199B206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjW4b3i3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8199B206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vaE6QThGvEGvwUEz5k4kSzZqISVbu1zg4Dujj8YtQtE=; b=YjW4b3i3EnAgL3mMxD4Akz82J
	yj83pix9qS0MAsOPXePYsFqlD+F1DjwCFEBFDESh6Ke/wJ/UHiUSq94RIWlga79uORGQjeklaP+0p
	LCNatai/3axeQUab30Na2H/tqsqWCXr5cqCGH8YZ0oxuJGcW6AFRlXhir+fdwZ1x2r/ZKQ3zgi+76
	jZuvkDInf+EsoImvwpwdpUALGOTQQ7Ui6r+uElD4JtgtRp+3d+jCoiAuKniFnq4wdEnta1AhHnmX3
	Oypjx6AbYrPSfvehlUy5Gs7TRNVK4Q0z/YPESwwLA0MrTNPFBjsQwMN5kowGV95M+GncC9WSQmig0
	WJQjKbMcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFC2-00053v-5t; Mon, 09 Nov 2020 21:59:18 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFC0-00053Z-8j
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:59:17 +0000
Received: by mail-oi1-f194.google.com with SMTP id m143so11933764oig.7
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 13:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UVi7/sTYybgJh6ZYR3cD0TOWbRw3z1zGkLRVe5rvAZs=;
 b=YWIgw0yDLRgTtJk+ReHh0gX/foMF8Wxc/5hTRhPzXiyY37VEF9TYDKO/AdmIxgLzzE
 gOex68zJi95kk2sXQIEb43M/Sz9VHFN4uy5WUX+Pdt9740uvyOY7ULHHBDrvdBqMW1m7
 TpCBT2sYP/FwI1VQBfH1Zmfk6bfztWEioedwg31LIDn1sYv1H3YifTe0WkOJBHMKwGik
 /K2DU9u5UoBCAPllkJTLKbRNVYAFNByyjAyvaLQrP08FshSBNkk8PRB82rvQcJAvhI0b
 D9OPwGkmXJasNFoci43HOVMe94NZ5Q3zR9PKw1C10lVpLrUbd/HFU7ICw6LVEuWUkQMH
 loAA==
X-Gm-Message-State: AOAM532+luCWydWM7lnitakrj/F2L1vMjiDsw2SUjOczEsPzIfDxA4eX
 8ihaAXg8o5MFjG8/T/FtmQ==
X-Google-Smtp-Source: ABdhPJyWkgNEZxra4dYV7f+rOtkuIME4kqLOXZ8Ih+K/nSTDfKadg1ResptqO8GoV4nmSP59pNTN2A==
X-Received: by 2002:aca:7250:: with SMTP id p77mr860507oic.130.1604959155207; 
 Mon, 09 Nov 2020 13:59:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b185sm2691837oif.5.2020.11.09.13.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:59:14 -0800 (PST)
Received: (nullmailer pid 1829665 invoked by uid 1000);
 Mon, 09 Nov 2020 21:59:13 -0000
Date: Mon, 9 Nov 2020 15:59:13 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 15/32] dt-bindings: Define Kendryte K210 sysctl registers
Message-ID: <20201109215913.GA1828781@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-16-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-16-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_165916_334121_EE402637 
X-CRM114-Status: GOOD (  18.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:14:03PM +0900, Damien Le Moal wrote:
> Introduce the dt-bindings file include/dt-bindings/mfd/k210_sysctl.h to
> define the offset of all registers of the K210 system controller.

We generally don't have defines for registers in DT.

> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  include/dt-bindings/mfd/k210-sysctl.h | 41 +++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/k210-sysctl.h
> 
> diff --git a/include/dt-bindings/mfd/k210-sysctl.h b/include/dt-bindings/mfd/k210-sysctl.h
> new file mode 100644
> index 000000000000..5cc386d3c9ca
> --- /dev/null
> +++ b/include/dt-bindings/mfd/k210-sysctl.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2020 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + */
> +#ifndef MFD_K210_SYSCTL_H
> +#define MFD_K210_SYSCTL_H
> +
> +/*
> + * Kendryte K210 SoC system controller registers offsets.
> + * Taken from Kendryte SDK (kendryte-standalone-sdk).
> + */
> +#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
> +#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
> +#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
> +#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
> +#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
> +#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
> +#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
> +#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
> +#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
> +#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
> +#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
> +#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
> +#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
> +#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
> +#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
> +#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
> +#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
> +#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
> +#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
> +#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
> +#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
> +#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
> +#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
> +#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
> +#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
> +#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
> +#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
> +
> +#endif /* MFD_K210_SYSCTL_H */
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

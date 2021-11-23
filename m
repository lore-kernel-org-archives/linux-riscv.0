Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4EDC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvuntiarljl8+4PWkS8buibfG1nKYqBR9xiR18B7tIg=; b=Yf0uOHSg/3gn/f
	6AnOrwHA+x8Kb18SsOzko0uvAC0UOl6UW5O/1LJ0ORgslimY48fcnlrFZPkUSXqTscJ/beQFceraU
	UlxCsom0TeS7osbEcyYSjrmIi5Xqe775OxD193S4F0amGn9QZ9XJCyaKOiWKkLvgQ69k0CeQLtOa+
	R8lkv7QH4bUX2huw7geCYTpXGiihn8p48NN3ErSyGoTdPkuciTTeEb9CubTy/qDfdvGKM6QPTCHg4
	oQkvFCqkPPKGkaxqAiWS2ZX4tSGLae6QOJQEVhHtVObtUkG/tg9NyWKxU71F3v+rD7vs6n0JFc197
	LQ+J2chxUJxBYi7pgVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTen-001puq-Pl; Tue, 23 Nov 2021 11:08:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTek-001ptd-Qs
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 11:08:12 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mpTeV-00086y-0h; Tue, 23 Nov 2021 12:07:55 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com, atish.patra@wdc.com,
 ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, conor.dooley@microchip.com
Subject: Re: [PATCH 01/13] dt-bindings: interrupt-controller: create a header
 for RISC-V interrupts
Date: Tue, 23 Nov 2021 12:07:52 +0100
Message-ID: <272946671.hFph3VMliC@diego>
In-Reply-To: <20211108150554.4457-2-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-2-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_030810_908371_5B2E0FBB 
X-CRM114-Status: GOOD (  18.08  )
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

Am Montag, 8. November 2021, 16:05:42 CET schrieb conor.dooley@microchip.com:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 
> diff --git a/include/dt-bindings/interrupt-controller/riscv-hart.h b/include/dt-bindings/interrupt-controller/riscv-hart.h
> new file mode 100644
> index 000000000000..e1c32f6090ac
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/riscv-hart.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2021 Microchip Technology Inc.  All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H
> +
> +#define HART_INT_U_SOFT   0
> +#define HART_INT_S_SOFT   1
> +#define HART_INT_M_SOFT   3
> +#define HART_INT_U_TIMER  4
> +#define HART_INT_S_TIMER  5
> +#define HART_INT_M_TIMER  7
> +#define HART_INT_U_EXT    8
> +#define HART_INT_S_EXT    9
> +#define HART_INT_M_EXT    11

(1) From checking clic doc [0] I see an additional
	12   CLIC software interrupt
defined.

(2) The doc states that the ordering is a recommendation and
	"not mandatory in all incarnations of the CLIC"
Is that clarified somewhere else that this more than recommended?

Thanks
Heiko


[0] https://github.com/riscv/riscv-fast-interrupt/blob/master/clic.adoc

> +
> +#endif /* _DT_BINDINGS_INTERRUPT_CONTROLLER_RISCV_HART_H */
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

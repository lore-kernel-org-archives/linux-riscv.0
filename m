Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6948C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:30:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A678720672
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVE5qzQ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KiriFpDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A678720672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+Sw0S8wrjgDjvlecVhqaBCw6oMMP1Ppr3LeS0Kup+6M=; b=pVE5qzQ9Tt5cmmO4Nx2S0IcUJ
	pBqQ08DggWZ72zhTl1NgZBWmjESJenEdNjx9HWk2I079Ok+0V2eBFpCIJHkyAyvnBc0Luxow53X+J
	SYUG649euetSo7wKzmjPAgIMVSgjRQ6mJHHyEs5ABaKY3bDqY8fzmMceTkvdxEpS3YpoGoQA1d+7F
	gOek8Vg5gXF0iu2b3wMlI7yoXntoRyq6+ysslRMr+4Lst2bBCx38wWILGIxxlSJgM4krJbJJt0xDm
	/mJfukrxzgJWEMXQiPGvky3G09aaSHk4wgssozrj/Nr9x1XOI8rTMNvwAxE5kexQ6D7iZbZvK4srr
	ovdittqOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKts-000679-Dg; Fri, 07 Dec 2018 18:30:56 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKtb-0005kZ-ER
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:30:55 +0000
Received: by mail-pl1-x641.google.com with SMTP id y1so2185245plp.9
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=W8EggpNqVluQivnmp6iZyHVmDWnm/JueOezDzfiTuXY=;
 b=KiriFpDDC62/TPlCCHB38BoU4fopb6xpYfvpq0tsEGPUtcVrl+hteWe/GR4EArFjoq
 nQ+ptd8mJGKvr6djt5v+QmQhmw0PRZ1XVTQ4JqoNl4IfNVEZIgQhp1hOH4ANC4BzjU5V
 JMjUglB70auPStIAyviDxc5VK7ZmRb9bOCaauDVob8Mi1sfC2nr1P5mYw0NqisMtNEg2
 y38U4pOhJeAk26h4q7UbWVvK25wZQK32TiXPQcUtCY6zuJn6cGn0aBqE42yoBIbjlalz
 AKSi00FjJyQZd3tcuT22w/8miAHXprCyWrkxNIvl7VLOA3tdlhE7+3qI/Nz4DmVbE7FC
 sIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W8EggpNqVluQivnmp6iZyHVmDWnm/JueOezDzfiTuXY=;
 b=k/NemqXBS9KzxNUhNY7ZXxCCVQXfmQeiQLrueygdZ5y23yqHFDFep5zdlu/HFg5kec
 qd0SHQ7M6UFfVkP7iI+gEuGh+xLlvORrojCgEb7vwbBflQ96J3Vdt1vgyjRaCU1ZCzcY
 DfVfRlR8SvXZhQtCIGh+3wuIbOtEYtA2eS5oCXyc8DmsXtpMbppzsov+7I7534cu6E7y
 w3BZ0vR3FAUrfatSfTxeWT1mMPoVcS/uC5DqbrSk9JlYJlCR7d5UbmvQ9lTNPzgvXRft
 b1EXx9J16Pxe2Ry6fP0E2eJxWATtxAOQvawHbHSFftdP97eq/77eZf3aU6imHOSX7JM7
 Z+IA==
X-Gm-Message-State: AA+aEWZ+gC7RSvyWkxAjWTUataSkoZUqrnRyJ7ZTPDg2+9OtqT3gxKqT
 VSHYP3Yuu+lobhNFM1g4yZEbBA==
X-Google-Smtp-Source: AFSGD/Xi/eZBBPy6a3ucsqeinj+9pPNX9MIWjSNXajUSVyZJ+Cb1hfLf6sMgxUT+MvxLSBeJD7gLvA==
X-Received: by 2002:a17:902:31a4:: with SMTP id
 x33mr3067158plb.41.1544207428755; 
 Fri, 07 Dec 2018 10:30:28 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id g190sm4641158pgc.28.2018.12.07.10.30.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:30:27 -0800 (PST)
Date: Fri, 07 Dec 2018 10:30:27 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:12:36 PST (-0800)
Subject: Re: [PATCH 1/3] tty/serial: Add RISC-V SBI earlycon support
In-Reply-To: <20181204135507.3706-2-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-03b5ef96-37b8-4a95-94fa-2fb5e8e59da3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_103040_141179_048C788C 
X-CRM114-Status: GOOD (  20.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 05:55:05 PST (-0800), anup@brainfault.org wrote:
> In RISC-V, the M-mode runtime firmware provide SBI calls for
> debug prints. This patch adds earlycon support using RISC-V
> SBI console calls. To enable it, just pass "earlycon=sbi" in
> kernel parameters.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  drivers/tty/serial/Kconfig              | 12 +++++++++++
>  drivers/tty/serial/Makefile             |  1 +
>  drivers/tty/serial/earlycon-riscv-sbi.c | 28 +++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 drivers/tty/serial/earlycon-riscv-sbi.c
>
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 32886c304641..287bb41ac814 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -85,6 +85,18 @@ config SERIAL_EARLYCON_ARM_SEMIHOST
>  	  with "earlycon=smh" on the kernel command line. The console is
>  	  enabled when early_param is processed.
>
> +config SERIAL_EARLYCON_RISCV_SBI
> +	bool "Early console using RISC-V SBI"
> +	depends on RISCV
> +	select SERIAL_CORE
> +	select SERIAL_CORE_CONSOLE
> +	select SERIAL_EARLYCON
> +	help
> +	  Support for early debug console using RISC-V SBI. This enables
> +	  the console before standard serial driver is probed. This is enabled
> +	  with "earlycon=sbi" on the kernel command line. The console is
> +	  enabled when early_param is processed.
> +
>  config SERIAL_SB1250_DUART
>  	tristate "BCM1xxx on-chip DUART serial support"
>  	depends on SIBYTE_SB1xxx_SOC=y
> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
> index daac675612df..3ce26ce08616 100644
> --- a/drivers/tty/serial/Makefile
> +++ b/drivers/tty/serial/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_SERIAL_CORE) += serial_core.o
>
>  obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
>  obj-$(CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST) += earlycon-arm-semihost.o
> +obj-$(CONFIG_SERIAL_EARLYCON_RISCV_SBI) += earlycon-riscv-sbi.o
>
>  # These Sparc drivers have to appear before others such as 8250
>  # which share ttySx minor node space.  Otherwise console device
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> new file mode 100644
> index 000000000000..e1a551aae336
> --- /dev/null
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V SBI based earlycon
> + *
> + * Copyright (C) 2018 Anup Patel <anup@brainfault.org>
> + */
> +#include <linux/kernel.h>
> +#include <linux/console.h>
> +#include <linux/init.h>
> +#include <linux/serial_core.h>
> +#include <asm/sbi.h>
> +
> +static void sbi_console_write(struct console *con,
> +			      const char *s, unsigned int n)
> +{
> +	int i;
> +
> +	for (i = 0; i < n; ++i)
> +		sbi_console_putchar(s[i]);
> +}
> +
> +static int __init early_sbi_setup(struct earlycon_device *device,
> +				  const char *opt)
> +{
> +	device->con->write = sbi_console_write;
> +	return 0;
> +}
> +EARLYCON_DECLARE(sbi, early_sbi_setup);

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

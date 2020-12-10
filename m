Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53131C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 10:05:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C36022DA9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 10:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C36022DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EMyNe8jRs98jSuWPF5MV7uUo1lwIjP+LrQI2oOQ4puo=; b=1EtwRYXGMghEt97guQKzosTLm
	9yRYUUuhahcRnXnlYLO4IPtmKiJixGUGz+uKkZsLQ9jHY1KojeNOXeZVvkh2YYqlcZ+BXGxJFKmy/
	0e0aI6U5UuLRkDwgk9W5CAlMIqvTAYWAF3mIoy2DL+4UloGT4h5jkMqoydrGA3RXuVjHf+jiKvHiF
	C3G2/l9duDHM7CKOyNOygBCW2RRIxN+AnRsjbEWy3X+CfIBl0WB3qCLfyydoeiQp44X+h0brdeVT/
	N7lr/M+NQm0mKuz9+oZZoyHtO/yk8VcQfXUrQ8jWIteRD6Gem+/Q3fxdT4Cn1PNLmNKxofnV5eTnd
	ysblQlyjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knIov-0003Gw-A3; Thu, 10 Dec 2020 10:05:09 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knIor-0003GW-FR
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 10:05:06 +0000
Received: by mail-ot1-f68.google.com with SMTP id b62so4334721otc.5
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 02:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAZ8PgYzvtbc3rL4ZfV3e1oM3SXylqOqHN7opQzLty8=;
 b=Bz1zjckmOCipzFS/1setK37WysTN1vdHtkJ4eX0e+SF/qYwM3BbTXw6Ki1q9CSD3hx
 g9dwxYaSJ4+5KwqxQzjSFJbmmhJMnfzI4s9+WllaLrgJaP4ciD1i2UR+JxM7K+OHJMb8
 fdt2jBpPUUNvBkUY3eqB96inED4DemnUJR+UatfYKq4tqFCxJZ6JdVLGszsw3DGC1oh9
 ddkmtB2G+guBO0UNhFLeHtmRcb3ZbpqpPlvj9qv3nIBKUJwlK+VsVmaDY+oc1TiwvTEq
 xhlbUEXvhihAps1lH8UgCLjxe3XwkQwZ3sx2RsUlOlujVZZ0B0+Ahj6A7e7G40HIroH2
 q67w==
X-Gm-Message-State: AOAM533mpDRBAgFK7SMXhV9u6pRW5O/F4jRex+3BInxMggO8aB3n/GBa
 QHKd6epvFpfrX0ru8OISnuqWcqcfu+9MYfSzcQY=
X-Google-Smtp-Source: ABdhPJyZli++OabJZH6oIk+doFCPUSskqqsQBvXQPxaex8q/acKKJGdIBrCVdCFmU/ZT7NKzZrrVrWx4c80BaVxZYR8=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr5253404ota.107.1607594704647; 
 Thu, 10 Dec 2020 02:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Dec 2020 11:04:53 +0100
Message-ID: <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_050505_550777_419F2B67 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Changes from v6:
> * Annotate struct platform_driver variables with __refdata to avoid
>   section mismatch compilation errors

Blindly following the advice from kernel test robot <lkp@intel.com> is
not always a good idea:

    The variable k210_rst_driver references
    the function __init set_reset_devices()
    If the reference is valid then annotate the
    variable with or __refdata (see linux/init.h) or name the variable:

If your driver's probe function is annotated with __init, you cannot
have a pointer to it in the driver structure, as any binding done after
the freeing of initmem will cause a crash.  Adding the __refdata merely
suppresses the warning, and won't avoid the crash.

There are two solutions for this:
  1. Remove the .probe pointer, and use platform_driver_probe() instead
     of platform_driver_register().
     This guarantees the probe method will be called only once, before
     initmem is freed, but does mean that probe deferral cannot work.
  2. Drop the __init annotation.
     This means the probe method can be called anytime, and supports
     both probe deferral and driver unbind/rebind cycles.

Given the limited amount of RAM on k210, I think option 1 is preferred,
but may require careful tuning of the initialization order using
*_initcall*(), to make sure probe deferral won't ever be needed.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB291C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 16:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57275224DE
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 16:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57275224DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AkecHzwhCoGMY8xMzXoYe5Goqgc7kQCFotU/SKuvZn4=; b=p3H4k5qAPD9jVllIXsWh05fUu
	WASBeeFod9kwWSg2MtFn84ujBJruI5cfXqlrDCUo+WMDYraRw4Q6Kc/wdzRTe6ySdIrQYIflusJjN
	mZcDh8PVJPDqzfZBFE36F5jQjuVBZpNrurcxXyQLX1tsq77bcSWlge2jcSbcY9IGKKDWHFlrgrJoS
	7WQsZMt5t6vGuvu8nOqlpieCZkiq0RjhXwnvyZvL5Mq4fv3LrS7Pv7MCFXBCTarjKn9aiAWjK9bGT
	RpqFJA0RwPvcRP3qQvTx5JJrlvRda2tooVrzwuhw4WptF91KeoFo9CdKaZysOKR4aIXDZ8Bz2TCTq
	4SVZLkclw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwT2k-0004T9-T9; Mon, 04 Jan 2021 16:49:18 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwT2i-0004Sk-HM
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 16:49:17 +0000
Received: by mail-ot1-f46.google.com with SMTP id b24so26635160otj.0
 for <linux-riscv@lists.infradead.org>; Mon, 04 Jan 2021 08:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fkrQP4tLbvvA8Dq58BtGeBgLkf6qqiDBKQsJadGDrI=;
 b=pWkMZ+Qv+ENq3PLZrFXxhrud7Vwp8GF1LouW2uorpMr9r3rjM+L6pA0rd64dUNiZQH
 QvwpCL3SLpA2X8hDcKJ0oCen8MkDhQiBzzkqYTdD2ScGo3VDD/Z/8V97BhEuZUwbsnWu
 sO/lDuAPaRfjnfPgA3BZlKF0pqDXH6YTXbDwyWJOydWZXCv7vpslnn1OMy0+UKz76FE5
 FXOUM6U4ECdCZgdBKebAbpxLUXNMEXMYxNFESsnGfKwJ6g4zSsBtWvHe5+18bX69mNlX
 OBJxS/lmqolBf1xH13xdw9DWKFAASiNx1C1IbCBbzuPtLYbe2tMvninAt/bX0/KlrFkE
 VBEw==
X-Gm-Message-State: AOAM533sOqAk1TazX+eBpg3Ao9KBm+trkC6CMoYyndzsn+lhIaUwnia3
 3jumpt0R/vdjSEOZrxyRlwXYgU3ObNpIi2XRe+w=
X-Google-Smtp-Source: ABdhPJw/fX5bDYgvVjAZ3/BXEfeMxMiKSCRsFXnDni2smUO6Y2LjN6+8nWI9zHhWsMEQkXD5+HFg8UlLyux2KP2cNiA=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr53508152oth.250.1609778954548; 
 Mon, 04 Jan 2021 08:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20210104164500.1311091-1-geert@linux-m68k.org>
In-Reply-To: <20210104164500.1311091-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jan 2021 17:49:03 +0100
Message-ID: <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
To: Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_114916_599370_48F3E927 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Let the LiteX SoC Controller a register a restart handler, which resets
> the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Tested with linux-on-litex-vexriscv.
>
> This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> CPUs"
> (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)

Bummer, and that's why the RESET_REG_* definitions are no longer
next to the SCRATCH_REG_* definitions :-(

Well, I assume that will be fixed by evolution ;-)

> v2:
>   - Rebase on top of v5.11-rc1,
>   - Change reset handler priority to recommended default value of 128
>     (was 192).
>
> (v1 was not sent to a mailing list)
> ---
>  drivers/soc/litex/litex_soc_ctrl.c | 33 +++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
> index 1217cafdfd4d1d2b..d729ad50d4ffca5e 100644
> --- a/drivers/soc/litex/litex_soc_ctrl.c
> +++ b/drivers/soc/litex/litex_soc_ctrl.c
> @@ -15,6 +15,11 @@
>  #include <linux/module.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
> +#include <linux/reboot.h>
> +
> +/* reset register located at the base address */
> +#define RESET_REG_OFF           0x00
> +#define RESET_REG_VALUE         0x00000001
>
>  /*
>   * LiteX SoC Generator, depending on the configuration, can split a single

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

Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A956DC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 02:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2567223442
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 02:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2567223442
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5svfd92EqyeMcyXug9a+Az/7PDXlmje3exOMvOkdKTM=; b=Axe5HLf8PtXKEkdsVJhXF0Gb7
	7KxQ3Ma1zOUeu6FjS6LT4JSmJ36ywpzLnCy6BZLcjiqH+GhZTWMMxBJoiueD3Idc4J3u0fS0utk+p
	/uWuFtgpOWYr4/+HOSyMp6eVkXIBr8BT8o/r0hLiz+uzJBteQZXhbsj5WyfsBriYlGOnyB+MuU2QP
	ID4YC9N69V4Wb7rXL2tcA5tuTm7Fy8Mvk+CwH8Pau/H+7y8LR1AaAVspnTGDqexo1XzTJuJufWzTT
	j6vWbkdVOmguXnObhbUj00tJvVh9OKEL90lsnT0Rb4TeY5MmlVCf2oquwNfiQfJdInESdLWO8raYI
	grzoBUu8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzryq-0001Jz-CT; Thu, 14 Jan 2021 02:03:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzryo-0001JR-2J
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 02:03:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id u4so2341542pjn.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 18:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/59kB1O5XIVx4wkhix0uTI9M83ghuwediLtzMt/ydBU=;
 b=hMgyZ0xWZXRDy8tBW0qOIwh+Xe7D8eY37gm1btzh5tZbvbHil34ZvT9v/bxYeUBFQY
 GDmvsv/lcJ98YUN88Plde66JeOnXZyw8/rFSlei6Jdq/k8K2ft40iwR5cVBPn8qIijks
 WcglGx7KYHon9U9Xx1kjTDAaCWaOPYzXbZzn8qAQakbcw3AlmbBBMYhA7nrPpPx1Uq7p
 QF8zG0ZalqAwZ+ksqQM/xkStlgAJ7ZOyFN8/IjTw8wk4vgkmzl3lh35+wyhuoar+Hn9p
 WDnuv4FtVJs7wzXVk1Y+vxAULFRRWZWUat8zc4dLez2OKQKFTLhbgCcTAQoXWc1VlifE
 uR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/59kB1O5XIVx4wkhix0uTI9M83ghuwediLtzMt/ydBU=;
 b=KOganeAMncmhsleG7l1PlR5RzcH6RBvDaooMqs2Md2jc4tSlJaWnmJY2jcVDdHunZw
 FI3Z+pnN3IISdJDOXV8wzI4PIs6RTrWPoV1zwjUN0GTszoKeC2V7fY8BuGYbTov4AuHW
 UawbyheiNLNJpY1HBm2+rQp+BIsFjjNP5ttvpcROQQmurBAyGDJMHzo5Q3NKcdiP0bzV
 n9dJgKkRaBj0+gpbLUtsWHa3ORqp4VWaI5OqDox7Sz5ApaUe4kODNAaqmCbTHK6fKPzt
 SuQq8jXaH6UH56dZcPQmEpquENY7+wJXKmJHly8gNRm2eYZgXJ9mS7vE7sTX6w+yeFM0
 umdg==
X-Gm-Message-State: AOAM531i8GHJdD7VUjlhWWWiig81E8fr+P17/kfCgL1bQMEFR+MIFPUg
 gqI/g3VG25OFzWE6ZP6xyuc=
X-Google-Smtp-Source: ABdhPJz6RVp8xXM12Kc+tzA7oP/A24jYoxwPWUFPY3GjYTDJEeBLPPNN9KWE/Xvw/6NFqJ0e9TzsFA==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr2403589pjb.199.1610589794397; 
 Wed, 13 Jan 2021 18:03:14 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 u1sm3878281pjr.51.2021.01.13.18.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:03:13 -0800 (PST)
Date: Thu, 14 Jan 2021 11:03:11 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drivers/soc/litex: Add restart handler
Message-ID: <20210114020311.GE2002709@lianli.shorne-pla.net>
References: <20210104164500.1311091-1-geert@linux-m68k.org>
 <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXG_B-3y1MWh64T6LU3Gmo6UQGGWU8EbLApjDeXVLL3GQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_210318_131417_C5DA3E5F 
X-CRM114-Status: GOOD (  25.84  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Mateusz Holenko <mholenko@antmicro.com>, Karol Gugala <kgugala@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 04, 2021 at 05:49:03PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 4, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Let the LiteX SoC Controller a register a restart handler, which resets
> > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Tested with linux-on-litex-vexriscv.
> >
> > This patch is based on upstream, i.e. not on top of Gabriel Somlo's
> > "[PATCH v5 0/4] drivers/soc/litex: support 32-bit subregisters, 64-bit
> > CPUs"
> > (https://lore.kernel.org/lkml/20201227161320.2194830-1-gsomlo@gmail.com/)
> 
> Bummer, and that's why the RESET_REG_* definitions are no longer
> next to the SCRATCH_REG_* definitions :-(

If it helps I have accepted Gabriel's patches and put them onto for-next.

  https://github.com/openrisc/linux/commits/for-next

I am happy to take and test a patch based on that.  Or I can do the adjustments
to base the patch on that myself.  Let me know.

-Stafford

> Well, I assume that will be fixed by evolution ;-)
> 
> > v2:
> >   - Rebase on top of v5.11-rc1,
> >   - Change reset handler priority to recommended default value of 128
> >     (was 192).
> >
> > (v1 was not sent to a mailing list)
> > ---
> >  drivers/soc/litex/litex_soc_ctrl.c | 33 +++++++++++++++++++++++++++---
> >  1 file changed, 30 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
> > index 1217cafdfd4d1d2b..d729ad50d4ffca5e 100644
> > --- a/drivers/soc/litex/litex_soc_ctrl.c
> > +++ b/drivers/soc/litex/litex_soc_ctrl.c
> > @@ -15,6 +15,11 @@
> >  #include <linux/module.h>
> >  #include <linux/errno.h>
> >  #include <linux/io.h>
> > +#include <linux/reboot.h>
> > +
> > +/* reset register located at the base address */
> > +#define RESET_REG_OFF           0x00
> > +#define RESET_REG_VALUE         0x00000001
> >
> >  /*
> >   * LiteX SoC Generator, depending on the configuration, can split a single
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

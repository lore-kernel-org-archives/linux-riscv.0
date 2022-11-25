Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D78AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXJKdYqe7uONeKD8dSAqWUZIGDM5iCBxzh65uLoWRgk=; b=kFOwErLUNGgPyP
	VJ60exIrOLWemUeAxc9GlDYqwuRkEslIOlsdD8prpDD0FXLC4ds+9wllztZIBqMyK/hVN3JXzAp1W
	2BZz4UdkfC8JaNXniKiXegs5IzDlotKbLI3JCa7L0dhftnT5Xtduv5BDo46m0c0SX85ZT0AsbPAIU
	weJf2mVkQwic23RYrDaWabFRxDvL8eTxiOJkP5wEiqaIhHTiqx/1Rlcz4rrfWrkNdEFZyVYFdwBaR
	Q0JgWClZ0FbjdNJzv4a1LVyMoAASn9ymF5XxpX622yOL9l2NnwtLexryPUGY8up90Eaq8mTZET2lH
	ydB6htTdKYu4M1xakINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVyS-00FRzm-Up; Fri, 25 Nov 2022 10:30:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVdG-00FEoC-Ko
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:08:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id s5so5679890edc.12
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 02:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LW+tamRHbjP1mfqbA3Ded0ngAklCtatsu4yoSddFO8c=;
        b=TA54suU8YpDsgwK+gCYNC1hnRxH/GXp5jshHxJFpA2ZeQYIq345/e0qRfmJmeuJBM6
         uZTk4HvkQowFDjP9Om3gj78PNhHXT1jpWAfUtpq4h6KnOjDqc+l+0QhrtBlPvaDvejJg
         PTkxVTGXu9CuXPBHNVT8G0Qv1Wk6x2GD7v6oNMS0KkDxWWprmz91SOXjp1I8z8Jrv2SQ
         Vnio8BQXhijH6HaPELKvoKcQPvwJBtVBGjZwH8Yipi4EJnKKzagnJwxyoJtFxk/vRgzx
         ZZ9v28PfthRlOfH6A4j7mCTxFGpR01pQG2rHC8ILpPECe6tI8OpGJ5/xQg6uOxghEKrL
         3png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW+tamRHbjP1mfqbA3Ded0ngAklCtatsu4yoSddFO8c=;
        b=SP3FXB33KV5H4YIUMuAP3zr++MBi8vwmH3YNyaGZGjOaxc3vgoaC+PSY3eT7IkhAc/
         Hm1ZKgK7OjG2+F7S76tUT5faCPYpfkq0Lfg8P13S77EH2BHU2N9B3exJ9jdXLndCURMz
         yDaloS3gcX8waDpcsbjQQeyUqVDodTrh9AuftUyiBF2OCrDKwPW7vaR7DVdjlJ9WksDn
         KbxnCQirByAM+7/WHjZbpil3PkEhKrzUZCVPBO/az/IcjtwkPYSh7w9y0rVrZGRAvyhX
         VMy23PyklWFyz55VPNyJsWPnp2HpFaKJHXWevoqt9YxdSYIABzbbCJTBOZ3kn6Gi7zeD
         Un0Q==
X-Gm-Message-State: ANoB5pkG9ikd5pVkZeMqAS3u7BBaym2syO4+3UTA+xD+aCLX3IiIVWSs
	OrwJY9zIHgA9cAxmeC7KklWNzFMFcYyz3yU/Ia8=
X-Google-Smtp-Source: AA0mqf4b5LchYvnEyBXJafepREoQx51r3HyOSAelZFgx98WKe8rtMye2xP54PO+EREtz7Qs/WaF6DOR5mbCt+BneGR8=
X-Received: by 2002:a05:6402:530b:b0:461:f919:caa4 with SMTP id
 eo11-20020a056402530b00b00461f919caa4mr34465411edb.255.1669370907771; Fri, 25
 Nov 2022 02:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y3/SZPjzXsd8dfkl@spud>
In-Reply-To: <Y3/SZPjzXsd8dfkl@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 10:08:01 +0000
Message-ID: <CA+V-a8ucDPnbnuVz+yfLtB=mhsBL9Rr9Aa7zg+rQ3sfu_5kyJw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] riscv: errata: Add Andes alternative ports
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_020832_990443_CCF3E7DF 
X-CRM114-Status: GOOD (  33.81  )
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

Hi Conor,

Thank you for the review.

On Thu, Nov 24, 2022 at 8:22 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, Nov 24, 2022 at 05:22:03PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add required ports of the Alternative scheme for Andes CPU cores.
>
> You've got a lot of nice info in your cover letter that would be nice in
> the git history. Could you add some of the commentary about why the
> Andes cache needs special handling from there to this commit message
> please?
>
Sure, I'll update the commit message here.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC v3 -> v4
> > * New patch
> > ---
> >  arch/riscv/Kconfig.erratas           | 22 +++++++++
> >  arch/riscv/errata/Makefile           |  1 +
> >  arch/riscv/errata/andes/Makefile     |  1 +
> >  arch/riscv/errata/andes/errata.c     | 68 ++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/alternative.h |  3 ++
> >  arch/riscv/include/asm/errata_list.h |  5 ++
> >  arch/riscv/kernel/alternative.c      |  5 ++
> >  7 files changed, 105 insertions(+)
> >  create mode 100644 arch/riscv/errata/andes/Makefile
> >  create mode 100644 arch/riscv/errata/andes/errata.c
>
> > diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> > new file mode 100644
> > index 000000000000..ec3e052ca8c7
> > --- /dev/null
> > +++ b/arch/riscv/errata/andes/errata.c
> > @@ -0,0 +1,68 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Erratas to be applied for Andes CPU cores
> > + *
> > + *  Copyright (C) 2022 Renesas Electronics Corporation.
> > + *
> > + * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cacheflush.h>
> > +#include <asm/errata_list.h>
> > +#include <asm/patch.h>
> > +#include <asm/vendorid_list.h>
> > +
> > +static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
>
> To the lay reader, what's an "iocp" when it's at home? "I/O coherency
> port"? Again, commit message would be a good place for the introduction
> of that term :)
>
Agree, I'll update that.

> > +{
> > +     if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
> > +             return false;
> > +
> > +     if (arch_id != 0x8000000000008a45 || impid != 0x500)
>
> Can you #define these?
>
> > +             return false;
> > +
> > +     riscv_cbom_block_size = 1;
> > +     riscv_noncoherent_supported();
> > +
> > +     return true;
> > +}
> > +
> > +static u32 andes_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> > +{
> > +     u32 cpu_req_errata = 0;
> > +
>
> I read some code and when it does the opposite of what I'd expect, I
> feel inclined to add a comment. In this case, you're probing for the
> presence of the port `probe_iocp()`, but the interesting case is when
> you don't find it. You can leave it uncommented if you like, but even
> something like the below I think fits.
>
>         /*
>          * In the absence of the I/O Coherency Port, access to certain peripherals
>          * requires vendor specific DMA handling.
>          */
Makes sense, I'll include the above.

> > +     if (errata_probe_iocp(stage, archid, impid))
> > +             cpu_req_errata |= BIT(ERRATA_ANDESTECH_NO_IOCP);
> > +
> > +     return cpu_req_errata;
> > +}
> > +
> > +void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> > +                                           unsigned long archid, unsigned long impid,
> > +                                           unsigned int stage)
> > +{
> > +     u32 cpu_req_errata = andes_errata_probe(stage, archid, impid);
> > +     struct alt_entry *alt;
> > +     u32 tmp;
> > +
> > +     if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +             return;
> > +
> > +     for (alt = begin; alt < end; alt++) {
> > +             if (alt->vendor_id != ANDESTECH_VENDOR_ID)
> > +                     continue;
> > +             if (alt->errata_id >= ERRATA_ANDESTECH_NUMBER)
> > +                     continue;
> > +
> > +             tmp = (1U << alt->errata_id);
>
> Is this not BIT(alt->errata_id)?
>
Yep, I will switch to BIT().

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

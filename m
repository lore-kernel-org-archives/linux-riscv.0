Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9CCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPRxxrezJo2GE3R2fExd6qEwzcF0aCudWSyLIX2t9ec=; b=wwCY4FhLpWIqzX
	03lP264rt53tdSBeDsi395N9nseXdieXY3B4vl/NQvoF5HeirK3u3hpbJ9xb8QJLEpnVjW5kQY3zc
	tcyUvSl8slNg+1IX/3L/ekkeFcOYpv5553sf6qFlWXSWL7YFByVINPwX3IJp7Htzt5+oyMW43ucKc
	KuvDCifzeVU7X3c3yKemNhK+Eae1FI0BI9OUN+QeaM+mP7p0DihERc7wm9fqfNjzoLBkiP0TVch21
	yYFcO2PKnJyk1kCzz0TJFlARCKYyODAEOxY4w/b3ro2Nrlkj61UyqfUffF5EqPtS/Mj1CB4Z/hauR
	ZsjqDf0WtzKpSuwOqy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7EBP-00CUsj-Cs; Mon, 19 Dec 2022 11:19:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7EBK-00CUp0-TZ
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 11:19:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id u19so20632358ejm.8
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 03:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zI2RTlOmL5oiwdZqJNw/D+P+a1vxFWJZ9IKVgLH4ir4=;
        b=bST3w1n2l4lGbm29FxqMPyB7CEznBrQmws+cKHNPXfRBzJ+B5JlTr/56pIFpsc+yIA
         zeNLk1+vrvu60Nhfp9Fy2Ml2kxQg2+iWzFRo+uX8PssZJHOiZdLvCAh615JUYhRB8Bxh
         6eo3UDkzllFuwTe0G5oyISg+stHLjrMRDlop3bn1PQyKZS9+ctlNDK7JX874Q5IBUI/W
         rzuOr8ZWXrXomg9s/yLd33dwiu7k2FSlsFEqNyOQE4RUZFjvcQaILIDbOejJS10SEGiT
         3RO/FaO9t2nn+C6l7VGFHO5VtmAMkHZJMN5/tICm1rcsQLU6Bc8DoDkeuIvKgfKRpdiA
         zX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zI2RTlOmL5oiwdZqJNw/D+P+a1vxFWJZ9IKVgLH4ir4=;
        b=Xx9By8Kcw26mAVX4cVotars8pR8oqixzMYcvtCh0mzcMckCcMWaf5kcodySd4cPZGW
         wVU0fYevIA7IHqcCQU6l1P8Qpl0jIEkHIQOcP3kNUVP+4hw529IK+fT2Rw5kUcw3GJL2
         77i6ZdAXgCqdhQRelbWz3YRUsunRVf5dDhZb+I8BoVvEHmKh+US2AiHoOrY88dWdLlST
         tGyuLAwCFepVY4jVdVL1M/J2j3hfb6Z1u8oBdaIdlrGLO7bAWkSwDrHcYc54M1h3Se16
         O4JDxoxAHE4sWp8J8Uo81Ec56WwjLnKGa9CTqxh+BzuekGzE7TjMkxDTZGyW3P7e4o4s
         lefQ==
X-Gm-Message-State: ANoB5plsV/SfzxgxxpcCKnikm/SLQkle8uv9Zp25l5jy+Br0+GH+1+f7
	6ke2KDvU6692erv3ExBswVVkgWwAQ21Jh29SJzo=
X-Google-Smtp-Source: AA0mqf6SIamhLU7Cdvr18/aFPWgzWlZlnua/b6tCC3PtCfJ09nFC457/raz0+iG0t2BqLWy5GLe94zi6oDpXrLjIxHg=
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr72229403ejo.342.1671448779945; Mon, 19
 Dec 2022 03:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y54ycZdMLjU5QVn5@spud>
In-Reply-To: <Y54ycZdMLjU5QVn5@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Dec 2022 11:19:13 +0000
Message-ID: <CA+V-a8sa1H=Hh2SzbKDWhiAO=C+Y2YN7sk9APBeqktBeHf49jA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] riscv: errata: Add Andes alternative ports
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_031943_020395_ACF12558 
X-CRM114-Status: GOOD (  36.16  )
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

On Sat, Dec 17, 2022 at 9:19 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Dec 12, 2022 at 11:55:02AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add required ports of the Alternative scheme for Andes CPU cores.
> >
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting external
> > non-caching masters, such as DMA controllers. IOCP is a specification
> > option and is disabled on the Renesas RZ/Five SoC due to this reason cache
> > management needs a software workaround.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4 -> v5
> > * Sorted the Kconfig/Makefile/Switch based on Core name
> > * Added a comments
> > * Introduced RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT ID to check if
> >   CMO needs to be applied. Is there a way we can access the DTB while patching
> >   as we can drop this SBI EXT ID and add a DT property instead for cmo?
> >
> > RFC v3 -> v4
> > * New patch
> > ---
> >  arch/riscv/Kconfig.erratas           | 22 +++++++
> >  arch/riscv/errata/Makefile           |  1 +
> >  arch/riscv/errata/andes/Makefile     |  1 +
> >  arch/riscv/errata/andes/errata.c     | 93 ++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/alternative.h |  3 +
> >  arch/riscv/include/asm/errata_list.h |  5 ++
> >  arch/riscv/kernel/alternative.c      |  5 ++
> >  7 files changed, 130 insertions(+)
> >  create mode 100644 arch/riscv/errata/andes/Makefile
> >  create mode 100644 arch/riscv/errata/andes/errata.c
> >
> > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > index 69621ae6d647..f0f0c1abd52b 100644
> > --- a/arch/riscv/Kconfig.erratas
> > +++ b/arch/riscv/Kconfig.erratas
> > @@ -1,5 +1,27 @@
> >  menu "CPU errata selection"
> >
> > +config ERRATA_ANDES
> > +     bool "Andes AX45MP errata"
> > +     depends on !XIP_KERNEL
> > +     select RISCV_ALTERNATIVE
> > +     help
> > +       All Andes errata Kconfig depend on this Kconfig. Disabling
> > +       this Kconfig will disable all Andes errata. Please say "Y"
> > +       here if your platform uses Andes CPU cores.
> > +
> > +       Otherwise, please say "N" here to avoid unnecessary overhead.
> > +
> > +config ERRATA_ANDES_CMO
> > +     bool "Apply Andes cache management errata"
> > +     depends on ERRATA_ANDES && MMU && ARCH_R9A07G043
> > +     select RISCV_DMA_NONCOHERENT
> > +     default y
> > +     help
> > +       This will apply the cache management errata to handle the
> > +       non-standard handling on non-coherent operations on Andes cores.
> > +
> > +       If you don't know what to do here, say "Y".
> > +
> >  config ERRATA_SIFIVE
> >       bool "SiFive errata"
> >       depends on !XIP_KERNEL
> > diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> > index a1055965fbee..6f1c693af92d 100644
> > --- a/arch/riscv/errata/Makefile
> > +++ b/arch/riscv/errata/Makefile
> > @@ -1,2 +1,3 @@
> > +obj-$(CONFIG_ERRATA_ANDES) += andes/
> >  obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
> >  obj-$(CONFIG_ERRATA_THEAD) += thead/
> > diff --git a/arch/riscv/errata/andes/Makefile b/arch/riscv/errata/andes/Makefile
> > new file mode 100644
> > index 000000000000..2d644e19caef
> > --- /dev/null
> > +++ b/arch/riscv/errata/andes/Makefile
> > @@ -0,0 +1 @@
> > +obj-y += errata.o
> > diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> > new file mode 100644
> > index 000000000000..3d04f15df8d5
> > --- /dev/null
> > +++ b/arch/riscv/errata/andes/errata.c
> > @@ -0,0 +1,93 @@
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
> > +#include <asm/sbi.h>
> > +#include <asm/vendorid_list.h>
> > +
> > +#define ANDESTECH_AX45MP_MARCHID     0x8000000000008a45UL
> > +#define ANDESTECH_AX45MP_MIMPID              0x500UL
> > +#define ANDESTECH_SBI_EXT_ANDES              0x0900031E
> > +
> > +#define RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND    0
> > +
> > +static long ax45mp_iocp_sw_workaround(void)
> > +{
> > +     struct sbiret ret;
> > +
> > +     ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND,
> > +                     0, 0, 0, 0, 0, 0);
>
> Seeing as you need a new version for some of the other bits, I think it
> would be good to add a minor comment here somewhere (be it here or the
> commit message) that links to the SBI specs for this.
> I think this looks pretty good though.
Sure I'll add a comment here.

I was wondering if we can get rid of this vendor specific extension
here if we get access to the DT here (for example having a DT property
which would indicate if IOCP CMO should be applied or not). Do you
think that would be good approach?  ATM we dont have a pointer here
for FDT whie early patching.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

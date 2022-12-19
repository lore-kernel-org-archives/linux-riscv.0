Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGNBJIHGC4rMA4y43edL9mX+mH80C1YIEIaU01bOZQA=; b=J7z/ryK5+tF8eC
	iGYIN+cYncvHefBg2KBmaNIqRcxtU0iTRrio/j9R6LM5ujGM+8QWgjLiCZ6uJTS5CgP+O69VF/Uek
	ttcmuD0bVtdSsQSMcG5p6WelzbGPs3spaRs6N71RS073Z2OY7/RwA14F495e2JeWhlArzrjo2xa8Q
	2IqiaoVS2g9dVLlkOln3dezeUAjJlVewTvuxwP8Qu5EbeCGF2O/EtFP73Q/AgzVBwwDP51xdwKNom
	khvk8ej1ZJQUrO3NLpwY9dHwMPoK5oltEZnKAPLC83Gpy9aiFZJSDJR5wp7GsBmiWQMFCWDhrKDaQ
	7tZk95zszFGkRz2CQcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7E7d-00CS6p-Lq; Mon, 19 Dec 2022 11:15:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7E7Y-00CS2A-6h
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 11:15:52 +0000
Received: by mail-ej1-x629.google.com with SMTP id bj12so20533033ejb.13
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sULm/S6ctvHgsxCE9dNljDGGzik1S/Aj6TzzkY/co2Q=;
        b=Cg5hiCoT38OhoJ6Bne97SPV5T/4u55mVWC85pj/w41gRATbSBW+BUAKeaNWUWtNzCY
         qnwhZAhlI/7cnvViPw/bfzsFbUvba1ok93/1qDUBoN8/NDl2eaMur26PD4munFHSY0Q7
         ikAl4FerrTytdL0z81UCCwL/P0v3xPeXiYAW3KiQeXAkL69pxnlbRlSyx84sCAL4SrlF
         Sqh16rHAVd9JZg4OBxGFfFldJALBHIvMY9cg5d536PmFhNrZRZn/XBUXnWOIE1CyD9UZ
         CEZjBkJTXjP4DTSgN5//ygeM5NOlnOmZ10tUV+sThLbF4VYGkzTZZqEe/TTVSwsrKjTa
         oeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sULm/S6ctvHgsxCE9dNljDGGzik1S/Aj6TzzkY/co2Q=;
        b=ns1aKTYETqFx6AnEPeDbddcibLqVazZXIo4Joq0DP4dgqr6pU/6nQQ508LQCZE06jl
         xlm09DUjr5WDT7+omYvh2AWsYNNNZgl7y/ptVV2pACN4uCsFw9dDTAJjvS9BOJyXgjsA
         Y+JXpXJnj/Jjn4K9+sFgFqzqq5VrqSlV+8pbtF9ygeDKPdonPhO1/9gRRHmNbYX2BIu4
         d8fhc9jukZjlPfkviPq5+NVuJoapDjbcnwVgQ9D7jbpL1A/nDwdFqiWit1xiDO7Uttqc
         H9d8x4mR4rtrPtSOlFyT8GIR1HLXGY6tie1wRKEwKzf7fpgAGdkQt9UH3OgEiCKMWZvI
         tBVQ==
X-Gm-Message-State: ANoB5pmsE4dDXwTf/1MX7orFQP6c1mbcN9Y0W7G/Ja0qdlvj75Xs/mKK
	iDUFfrgpQIgxFCNHIYTq/x1wZS0gGA5myBGB5AQ=
X-Google-Smtp-Source: AA0mqf6DSq68HqwwXjoJBjzLaxcy23gNleXYuq16vF5JPGyGgRZfsMM7aZQjJaDzh/QNNHekgnhbEGhA3xhTXdp3SqQ=
X-Received: by 2002:a17:906:9615:b0:7c0:f459:a0e4 with SMTP id
 s21-20020a170906961500b007c0f459a0e4mr16004795ejx.155.1671448544424; Mon, 19
 Dec 2022 03:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y543kM4070CSDtZi@spud>
In-Reply-To: <Y543kM4070CSDtZi@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Dec 2022 11:15:17 +0000
Message-ID: <CA+V-a8ss0idLDoc+J8-Undqd+DUGrpeytenzSxV8xMs2N3dh1g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
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
X-CRM114-CacheID: sfid-20221219_031548_344768_37D00B61 
X-CRM114-Status: GOOD (  29.99  )
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

On Sat, Dec 17, 2022 at 9:41 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Dec 12, 2022 at 11:55:00AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce ALTERNATIVE_3() macro.
> >
> > A vendor wants to replace an old_content, but another vendor has used
> > ALTERNATIVE_2() to patch its customized content at the same location.
> > In this case, this vendor can use macro ALTERNATIVE_3() and then replace
> > ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.
> >
> > While at it update comment above ALTERNATIVE_2() macro and make it generic
> > so that the comment holds good for any new addition of ALTERNATIVE_X()
> > macros.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5
> > * Rebased the patch on top of Andrew's series (now in Palmers for next-branch)
> > * Updated comment for ALTERNATIVE_x() as suggested by Heiko
> >
> > RFC v3 -> v4
> > * New patch
> > ---
> >  arch/riscv/include/asm/alternative-macros.h | 46 ++++++++++++++++++---
> >  1 file changed, 41 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> > index 7226e2462584..a5b4691520da 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -50,8 +50,17 @@
> >       ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> >  .endm
> >
> > +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> > +                             new_c_2, vendor_id_2, errata_id_2, enable_2,    \
> > +                             new_c_3, vendor_id_3, errata_id_3, enable_3
> > +       ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,    \
> > +                                 \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
> > +       ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> > +.endm
> > +
> >  #define __ALTERNATIVE_CFG(...)               ALTERNATIVE_CFG __VA_ARGS__
> >  #define __ALTERNATIVE_CFG_2(...)     ALTERNATIVE_CFG_2 __VA_ARGS__
> > +#define __ALTERNATIVE_CFG_3(...)     ALTERNATIVE_CFG_3 __VA_ARGS__
> >
> >  #else /* !__ASSEMBLY__ */
> >
> > @@ -98,6 +107,13 @@
> >       __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)   \
> >       ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
> >
> > +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,      \
> > +                                new_c_2, vendor_id_2, errata_id_2, enable_2, \
> > +                                new_c_3, vendor_id_3, errata_id_3, enable_3) \
> > +     __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> > +                                   new_c_2, vendor_id_2, errata_id_2, enable_2)      \
> > +     ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> > +
> >  #endif /* __ASSEMBLY__ */
> >
> >  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)       \
> > @@ -108,6 +124,13 @@
> >       __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
> >                                  new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
> >
> > +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,             \
> > +                               new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,                \
> > +                               new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)                \
> > +     __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
> > +                                new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
> > +                                new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> > +
> >  #else /* CONFIG_RISCV_ALTERNATIVE */
> >  #ifdef __ASSEMBLY__
> >
> > @@ -152,15 +175,28 @@
> >       _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
> >
> >  /*
> > - * A vendor wants to replace an old_content, but another vendor has used
> > - * ALTERNATIVE() to patch its customized content at the same location. In
> > - * this case, this vendor can create a new macro ALTERNATIVE_2() based
> > - * on the following sample code and then replace ALTERNATIVE() with
> > - * ALTERNATIVE_2() to append its customized content.
> > + * ALTERNATIVE_x macros allow providing multiple replacement options
> > + * for an ALTERNATIVE code section. This is helpful if multiple
> > + * implementation variants for the same functionality exist for
> > + * different cpu cores.
>
> I think this last sentence should be:
> "This is helpful if multiple implementation variants exist for the same
> functionality."
> I don't think CPU cores is the right level of "granularity".
>
Ok, I'll update it as above.

> > + *
> > + * Usage:
> > + *   ALTERNATIVE_x(old_content,
> > + *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
> > + *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
> > + *      ...
> > + *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
> >   */
> >  #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> >                                  new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)         \
> >       _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,    \
> >                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> >
> > +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,              \
> > +                                new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,         \
> > +                                new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)         \
> > +       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,  \
> > +                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,  \
> > +                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
>
> btw, why is this indented with spaces when the line above it is indented
> with tabs? (At least, that is how it appears in mutt).
>
I'll update it with spaces.

> With those minor bits & the suggested fixes from Drew/Geert:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

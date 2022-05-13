Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeJhuHCo7eprGdxlzO7KmbEM6D9Iick9Q1St/Ps13R0=; b=p4B6ZnvQKOyGDN
	vr4XvjIg2ZLyBaKYs4ajOHX4frnMjcYcSuEoBe4fHe4zz0eR/cv0gNQ4DXrmG43KCl14SL1afRNOa
	YXb7ALDUJCpmJ6P8V2aZUa+/A9f3BQ5TKBcAhW0pw8/QVuHrxAmpdZYrI6hvWNXGjviVpz6tteihY
	vBC7rvOjtUgnCqwgQu/xxTA5GmqEGWBvCx+ZvdN56Wd9/QKcE8+bSEpoC/47ILGQ5+m0929rDyqX8
	ZZ20qVbwdnzdBSm1GgxgH3ed83e0WniyX1xG5wIpBOCTqA7Wzyvx1O9PtwibL1BYkjsk4XFg7FPwL
	kj0+lkO/hVYs9RnqZ1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVUr-00GJem-NG; Fri, 13 May 2022 13:38:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVUk-00GJbO-K0
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 13:38:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEC4B62071
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 13:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2773C3411E
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652449092;
 bh=9SAXu5y8sd1VSjq3F8o0QPCuN0UnOTwTauQcK406F8o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nQ+VHmOJHxftBU3+vaa2ZGKgm7bZn+9N/Xuv6y3SB4nLY4V5jy89Dt5Sm7RgvgUMz
 KLyCLdnEGpGcQYeQ56nD1C3vpmUTXjIOm+mA1BG62CX05Jo7FK0DtN70uEgI7JeFN2
 CoxwAe+q9EwUIkFoc/KOSY0wHsUyWJRQXONjnVIy5obFnnsYPvjFdFOQP+iwGJ4S/g
 vKEU6iN9nPjdn5G7n4ZRFIR8j1XCZ0wXs1KMDZBrKR8RhvLSBpNxmve1pT0eeP7Fz8
 6n2+dVypMolWAm1U4y9ilvAPGqmt4zj4zWPkV3z0ENS9ttZf1nt1xZrTbN4QX7NPqJ
 2DbSyPYAfbbjA==
Received: by mail-vs1-f50.google.com with SMTP id x8so8392601vsg.11
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 06:38:11 -0700 (PDT)
X-Gm-Message-State: AOAM533rdmhaUl5DIsWxhe7yJ+1B9srkjycwGwP4du4s3eTZTiPkmImX
 cTgkwfmeLuYTBFk2AJ28DgcGpW2j7GHQYVypr74=
X-Google-Smtp-Source: ABdhPJyc6jQ7oXeqwaKeI4M2msfjx940ZJfQsIisC8+jsBLfAcTIu1uk8/qClF49yxMCyO0nT6C2rjU4w4xsSRqqVIM=
X-Received: by 2002:a67:ce02:0:b0:32c:f290:a37e with SMTP id
 s2-20020a67ce02000000b0032cf290a37emr2467373vsl.2.1652449090855; Fri, 13 May
 2022 06:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-4-heiko@sntech.de>
 <CAAhSdy1riRoVKz=7N865ZJ6tsPO+diULZ8ctNrqVuXEmgtrqOA@mail.gmail.com>
In-Reply-To: <CAAhSdy1riRoVKz=7N865ZJ6tsPO+diULZ8ctNrqVuXEmgtrqOA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 13 May 2022 21:37:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRmt5rWHNdtC9mh6ODFTBTz3XZz9Gq=NfAdJJpxPO3tBQ@mail.gmail.com>
Message-ID: <CAJF2gTRmt5rWHNdtC9mh6ODFTBTz3XZz9Gq=NfAdJJpxPO3tBQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: implement cache-management errata for
 T-Head SoCs
To: Anup Patel <anup@brainfault.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, Nick Kossifidis <mick@ics.forth.gr>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rob Herring <robh+dt@kernel.org>,
 krzk+dt@kernel.org, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063814_757745_2C047D21 
X-CRM114-Status: GOOD (  27.73  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, May 12, 2022 at 12:41 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, May 12, 2022 at 3:11 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > The T-Head C906 and C910 implement a scheme for handling
> > cache operations different from the generic Zicbom extension.
> >
> > Add an errata for it next to the generic dma coherency ops.
> >
> > Tested-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/Kconfig.erratas           | 10 ++++++
> >  arch/riscv/errata/thead/errata.c     |  5 +++
> >  arch/riscv/include/asm/errata_list.h | 47 +++++++++++++++++++++++++---
> >  3 files changed, 58 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> > index ebfcd5cc6eaf..213629bac5d7 100644
> > --- a/arch/riscv/Kconfig.erratas
> > +++ b/arch/riscv/Kconfig.erratas
> > @@ -54,4 +54,14 @@ config ERRATA_THEAD_PBMT
> >
> >           If you don't know what to do here, say "Y".
> >
> > +config ERRATA_THEAD_CMO
> > +       bool "Apply T-Head cache management errata"
> > +       depends on ERRATA_THEAD && RISCV_ISA_ZICBOM
> > +       default y
> > +       help
> > +         This will apply the cache management errata to handle the
> > +         non-standard handling on non-coherent operations on T-Head SoCs.
> > +
> > +         If you don't know what to do here, say "Y".
> > +
> >  endmenu
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index e5d75270b99c..9545f43d3504 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -33,6 +33,11 @@ static const struct errata_info errata_list[ERRATA_THEAD_NUMBER] = {
> >                 .stage = RISCV_ALTERNATIVES_EARLY_BOOT,
> >                 .check_func = errata_mt_check_func
> >         },
> > +       {
> > +               .name = "cache-management",
> > +               .stage = RISCV_ALTERNATIVES_BOOT,
> > +               .check_func = errata_mt_check_func
> > +       },
> >  };
> >
> >  static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index eebcd4415049..1da311fc5126 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -16,7 +16,8 @@
> >
> >  #ifdef CONFIG_ERRATA_THEAD
> >  #define        ERRATA_THEAD_PBMT 0
> > -#define        ERRATA_THEAD_NUMBER 1
> > +#define        ERRATA_THEAD_CMO 1
> > +#define        ERRATA_THEAD_NUMBER 2
> >  #endif
> >
> >  #define        CPUFEATURE_SVPBMT 0
> > @@ -111,8 +112,37 @@ asm volatile(ALTERNATIVE(                                          \
> >  #define CBO_CLEAN_A0   ".long 0x25200F"
> >  #define CBO_FLUSH_A0   ".long 0x05200F"
> >
> > +/*
> > + * dcache.ipa rs1 (invalidate, physical address)
> > + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *   0000001    01010      rs1       000      00000  0001011
> > + * dache.iva rs1 (invalida, virtual address)
> > + *   0000001    00110      rs1       000      00000  0001011
> > + *
> > + * dcache.cpa rs1 (clean, physical address)
> > + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *   0000001    01001      rs1       000      00000  0001011
> > + * dcache.cva rs1 (clean, virtual address)
> > + *   0000001    00100      rs1       000      00000  0001011
> > + *
> > + * dcache.cipa rs1 (clean then invalidate, physical address)
> > + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *   0000001    01011      rs1       000      00000  0001011
> > + * dcache.civa rs1 (... virtual address)
> > + *   0000001    00111      rs1       000      00000  0001011
> > + *
> > + * sync.s (make sure all cache operations finished)
> > + * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > + *   0000000    11001     00000      000      00000  0001011
> > + */
> > +#define THEAD_INVAL_A0 ".long 0x0265000b"
> > +#define THEAD_CLEAN_A0 ".long 0x0245000b"
> > +#define THEAD_FLUSH_A0 ".long 0x0275000b"
> > +#define THEAD_SYNC_S   ".long 0x0190000b"
> > +
> >  #define ALT_CMO_OP(_op, _start, _size, _cachesize)                     \
> > -asm volatile(ALTERNATIVE(                                              \
> > +asm volatile(ALTERNATIVE_2(                                            \
> > +       "nop\n\t"                                                       \
> >         "nop\n\t"                                                       \
> >         "nop\n\t"                                                       \
> >         "nop\n\t"                                                       \
> > @@ -124,8 +154,17 @@ asm volatile(ALTERNATIVE(                                          \
> >         CBO_##_op##_A0 "\n\t"                                           \
> >         "add a0, a0, %0\n\t"                                            \
> >         "2:\n\t"                                                        \
> > -       "bltu a0, %2, 3b\n\t", 0,                                       \
> > -               CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM)                \
> > +       "bltu a0, %2, 3b\n\t"                                           \
> > +       "nop", 0, CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM,              \
> > +       "mv a0, %1\n\t"                                                 \
> > +       "j 2f\n\t"                                                      \
> > +       "3:\n\t"                                                        \
> > +       THEAD_##_op##_A0 "\n\t"                                         \
> > +       "add a0, a0, %0\n\t"                                            \
> > +       "2:\n\t"                                                        \
> > +       "bltu a0, %2, 3b\n\t"                                           \
> > +       THEAD_SYNC_S, THEAD_VENDOR_ID,                                  \
> > +                       ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)      \
> >         : : "r"(_cachesize),                                            \
> >             "r"(ALIGN((_start), (_cachesize))),                         \
> >             "r"(ALIGN((_start) + (_size), (_cachesize))))
> > --
> > 2.35.1
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

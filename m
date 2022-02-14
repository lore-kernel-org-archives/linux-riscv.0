Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32293C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u6Kf4LuuFJA0yiWU1sZ+eZ/5P13x06WWxsFnaewItg=; b=nlUypcvCrm8sBA
	ewLNMEbTSErVGzehUhRX8TNiS2ppz+S95yxiUkehSrKPFbKlh08RcDC8xRlUKpJ6Pg8mH0DAcbUml
	ZKLuimwyMc53FJybnrEFaQO8Qh/926mVfRrZOTjhOFpeZ3MyOrIFsrl0XmTts9OJmbnCQ90rZ2pTW
	HYAn1MujIPfawtUusfNEl3tipGzrdMTIasOYxZJAHMl2xjn/F14Wfp/fZDuvg5QkjtiddH8Q+Xdlr
	42J5qc3NQy1a4MNUjn6ndxPcAMPrXSxDFKIrZNG3i/P9uQiJ2OzEKYYw7GP5b2Iv3OLim+IM7RQe6
	TC5cJMyHqoAAO0LEaJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhde-00GnSJ-WB; Mon, 14 Feb 2022 20:07:59 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhdc-00GnR1-3K
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:07:58 +0000
Received: by mail-yb1-xb35.google.com with SMTP id bt13so49684671ybb.2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 12:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUYhi8UFdFu/tzhlAXkpU7pxHMK4UXnGiQ/SEVP8wl8=;
 b=VtFeS1Y0S099VD11m462TqS96c6zees+bphsTKfu1Gjof4tK6VlVg2xcfrRnXuvzAQ
 SBY+fDHZav9oeJCbe0nbawygXpp4ZK/N5bw7ccGUgSBZRsgSrULF5hynajGcuqAg5TLm
 zzl1XUvf+9J4BHKstB60ODpsQ8aLEvVpAZgWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUYhi8UFdFu/tzhlAXkpU7pxHMK4UXnGiQ/SEVP8wl8=;
 b=BCKfTC4TphcLD/GwbADIrtzFGkohWe/ooji6DDk1031+LLlWaKkhzrZDtWTcERvt9C
 kSo6ukv5v2UnAJvZ3T+gEnYjuJt0ZQ9unNedscwnu/T7Gr29RRWyl3te5GM0U/IEQAi1
 FmHjmc2F4u2VJFKDJFMZlvkqmUbZyFTy/fMf7Ah4P8GSf6LQArai2xn044aIb88YH81t
 wRPWSgx0ZktgRqBj8Of2dJMLkACTGm8EECgdLn58id7hWVckQ0Kif45vCu/hmrqEzMY2
 m7cRbqOI9/ECJOnbcB28Bd8k/vJ/hOlQd6TDPaPfu/hB3sYp35eQ2AeKSOIvqYSs9yqL
 y4Kw==
X-Gm-Message-State: AOAM531zSRs4hynmJAS5KbLcZVbUT833/se3ha4L7zd3YB542OqQoM/Y
 TvMYIMSBsXANhaBzlJ4VbR/zFR/RsRLEKPjtiXqb
X-Google-Smtp-Source: ABdhPJxEj4VGlgrJp5vYNkt3Cy6/tGoU7A670XAwbq+PDp9MstnLKONSRm4W0x7zk91NH216EulflRUH4k2vg9jlVJc=
X-Received: by 2002:a25:e406:: with SMTP id b6mr664191ybh.703.1644869273863;
 Mon, 14 Feb 2022 12:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-3-atishp@rivosinc.com>
 <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
In-Reply-To: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 14 Feb 2022 12:07:43 -0800
Message-ID: <CAOnJCUKazUEmT+D7ZWqZY8WddTHE=AtHUN6_g_EFTTJ0tpX_+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Minimal parser for "riscv, isa" strings
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120756_246705_A265FCEB 
X-CRM114-Status: GOOD (  44.16  )
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

On Fri, Feb 11, 2022 at 10:25 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> Hi Atish,
>
> Your patches for new RISC-V extension framework seems good.  I was busy
> working on GNU Binutils and (though I'm not completely convinced) it's
> okay with "isa-ext" approach of Anup.
>
> And thanks for using my parser for new ISA extension framework.
>
> Still, I will raise an issue with your "improvement" and propose new
> version of PATCH 1-3/6 (as replies to this e-mail).
>
> (I also corrected indent on PATCH 3/6 though this is not functional).
>
> Thanks,
> Tsukasa
>
> On 2022/02/11 6:40, Atish Patra wrote:
> > From: Tsukasa OI <research_trasio@irq.a4lg.com>
> >
> > Current hart ISA ("riscv,isa") parser don't correctly parse:
> >
> > 1. Multi-letter extensions
> > 2. Version numbers
> >
> > All ISA extensions ratified recently has multi-letter extensions
> > (except 'H'). The current "riscv,isa" parser that is easily confused
> > by multi-letter extensions and "p" in version numbers can be a huge
> > problem for adding new extensions through the device tree.
> >
> > Leaving it would create incompatible hacks and would make "riscv,isa"
> > value unreliable.
> >
> > This commit implements minimal parser for "riscv,isa" strings.  With this,
> > we can safely ignore multi-letter extensions and version numbers.
> >
> > Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> > [Improved commit text and fixed a bug around 's' in base extension]
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 67 ++++++++++++++++++++++++++++------
> >  1 file changed, 56 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index dd3d57eb4eea..e19ae4391a9b 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/bitmap.h>
> > +#include <linux/ctype.h>
> >  #include <linux/of.h>
> >  #include <asm/processor.h>
> >  #include <asm/hwcap.h>
> > @@ -66,7 +67,7 @@ void __init riscv_fill_hwcap(void)
> >       struct device_node *node;
> >       const char *isa;
> >       char print_str[NUM_ALPHA_EXTS + 1];
> > -     size_t i, j, isa_len;
> > +     int i, j;
> >       static unsigned long isa2hwcap[256] = {0};
> >
> >       isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> > @@ -92,23 +93,67 @@ void __init riscv_fill_hwcap(void)
> >                       continue;
> >               }
> >
> > -             i = 0;
> > -             isa_len = strlen(isa);
> >  #if IS_ENABLED(CONFIG_32BIT)
> >               if (!strncmp(isa, "rv32", 4))
> > -                     i += 4;
> > +                     isa += 4;
> >  #elif IS_ENABLED(CONFIG_64BIT)
> >               if (!strncmp(isa, "rv64", 4))
> > -                     i += 4;
> > +                     isa += 4;
> >  #endif
> > -             for (; i < isa_len; ++i) {
> > -                     this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> > +             for (; *isa; ++isa) {
> > +                     const char *ext = isa++;
> > +                     bool ext_long, ext_err = false;
>
> To address an issue reported in
> <https://lore.kernel.org/all/202202111616.z7nZoKYj-lkp@intel.com/T/>,
> we'd be better to initialize ext_long with false.
>
> > +
> > +                     switch (*ext) {
> > +                     case 's':
> > +                     case 'x':
> > +                     case 'z':
> > +                             /**
> > +                              * 's' is a special case because:
> > +                              * It can be present in base extension for supervisor
> > +                              * Multi-letter extensions can start with 's' as well for
> > +                              * Supervisor extensions (i.e. sstc, sscofpmf, svinval)
> > +                              */
> > +                             if (*ext == 's' && ext[-1] != '_')
> > +                                     break;
>
> I think you added this for QEMU bug workaround (I will describe leter)
> but this will raise an issue.
>
> QEMU generates invalid ISA string on "riscv,isa" such like:
> "rv64imafdcsuh".  QEMU handles 'S' as a single-letter extension and can
> easily confuse my parser (handles this as 'Suh' non-existent extension).
>
> Atish tried to address this issue by handling \2 of "([^_])(S)"
> as a single-letter 'S' extension.
>
> It's okay for QEMU-generated ones and full ISA strings like
> "rv64imafdc_svinval_svnapot".  However, it causes problems on
> "rv64imafdcsvinval_svnapot" (no underscore before "svinval").  This is
> still a valid ISA string (with existing extensions) but confuses
> Atish's parser.
>
> The best solution is to fix **ONLY** QEMU and not make this exception.
>

"S" is a bit ambiguous as misa defines the "S" bit as Supervisor
implemented but it's not a valid ISA extension.

Probably, we should fix the isa-string generation in Qemu. But we
should have a workaround for backward compatibility
as well so that users can run hypervisors on older qemu.

> If we need QEMU workaround now, how about checking \2 of "([^_])(SU)"
> as single-letter 'S' and 'U' extensions?
>

Sounds good to me. Can I fold in your changes and send a v3 so that it
is easier to merge ?

> Here's the background for my new workaround:
>
> 1.  Linux requires U-mode.
> 2.  QEMU always generates invalid ISA string containing "SU"
>     for RISC-V with MSU modes.
> 3.  There's no standard extensions starting with 'Su'
>     (there's even no discussions/drafts about them).
>
> Following is related dumps from QEMU and Spike with my test Busybox image
> (with some notes):
>
> QEMU + RV64GC (with hypervisor enabled) w/o Atish's workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsuh
> isa-ext         :
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as an extension)
> dmesg:
> [    0.000000] riscv: ISA extensions acdfim  (hypervisor not detected!)
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
> QEMU + RV64GC (with hypervisor enabled) w/ Atish's workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsuh
> isa-ext         :
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as 'S', 'U' and 'H')
> dmesg:
> [    0.000000] riscv: ISA extensions acdfhimsu (extra 'S' and 'U' are harmless)
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
> QEMU + RV64GC (with hypervisor enabled) w/ Tsukasa's new workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsuh
> isa-ext         :
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as 'S', 'U' and 'H')
> dmesg:
> [    0.000000] riscv: ISA extensions acdfhimsu (same as Atish's workaround)
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
> Spike + rv64imafdc_svinval_svnapot w/ Atish's workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdc
> isa-ext         : svinval svnapot
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdc_svinval_svnapot
> dmesg:
> [    0.000000] Found ISA extension svinval
> [    0.000000] Found ISA extension svnapot
> [    0.000000] riscv: ISA extensions acdfim
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
> Spike + rv64imafdcsvinval_svnapot w/ Atish's workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsvinval
> isa-ext         : svnapot
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdcsvinval_svnapot
> dmesg:
> [    0.000000] Found ISA extension svnapot        (no 'Svinval' is found!)
> [    0.000000] riscv: ISA extensions acdfilmnsv   ('V' et al. should not be here!)
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
> Spike + rv64imafdcsvinval_svnapot w/ Tsukasa's new workaround
> =-===========================================================================-=
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsvinval
> isa-ext         : svinval svnapot
> mmu             : sv48
>
> riscv,isa (DTS) : rv64imafdcsvinval_svnapot
> dmesg:
> [    0.000000] Found ISA extension svinval
> [    0.000000] Found ISA extension svnapot
> [    0.000000] riscv: ISA extensions acdfim
> [    0.000000] riscv: ELF capabilities acdfim
> =-===========================================================================-=
>
>
> > +                             ext_long = true;
> > +                             /* Multi-letter extension must be delimited */
> > +                             for (; *isa && *isa != '_'; ++isa)
> > +                                     if (!islower(*isa) && !isdigit(*isa))
> > +                                             ext_err = true;
> > +                             /* ... but must be ignored. */
> > +                             break;
> > +                     default:
>
> > +                             ext_long = false;
>
> A line above is removed on my new patches.
>
> > +                             if (!islower(*ext)) {
> > +                                     ext_err = true;
> > +                                     break;
> > +                             }
> > +                             /* Find next extension */
> > +                             if (!isdigit(*isa))
> > +                                     break;
> > +                             while (isdigit(*++isa))
> > +                                     ;
> > +                             if (*isa != 'p')
> > +                                     break;
> > +                             if (!isdigit(*++isa)) {
> > +                                     --isa;
> > +                                     break;
> > +                             }
> > +                             while (isdigit(*++isa))
> > +                                     ;
> > +                             break;
> > +                     }
> > +                     if (*isa != '_')
> > +                             --isa;
> >                       /*
> > -                      * TODO: X, Y and Z extension parsing for Host ISA
> > -                      * bitmap will be added in-future.
> > +                      * TODO: Full version-aware handling including
> > +                      * multi-letter extensions will be added in-future.
> >                        */
> > -                     if ('a' <= isa[i] && isa[i] < 'x')
> > -                             this_isa |= (1UL << (isa[i] - 'a'));
> > +                     if (ext_err || ext_long)
> > +                             continue;
> > +                     this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> > +                     this_isa |= (1UL << (*ext - 'a'));
> >               }
> >
> >               /*



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

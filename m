Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB839C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xv3MDpZMi0HBxiXcccv6qL38WzOwRCpHzGJ6awNzuzo=; b=waDrBNKfQ72E56
	SmPTLEWdwySK9zsoKJoL0vDqVEr99dymXlBuinio+mIZLaDpwTLvrQPqdOduxCn7BYTtCffFKLYBW
	YNAh+uaZEkbfCmOX4P8NL8mSsDOeuAlyPzcByZybG8c8NOvXJHRNLVHKTcrQ+jVMeUDxBEtowUrjj
	ksRrK1bo9c4yzwssH3Gm3fDDXNlJPNs0xO5/rl3T2QVRR43HsBu937WOwg6GYkSsQD3gs0aAVP1+L
	9OUGs/oe+0t5Fj8O6edYpHkAv+YfmIq0LPRASk5Q8ksBL5pHBs8F0DY0ePDO38q7wSnSW4QdJFs7s
	x0sEjBn5Jx8hhsv7OHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npPQt-00Enxf-Oy; Fri, 13 May 2022 07:09:51 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npPQq-00Enwd-CY
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 07:09:50 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id x74so1125304ybe.4
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZCi80rSWSaWljJIiTWfg9yEo+Fxng+76D2ncosO4CQ=;
 b=V9YdKa+SALRwTY7iubDWZyaBm1XHeAjdscWdQFBcKyRNLA9yFyC+thvQNGU85FLvgr
 TZroI8BVWP9JGqOaNlf2lVp7K87zzK9CM2+TdOQo7wL+W5X1vbzm4a0Iz++AMtT3aZK7
 eb7KVxBGzP8QUGBmiMZDHZQS496kuYr4UwNEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZCi80rSWSaWljJIiTWfg9yEo+Fxng+76D2ncosO4CQ=;
 b=uMK88rzgNv++aq+7K05vLVc7tvQV1/2qXbSdjYI2R4jsqsxQvfdi2+UW5HYjFt2ZmA
 ynmMk1oFwq06d4w1Swb0w4xngfQISWPh8abJadK2CisR/8f0ZJU9Czho+BGieb1hYEU8
 /frwh/jz4zQYsOHqSkSyfHp0VIHZcLnsrML5qIdJ7OmWBiU8U24ppjOF1W8Q1QSMOz7O
 dS70xwE0SVPdrkbbk8wEeyAkConQ0G39gaqChk1Z+SKi65zykcXMahS7qa7aAXvbYxhM
 3hXbBjoB52959ZjV16XEA5/yL2/hR80SLq+6xeBaX3eqjkPymvfJuVGol2Ib3L/AGFQE
 IGQw==
X-Gm-Message-State: AOAM5308WcIIgeQFLwO62Hlvc8qC3zw2QBO+skKOaIk2Gc0gDCnHkG1m
 fysKmv+wdFGsnY5C7S1Hw34slnu8gXMtlR33aqOm
X-Google-Smtp-Source: ABdhPJxSAyQDEsCyxhdl+i5Eez6Kj9nvcDlaPv0osm4ipMdlMzIqAFbx5LjMZ7IR+o8zItpRV/XEoj1wLxOdJfFZgR4=
X-Received: by 2002:a05:6902:124b:b0:64b:8730:fd06 with SMTP id
 t11-20020a056902124b00b0064b8730fd06mr2462623ybu.289.1652425784594; Fri, 13
 May 2022 00:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220512033045.1101909-1-daolu@rivosinc.com>
 <689ad3c4-0365-bd27-4873-bff8dbe6591b@sholland.org>
In-Reply-To: <689ad3c4-0365-bd27-4873-bff8dbe6591b@sholland.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 13 May 2022 00:09:33 -0700
Message-ID: <CAOnJCUJbsrCfjsfBgBMuA5E_h+yhOCjE4rSKYvxv1meQGDwZgA@mail.gmail.com>
Subject: Re: [PATCH] arch/riscv: Add Zihintpause extension support
To: Samuel Holland <samuel@sholland.org>
Cc: Dao Lu <daolu@rivosinc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_000948_655584_270A6692 
X-CRM114-Status: GOOD (  29.93  )
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

On Thu, May 12, 2022 at 6:06 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 5/11/22 10:30 PM, Dao Lu wrote:
> > This patch:
> >   1. Build with _zihintpause if the toolchain has support for it
> >   2. Detects if the platform supports the extension
>
> This instruction is a hint, meaning it is a harmless no-op if the extension is
> unsupported by the CPU. So we can use it as long as the compiler supports it.
> There is no need to probe for it at runtime.
>

Is it guaranteed that the hardware won't throw any error if it sees a
fence instruction with
(pred=W, succ=0, fm=0, rd=x0, and rs1=x0.) ? I couldn't find anything
specific related to this in the spec.

I think using the static key mechanism provides backward compatibility
without any runtime impact.

> Regards,
> Samuel
>
> >   3. Use PAUSE for cpu_relax if both toolchain and the platform support it
> >
> > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > ---
> >  arch/riscv/Makefile                     |  4 ++++
> >  arch/riscv/include/asm/hwcap.h          |  1 +
> >  arch/riscv/include/asm/vdso/processor.h | 19 ++++++++++++++++---
> >  arch/riscv/kernel/cpu.c                 |  1 +
> >  arch/riscv/kernel/cpufeature.c          |  7 +++++++
> >  5 files changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 7d81102cffd4..900a8fda1a2d 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -56,6 +56,10 @@ riscv-march-$(CONFIG_RISCV_ISA_C)  := $(riscv-march-y)c
> >  toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> >  riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> >
> > +# Check if the toolchain supports Zihintpause extension
> > +toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
> > +riscv-march-$(toolchain-supports-zihintpause) := $(riscv-march-y)_zihintpause
> > +
> >  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0734e42f74f2..caa9ee5459b4 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
> >   */
> >  enum riscv_isa_ext_id {
> >       RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > +     RISCV_ISA_EXT_ZIHINTPAUSE,
> >       RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> > index 134388cbaaa1..106b35ba8cac 100644
> > --- a/arch/riscv/include/asm/vdso/processor.h
> > +++ b/arch/riscv/include/asm/vdso/processor.h
> > @@ -4,15 +4,28 @@
> >
> >  #ifndef __ASSEMBLY__
> >
> > +#include <linux/jump_label.h>
> >  #include <asm/barrier.h>
> > +#include <asm/hwcap.h>
> >
> > +extern struct static_key_false riscv_pause_available;
> >  static inline void cpu_relax(void)
> >  {
> > +     if (!static_branch_likely(&riscv_pause_available)) {
> >  #ifdef __riscv_muldiv
> > -     int dummy;
> > -     /* In lieu of a halt instruction, induce a long-latency stall. */
> > -     __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > +             int dummy;
> > +             /* In lieu of a halt instruction, induce a long-latency stall. */
> > +             __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> >  #endif
> > +     } else {
> > +#ifdef __riscv_zihintpause
> > +             /*
> > +              * Reduce instruction retirement.
> > +              * This assumes the PC changes.
> > +              */
> > +             __asm__ __volatile__ ("pause");
> > +#endif
> > +     }
> >       barrier();
> >  }
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index ccb617791e56..89e563e9c4cc 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > +     __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >       __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> >  };
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 1b2d42d7f589..327c19507dbb 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -24,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  #ifdef CONFIG_FPU
> >  __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
> >  #endif
> > +DEFINE_STATIC_KEY_FALSE(riscv_pause_available);
> > +EXPORT_SYMBOL_GPL(riscv_pause_available);
> >
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> > @@ -192,6 +194,7 @@ void __init riscv_fill_hwcap(void)
> >                               set_bit(*ext - 'a', this_isa);
> >                       } else {
> >                               SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> > +                             SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >                       }
> >  #undef SET_ISA_EXT_MAP
> >               }
> > @@ -213,6 +216,10 @@ void __init riscv_fill_hwcap(void)
> >
> >       }
> >
> > +     if (__riscv_isa_extension_available(riscv_isa, RISCV_ISA_EXT_ZIHINTPAUSE)) {
> > +             static_branch_enable(&riscv_pause_available);
> > +     }
> > +
> >       /* We don't support systems with F but without D, so mask those out
> >        * here. */
> >       if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
> >
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

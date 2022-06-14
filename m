Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF4BC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C80WfH3yGTYRYrP6JW0v9rV/mUGhf0my/C/HLg5TGs8=; b=j5WCFSQLlhRmlY
	MAMeIczaAddaNRkl/5NC9yU/+uoYL+sqX6/Bpwur4DzmMDrLROVzIzgddHvNEDbes01s9Q3DgTbxV
	eyLBL25pO9UM5KoVlUloyuvOjPwF0nF5gzY+kATdKlTvkTrrWTMF5qMw82b5HiRGreEB2u2EhJEFa
	PQsb+BMGA63Dnk2ru7FGKF0Yn+pl8cWTMbsR7DHHzjFmHoPg4WO3sJuKalmDGcA6rezaPoX1Xuv57
	n0BnfaDOJS7AF8FW2D7lCsDD8WEbYNHHcaX0TksC+YDzLgDRCbdBDK+RQbyeVK6wq/E9tnuZ0LOnZ
	nZp41CpFPh+QIv4NT/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18ZP-00AAdJ-JM; Tue, 14 Jun 2022 15:35:07 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18ZM-00AAap-M8
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 15:35:06 +0000
Received: by mail-yb1-xb32.google.com with SMTP id t32so15722635ybt.12
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jun 2022 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kQM8S+pM1PYYc1VPdpiDIud+0asVPfRB4C7ECP+ubNc=;
        b=R5goSh56V1xQ9hqhvWR/MPKlDpaaNS2GcHKsmq3WZSacQvw9elUD191K+AdvWMOCUA
         UyU0xEbVT/NYPzi22NeyYfKtf7Gw3+zCa7AJFPVDr06gCH6K10Zza9gxo0P8nFyqcmXe
         EkqwWwssXf8sc8T2HD0Tvu9qMLg877yRFh494=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQM8S+pM1PYYc1VPdpiDIud+0asVPfRB4C7ECP+ubNc=;
        b=B6Rn9URTeGUqT9hIYLzaRdvnXOAUpaZZ2bXFV2VP4+DXyEZ7HpZgUYlsv6TAnqgbUb
         tYrL4wNskwdcvggbhfF7PWYYI9aEL3hIiNWQgG0a2wElfDtnYiOJSe7j0IRbJB+2g+Ed
         Q20qiRuDSg5ISXiizeptH5vZde1yAjT5zOolut0Fa2JEE3AHM/RtRISvELVtuDKWvW+Y
         TTHBIKQirbkz31aU3LTxsPro/18odf7giqUX5qtO5pUq0RY3b9vQwSEyf+NGGZQmq0wF
         Lw5hhOcvqmrmTbm3c1Exs75ZbIkoWgc+X0vimkOUw7wyvIgvE6SeQtq3cRu8CSVVW50f
         mA0w==
X-Gm-Message-State: AJIora/P4AcJzGugKT/KNDc2CbDxAy1JkI1TAAP40Txy/gfd7Fb5o18P
	yJHMKgdy4ES43wuKS8BvhY7PJB1N0Sdl7iEgXORQ
X-Google-Smtp-Source: AGRyM1stCEHQProi+RrUM21gADHltiUdG2WyQy2EvgyYqKb3qIvrSq2PKGSOAEHIdWSaKdGBwKPE+SYRMo6BcHVtB7A=
X-Received: by 2002:a05:6902:729:b0:660:77c3:d81a with SMTP id
 l9-20020a056902072900b0066077c3d81amr6002603ybt.473.1655220899030; Tue, 14
 Jun 2022 08:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220602141032.169907-1-christoph.muellner@vrull.io>
In-Reply-To: <20220602141032.169907-1-christoph.muellner@vrull.io>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 14 Jun 2022 08:34:48 -0700
Message-ID: <CAOnJCULLTSVYX90yenWVDAtsq8XiZyA5bfKC94M9vC6Mina+Tg@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Add Zawrs support for spinlocks
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christoph Muellner <christoph.muellner@vrull.io>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Aaron Durbin <adurbin@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_083504_779183_9E8C3523 
X-CRM114-Status: GOOD (  43.51  )
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

On Thu, Jun 2, 2022 at 7:11 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> The current RISC-V code uses the generic ticket lock implementation,
> that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> Currently, RISC-V uses the generic implementation of these macros.
> This patch introduces a RISC-V specific implementation, of these
> macros, that peels off the first loop iteration and modifies the waiting
> loop such, that it is possible to use the WRS instruction of the Zawrs
> ISA extension to stall the CPU.
>
> The resulting implementation of smp_cond_load_*() will only work for
> 32-bit or 64-bit types for RV64 and 32-bit types for RV32.
> This is caused by the restrictions of the LR instruction (RISC-V only
> has LR.W and LR.D). Compiler assertions guard this new restriction.
>
> This patch uses the existing RISC-V ISA extension framework
> to detect the presents of Zawrs at run-time.
> If available a NOP instruction will be replaced by WRS.
> A similar patch could add support for the PAUSE instruction of
> the Zihintpause ISA extension.
>

FYI..The initial Zihintpause support patch
https://www.spinics.net/lists/kernel/msg4380326.html

> The whole mechanism is gated by Kconfig setting, which defaults to Y.
>
> The Zawrs specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>
> Note, that the Zawrs extension is not frozen or ratified yet.
> Therefore this patch is an RFC and not intended to get merged.
>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.io>
> ---
>  arch/riscv/Kconfig                   | 10 +++
>  arch/riscv/include/asm/barrier.h     | 97 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 12 +++-
>  arch/riscv/include/asm/hwcap.h       |  3 +-
>  arch/riscv/kernel/cpu.c              |  1 +
>  arch/riscv/kernel/cpufeature.c       | 13 ++++
>  6 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 905e550e0fd3..054872317d4a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -358,6 +358,16 @@ config RISCV_ISA_C
>
>            If you don't know what to do here, say Y.
>
> +config RISCV_ISA_ZAWRS
> +       bool "Zawrs extension support"
> +       select RISCV_ALTERNATIVE
> +       default y
> +       help
> +          Adds support to dynamically detect the presence of the Zawrs extension
> +          (wait for reservation set) and enable its usage.
> +
> +          If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_SVPBMT
>         bool "SVPBMT extension support"
>         depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
> index d0e24aaa2aa0..69b8f1f4b80c 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -12,6 +12,8 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/errata_list.h>
> +
>  #define nop()          __asm__ __volatile__ ("nop")
>
>  #define RISCV_FENCE(p, s) \
> @@ -42,6 +44,69 @@ do {                                                                 \
>         ___p1;                                                          \
>  })
>
> +#if __riscv_xlen == 64
> +
> +#define __riscv_lrsc_word(t)                                           \
> +       (sizeof(t) == sizeof(int) ||                                    \
> +        sizeof(t) == sizeof(long))
> +
> +#define __riscv_lr(ptr)                                                        \
> +       sizeof(*ptr) == sizeof(int) ? "lr.w" : "lr.d"
> +
> +#elif __riscv_xlen == 32
> +
> +#define __riscv_lrsc_word(ptr)                                         \
> +       (sizeof(*ptr) == sizeof(int))
> +
> +#define __riscv_lr(t) "lr.w"
> +
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif /* __riscv_xlen */
> +
> +#define compiletime_assert_atomic_lrsc_type(t)                         \
> +       compiletime_assert(__riscv_lrsc_word(t),                        \
> +               "Need type compatible with LR/SC instructions.")
> +
> +#define ___smp_load_reservedN(pfx, ptr)                                        \
> +({                                                                     \
> +       typeof(*ptr) ___p1;                                             \
> +       __asm__ __volatile__ ("lr." pfx "       %[p], %[c]\n"           \
> +                             : [p]"=&r" (___p1), [c]"+A"(*ptr));       \
> +       ___p1;                                                          \
> +})
> +
> +#define ___smp_load_reserved32(ptr)                                    \
> +       ___smp_load_reservedN("w", ptr)
> +
> +#define ___smp_load_reserved64(ptr)                                    \
> +       ___smp_load_reservedN("d", ptr)
> +
> +#define __smp_load_reserved_relaxed(ptr)                               \
> +({                                                                     \
> +       typeof(*ptr) ___p1;                                             \
> +       compiletime_assert_atomic_lrsc_type(*ptr);                      \
> +       if (sizeof(*ptr) == 32) {                                       \
> +               ___p1 = ___smp_load_reserved32(ptr);                    \
> +       } else {                                                        \
> +               ___p1 = ___smp_load_reserved64(ptr);                    \
> +       }                                                               \
> +       ___p1;                                                          \
> +})
> +
> +#define __smp_load_reserved_acquire(ptr)                               \
> +({                                                                     \
> +       typeof(*ptr) ___p1;                                             \
> +       compiletime_assert_atomic_lrsc_type(*ptr);                      \
> +       if (sizeof(*ptr) == 32) {                                       \
> +               ___p1 = ___smp_load_reserved32(ptr);                    \
> +       } else {                                                        \
> +               ___p1 = ___smp_load_reserved64(ptr);                    \
> +       }                                                               \
> +       RISCV_FENCE(r,rw);                                              \
> +       ___p1;                                                          \
> +})
> +
>  /*
>   * This is a very specific barrier: it's currently only used in two places in
>   * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
> @@ -69,6 +134,38 @@ do {                                                                        \
>   */
>  #define smp_mb__after_spinlock()       RISCV_FENCE(iorw,iorw)
>
> +#define smp_cond_load_relaxed(ptr, cond_expr)                          \
> +({                                                                     \
> +       typeof(ptr) __PTR = (ptr);                                      \
> +       __unqual_scalar_typeof(*ptr) VAL;                               \
> +       VAL = READ_ONCE(*__PTR);                                        \
> +       if (!cond_expr) {                                               \
> +               for (;;) {                                              \
> +                       VAL = __smp_load_reserved_relaxed(__PTR);       \
> +                       if (cond_expr)                                  \
> +                               break;                                  \
> +                       ALT_WRS();                                      \
> +               }                                                       \
> +       }                                                               \
> +       (typeof(*ptr))VAL;                                              \
> +})
> +
> +#define smp_cond_load_acquire(ptr, cond_expr)                          \
> +({                                                                     \
> +       typeof(ptr) __PTR = (ptr);                                      \
> +       __unqual_scalar_typeof(*ptr) VAL;                               \
> +       VAL = smp_load_acquire(__PTR);                                  \
> +       if (!cond_expr) {                                               \
> +               for (;;) {                                              \
> +                       VAL = __smp_load_reserved_acquire(__PTR);       \
> +                       if (cond_expr)                                  \
> +                               break;                                  \
> +                       ALT_WRS();                                      \
> +               }                                                       \
> +       }                                                               \
> +       (typeof(*ptr))VAL;                                              \
> +})
> +
>  #include <asm-generic/barrier.h>
>
>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 9e2888dbb5b1..b9aa0b346493 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -19,8 +19,9 @@
>  #define        ERRATA_THEAD_NUMBER 1
>  #endif
>
> -#define        CPUFEATURE_SVPBMT 0
> -#define        CPUFEATURE_NUMBER 1
> +#define        CPUFEATURE_ZAWRS 0
> +#define        CPUFEATURE_SVPBMT 1
> +#define        CPUFEATURE_NUMBER 2
>
>  #ifdef __ASSEMBLY__
>
> @@ -42,6 +43,13 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,     \
>                 ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)  \
>                 : : "r" (addr) : "memory")
>
> +#define ZAWRS_WRS      ".long 0x1000073"
> +#define ALT_WRS()                                                      \
> +asm volatile(ALTERNATIVE(                                              \
> +       "nop\n\t",                                                      \
> +       ZAWRS_WRS "\n\t",                                               \
> +       0, CPUFEATURE_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> +
>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 4e2486881840..c7dd8cc38bec 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -51,7 +51,8 @@ extern unsigned long elf_hwcap;
>   * available logical extension id.
>   */
>  enum riscv_isa_ext_id {
> -       RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +       RISCV_ISA_EXT_ZAWRS = RISCV_ISA_EXT_BASE,
> +       RISCV_ISA_EXT_SSCOFPMF,
>         RISCV_ISA_EXT_SVPBMT,
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..6c3a10ff5358 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -87,6 +87,7 @@ int riscv_of_parent_hartid(struct device_node *node)
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dea3ea19deee..fc2c47a1784b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
>                         } else {
>                                 SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>                                 SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +                               SET_ISA_EXT_MAP("zawrs", RISCV_ISA_EXT_ZAWRS);
>                         }
>  #undef SET_ISA_EXT_MAP
>                 }
> @@ -251,6 +252,14 @@ struct cpufeature_info {
>         bool (*check_func)(unsigned int stage);
>  };
>
> +static bool __init_or_module cpufeature_zawrs_check_func(unsigned int stage)
> +{
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       return riscv_isa_extension_available(NULL, ZAWRS);
> +}
> +
>  static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
>  {
>  #ifdef CONFIG_RISCV_ISA_SVPBMT
> @@ -267,6 +276,10 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
>
>  static const struct cpufeature_info __initdata_or_module
>  cpufeature_list[CPUFEATURE_NUMBER] = {
> +       {
> +               .name = "zawrs",
> +               .check_func = cpufeature_zawrs_check_func
> +       },
>         {
>                 .name = "svpbmt",
>                 .check_func = cpufeature_svpbmt_check_func
> --
> 2.35.3
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

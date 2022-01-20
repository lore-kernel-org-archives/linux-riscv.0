Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981BFC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9e5asUvipB2cczU6rjAZSVIbF7PsO6T+7DoFhDz2HUw=; b=DVna809eL7lHWJ
	b/Hh9wIPDEsCE8eAPoKuPIP8SNyDFdMgMox0Z7229/2eJhkD9n6JgpamJQs8WwU6mrxMo2W8dPW7q
	GvWaQAjsIcKSTnIUn4m1Qau79moCk5KmOUJeOeJIPeyU1w/Vw6V6p93cKUluk7qMNpawJ36g43gJu
	hJ6VGsGXPBKw7TA6oa5XyZB22yyfkyIKnlN6BgkzeYEpR/hXPmPEQj/lu7oSUmBCvayZePhr10jZn
	Ah+p32+QP02oG7wvzGqtaNhpDSQbQAXQvhmLAaavmahm+muwLxfMShbINgh0WI9HZRqbjfkVAThcw
	0InLy6NHQaiMPkM6irUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAbyp-00Ckd5-Gx; Thu, 20 Jan 2022 18:16:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAbym-00CkcB-Pe
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:16:15 +0000
Received: by mail-lf1-x132.google.com with SMTP id d3so24739896lfv.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9x2NG+LgE4kaD5UG5LUL0GB0NdPSyzMtwcN6xwlv9c=;
 b=UuAosnS4uZq9DoXlhTBm4j5l2w1d3uzS1YTDRfj9LBQyPwlz6lHwa3/ypLEr5zmS7k
 pt/lZDx7hlGBC3crCBzVwmp8t2ixX5/2a0nkfDSp4Kru+pSVPKZtUWhqQYcVdiN5HiUO
 WpBGKcJpqU7V4pg5PTUGwatPlL+giv/QcjBc3qGRjWYM34j4EdkN+kNyDOqhr54G64ry
 WWzRfIpb+bYWwx/wBMHhTNpDyimr/Mld0kgdo/BCjycjgRXREiZ8gzJzne/VND60di8c
 b3wv3kQRT+j0JNBpWPwbhpQzAdrDopXsBMpjb7d3wS2tLfFVQDndXur5qLVBLLAmStJt
 nU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9x2NG+LgE4kaD5UG5LUL0GB0NdPSyzMtwcN6xwlv9c=;
 b=kAOpIab6HuG8kQjliJ+pI6MBPNbWEoznVhQ7rVjd3G1Di21E9zW1azCz4NeNMhceuc
 +TZ1oMt0dlstij1Dk4t29mim0EHs/W/FET4yboCMjpUqqKu/M/7mDpewhOArh3kzKKBA
 +BktEU3/NrAGa6fgikMB1Y2QJ4kkotRIeV7Vh+4jmlSE2wQ9saq+IUKZwhEMb/8dMqRN
 32aBUp4GglMyorxtolsdR0lGG4/q1xHHgmg0qKYIK53hAYHHiRGMyyjZONbnY/RM0n9e
 WzY/aAh8Zx7wMN8zX3YNO5m1jiUYh5WqMT9ilpfFDbVWYGB+4VGAR+7AibEjsy04gwC2
 3G7g==
X-Gm-Message-State: AOAM533vMBV0OZrBamPP27dpvno5ZjA0rEw231uzuTmvEe08AjALklcX
 iEJOJrO5Vo7Bx4SNrI5z5nIEP6SxzEzE19fcA7BoNA==
X-Google-Smtp-Source: ABdhPJybBrwpc3UAc6Gu9IhMW/l96xRVYL7rrYuA41iXQZChzao9yTwmwptotwP66Tm7Frroc0/+6+Z/W8qqzY+Uz2w=
X-Received: by 2002:a05:6512:130f:: with SMTP id
 x15mr242448lfu.587.1642702571197; 
 Thu, 20 Jan 2022 10:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20211118192130.48b8f04c@xhacker> <20211118192651.605d0c80@xhacker>
In-Reply-To: <20211118192651.605d0c80@xhacker>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 20 Jan 2022 23:45:34 +0530
Message-ID: <CAN37VV6vfee+T18UkbDLe1ts87+Zvg25oQR1+VJD3e6SJFPPiA@mail.gmail.com>
Subject: Re: [PATCH 11/12] riscv: extable: add a dedicated uaccess handler
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Tong Tiangen <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_101612_998124_D17C807D 
X-CRM114-Status: GOOD (  18.82  )
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

Hello Jisheng,

Just wanted to inform you that this patch breaks the writev02 test
case in LTP and if it is reverted then the test passes. If we run the
test through strace then we see that the test hangs and following is
the last line printed by strace:

"writev(3, [{iov_base=0x7fff848a6000, iov_len=8192}, {iov_base=NULL,
iov_len=0}]"

Thanks,
Mayuresh.


On Thu, Nov 18, 2021 at 5:05 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Inspired by commit 2e77a62cb3a6("arm64: extable: add a dedicated
> uaccess handler"), do similar to riscv to add a dedicated uaccess
> exception handler to update registers in exception context and
> subsequently return back into the function which faulted, so we remove
> the need for fixups specialized to each faulting instruction.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm-extable.h | 23 +++++++++
>  arch/riscv/include/asm/futex.h       | 23 +++------
>  arch/riscv/include/asm/uaccess.h     | 74 +++++++++-------------------
>  arch/riscv/mm/extable.c              | 27 ++++++++++
>  4 files changed, 78 insertions(+), 69 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
> index 1b1f4ffd8d37..14be0673f5b5 100644
> --- a/arch/riscv/include/asm/asm-extable.h
> +++ b/arch/riscv/include/asm/asm-extable.h
> @@ -5,6 +5,7 @@
>  #define EX_TYPE_NONE                   0
>  #define EX_TYPE_FIXUP                  1
>  #define EX_TYPE_BPF                    2
> +#define EX_TYPE_UACCESS_ERR_ZERO       3
>
>  #ifdef __ASSEMBLY__
>
> @@ -23,7 +24,9 @@
>
>  #else /* __ASSEMBLY__ */
>
> +#include <linux/bits.h>
>  #include <linux/stringify.h>
> +#include <asm/gpr-num.h>
>
>  #define __ASM_EXTABLE_RAW(insn, fixup, type, data)     \
>         ".pushsection   __ex_table, \"a\"\n"            \
> @@ -37,6 +40,26 @@
>  #define _ASM_EXTABLE(insn, fixup)      \
>         __ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
>
> +#define EX_DATA_REG_ERR_SHIFT  0
> +#define EX_DATA_REG_ERR                GENMASK(4, 0)
> +#define EX_DATA_REG_ZERO_SHIFT 5
> +#define EX_DATA_REG_ZERO       GENMASK(9, 5)
> +
> +#define EX_DATA_REG(reg, gpr)                                          \
> +       "((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
> +
> +#define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)          \
> +       __DEFINE_ASM_GPR_NUMS                                           \
> +       __ASM_EXTABLE_RAW(#insn, #fixup,                                \
> +                         __stringify(EX_TYPE_UACCESS_ERR_ZERO),        \
> +                         "("                                           \
> +                           EX_DATA_REG(ERR, err) " | "                 \
> +                           EX_DATA_REG(ZERO, zero)                     \
> +                         ")")
> +
> +#define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)                     \
> +       _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* __ASM_ASM_EXTABLE_H */
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 2e15e8e89502..fc8130f995c1 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -21,20 +21,14 @@
>
>  #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)     \
>  {                                                              \
> -       uintptr_t tmp;                                          \
>         __enable_user_access();                                 \
>         __asm__ __volatile__ (                                  \
>         "1:     " insn "                                \n"     \
>         "2:                                             \n"     \
> -       "       .section .fixup,\"ax\"                  \n"     \
> -       "       .balign 4                               \n"     \
> -       "3:     li %[r],%[e]                            \n"     \
> -       "       jump 2b,%[t]                            \n"     \
> -       "       .previous                               \n"     \
> -               _ASM_EXTABLE(1b, 3b)                            \
> +       _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])                  \
>         : [r] "+r" (ret), [ov] "=&r" (oldval),                  \
> -         [u] "+m" (*uaddr), [t] "=&r" (tmp)                    \
> -       : [op] "Jr" (oparg), [e] "i" (-EFAULT)                  \
> +         [u] "+m" (*uaddr)                                     \
> +       : [op] "Jr" (oparg)                                     \
>         : "memory");                                            \
>         __disable_user_access();                                \
>  }
> @@ -96,15 +90,10 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>         "2:     sc.w.aqrl %[t],%z[nv],%[u]              \n"
>         "       bnez %[t],1b                            \n"
>         "3:                                             \n"
> -       "       .section .fixup,\"ax\"                  \n"
> -       "       .balign 4                               \n"
> -       "4:     li %[r],%[e]                            \n"
> -       "       jump 3b,%[t]                            \n"
> -       "       .previous                               \n"
> -               _ASM_EXTABLE(1b, 4b)                    \
> -               _ASM_EXTABLE(2b, 4b)                    \
> +               _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])  \
> +               _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])  \
>         : [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
> -       : [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
> +       : [ov] "Jr" (oldval), [nv] "Jr" (newval)
>         : "memory");
>         __disable_user_access();
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 40e6099af488..a4716c026386 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -81,22 +81,14 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
>
>  #define __get_user_asm(insn, x, ptr, err)                      \
>  do {                                                           \
> -       uintptr_t __tmp;                                        \
>         __typeof__(x) __x;                                      \
>         __asm__ __volatile__ (                                  \
>                 "1:\n"                                          \
> -               "       " insn " %1, %3\n"                      \
> +               "       " insn " %1, %2\n"                      \
>                 "2:\n"                                          \
> -               "       .section .fixup,\"ax\"\n"               \
> -               "       .balign 4\n"                            \
> -               "3:\n"                                          \
> -               "       li %0, %4\n"                            \
> -               "       li %1, 0\n"                             \
> -               "       jump 2b, %2\n"                          \
> -               "       .previous\n"                            \
> -                       _ASM_EXTABLE(1b, 3b)                    \
> -               : "+r" (err), "=&r" (__x), "=r" (__tmp)         \
> -               : "m" (*(ptr)), "i" (-EFAULT));                 \
> +               _ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)   \
> +               : "+r" (err), "=&r" (__x)                       \
> +               : "m" (*(ptr)));                                \
>         (x) = __x;                                              \
>  } while (0)
>
> @@ -108,27 +100,18 @@ do {                                                              \
>  do {                                                           \
>         u32 __user *__ptr = (u32 __user *)(ptr);                \
>         u32 __lo, __hi;                                         \
> -       uintptr_t __tmp;                                        \
>         __asm__ __volatile__ (                                  \
>                 "1:\n"                                          \
> -               "       lw %1, %4\n"                            \
> +               "       lw %1, %3\n"                            \
>                 "2:\n"                                          \
> -               "       lw %2, %5\n"                            \
> +               "       lw %2, %4\n"                            \
>                 "3:\n"                                          \
> -               "       .section .fixup,\"ax\"\n"               \
> -               "       .balign 4\n"                            \
> -               "4:\n"                                          \
> -               "       li %0, %6\n"                            \
> -               "       li %1, 0\n"                             \
> -               "       li %2, 0\n"                             \
> -               "       jump 3b, %3\n"                          \
> -               "       .previous\n"                            \
> -                       _ASM_EXTABLE(1b, 4b)                    \
> -                       _ASM_EXTABLE(2b, 4b)                    \
> -               : "+r" (err), "=&r" (__lo), "=r" (__hi),        \
> -                       "=r" (__tmp)                            \
> -               : "m" (__ptr[__LSW]), "m" (__ptr[__MSW]),       \
> -                       "i" (-EFAULT));                         \
> +               _ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)   \
> +               _ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)   \
> +               : "+r" (err), "=&r" (__lo), "=r" (__hi)         \
> +               : "m" (__ptr[__LSW]), "m" (__ptr[__MSW]))       \
> +       if (err)                                                \
> +               __hi = 0;                                       \
>         (x) = (__typeof__(x))((__typeof__((x)-(x)))(            \
>                 (((u64)__hi << 32) | __lo)));                   \
>  } while (0)
> @@ -216,21 +199,14 @@ do {                                                              \
>
>  #define __put_user_asm(insn, x, ptr, err)                      \
>  do {                                                           \
> -       uintptr_t __tmp;                                        \
>         __typeof__(*(ptr)) __x = x;                             \
>         __asm__ __volatile__ (                                  \
>                 "1:\n"                                          \
> -               "       " insn " %z3, %2\n"                     \
> +               "       " insn " %z2, %1\n"                     \
>                 "2:\n"                                          \
> -               "       .section .fixup,\"ax\"\n"               \
> -               "       .balign 4\n"                            \
> -               "3:\n"                                          \
> -               "       li %0, %4\n"                            \
> -               "       jump 2b, %1\n"                          \
> -               "       .previous\n"                            \
> -                       _ASM_EXTABLE(1b, 3b)                    \
> -               : "+r" (err), "=r" (__tmp), "=m" (*(ptr))       \
> -               : "rJ" (__x), "i" (-EFAULT));                   \
> +               _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)            \
> +               : "+r" (err), "=m" (*(ptr))                     \
> +               : "rJ" (__x));                                  \
>  } while (0)
>
>  #ifdef CONFIG_64BIT
> @@ -244,22 +220,16 @@ do {                                                              \
>         uintptr_t __tmp;                                        \
>         __asm__ __volatile__ (                                  \
>                 "1:\n"                                          \
> -               "       sw %z4, %2\n"                           \
> +               "       sw %z3, %1\n"                           \
>                 "2:\n"                                          \
> -               "       sw %z5, %3\n"                           \
> +               "       sw %z4, %2\n"                           \
>                 "3:\n"                                          \
> -               "       .section .fixup,\"ax\"\n"               \
> -               "       .balign 4\n"                            \
> -               "4:\n"                                          \
> -               "       li %0, %6\n"                            \
> -               "       jump 3b, %1\n"                          \
> -               "       .previous\n"                            \
> -                       _ASM_EXTABLE(1b, 4b)                    \
> -                       _ASM_EXTABLE(2b, 4b)                    \
> -               : "+r" (err), "=r" (__tmp),                     \
> +               _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)            \
> +               _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)            \
> +               : "+r" (err),                                   \
>                         "=m" (__ptr[__LSW]),                    \
>                         "=m" (__ptr[__MSW])                     \
> -               : "rJ" (__x), "rJ" (__x >> 32), "i" (-EFAULT)); \
> +               : "rJ" (__x), "rJ" (__x >> 32));                \
>  } while (0)
>  #endif /* CONFIG_64BIT */
>
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index 91e52c4bb33a..05978f78579f 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -7,10 +7,12 @@
>   */
>
>
> +#include <linux/bitfield.h>
>  #include <linux/extable.h>
>  #include <linux/module.h>
>  #include <linux/uaccess.h>
>  #include <asm/asm-extable.h>
> +#include <asm/ptrace.h>
>
>  static inline unsigned long
>  get_ex_fixup(const struct exception_table_entry *ex)
> @@ -25,6 +27,29 @@ static bool ex_handler_fixup(const struct exception_table_entry *ex,
>         return true;
>  }
>
> +static inline void regs_set_gpr(struct pt_regs *regs, unsigned int offset,
> +                               unsigned long val)
> +{
> +       if (unlikely(offset > MAX_REG_OFFSET))
> +               return;
> +
> +       if (!offset)
> +               *(unsigned long *)((unsigned long)regs + offset) = val;
> +}
> +
> +static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
> +                                       struct pt_regs *regs)
> +{
> +       int reg_err = FIELD_GET(EX_DATA_REG_ERR, ex->data);
> +       int reg_zero = FIELD_GET(EX_DATA_REG_ZERO, ex->data);
> +
> +       regs_set_gpr(regs, reg_err, -EFAULT);
> +       regs_set_gpr(regs, reg_zero, 0);
> +
> +       regs->epc = get_ex_fixup(ex);
> +       return true;
> +}
> +
>  bool fixup_exception(struct pt_regs *regs)
>  {
>         const struct exception_table_entry *ex;
> @@ -38,6 +63,8 @@ bool fixup_exception(struct pt_regs *regs)
>                 return ex_handler_fixup(ex, regs);
>         case EX_TYPE_BPF:
>                 return ex_handler_bpf(ex, regs);
> +       case EX_TYPE_UACCESS_ERR_ZERO:
> +               return ex_handler_uaccess_err_zero(ex, regs);
>         }
>
>         BUG();
> --
> 2.33.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

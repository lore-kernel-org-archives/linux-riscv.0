Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69006C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 20:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWdYHVUtuwJv//rn4Bdtaeb1tXOGe5KRQGd3X1DaJ2M=; b=JPPF+EwPcyygDX
	rVfZtK7APRK8hOkWNx02ZmG2taaPl6/yveAXrESLNXYzlIzLLIKqDxbYRc29E63lRYgykNcZzaa1L
	yhlV4rdWtHKk1xeW4BWCEr9rkYCNWnJT/bbOGZnyHAGpxqUavxRcLIExHSIij5sZgSGhHBXTfhp3V
	MJ9UdgZKXbt+f+ChMWtF+d4g0I05uTTCUM8QKgkYjNR6sxFeMHmMOmufHBcsD862etOUZvQtf68hy
	fOljraCQraINdfHW/GqAZxdRxCkJ69vum6lAWhYwdvW2VZOTN8j793wVPaAd6ZAxlffE/dxQwRXb9
	+2alLXnRs0N/ayAECk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrQY3-003uwL-37; Wed, 18 May 2022 20:45:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrQY0-003uuJ-FC
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 20:45:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id p22so5633348lfo.10
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZJJPAZDkDqR7UoeGKaC6qUbpF8wvLcJmxmRJ8kYOSU=;
 b=i+FtS1BM+D5y1Fijev4TprJqlINgopPryrnYc3eI6KH1HzKaxQQqr0voU6ZpMOGKv1
 HmhzABK4RSTo3+zqOytKGeu8fgmUxsk+DnBWCyp2jEJpRzn2OrEsvlH5ZwanpF1UVsCv
 7jpzINan8lrclloeNnX9ohq+oRKKFzXhjqbRqmLLBMrGZyU7PLFmaMfOFkSYwONUsZlE
 zadkzm2Vn+/5danHpEmCddVSLy6WFBPBcZsybyx6pk68M7WjscnNfqGopIHAXXkRKk41
 MQkaGVfEN1oCsCqAI9edLvMJ9OXhS0J6cnlSLWwzuHVJ7QoubRxmasZ/pwwfnfrNRUTV
 acZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZJJPAZDkDqR7UoeGKaC6qUbpF8wvLcJmxmRJ8kYOSU=;
 b=TMxB4D4TsAxGqnVroRE1SQVwFf+DDvW44MSnXumCuFGcx9vyeQ5ABxbCpNtW2L5Nsi
 e2yf9XiyiJvHUZarn3wo7LUBrfhoQcCJHeL0/It16CEQWBvtqmksAxpigHtfZNNr0ct9
 UBGySYnkx1YUciQvtaAbo/u1SP9jlaysSpPo84OTJmRbK+UU7Vs7TYUrC0uKOAQNYSd7
 kExrkN9GcTidkjmiydCl1apmmHxI5m6njGHZq1Lwklf4hmhqTI+qccZJvsEnZha/d5PZ
 RjMiQ9dczeshULMx15RRYu9hsv9r4V5i2Pi+vRKLO0DNSZnQq+LOIZvPW+WUh3+pu9zH
 FgTg==
X-Gm-Message-State: AOAM530JQsL19cfHhBAWomsy6KcMw7dqlvoypskrDOPLNLmSGqOj3ZNA
 0wdUGg4/20SgpnxgUP5aYULeOmg8O7kQe/7Y87ej1g==
X-Google-Smtp-Source: ABdhPJzEuMLqq/YYkPJUgoDmG+EduOgOoFxh5PSOdtGXfVwKSqpQ0R2rlP/M7Z0qDdr7a4AlDOaaEEA/hCVff3/7Axk=
X-Received: by 2002:a05:6512:1105:b0:477:b97f:4971 with SMTP id
 l5-20020a056512110500b00477b97f4971mr883037lfg.87.1652906727396; Wed, 18 May
 2022 13:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220518184529.454008-1-nathan@kernel.org>
In-Reply-To: <20220518184529.454008-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 May 2022 13:45:15 -0700
Message-ID: <CAKwvOdk3HZkiZwtp1+xZULbm8BkOjdCQxPqsOHDJ5CboVy5ONw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix ALT_THEAD_PMA's asm parameters
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Jessica Clarke <jrtc27@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_134532_549003_AA3AB5CB 
X-CRM114-Status: GOOD (  22.20  )
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

On Wed, May 18, 2022 at 11:45 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit a35707c3d850 ("riscv: add memory-type errata for T-Head"),
> builds with LLVM's integrated assembler fail like:
>
>   In file included from arch/riscv/kernel/asm-offsets.c:10:
>   In file included from ./include/linux/mm.h:29:
>   In file included from ./include/linux/pgtable.h:6:
>   In file included from ./arch/riscv/include/asm/pgtable.h:114:
>   ./arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
>           ALT_THEAD_PMA(prot_val);
>           ^
>   ./arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
>           : "0"(_val),                                                    \
>             ^
>
> This was reported upstream to LLVM where Jessica pointed out a couple of
> issues with the existing implementation of ALT_THEAD_PMA:
>
> * t3 is modified but not listed in the clobbers list.
>
> * "+r"(_val) marks _val as both an input and output of the asm but then
>   "0"(_val) marks _val as an input matching constraint, which does not
>   make much sense in this situation, as %1 is not actually used in the
>   asm and matching constraints are designed to be used for different
>   inputs that need to use the same register.
>
> Drop the matching contraint and shift all the operands by one, as %1 is

s/contraint/constraint/

Thanks for the fix!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> unused, and mark t3 as clobbered. This resolves the build error and goes
> not cause any problems with GNU as.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1641
> Link: https://github.com/llvm/llvm-project/issues/55514
> Link: https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
> Suggested-by: Jessica Clarke <jrtc27@jrtc27.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 9e2888dbb5b1..416ead0f9a65 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -75,20 +75,20 @@ asm volatile(ALTERNATIVE(                                           \
>         "nop\n\t"                                                       \
>         "nop\n\t"                                                       \
>         "nop",                                                          \
> -       "li      t3, %2\n\t"                                            \
> -       "slli    t3, t3, %4\n\t"                                        \
> +       "li      t3, %1\n\t"                                            \
> +       "slli    t3, t3, %3\n\t"                                        \
>         "and     t3, %0, t3\n\t"                                        \
>         "bne     t3, zero, 2f\n\t"                                      \
> -       "li      t3, %3\n\t"                                            \
> -       "slli    t3, t3, %4\n\t"                                        \
> +       "li      t3, %2\n\t"                                            \
> +       "slli    t3, t3, %3\n\t"                                        \
>         "or      %0, %0, t3\n\t"                                        \
>         "2:",  THEAD_VENDOR_ID,                                         \
>                 ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)            \
>         : "+r"(_val)                                                    \
> -       : "0"(_val),                                                    \
> -         "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),              \
> +       : "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),              \
>           "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),                 \
> -         "I"(ALT_THEAD_PBMT_SHIFT))
> +         "I"(ALT_THEAD_PBMT_SHIFT)                                     \
> +       : "t3")
>  #else
>  #define ALT_THEAD_PMA(_val)
>  #endif
>
> base-commit: 93c0651617a62a69717299f1464dda798af8bebb
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

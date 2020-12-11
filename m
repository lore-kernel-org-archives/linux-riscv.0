Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF2C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A64F2312A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A64F2312A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0QuwNKaEXYNkk1oyKW0I0fQz22FKrLInNpNqAUpSrqA=; b=PYihBILZfc5pqLf6A7A+LPV/4
	Z9XSSrSiSbXu8qO6yi0JDNwp+RJXhR0o9eHZ8eEO5heViYHe581xSgGgHyo7wc1sYcux9y4l1r2If
	jkq6lM5whO5YYUOziHyNxzIWZxINnY4cRyZ8dVT/qlNE3wGgSjd7oHUL9TZqr170bjmisdbZ1SmcK
	05y07K7hiG9ldpCibfXyas4Nlni+dSqP/tC3si/MP37SS1QrTeND8IomjMg6LUXxA0ce97Ipb6knR
	FH25+8SuT7FGd9sYIwZnYqm6Ilj0buv0ACrZCOYshhYDocsCqAVzjR5820zMEoGwYhXNp2cgEWW1/
	0q6UF84AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXTH-0002u3-52; Fri, 11 Dec 2020 01:43:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXTE-0002tB-DF
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 01:43:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id c12so5961897pfo.10
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 17:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pQu0LnGna1dWoV0eZjzZ6tJ6W057k3Sx2X7eDqkVyI4=;
 b=P444x4XONVykcGyaVpl0sjZKMddSH0r4u7h7zcjPuUaqB8DfhbIKQMMaEFRUzUPdFl
 7iNB/LnfXMsYOeNMw5/WlIXHGl4zc8SYDc7Xt/9GtoDK2iboz6dJz/4YIrzhLOu4pDJt
 tO07YJ6cgBD45CcZYnMI0DvNjPUl0dym2z9A2rWisUOH2nyC4d26Z+5XJhimavcR/sXD
 A6NSHBKvzLK/bqThakR3yexeZEp4P/LkWUi4wvGx/azjA84WXhYEWkfu8LzTPN1zQiDD
 b9ksdhgc0I7BXGsrmMyE0qeanaOZ8fmpi0EiCI22En76OxK3K18ldJA09I99iJpYYif/
 yTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pQu0LnGna1dWoV0eZjzZ6tJ6W057k3Sx2X7eDqkVyI4=;
 b=ZIeG3XIwDcdnmrgOqP9lzm39rE41NmGLkBklYHQuaIskkp1PKH2YfR0nuITOMvf0VR
 x/coc7p8d1JmHonr5VbTiTcBZ1zzeBsvv4KofZ8CVJeq7BAOBix8IL+yrTC6ztLm182h
 tIPx+abYGSV3dJBjU8z6brsC8cRU085UOqx5S6Ntn3SsAtSvwQPGi6yamP0AqNdGLBiI
 vu3ZhMXLpc9o4r9olPOJFCXOtOlvJB97mmqYk9JNPlgEzqgSd5lMTqplkN1zsoPNJA4w
 ogR0Tr/OWepOoCU6Z2erTEK3GwBUl8wtJu0ZUpKKaKseXA4dHZHHzCuEfAdCQ85Budin
 V++g==
X-Gm-Message-State: AOAM530SPlFOhhq1pWrzcdiDZcUxcbvmF6eX8gyr45pRo2v2h/Gz9NSc
 FdBG65LoTlB3ob9jMLUQon3x/g==
X-Google-Smtp-Source: ABdhPJw/Y4nD+V1nAjphKP8QMRgU937bQpX0mIpFp/n0KlGyQ1v/YR8CWQrAceBpA3D35PEc3CsnIQ==
X-Received: by 2002:a65:5bcd:: with SMTP id o13mr9267114pgr.81.1607651020439; 
 Thu, 10 Dec 2020 17:43:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x28sm7592780pff.182.2020.12.10.17.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:43:39 -0800 (PST)
Date: Thu, 10 Dec 2020 17:43:39 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:28:07 PST (-0800)
Subject: Re: [PATCH 1/1] riscv: provide memmove implementation
In-Reply-To: <1606727599-8598-2-git-send-email-nylon7@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nylon7@andestech.com
Message-ID: <mhng-d7cf2bc5-2d77-4da4-ad30-206628447bc1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_204344_596124_4DC9F517 
X-CRM114-Status: GOOD (  21.28  )
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
Cc: aou@eecs.berkeley.edu, alankao@andestech.com, nickhu@andestech.com,
 nick650823@gmail.com, kasan-dev@googlegroups.com, nylon7@andestech.com,
 nylon7717@gmail.com, linux-riscv@lists.infradead.org, glider@google.com,
 luc.vanoostenryck@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aryabinin@virtuozzo.com, akpm@linux-foundation.org, greentime.hu@sifive.com,
 dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 30 Nov 2020 01:13:19 PST (-0800), nylon7@andestech.com wrote:
> The memmove used by the kernel feature like KASAN.
>
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> Signed-off-by: Nick Hu <nick650823@gmail.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  arch/riscv/include/asm/string.h |  8 ++---
>  arch/riscv/kernel/riscv_ksyms.c |  2 ++
>  arch/riscv/lib/Makefile         |  1 +
>  arch/riscv/lib/memmove.S        | 64 +++++++++++++++++++++++++++++++++
>  4 files changed, 71 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/lib/memmove.S
>
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 924af13f8555..5477e7ecb6e1 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -12,16 +12,16 @@
>  #define __HAVE_ARCH_MEMSET
>  extern asmlinkage void *memset(void *, int, size_t);
>  extern asmlinkage void *__memset(void *, int, size_t);
> -
>  #define __HAVE_ARCH_MEMCPY
>  extern asmlinkage void *memcpy(void *, const void *, size_t);
>  extern asmlinkage void *__memcpy(void *, const void *, size_t);
> -
> +#define __HAVE_ARCH_MEMMOVE
> +extern asmlinkage void *memmove(void *, const void *, size_t);
> +extern asmlinkage void *__memmove(void *, const void *, size_t);
>  /* For those files which don't want to check by kasan. */
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
> -
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
> -
> +#define memmove(dst, src, len) __memmove(dst, src, len)
>  #endif
>  #endif /* _ASM_RISCV_STRING_H */
> diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
> index 450492e1cb4e..5ab1c7e1a6ed 100644
> --- a/arch/riscv/kernel/riscv_ksyms.c
> +++ b/arch/riscv/kernel/riscv_ksyms.c
> @@ -11,5 +11,7 @@
>   */
>  EXPORT_SYMBOL(memset);
>  EXPORT_SYMBOL(memcpy);
> +EXPORT_SYMBOL(memmove);
>  EXPORT_SYMBOL(__memset);
>  EXPORT_SYMBOL(__memcpy);
> +EXPORT_SYMBOL(__memmove);
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 47e7a8204460..ac6171e9c19e 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -2,5 +2,6 @@
>  lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
> +lib-y			+= memmove.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
> new file mode 100644
> index 000000000000..07d1d2152ba5
> --- /dev/null
> +++ b/arch/riscv/lib/memmove.S
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +ENTRY(__memmove)
> +WEAK(memmove)
> +        move    t0, a0
> +        move    t1, a1
> +
> +        beq     a0, a1, exit_memcpy
> +        beqz    a2, exit_memcpy
> +        srli    t2, a2, 0x2
> +
> +        slt     t3, a0, a1
> +        beqz    t3, do_reverse
> +
> +        andi    a2, a2, 0x3
> +        li      t4, 1
> +        beqz    t2, byte_copy
> +
> +word_copy:
> +        lw      t3, 0(a1)
> +        addi    t2, t2, -1
> +        addi    a1, a1, 4
> +        sw      t3, 0(a0)
> +        addi    a0, a0, 4
> +        bnez    t2, word_copy
> +        beqz    a2, exit_memcpy
> +        j       byte_copy
> +
> +do_reverse:
> +        add     a0, a0, a2
> +        add     a1, a1, a2
> +        andi    a2, a2, 0x3
> +        li      t4, -1
> +        beqz    t2, reverse_byte_copy
> +
> +reverse_word_copy:
> +        addi    a1, a1, -4
> +        addi    t2, t2, -1
> +        lw      t3, 0(a1)
> +        addi    a0, a0, -4
> +        sw      t3, 0(a0)
> +        bnez    t2, reverse_word_copy
> +        beqz    a2, exit_memcpy
> +
> +reverse_byte_copy:
> +        addi    a0, a0, -1
> +        addi    a1, a1, -1
> +
> +byte_copy:
> +        lb      t3, 0(a1)
> +        addi    a2, a2, -1
> +        sb      t3, 0(a0)
> +        add     a1, a1, t4
> +        add     a0, a0, t4
> +        bnez    a2, byte_copy
> +
> +exit_memcpy:
> +        move a0, t0
> +        move a1, t1
> +        ret
> +END(__memmove)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

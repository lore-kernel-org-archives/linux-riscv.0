Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4B5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slt9/9vBYwSZ4rq3C9OMtABUJXDzx0k8AZ5it0sa/O4=; b=be8RsE4BBegSA3
	RJBloeVs8tA3QkOlmqR5r3ThV71alQtVteE3rlzj4MPuF5o/xdmKYMMR54JFgrISPmb5e6yo+q1P/
	6zTSsCb++fS0I7rvo5jMPPvCOzbT7t1eHyP5HdRMQ5RKZr5Clj0/WnSwDoNkOQuzgx9Qa/xqdFsR5
	O0NHsRdao9TdYCHbc6XrejIkENohgzqbgrvIlv+A/P9nb740TIvRJp8eCR9egsx+E/65PlFqFs1YW
	9yhtZK0VXFp+dXoVHb6JRz6zyiPwBFowxXdMtKwDab2ghpIpnjL4Uolbyjst6r9SGn5S6hddrhTlm
	KorLrkaEmABlUEJxC0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSm3-0036mf-C4; Tue, 10 May 2022 16:31:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSm0-0036l9-2f
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 16:31:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1775728wme.4
 for <linux-riscv@lists.infradead.org>; Tue, 10 May 2022 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWGzBUsWBBDH/P677svrWdBEwqX8mcCwwVWbeqZWyLM=;
 b=mp+dUgzLD4/aCLY9HUnigMrWJJnPCtVY67VICGXnZi/Ibm1aI1RupWH/WFm4Lg3DJc
 RHYE3K/zWkzGzTb8icJxuI3AmVLYGdHmc2Tsz01br4rDumBHHB7NU4wwJJeuCTjpGBRn
 Nc9cKW2K1z+tZC/9zPq2EZMm1DmD0HqLGz/K4PM5Wuc0iP5RlnzGg/KtjsBo92nP3Mbk
 YTlR52T2RPBol7QG5IrBEmxdc2rk8APC9ILl8VPnqJRu+johonHlBafRa5R8NTv7bkDx
 Ev98I0OgfHTQ4J2Sl3E4B+P6BwRATwJhRcHISuWvL9xe2LloKFDByHLMbA9IloQNDRRp
 TM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWGzBUsWBBDH/P677svrWdBEwqX8mcCwwVWbeqZWyLM=;
 b=DPR7qZ+JKnauMilClT+ufbluEjoC03659ahHEj8T8s8xUSFxmYZArkgGOg9OufQOOY
 Vq/7k5VvUarufMNQorqGiuC1F9R/i7vDqZnBHniIdobnAYogi7gsTkpb5W4HbG/41qpQ
 COesZzoJ2trC6sKLTWQzk8mtbga4MQcdpEHJrta+hFrWX/Q04twcjR4xbvPT5izRkPeM
 0TWGaXWXTvmyMNWwDsidipVHB9rEzd46wUM7x7OeWff7J9fFhIglBISosQ6iDywQeOex
 fMkAJmPB9bOFUblyG7I75EW3/GWIjPSeCAc1PnwlKqPmfWsbt3dXSJwK3UnYn/r3AunY
 txyw==
X-Gm-Message-State: AOAM533ZfflGeHIS3JF2a5N5Xf3T82VSAEkbOjQwMxsT/mshbkIW6vjc
 hGTLsR9fbcpOiSTGAerauxyNYx+E4/kNTyyjM3Tx5g==
X-Google-Smtp-Source: ABdhPJzQtKdjWFU8w2Qsa+cEZtvGNo/+m/RKVZhKkEZcyeqc6UGOm2ftqsMkQI0qDdQfORovWRe/wzgyIxFX1xZN6Kw=
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr782732wms.137.1652200302633; Tue, 10 May
 2022 09:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220510154750.212913-1-yury.norov@gmail.com>
 <20220510154750.212913-8-yury.norov@gmail.com>
In-Reply-To: <20220510154750.212913-8-yury.norov@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 May 2022 22:01:30 +0530
Message-ID: <CAAhSdy0=g1pp+VgV2=1-3t_u32nX6xx=zmMuVQBd-zyFtQ983A@mail.gmail.com>
Subject: Re: [PATCH 07/22] risc-v: replace bitmap_weight with bitmap_empty in
 riscv_fill_hwcap()
To: Yury Norov <yury.norov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 David Laight <David.Laight@aculab.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joe Perches <joe@perches.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Tsukasa OI <research_trasio@irq.a4lg.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093144_182239_A36040A7 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, May 10, 2022 at 9:18 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> bitmap_empty() is better than bitmap_weight() because it may return
> earlier, and improves on readability.
>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Anup Patel <anup@brainfault.org>
> CC: Atish Patra <atishp@atishpatra.org>
> CC: Jisheng Zhang <jszhang@kernel.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Tsukasa OI <research_trasio@irq.a4lg.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1b2d42d7f589..f0298d756f66 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -206,11 +206,10 @@ void __init riscv_fill_hwcap(void)
>                 else
>                         elf_hwcap = this_hwcap;
>
> -               if (bitmap_weight(riscv_isa, RISCV_ISA_EXT_MAX))
> -                       bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> -               else
> +               if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
>                         bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> -
> +               else
> +                       bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>         }
>
>         /* We don't support systems with F but without D, so mask those out
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

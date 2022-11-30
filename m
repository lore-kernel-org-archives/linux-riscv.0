Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0113AC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yeCb/EN3g3tyi1l2te8SfcaZQ6IiRLLW27XMm1t5+Y=; b=G1RZYsKf//QAxM
	vBEYGfrDNo6cf2biuWWFyY6zApQILvWhWiij2Wiqb8d3fUBkHZpN6App1Ae0rcTCHUMaHVusQNBl9
	NpoYX9tFtDIKDkY+jVT6qrK7Mjwfcc6TvORApnHvV1216AMuXECHwuVZ+XZizsn8MKIgWJPVQ7hmZ
	woWz9CDCwcuSnN/0+OHIQpHHL0grQcYOuh4XC7tK8MFKpL7inDFT3x5Br2mhLLfMJJIYtYWxUCO4u
	9ORFtMu1w+adx58CfDR9Tob/D5jsCJciBBihRpL4N2LscPpRRvpSrsylyPFQBLUU/yOI2lZvpGQ4K
	w27+8Vx8GEUHrBoCbw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0D9C-00CIHT-Em; Wed, 30 Nov 2022 02:48:30 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0D9A-00CIDz-6Z
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:48:29 +0000
Received: by mail-oi1-x22f.google.com with SMTP id m204so17426252oib.6
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=keXd344sIL2Axw294Ojzkf8vMy22zfN9agu+NIErakc=;
        b=q4h7YuMITHQxrW7ZuaQ5CLlmfdNHlj7tkZnyFGRJ79wAUoewwbZndW8+BaQ1gcu1gh
         QsH6IyUquRSagctknw2PpehMpel5+mogcX84p1/1PRCOf3jR1pYc9f11tkxUTaz3nJw2
         pc6+03jI0dOCB3402JK509Hhc0Fyb7567c1aZKMMIcvY9UHcYNENo+U1XiyL7AwGH75K
         5JbbUvYujwKmDW8F+uZWgxl20X2uVTTdwOTrhqjZly1FTHwcOUc3mgzOnj5CdbFqWDQr
         9tgvEKKwVXArDfeRCAm90yy9nFztRVXwMKTyDun3H7+7s8syW3Sn+ALJBH6mYifPNzye
         oO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keXd344sIL2Axw294Ojzkf8vMy22zfN9agu+NIErakc=;
        b=L7AEi7pLD03kX63Qa/J7LFqbr04U9FcKPJJiNt/K0SmXjx6hM2DjocI6wkq16C1V+q
         C9O9jV5mVKpAfX+bOkblBmxSDUxHE3v4bSVT75MeJyo0TYYLmZiUTYY7XHseYFLZO5vK
         0eEgg0G/gCoqpHRZdiqgDxNLWyI2/reZ9bsGZu2lQlx+B2ZrrTCjq0wV14htd6P8a/b1
         aUEZyU/Su3Fj5vCHHSYrr/bfpBPwZKKZLYDLZ6ld3GVOPumnkIfaeDzCCR0UipCIKHCo
         vj7zPKwCEeX63cn30tWN4UOC6TqC3WUCC9t3Dc7B8PQqtCM7u9jg2BTZRxYCKJ+QEyPm
         8UFQ==
X-Gm-Message-State: ANoB5pmC3awurFAYsFqm7QqIMn1xGHRC61uWIR7AJ0TY1bjO5IsVMDsN
	KAk2/B1a7m0MB0HZ8UbA9aeQ/BwMw9lJh0Q1DVE=
X-Google-Smtp-Source: AA0mqf4XDuK51ylnQ1qDeOE5aq2PPrJbmFP2lmvGRlVb9l0st8hTdzUCZJMG5GqoHJsxhY2CSjXDfkK+7/IKWCIili4=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr30266295oic.262.1669776500901; Tue, 29
 Nov 2022 18:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20221130023515.20217-1-palmer@rivosinc.com>
In-Reply-To: <20221130023515.20217-1-palmer@rivosinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2022 18:47:55 -0800
Message-ID: <CAMKF1srMj5aH4_+iwbFuu+AEgyyz85y+UPEszUGeQ7U=u19R3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_184828_286557_03DC86DC 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Palmer

On Tue, Nov 29, 2022 at 6:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
> only calling that one function on the shadow stack so I doubt it'd
> result in a real issue, but might as well keep this lined up.

Is 16-byte alignment required on rv32 as well ?

>
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index be54ccea8c47..acdfcacd7e57 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>   * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>   * to get per-cpu overflow stack(get_overflow_stack).
>   */
> -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> +long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>  asmlinkage unsigned long get_overflow_stack(void)
>  {
>         return (unsigned long)this_cpu_ptr(overflow_stack) +
> --
> 2.38.1
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7AC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4PztTnRnoTvHiOMuvutgiVnnvyzHuJ/EpWexly+Dwmg=; b=ZdE9fooJ3medfsZ7kkVd+pgcdM
	ivhVaHEzvAYW1svxV5QfzCV1bW/bT82tRiUHR0jjMwM58i9GqzCuZCdA09dxP0rTDCxXNhJmaV1o+
	l+7ZskIzrzl6xwHYBvBKwbjlF9BeU21EejBkGemCoaVzXlLgtgEc853SVDUoptcDcqZ8rnbuALqVO
	zI40vvHL5iYkTdkVfSEaWsIWFp/NbJQpVvK9INPWip05+vHauM6gbhCPNu51Jue4J67AdosRJpbMl
	kwXwh9j0izJyORUb8BkJ6gQ5NPgHSPqQ5R7FlE9YolXFD4jbkPCCZB7ZFd/s6wvTeDUxRAc377428
	YDefd4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CqU-00CAiM-Hd; Wed, 30 Nov 2022 02:29:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CqQ-00CAeG-0a
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:29:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so603759pjb.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jstbFvyP0O4grgHUTkEUa75qdwH13vOZyONOc8qvqao=;
        b=hKcG49akw6nka55UlYwOv0vcGgWdTQyqAR6S8QHFnIJWU/gFb1rFbnwJ7xEQdMAlfd
         iC3s0AWpCxM9TxTl/0Y/pR/DG9j3WagJUMrfahBSalvDg/VRP7SLSqw5/4X8j7ygjGtv
         a6lsifCfCFFrTRIUNRaCBINOdiUdCL1hVhV9G0xM9b8MBu0+us+hwujK+bpSDYWdxJId
         z0id5Bkkhww8I2xaOhIuHbaNk96bxP1i9cV6Fpk7J+X99sqc64lxOi6HVT265BL9m5d6
         nSjEN2amHSgzA/DKC5vR2q0BPpvplEuoHPDa2lJ5pLqefvxXBckGdjoE7K0ZuhET2GH4
         qUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jstbFvyP0O4grgHUTkEUa75qdwH13vOZyONOc8qvqao=;
        b=UjHXHsC7aVAPW2y5Jp95dfPwWPYY8LDmUvfteX2wVPh6dYXFOuTELAE/uPzXlT7L3M
         s+jup9A64S/L+/GdMWsP6hLFLzHEz7MbBuya6bkGPIJrHaOoBcqUPu1eI49/R+A/vk7a
         nhd7SY9DcY6F9TpOp4gaBSZZamCa7XfLJXCPDV3Yw39StXvnFBTCCAZDsGqAmaGD4cyY
         Wc/6xEUxQQqm8r/AFLLDyW6az8HXUZ3LfKWkGuKU6FAT8MKnFC98xCwg5ffpSfhtDKys
         FpltRyUWQNaxBMB6DtMS/h0g6hc6MPaK09XTED8LATmdKRUwSZDgm+PnAJ9m452qsghH
         qcRA==
X-Gm-Message-State: ANoB5pkLH9cNyWMtUjogGsr5PRmgiZJs7gEHB5GMdZWlmyKBFAA6jzTM
	5N9BgEIKvoKhIgKpDCFpmEOo8A==
X-Google-Smtp-Source: AA0mqf4XPEiBxmnuTMRctdKMPwIbDXdSlCROEvR/n5LezQOPoE+xwiQsNMFtY1PKCH+GYrMB6DNzLw==
X-Received: by 2002:a17:90b:1282:b0:214:1804:d96b with SMTP id fw2-20020a17090b128200b002141804d96bmr61403150pjb.90.1669775344112;
        Tue, 29 Nov 2022 18:29:04 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id lj14-20020a17090b344e00b002139459e121sm2005940pjb.27.2022.11.29.18.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 18:29:03 -0800 (PST)
Date: Tue, 29 Nov 2022 18:29:03 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 18:28:36 PST (-0800)
Subject: Re: [PATCH v3] riscv: fix race when vmap stack overflow
In-Reply-To: <Y347B0x4VUNOd6V7@xhacker>
CC: guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-868b7b97-c3b9-4c1a-aaed-2fba5b0550ec@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_182906_306237_3E3CD542 
X-CRM114-Status: GOOD (  30.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Nov 2022 07:23:51 PST (-0800), jszhang@kernel.org wrote:
> On Sun, Oct 30, 2022 at 09:23:51PM +0800, Guo Ren wrote:
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>>
>
> Gentle ping? This patch is still missing in mainline.

Sorry, this one took a few looks to figure out.  I just sent out a v4, 
it's pretty much the same thing but by the time I'd figured out what 
this was doing it seemed easier to just write up the comments directly.

https://lore.kernel.org/r/20221130022442.18358-1-palmer@rivosinc.com/

I'll try and watch the threads, LMK if I screwed anything up.  I've 
already got this queued up in staging so it's being tested, should be 
fast to take it onto fixes.

Thanks!

>
>> On Sun, Oct 30, 2022 at 8:54 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>> >
>> > Currently, when detecting vmap stack overflow, riscv firstly switches
>> > to the so called shadow stack, then use this shadow stack to call the
>> > get_overflow_stack() to get the overflow stack. However, there's
>> > a race here if two or more harts use the same shadow stack at the same
>> > time.
>> >
>> > To solve this race, we introduce spin_shadow_stack atomic var, which
>> > will be swap between its own address and 0 in atomic way, when the
>> > var is set, it means the shadow_stack is being used; when the var
>> > is cleared, it means the shadow_stack isn't being used.
>> >
>> > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > Suggested-by: Guo Ren <guoren@kernel.org>
>> > ---
>> > Since v2:
>> >  - use REG_AMOSWAP
>> >  - add comment to the purpose of smp_store_release()
>> >
>> > Since v1:
>> >  - use smp_store_release directly
>> >  - use unsigned int instead of atomic_t
>> >
>> >
>> >  arch/riscv/include/asm/asm.h | 1 +
>> >  arch/riscv/kernel/entry.S    | 4 ++++
>> >  arch/riscv/kernel/traps.c    | 9 +++++++++
>> >  3 files changed, 14 insertions(+)
>> >
>> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> > index 1b471ff73178..acf563072b8b 100644
>> > --- a/arch/riscv/include/asm/asm.h
>> > +++ b/arch/riscv/include/asm/asm.h
>> > @@ -23,6 +23,7 @@
>> >  #define REG_L          __REG_SEL(ld, lw)
>> >  #define REG_S          __REG_SEL(sd, sw)
>> >  #define REG_SC         __REG_SEL(sc.d, sc.w)
>> > +#define REG_AMOSWAP    __REG_SEL(amoswap.d, amoswap.w)
>> >  #define REG_ASM                __REG_SEL(.dword, .word)
>> >  #define SZREG          __REG_SEL(8, 4)
>> >  #define LGREG          __REG_SEL(3, 2)
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index b9eda3fcbd6d..ea6b78dac739 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
>> >
>> >  #ifdef CONFIG_VMAP_STACK
>> >  handle_kernel_stack_overflow:
>> > +1:     la sp, spin_shadow_stack
>> > +       REG_AMOSWAP sp, sp, (sp)
>> > +       bnez sp, 1b
>> > +
>> >         la sp, shadow_stack
>> >         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>> >
>> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> > index f3e96d60a2ff..dea47f329708 100644
>> > --- a/arch/riscv/kernel/traps.c
>> > +++ b/arch/riscv/kernel/traps.c
>> > @@ -221,11 +221,20 @@ asmlinkage unsigned long get_overflow_stack(void)
>> >                 OVERFLOW_STACK_SIZE;
>> >  }
>> >
>> > +unsigned long spin_shadow_stack;
>> > +
>> >  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>> >  {
>> >         unsigned long tsk_stk = (unsigned long)current->stack;
>> >         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>> >
>> > +       /*
>> > +        * to ensure spin flag is set after the sp is used in entry.S:
>> > +        * //load per-cpu overflow stack.
>> > +        * REG_L sp, -8(sp)
>> > +        */
>> > +       smp_store_release(&spin_shadow_stack, 0);
>> > +
>> >         console_verbose();
>> >
>> >         pr_emerg("Insufficient stack space to handle exception!\n");
>> > --
>> > 2.37.2
>> >
>>
>>
>> --
>> Best Regards
>>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

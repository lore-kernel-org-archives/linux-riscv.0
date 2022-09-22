Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D71C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 01:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTzbrkbTNy075ZATpolwVRyCz9bXBH9BxKRD7hlHmsc=; b=SJ4Tlki1YBy5e6
	1VjBmLFT1jR0DzJrlrOmH5eyckLvY2KvXsqoyTJBQvk45UNiiNbnvYuEm3/xFXKw3Ftc3Z5t7zJVm
	z8hw73OZYxR3qJ3flTgJvxvapafg/pE5LEQysgGZluN0m+1fcQT8+0FsI6KKzaBNJf/V8aWLmvYge
	TwtT8814gOMjt/+7OdIoCQHQaLY0buj8V47TSB6lxe/R0qU0oCv7/2syXUo0kaQ4XmC/kydyoOffk
	Jbv4zE9zhpHyfbT2w/k5oWekOSp8RlWfntIGBVA9gK/2ErTodYMbL7PdxpraFpB7W9Lk2wfi1oIwJ
	JpsaeI9luX/jsRNnmDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obAzP-00D4OC-1G; Thu, 22 Sep 2022 01:26:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obAzN-00D4Nb-5i
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 01:26:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1FF162C8E
	for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 01:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C68BC43143
	for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 01:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663810010;
	bh=6OvF45eCl5d2FjxziCWsCcjLdCsAYOFNQse2WIemCjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iDuwNAKIcR9nkcBbRDkDpjI9/guVnVBkMqVocMaBR6eZPP4O3tNIzJGYFoqk5qlOB
	 T7kXk17eMshImBvw91L9+uk7kj+rNqzlZFAafvDz0lPgAJxI4PnvyGAkCr0U1+kI7X
	 cMSNdQW1QOfQoi81TM2o/9/OK4IIbE1Ge3emToO0KwC3emoXcOdU81e9r7eoA+sqvd
	 eJ7Illgs4SWf91dAn02emRLgcn9kI65JxSIjGn91YIKLJyxlrVkJEJ3SWPCOF+l/hU
	 ySvsvLratHV3Q1BSq4xUvhUsPmRse/JUXGP+Au6rWsbk9hZbvuuBiMos6y4xkNsupp
	 HXjiJUbqr3Q2g==
Received: by mail-ot1-f49.google.com with SMTP id j17-20020a9d7f11000000b0065a20212349so5206521otq.12
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 18:26:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf0Ex76CrY5UoRJoZSfXvMLvynS47/emzi+k9ZIsjEPfvwzX/pol
	R6wekhWJuIF5W6rGe4iedpW/L3xyj3DSODuF4MQ=
X-Google-Smtp-Source: AMsMyM7sUE7ECUkudO8TSiHPeKKpJfG4rB1Npzrr8yg2CelDFVDUFYydQ/U0cLV7L/t1G7ZtbXSsham+YdjuDi0Aqx0=
X-Received: by 2002:a05:6830:1213:b0:65a:9a2:daf3 with SMTP id
 r19-20020a056830121300b0065a09a2daf3mr483252otp.308.1663810009513; Wed, 21
 Sep 2022 18:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-9-guoren@kernel.org>
 <afa17bdd-2d11-4015-6e2a-7a39db931d09@huawei.com> <CAJF2gTRMt4zDQcvBOxge-4+6o1mqhWds_AiFKamdCzKJZfoKPw@mail.gmail.com>
 <df9590bc-1a61-28c0-55eb-9f9539d03144@huawei.com>
In-Reply-To: <df9590bc-1a61-28c0-55eb-9f9539d03144@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Sep 2022 09:26:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSZmqW-KnL5oFrCMsf+FSyqn=W6GCtPs6983e26it8Qug@mail.gmail.com>
Message-ID: <CAJF2gTSZmqW-KnL5oFrCMsf+FSyqn=W6GCtPs6983e26it8Qug@mail.gmail.com>
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_182653_310217_A736AB78 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Sep 21, 2022 at 7:56 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>
> Hi,
>
> Sorry to bother again, I just finished the test with your patches on
> mine patch set.
>
> On 2022/9/21 17:53, Guo Ren wrote:
> > On Wed, Sep 21, 2022 at 4:34 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
> >> Hi,
> >>
> >> On 2022/9/18 23:52, guoren@kernel.org wrote:
> >>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> >>> index 5f49517cd3a2..426529b84db0 100644
> >>> --- a/arch/riscv/kernel/entry.S
> >>> +++ b/arch/riscv/kernel/entry.S
> >>> @@ -332,6 +332,33 @@ ENTRY(ret_from_kernel_thread)
> >>>        tail syscall_exit_to_user_mode
> >>>    ENDPROC(ret_from_kernel_thread)
> >>>
> >>> +#ifdef CONFIG_IRQ_STACKS
> >>> +ENTRY(call_on_stack)
> >>> +     /* Create a frame record to save our ra and fp */
> >>> +     addi    sp, sp, -RISCV_SZPTR
> >>> +     REG_S   ra, (sp)
> >>> +     addi    sp, sp, -RISCV_SZPTR
> >>> +     REG_S   fp, (sp)
> >>> +
> >>> +     /* Save sp in fp */
> >>> +     move    fp, sp
> >>> +
>
> Considering that s0 points to previous sp normally, I think here we
> should have 'addi fp, sp, 2*RISCV_SZPTR'.
>
> An example below:
>
>      addi    sp, sp, -16
>      sd  ra, 8(sp)
>      sd  s0, 0(sp)
>      addi    s0, sp, 16    <- s0 is set to previous sp
>      ...
>
>      ld  ra,8(sp)
>      ld  s0,0(sp)
>      addi    sp,sp,16
>
> So maybe it's better to save the stack frame as below:
>
>      addi    sp, sp, -2*RISCV_SZPTR
>      REG_S   ra, RISCV_SZPTR(sp)
>      REG_S   s0, (sp)
>
>      /* Save sp in fp */
>      addi    s0, sp, 2*RISCV_SZPTR
>
>      ...
>
>      /*
>       * Restore sp from prev fp, and fp, ra from the frame
>       */
>      addi    sp, s0, -2*RISCV_SZPTR
>      REG_L   ra, RISCV_SZPTR(sp)
>      REG_L   s0, (sp)
>      addi    sp, sp, 2*RISCV_SZPTR
>
>
> Anyway, lets set fp as sp + 2 * RISCV_SZPTR, so that unwinder can
> connect two stacks same as normal function.
>
> I tested this with my patch and the unwinder works properly.
Thx, you got it. My patch broke the fp chain. I would fix it in the
next version.

>
>
> Thanks for your time!
>
> Best,
>
> Chen
>
> >>> +     /* Move to the new stack and call the function there */
> >>> +     li      a3, IRQ_STACK_SIZE
> >>> +     add     sp, a1, a3
> >>> +     jalr    a2
> >>> +
> >>> +     /*
> >>> +      * Restore sp from prev fp, and fp, ra from the frame
> >>> +      */
> >>> +     move    sp, fp
> >>> +     REG_L   fp, (sp)
> >>> +     addi    sp, sp, RISCV_SZPTR
> >>> +     REG_L   ra, (sp)
> >>> +     addi    sp, sp, RISCV_SZPTR
> >>> +     ret
> >>> +ENDPROC(call_on_stack)
> >>> +#endif
> >> Seems my compiler (riscv64-linux-gnu-gcc 8.4.0, cross compiling from
> >> x86) cannot recognize the register `fp`.
> > The whole entry.S uses s0 instead of fp, so I approve of your advice. Thx.
> >
> >> After I changed it to `s0` this can pass compiling.
> >>
> >>
> >> Seems there is nowhere else using `fp`, can this just using `s0` instead?
> >>
> >> Best,
> >>
> >> Chen
> >>
> >>



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

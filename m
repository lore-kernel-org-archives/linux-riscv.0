Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892D1C5519F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 03:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE41322370
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 03:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csh/fUQj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vB7zggMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE41322370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BULMe8TNCANu8bhG1rwNNOzdRG1NFWOPPUrSgTLU9RY=; b=csh/fUQj0UOFZPhjDuH3yCIcr
	QhMiTG2V8GhBglZxM4G4PAci169QprqUlXkLu1jln3/68jgtJG+37qh03KDJJ5mWfLbpAdD8NVYAS
	YufBM1NXmA3qzHH0lZ2qVNR8V9F7RlXaM9Hv+DBKsh7kzAL9s5xmT6LwpCQSU3pGVG3st16upuwb1
	iNHUiUxWVxUWiRP4IEP9UAgAt2/b46P1FhHUBAA8mC7N1d/4o1dBeict/OuHd8c+OsKpRKjf8bRCz
	304lD3gTbcAWPbYAvlpELgFDg+fCDoaF4i905H9VyMs48w6oPrZEDqYQow1pgBd20xPwyPgsZTei+
	9okBVy7Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke8Mo-0006IC-Lk; Sun, 15 Nov 2020 03:06:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke8Mk-0006Hh-UG
 for linux-riscv@lists.infradead.org; Sun, 15 Nov 2020 03:06:13 +0000
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A91EB2417A
 for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2020 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605409566;
 bh=PcClpXu3KiOwaaUagTIiQI2iPEfsvKH5yU8G9nBQ3EA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vB7zggMFq2DHn8xvFqn4EjCMyTHILpnMqGUS//DNHMbF0AEupaISKIQBFDwoCrUlZ
 GO3SLR1mKnRE+K+XpRdGlOoU2E0nQ8UEnHN7+cNqo0MHEI58lgRTinIiWOiJxTy2+5
 1uFy4RebSMEbJVRUcVGycxPuQWqAmllWEQGHzy3c=
Received: by mail-lf1-f47.google.com with SMTP id u18so19783845lfd.9
 for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2020 19:06:05 -0800 (PST)
X-Gm-Message-State: AOAM530HndiUps3dmBwUjmFgTCVaB7YPVrz3FNlnHrWShNZm9z2dvGCX
 Ar7bApdDZa+RSp8rW/mhN3xDfA5DCasFrNI5Y0c=
X-Google-Smtp-Source: ABdhPJy7AM5rppSQoupCrOrC1VAmGG/BLptOkWdz7cLxMYo/htpzH163GWy1eTrOW3pvsQD8GpjaBPiPEPgy5+sCWvA=
X-Received: by 2002:a19:fc0f:: with SMTP id a15mr3152753lfi.248.1605409563974; 
 Sat, 14 Nov 2020 19:06:03 -0800 (PST)
MIME-Version: 1.0
References: <1603024697-30080-1-git-send-email-guoren@kernel.org>
 <202011131457.63270B286@keescook>
In-Reply-To: <202011131457.63270B286@keescook>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 15 Nov 2020 11:05:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT6j3YQJBy6C4Rz-wfYd7r7FkWLV+q1G7NHzBzUQ6iVqw@mail.gmail.com>
Message-ID: <CAJF2gTT6j3YQJBy6C4Rz-wfYd7r7FkWLV+q1G7NHzBzUQ6iVqw@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Enable per-task stack canaries
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_220611_191161_5BB1F033 
X-CRM114-Status: GOOD (  27.01  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 cooper.qu@linux.alibaba.com, Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Could you help move the patch into your next-tree with Kees' review added?

On Sat, Nov 14, 2020 at 6:57 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Oct 18, 2020 at 12:38:17PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This enables the use of per-task stack canary values if GCC has
> > support for emitting the stack canary reference relative to the
> > value of tp, which holds the task struct pointer in the riscv
> > kernel.
> >
> > After compare arm64 and x86 implementations, seems arm64's is more
> > flexible and readable. The key point is how gcc get the offset of
> > stack_canary from gs/el0_sp.
> >
> > x86: Use a fix offset from gs, not flexible.
> >
> > struct fixed_percpu_data {
> >       /*
> >        * GCC hardcodes the stack canary as %gs:40.  Since the
> >        * irq_stack is the object at %gs:0, we reserve the bottom
> >        * 48 bytes of the irq stack for the canary.
> >        */
> >       char            gs_base[40]; // :(
> >       unsigned long   stack_canary;
> > };
> >
> > arm64: Use -mstack-protector-guard-offset & guard-reg
> >       gcc options:
> >       -mstack-protector-guard=sysreg
> >       -mstack-protector-guard-reg=sp_el0
> >       -mstack-protector-guard-offset=xxx
> >
> > riscv: Use -mstack-protector-guard-offset & guard-reg
> >       gcc options:
> >       -mstack-protector-guard=tls
> >       -mstack-protector-guard-reg=tp
> >       -mstack-protector-guard-offset=xxx
> >
> >  GCC's implementation has been merged:
> >  commit c931e8d5a96463427040b0d11f9c4352ac22b2b0
> >  Author: Cooper Qu <cooper.qu@linux.alibaba.com>
> >  Date:   Mon Jul 13 16:15:08 2020 +0800
> >
> >      RISC-V: Add support for TLS stack protector canary access
> >
> > In the end, these codes are inserted by gcc before return:
> >
> > *  0xffffffe00020b396 <+120>:   ld      a5,1008(tp) # 0x3f0
> > *  0xffffffe00020b39a <+124>:   xor     a5,a5,a4
> > *  0xffffffe00020b39c <+126>:   mv      a0,s5
> > *  0xffffffe00020b39e <+128>:   bnez    a5,0xffffffe00020b61c <_do_fork+766>
> >    0xffffffe00020b3a2 <+132>:   ld      ra,136(sp)
> >    0xffffffe00020b3a4 <+134>:   ld      s0,128(sp)
> >    0xffffffe00020b3a6 <+136>:   ld      s1,120(sp)
> >    0xffffffe00020b3a8 <+138>:   ld      s2,112(sp)
> >    0xffffffe00020b3aa <+140>:   ld      s3,104(sp)
> >    0xffffffe00020b3ac <+142>:   ld      s4,96(sp)
> >    0xffffffe00020b3ae <+144>:   ld      s5,88(sp)
> >    0xffffffe00020b3b0 <+146>:   ld      s6,80(sp)
> >    0xffffffe00020b3b2 <+148>:   ld      s7,72(sp)
> >    0xffffffe00020b3b4 <+150>:   addi    sp,sp,144
> >    0xffffffe00020b3b6 <+152>:   ret
> >    ...
> > *  0xffffffe00020b61c <+766>:   auipc   ra,0x7f8
> > *  0xffffffe00020b620 <+770>:   jalr    -1764(ra) # 0xffffffe000a02f38 <__stack_chk_fail>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>
> Thanks for getting this working! It looks good to me. :)
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

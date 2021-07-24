Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3938FC4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991B560E96
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 991B560E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pMSZ+tt5hG+l8CFAat8RugcB8T2dnXicZjqnrK4gu+g=; b=F+57T9fhiCOk/fG4/FjVei8vmq
	bIEif9e5Mqo0E2rAFHjPryDDorNqAu+s2CzbV8N0+7Jy063zcXbJcnCbUFdr19BmCf9n1b1IhKP6q
	dwl3WKmbtZJO6D9u7IKqUryen4QLZxbGsSD3oDfJpfhhFRUoJdGAV2ki2AebTwarBfZjn/q5914fn
	4fPlSMkZBL5P4KLLZX4zlEKuA+BLcPLMEvo4vIJuU28QcQ97mlZWxXFFlVFHTczMG3LvV86lrNlfo
	Aw4xRhosuKaZlNPtki/kQYDk3vewhZ5BcZYK3pxWtKeQGYi2ek/5e9qyzwNvEUR6GPe2ynSc2Ahjd
	iLJwB2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7O3s-007nBC-G8; Sat, 24 Jul 2021 20:15:52 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7O3p-007nAg-Co
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 20:15:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so13995816pjz.3
 for <linux-riscv@lists.infradead.org>; Sat, 24 Jul 2021 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3Wkjn9nso1W/KTsxLqXCUmzoKEFbGrrpBrz7B52jel4=;
 b=1gBx+uCWBCHfyYT32bRgkmp/EqImyb8FvhKWIziXp372ojXlAYA3uCNqC6aPOIEBXP
 YhlyO3AqRqN5Y0kzEK9/xX7qV74jlbAyqMhJ5FM5GOYTvC9FvwJKGdF6+nRxojUgfC3F
 31LothA5rZXgW5Aio7wITYUfByBAacOC+cZ2kThP18lx/xgF5zwX8bOAemdOYSVMCCTZ
 NGIdiu9wu+REZTQH1fTA66jedK3Uf36dIL28U4QLRcuT1+tcsEK8JbEqwlHWNlzjfWBk
 nZvn4WnROSoYbmjD6ZDOEydXp28sIOQnIK2Mdeiu/VuY214tIEjZ5qvvCaBVL8b1J3vT
 Q4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3Wkjn9nso1W/KTsxLqXCUmzoKEFbGrrpBrz7B52jel4=;
 b=Vt2fopLDRN4N4e092iwLMtrXkssy2hPI77Xy/PYSIr5eflxETZiwBNeuPQnjvBTgNz
 6CgEIYrPYtrn2yLQ+SvtrgGYHzG2M4zErgfWEun1HmKrl9SflTJ4CU1R6ojSeKWIECLJ
 nO3YDZWBXe+vfsBF4hhK0Luj1QIfMNaSLSBzAPEBFvSE6pshqHHM4kyYI+qDmFHt2A0v
 zWUSnCrJTU/q+9oFNRuVBboh1sQ+PVcC3F+EPl4atYvSYD+KxHnJgWTq2QR5vgerMHIN
 jA74tnPo4O8ICs2U+hs6bXuaIteIBj0LafAD4IZ4C1RkUYjJHZHfuqXGAODx0ep5FhZD
 R4XA==
X-Gm-Message-State: AOAM530hhOscv2GOhu8FEPlPpP0GYKr7CfpQDzFzGULlZ+82MHeSXesu
 CFG4V/W5VvDwYWRL3iHhFVztNPgEGzpXSQ==
X-Google-Smtp-Source: ABdhPJxIxHvQAA35PCLoV+U+RF06Ya/LR6ptdba8rkAJezxG+aGqiQVZ/Ik1ZuTDAYw338ivWprAtQ==
X-Received: by 2002:a17:90a:550a:: with SMTP id
 b10mr19299180pji.103.1627157747428; 
 Sat, 24 Jul 2021 13:15:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b1sm9220211pjn.11.2021.07.24.13.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:15:46 -0700 (PDT)
Date: Sat, 24 Jul 2021 13:15:46 -0700 (PDT)
X-Google-Original-Date: Sat, 24 Jul 2021 13:15:43 PDT (-0700)
Subject: Re: [PATCH RESEND] riscv: stacktrace: Fix NULL pointer dereference
In-Reply-To: <20210725000258.1ca59266@xhacker>
CC: atishp@atishpatra.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-1f8957c6-164a-46c6-b0a2-d8ae52b3cb8c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_131549_616594_77FC66D2 
X-CRM114-Status: GOOD (  27.95  )
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

On Sat, 24 Jul 2021 09:02:58 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> Hi @Palmer,
>
> On Fri, 16 Jul 2021 07:07:24 -0700
> Atish Patra <atishp@atishpatra.org> wrote:
>
>> On Fri, Jul 16, 2021 at 6:47 AM Jisheng Zhang wrote:
>> >
>> > From: Jisheng Zhang <jszhang@kernel.org>
>> >
>> > When CONFIG_FRAME_POINTER=y, calling dump_stack() can always trigger
>> > NULL pointer dereference panic similar as below:
>> >
>> > [    0.396060] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
>> > [    0.396692] Hardware name: riscv-virtio,qemu (DT)
>> > [    0.397176] Call Trace:
>> > [    0.398191] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000960
>> > [    0.399487] Oops [#1]
>> > [    0.399739] Modules linked in:
>> > [    0.400135] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
>> > [    0.400570] Hardware name: riscv-virtio,qemu (DT)
>> > [    0.400926] epc : walk_stackframe+0xc4/0xdc
>> > [    0.401291]  ra : dump_backtrace+0x30/0x38
>> > [    0.401630] epc : ffffffff80004922 ra : ffffffff8000496a sp : ffffffe000f3bd00
>> > [    0.402115]  gp : ffffffff80cfdcb8 tp : ffffffe000f30000 t0 : ffffffff80d0b0cf
>> > [    0.402602]  t1 : ffffffff80d0b0c0 t2 : 0000000000000000 s0 : ffffffe000f3bd60
>> > [    0.403071]  s1 : ffffffff808bc2e8 a0 : 0000000000001000 a1 : 0000000000000000
>> > [    0.403448]  a2 : ffffffff803d7088 a3 : ffffffff808bc2e8 a4 : 6131725dbc24d400
>> > [    0.403820]  a5 : 0000000000001000 a6 : 0000000000000002 a7 : ffffffffffffffff
>> > [    0.404226]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
>> > [    0.404634]  s5 : ffffffff803d7088 s6 : ffffffff808bc2e8 s7 : ffffffff80630650
>> > [    0.405085]  s8 : ffffffff80912a80 s9 : 0000000000000008 s10: ffffffff804000fc
>> > [    0.405388]  s11: 0000000000000000 t3 : 0000000000000043 t4 : ffffffffffffffff
>> > [    0.405616]  t5 : 000000000000003d t6 : ffffffe000f3baa8
>> > [    0.405793] status: 0000000000000100 badaddr: 0000000000000960 cause: 000000000000000d
>> > [    0.406135] [<ffffffff80004922>] walk_stackframe+0xc4/0xdc
>> > [    0.407032] [<ffffffff8000496a>] dump_backtrace+0x30/0x38
>> > [    0.407797] [<ffffffff803d7100>] show_stack+0x40/0x4c
>> > [    0.408234] [<ffffffff803d9e5c>] dump_stack+0x90/0xb6
>> > [    0.409019] [<ffffffff8040423e>] ptdump_init+0x20/0xc4
>> > [    0.409681] [<ffffffff800015b6>] do_one_initcall+0x4c/0x226
>> > [    0.410110] [<ffffffff80401094>] kernel_init_freeable+0x1f4/0x258
>> > [    0.410562] [<ffffffff803dba88>] kernel_init+0x22/0x148
>> > [    0.410959] [<ffffffff800029e2>] ret_from_exception+0x0/0x14
>> > [    0.412241] ---[ end trace b2ab92c901b96251 ]---
>> > [    0.413099] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> >
>> > The reason is the task is NULL when we finally call walk_stackframe()
>> > the NULL is passed from __dump_stack():
>> >
>> > |static void __dump_stack(void)
>> > |{
>> > |        dump_stack_print_info(KERN_DEFAULT);
>> > |        show_stack(NULL, NULL, KERN_DEFAULT);
>> > |}
>> >
>> > Fix this issue by checking "task == NULL" case in walk_stackframe().
>> >
>> > Fixes: eac2f3059e02 ("riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled"
>
> Missed a ")" at the end here, do you want a resend?
>
> PS: This patch is missed for twice.

Sorry about that.   I remember having seen this, so I'm not sure what 
happened.  It's on fixes now, but I'm just sending up a PR so this will 
go up in the next one.

>
> Thanks
>
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > ---
>> >  arch/riscv/kernel/stacktrace.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> > index bde85fc53357..7bc8af75933a 100644
>> > --- a/arch/riscv/kernel/stacktrace.c
>> > +++ b/arch/riscv/kernel/stacktrace.c
>> > @@ -27,7 +27,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>> >                 fp = frame_pointer(regs);
>> >                 sp = user_stack_pointer(regs);
>> >                 pc = instruction_pointer(regs);
>> > -       } else if (task == current) {
>> > +       } else if (task == NULL || task == current) {
>> >                 fp = (unsigned long)__builtin_frame_address(1);
>> >                 sp = (unsigned long)__builtin_frame_address(0);
>> >                 pc = (unsigned long)__builtin_return_address(0);
>> > --
>> > 2.32.0
>> >
>> >
>> >
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>>
>> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

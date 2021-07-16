Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98259C07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 14:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1793A613E8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 14:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1793A613E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yb/XhPri/UAK5Oe9xIDL40KPFZ/tGmi1f3cxvQqbWAg=; b=JQW1OQO6ZnIoSU
	Y79Wy1mNNeL2saPAYVVjYKJh7CnE4Y97hIsvucoVBGQw4DBUZlbO5uD+ObQklsEQP4kOZRsGK7ks/
	dUDOIe/uCFjmLn4qQkP03+ybYLcIABQ91IEz8xSg5uPl0hiCbwCG6lviCNa296cS2/xL0hfR3OyZp
	jsjoszSCd0xdkLpeNiu6RQxyEXIbaw4B0QjCKU7t+QfeIpwjuhGXWB34g7FwzcIBKQjKSCWHwYbje
	hTHWZZ67wchmsNj0iGwQoEwKWJow051YpkYeYHMtVVtruCY/DA9NMzbfDmgFWJszoVTCVeTiVDet3
	UEud4eFLVSAQ1RCdAK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4OVA-004Z9I-7j; Fri, 16 Jul 2021 14:07:40 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4OV6-004Z8Z-OZ
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 14:07:38 +0000
Received: by mail-yb1-xb31.google.com with SMTP id r135so15096203ybc.0
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TYUWmzUdnH0JTnpBiamPfJOy6/HDT0BS9cFs7kQWpY8=;
 b=IQkSEg7b5XVCdSeUTpBebnEB+YTZzsH18t2/V+btuhlD0wB/UHUhXDNIiFVTreZNOH
 mONCOjW17XcCClTm1EJ1BGf+cWpNLg2D/9ud6eQJRSEmcndLWPylBBY11yx77lktaHHD
 DvzN0UjpR7/SWUw1cgsHNQv/dBhnqqMJd3VP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYUWmzUdnH0JTnpBiamPfJOy6/HDT0BS9cFs7kQWpY8=;
 b=h9U3QvxJ8N07W1ng5C+KO3v390FnPFZQJ8oiT/RA1XVW0i9H9BJEYCqOE2R4gsUlqU
 5EIK8CBNpl2DLi5DCiVOBtrPL1B0b7mAc7Y5Wku2nztRIm55KQ6McgHnd6bSdXUtg33B
 yWiFYiI2xlQztixymEwUM99Q2lI8Tn6190mJfWhYPSkGoS/m5Ulw8HkprR4m/uQ7izIY
 faoANKakjWzQHPICc4o9Fm0/dLUV5B6DuSvylrsSgDnykGu9HobzCISHjGy52p+YmjzC
 6HLBnc1k5DnBY/52eet6Tyh5TdFNHyQN+wP6vj6EWVu58BObPGB2khi0VJ0rzO6bRSLz
 SybA==
X-Gm-Message-State: AOAM53130lDmLrNFtspywmbXt+JK3LlOEhiaL914C8FJl6qeBAi553TD
 R2iAi/opZn/i0f/57MSweZEwJGDNdp3kL1/EL3Dj
X-Google-Smtp-Source: ABdhPJwuAu1PTuenOaymRy+9OSWKibsKVPubfbRZQaznJgEdRGjw1LGpHp+VWZYFwdyuwRx9EummxeFhi9X1xYl8NCU=
X-Received: by 2002:a05:6902:1507:: with SMTP id
 q7mr13636520ybu.326.1626444454843; 
 Fri, 16 Jul 2021 07:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210716214051.32eea3a8@xhacker>
In-Reply-To: <20210716214051.32eea3a8@xhacker>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Jul 2021 07:07:24 -0700
Message-ID: <CAOnJCU+h9uwBP57Nhh2tX9boOeQ9eV-_jjY0zSzUqhmi2Ptd2A@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv: stacktrace: Fix NULL pointer dereference
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_070736_921495_25B0B6A0 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, Jul 16, 2021 at 6:47 AM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> When CONFIG_FRAME_POINTER=y, calling dump_stack() can always trigger
> NULL pointer dereference panic similar as below:
>
> [    0.396060] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> [    0.396692] Hardware name: riscv-virtio,qemu (DT)
> [    0.397176] Call Trace:
> [    0.398191] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000960
> [    0.399487] Oops [#1]
> [    0.399739] Modules linked in:
> [    0.400135] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> [    0.400570] Hardware name: riscv-virtio,qemu (DT)
> [    0.400926] epc : walk_stackframe+0xc4/0xdc
> [    0.401291]  ra : dump_backtrace+0x30/0x38
> [    0.401630] epc : ffffffff80004922 ra : ffffffff8000496a sp : ffffffe000f3bd00
> [    0.402115]  gp : ffffffff80cfdcb8 tp : ffffffe000f30000 t0 : ffffffff80d0b0cf
> [    0.402602]  t1 : ffffffff80d0b0c0 t2 : 0000000000000000 s0 : ffffffe000f3bd60
> [    0.403071]  s1 : ffffffff808bc2e8 a0 : 0000000000001000 a1 : 0000000000000000
> [    0.403448]  a2 : ffffffff803d7088 a3 : ffffffff808bc2e8 a4 : 6131725dbc24d400
> [    0.403820]  a5 : 0000000000001000 a6 : 0000000000000002 a7 : ffffffffffffffff
> [    0.404226]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> [    0.404634]  s5 : ffffffff803d7088 s6 : ffffffff808bc2e8 s7 : ffffffff80630650
> [    0.405085]  s8 : ffffffff80912a80 s9 : 0000000000000008 s10: ffffffff804000fc
> [    0.405388]  s11: 0000000000000000 t3 : 0000000000000043 t4 : ffffffffffffffff
> [    0.405616]  t5 : 000000000000003d t6 : ffffffe000f3baa8
> [    0.405793] status: 0000000000000100 badaddr: 0000000000000960 cause: 000000000000000d
> [    0.406135] [<ffffffff80004922>] walk_stackframe+0xc4/0xdc
> [    0.407032] [<ffffffff8000496a>] dump_backtrace+0x30/0x38
> [    0.407797] [<ffffffff803d7100>] show_stack+0x40/0x4c
> [    0.408234] [<ffffffff803d9e5c>] dump_stack+0x90/0xb6
> [    0.409019] [<ffffffff8040423e>] ptdump_init+0x20/0xc4
> [    0.409681] [<ffffffff800015b6>] do_one_initcall+0x4c/0x226
> [    0.410110] [<ffffffff80401094>] kernel_init_freeable+0x1f4/0x258
> [    0.410562] [<ffffffff803dba88>] kernel_init+0x22/0x148
> [    0.410959] [<ffffffff800029e2>] ret_from_exception+0x0/0x14
> [    0.412241] ---[ end trace b2ab92c901b96251 ]---
> [    0.413099] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> The reason is the task is NULL when we finally call walk_stackframe()
> the NULL is passed from __dump_stack():
>
> |static void __dump_stack(void)
> |{
> |        dump_stack_print_info(KERN_DEFAULT);
> |        show_stack(NULL, NULL, KERN_DEFAULT);
> |}
>
> Fix this issue by checking "task == NULL" case in walk_stackframe().
>
> Fixes: eac2f3059e02 ("riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled"
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/stacktrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index bde85fc53357..7bc8af75933a 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -27,7 +27,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>                 fp = frame_pointer(regs);
>                 sp = user_stack_pointer(regs);
>                 pc = instruction_pointer(regs);
> -       } else if (task == current) {
> +       } else if (task == NULL || task == current) {
>                 fp = (unsigned long)__builtin_frame_address(1);
>                 sp = (unsigned long)__builtin_frame_address(0);
>                 pc = (unsigned long)__builtin_return_address(0);
> --
> 2.32.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

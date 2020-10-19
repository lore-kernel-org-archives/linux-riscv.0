Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58FBC433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 11:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FCA21D6C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 11:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UL7sud39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7gapMM4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1FCA21D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ILJ6Se25Ecn3uXfIED1mqB3/bTkyBrrxI4sPF1qfCxM=; b=UL7sud39wtWUXBpoU2ymYXf0b
	8i1n+1cm5bRZgbZs3OXmUbIyVBtsWRqAUQZ7CL2T2v0JA5cNQz6rUlFCJwycD6+k46TfzwgVN7HUR
	H83dN8Nz1MM9srkmR2X5dkbt7AVVx4xQC1V1dc0oTgAvasZwxm4Col1Comf/bswxU7+UIUd2VsZr7
	Int8guH67T5Itpsi6jajOIHHyctBLjg/e3L6ymbnoU6IOhUCRS1iD673+TTvrn0tIlTw+81FUpZuI
	RvhnBa2sCF19WYu4IHgeX3+s/LFKrHS70SFPWFZ1s0k5zBVMIcS4AkCvq4p5q5OwOLmJXzRxaVzZp
	w71X3wdVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSxI-00032N-Sh; Mon, 19 Oct 2020 11:03:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSxG-00031z-Az
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 11:03:55 +0000
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D957622268
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603105433;
 bh=MlTuiCzjXhOWFPtC2Q6bTRqPFaq9rch3+wu+hpA35Yo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F7gapMM4qjLfXtYgi6Jnr406ROeCOVM9CBd4GrCnxCp9t77/JSC6debeN2d2XyeOz
 VoCGjuuht0BgyzpxRSxVRz1Es+FIbxFeOcfFVq9Thx4p+Pec/vMxs4K98hLjcLLhV+
 iENSy2Hk/g7u6X3OAvqvdYOGC9Yhst6qAJIEtC8E=
Received: by mail-lf1-f42.google.com with SMTP id a9so13628402lfc.7
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 04:03:52 -0700 (PDT)
X-Gm-Message-State: AOAM5339nUjQLzDmfQVd0vB8JIz+elnGMqLPq83AmSl9q6KMULcpSe48
 fnMkc50IHLMC5DZbeEBeSKvdJhMCtE6zw+YvILI=
X-Google-Smtp-Source: ABdhPJw0d1nxPIbToVnGvVAsP9vm1UcGMcrTbPUKvyvQGr/m4b0LyAF4U+iCNahfTqtCb2147KuTvKO15NoOHBefHsk=
X-Received: by 2002:a19:e305:: with SMTP id a5mr5277572lfh.549.1603105430990; 
 Mon, 19 Oct 2020 04:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
 <20201019173648.573d58c7fde864090bf0487a@kernel.org>
In-Reply-To: <20201019173648.573d58c7fde864090bf0487a@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 19 Oct 2020 19:03:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRWOg9CuiEMoG3=LwzW0_BV7Przg-dAuzdPpqXEdr8FYQ@mail.gmail.com>
Message-ID: <CAJF2gTRWOg9CuiEMoG3=LwzW0_BV7Przg-dAuzdPpqXEdr8FYQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_070354_557239_807212D3 
X-CRM114-Status: GOOD (  25.04  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-csky@vger.kernel.org,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Good Idea! I'll try :P

On Mon, Oct 19, 2020 at 4:36 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> On Sat, 17 Oct 2020 07:06:17 +0000
> guoren@kernel.org wrote:
>
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > It will cause warning messages:
> > echo function_graph > /sys/kernel/debug/tracing/current_tracer
> > [   47.691397] ------------[ cut here ]------------
> > [   47.692899] WARNING: CPU: 0 PID: 11 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x182/0x19a
> > [   47.694483] Modules linked in:
> > [   47.695754] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.9.0-11367-g1054335 #132
> > [   47.698228] epc: ffffffe000204530 ra : ffffffe00020452c sp : ffffffe0023ffc20 gp : ffffffe0013e1fe0 tp : ffffffe0023e4e00 t0 : 0000000000000000
> > [   47.701872]  t1 : 000000000000000e t2 : 000000000000001b s0 : ffffffe0023ffc70 s1 : ffffffe000206850 a0 : 0000000000000000 a1 : ffffffffffffffff
> > [   47.705550]  a2 : 0000000000000000 a3 : ffffffe03af7c5e8 a4 : 0000000000000000 a5 : 0000000000000000 a6 : 0000000000000000 a7 : 00000000150b02d8
> > [   47.709159]  s2 : 0000000000000008 s3 : 0000000000000858 s4 : ffffffe0023ffc98 s5 : 0000000000000850 s6 : 0000000000000003 s7 : 0000000000000002
> > [   47.714135]  s8 : 0000000000000004 s9 : 0000000000000001 s10: 0000000000000001 s11: 0000000000000003 t3 : ffffffffffffe000 t4 : 0000000000d86254
> > [   47.716574]  t5 : 0000000000000005 t6 : 0000000000040000status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> > [   47.720019] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.9.0-11367-g1054335 #132
> > [   47.722074] Call Trace:
> > [   47.722561] [<ffffffe000203c88>] walk_stackframe+0x0/0xc2
> > [   47.724608] [<ffffffe000b2020a>] show_stack+0x46/0x52
> > [   47.726246] [<ffffffe000b23c24>] dump_stack+0x90/0xb6
> > [   47.727672] [<ffffffe00020c9c4>] __warn+0x98/0xfa
> > [   47.729131] [<ffffffe0005f4be0>] report_bug+0xaa/0x11e
> > [   47.730624] [<ffffffe000203b74>] do_trap_break+0x96/0xfe
> > [   47.732448] [<ffffffe000201daa>] ret_from_exception+0x0/0x14
> > [   47.734341] [<ffffffe00020452c>] patch_insn_write+0x17e/0x19a
> > [   47.737235] irq event stamp: 39
> > [   47.738521] hardirqs last  enabled at (39): [<ffffffe000201d0a>] _save_context+0xa2/0xe6
> > [   47.741055] hardirqs last disabled at (38): [<ffffffe0002c2404>] multi_cpu_stop+0x130/0x166
> > [   47.743551] softirqs last  enabled at (0): [<ffffffe00020a4d2>] copy_process+0x430/0x1316
> > [   47.746031] softirqs last disabled at (0): [<0000000000000000>] 0x0
> > [   47.748617] ---[ end trace 88a1054faa6524ef ]---
> >
> > Because the path of stop_machine(__ftrace_modify_code)->
> > ftrace_modify_all_code->...->patch_insn_write has no pair of
> > lock&unlock text_mutex, so we shouldn't put assert here.
>
> Hm, are there any chance to get the text_mutex in that path?
> There are ftrace_arch_code_modify_prepare/post_process() in arch/riscv/kernel/ftrace.c,
> aren't those used?
>
> Thank you,
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  arch/riscv/kernel/patch.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > index 0b55287..2ee5063 100644
> > --- a/arch/riscv/kernel/patch.c
> > +++ b/arch/riscv/kernel/patch.c
> > @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
> >       bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> >       int ret;
> >
> > -     /*
> > -      * Before reaching here, it was expected to lock the text_mutex
> > -      * already, so we don't need to give another lock here and could
> > -      * ensure that it was safe between each cores.
> > -      */
> > -     lockdep_assert_held(&text_mutex);
> > -
> >       if (across_pages)
> >               patch_map(addr + len, FIX_TEXT_POKE1);
> >
> > --
> > 2.7.4
> >
>
>
> --
> Masami Hiramatsu <mhiramat@kernel.org>



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=/4kn=D3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB5C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 11:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2442223C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 11:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T5+aAm1O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeuLJ1+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A2442223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=evAZKg5WwpMB5zpxzZleEFecUmM94TyX//wzGucOjls=; b=T5+aAm1OWoxOrzC/jur7ieXNh
	1emyrdQhLwL3iXOuY3QQYLF7RVSzOGQnLzcF37f6r2xz39LuDrPDm9+tuTPmAieiBcMYXDXX7fbVI
	7T8ud5eiUgFfjGL9hT6Sz8rv0ONLpWVM2I5T55Rh5ii5piFSJbiwDNN4drSzeXTP+beQ97PVF/t8A
	uQN29UQLv2CQnwU7vSvr/riV1gKkBv16EN+A7w4x8wqerSyoJ/GK6TN7Ev+cJ7n9LH4NKtmcZgiSK
	VCTEO4p0rihCiupg1u7p5xQc1Wp+3hmnB5nmWhmd6WjPfEyvVHUM55ZRbFEGcQkqhio7GYcyeEzYV
	aynnHuuxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUpbI-0005Ce-F3; Tue, 20 Oct 2020 11:14:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUpbG-0005C8-5q
 for linux-riscv@lists.infradead.org; Tue, 20 Oct 2020 11:14:43 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C9612224B
 for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2020 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603192479;
 bh=z11io3P7B6JuJMW8LPvZUzVApkfxzAf5Pd0zkJNXPm4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NeuLJ1+u3tICUvhSuymNTyygLHeGgu+gfDRqoCl4cWaWgWDEFSp07ye5vUFY4fEZF
 NFE2Ph9RvVxet2o43eJnVb3MJca8RQLG/kbQLCumGIlPb1ga0E90v4PQ6vt4RLWl8E
 N/AYp0o9q/opsH0RZeFwOKhWhLdbQdl9q7RDCmoo=
Received: by mail-lj1-f175.google.com with SMTP id d24so1545177ljg.10
 for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2020 04:14:39 -0700 (PDT)
X-Gm-Message-State: AOAM530apwSGFHTzmhOuReNIihIJzfgvZZNR0BfnBDpETtT1ApilpXxH
 LJscUR0YY5eLKyNeogwu5EurrPu6yv/8r4t8e0I=
X-Google-Smtp-Source: ABdhPJwfHfDYAYgcJnsow6xw2EtrhjTlsAw3IIZnRIe5/y/jT5DTMr4+kRCwdCWtpfhXfglP44iqo+joimsF48ObCF0=
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr855128ljj.250.1603192477556;
 Tue, 20 Oct 2020 04:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
 <20201019173648.573d58c7fde864090bf0487a@kernel.org>
In-Reply-To: <20201019173648.573d58c7fde864090bf0487a@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Oct 2020 19:14:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQwBY_FkzE1bi9-1xVMix8Vq6q1msyC9LAV79eNHjC8dQ@mail.gmail.com>
Message-ID: <CAJF2gTQwBY_FkzE1bi9-1xVMix8Vq6q1msyC9LAV79eNHjC8dQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_071442_365666_FA855346 
X-CRM114-Status: GOOD (  27.15  )
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
I found ftrace_run_update_code:
 - ftrace_arch_code_modify_prepare()-> mutex_lock(&text_mutex)
 - stop_machine(__ftrace_modify_code, &command, NULL); - >
__ftrace_modify_code -> patch_insn_write -> lockdep_assert_held ->
lockdep_is_held
 - ftrace_arch_code_modify_post_process()-> mutex_unlock(&text_mutex)

Because of stop_machine, __ftrace_modify_code and
ftrace_run_update_code are not the same task. This will cause
lockdep_is_held return 0.

ref to __lock_is_held:
volatile int __lock_is_held(const struct lockdep_map *lock, int read)
{
        struct task_struct *curr = current; // current is from
stop_machine, not ftrace_run_update_code. So never match!
        int i;

        for (i = 0; i < curr->lockdep_depth; i++) {
                struct held_lock *hlock = curr->held_locks + i;

                if (match_held_lock(hlock, lock)) {
                        if (read == -1 || hlock->read == read)
                                return 1;

                        return 0;
                }
        }

        return 0;
}

Does it seem a comm issue? I'm not so expert on lockdep mechanism.

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

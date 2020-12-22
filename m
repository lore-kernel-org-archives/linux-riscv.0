Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A8DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:27:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B85229C5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B85229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yzx6uEqGO0ARTTGvdTJ1pe3SSNe4LPo1o2ouhwq/zzo=; b=zk/QcOJbKvXV0oOitrBt/uML1
	taWWkz34sw6gRVw4wdYVhfRC/iNB8rZMuSO/N73nqWADDyuF3//+SWHLJOj/Y4sixRs7NQvGgjYnY
	hAUmIiTnF3SBOXRU62ZoVKM25r3FIWzC78lH0GQyCKOAkoenZOiulGPF0aSQbj+cGXo4Va2b6D+u7
	G9qGvof+eOrrJRckTLJCpjUrmdWLlrx8co/Czna0e2W+Ui69oz54iHxp1jgVyyk82QIu7Pgfx8QLu
	6Po+wzZGWD89Sxu2lqVUbkHQSa0mfNwZK3fEAEYnqx/kxWnyo8myszmqRL1h3sPz7xho/xejR5pzv
	NlaA7mOUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kroFM-0007Vl-Un; Tue, 22 Dec 2020 20:27:04 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kroFK-0007Uv-Fz
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 20:27:03 +0000
Received: by mail-io1-xd29.google.com with SMTP id 81so13088867ioc.13
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s4eq0AhfPjlFgt6wX8XqFRkHGBvSUkB/noacG+ANrhQ=;
 b=PdgXwm+8hKObh+trYcWGCpH3MmdPOF0hW3ALimafOCRaSREEv94bkVz59RtngZrk1R
 ii5jA2pT6wp2qY0z/vw/lz4s8RKo/Edj2egupTBuOAGVlKBlQM1VHtoCECU+sIIMMDZb
 +AMdiXw9pLUISzt42aCgWZE0LiIXfv3+EzVT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4eq0AhfPjlFgt6wX8XqFRkHGBvSUkB/noacG+ANrhQ=;
 b=mdYiZYtQQ78NWnIHQf8gynY0rEGLBNat98mBvFp62fbP5igyvv48BhudqRn1v9p95J
 EAc3kloivdadzT+hyHycWyP/BwUPHmY0B4DFwWo7bynY95TfdUX3yVsKzRIWt9UFDZdU
 OayPYSO7dVKjHrvo9mwqUUgzDzRi022JIBwAzGw+u1AkBAnQMG0rWONlGQ6Sj3ETK67P
 SmEPIYKX3pprwzReAxO6qZqcRScHRlVoNHrugqOIKvbeZOJeK0jn7O/MZf/hn7PNNALq
 /HiTUKOrcXawujIYPp3E2Ccm3aB3WxeuEn5kKLW1qdXQ23GFnN7Hix7mOPZrZjRFrhka
 7VNw==
X-Gm-Message-State: AOAM5320KWhntByK3oTawBfQ6TW/+cBxQhHDT4iyo5TwJJDOXibgIjfu
 8rZqMO4FRTso+dRgAm1GZI46Adv/d86+lcpuR1Vm
X-Google-Smtp-Source: ABdhPJwbxAyjZnISDKpXczfPPFTrbbpIBz9t5pmtrM2v097I452wHLnKYL5XvVbAq3JhkqEjzlqW0OFEnFM/H5kRC9w=
X-Received: by 2002:a02:cd84:: with SMTP id l4mr20518070jap.141.1608668820615; 
 Tue, 22 Dec 2020 12:27:00 -0800 (PST)
MIME-Version: 1.0
References: <1608220905-1962-1-git-send-email-guoren@kernel.org>
 <1608220905-1962-5-git-send-email-guoren@kernel.org>
In-Reply-To: <1608220905-1962-5-git-send-email-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Dec 2020 12:26:49 -0800
Message-ID: <CAOnJCUJxdZbYJM44EReZKizsBXAZMOn4zvrJA1kTW0k574iWNQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] riscv: Fixup patch_text panic in ftrace
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_152702_547211_AD01B4D7 
X-CRM114-Status: GOOD (  21.40  )
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>,
 Alan Kao <alankao@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Atish Patra <atish.patra@wdc.com>,
 linux-csky@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Drew Fustini <pdp7pdp7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 8:04 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Just like arm64, we can't trace the function in the patch_text path.
>
> Here is the bug log:
>
> [   45.234334] Unable to handle kernel paging request at virtual address ffffffd38ae80900
> [   45.242313] Oops [#1]
> [   45.244600] Modules linked in:
> [   45.247678] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.9.0-00025-g9b7db83-dirty #215
> [   45.255797] epc: ffffffe00021689a ra : ffffffe00021718e sp : ffffffe01afabb58
> [   45.262955]  gp : ffffffe00136afa0 tp : ffffffe01af94d00 t0 : 0000000000000002
> [   45.270200]  t1 : 0000000000000000 t2 : 0000000000000001 s0 : ffffffe01afabc08
> [   45.277443]  s1 : ffffffe0013718a8 a0 : 0000000000000000 a1 : ffffffe01afabba8
> [   45.284686]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : c4c16ad38ae80900
> [   45.291929]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
> [   45.299173]  s2 : 0000000000000001 s3 : ffffffe000206a60 s4 : ffffffe000206a60
> [   45.306415]  s5 : 00000000000009ec s6 : ffffffe0013718a8 s7 : c4c16ad38ae80900
> [   45.313658]  s8 : 0000000000000004 s9 : 0000000000000001 s10: 0000000000000001
> [   45.320902]  s11: 0000000000000003 t3 : 0000000000000001 t4 : ffffffffd192fe79
> [   45.328144]  t5 : ffffffffb8f80000 t6 : 0000000000040000
> [   45.333472] status: 0000000200000100 badaddr: ffffffd38ae80900 cause: 000000000000000f
> [   45.341514] ---[ end trace d95102172248fdcf ]---
> [   45.346176] note: migration/0[11] exited with preempt_count 1
>
> (gdb) x /2i $pc
> => 0xffffffe00021689a <__do_proc_dointvec+196>: sd      zero,0(s7)
>    0xffffffe00021689e <__do_proc_dointvec+200>: li      s11,0
>
> (gdb) bt
> 0  __do_proc_dointvec (tbl_data=0x0, table=0xffffffe01afabba8,
> write=0, buffer=0x0, lenp=0x7bf897061f9a0800, ppos=0x4, conv=0x0,
> data=0x52464e43) at kernel/sysctl.c:581
> 1  0xffffffe00021718e in do_proc_dointvec (data=<optimized out>,
> conv=<optimized out>, ppos=<optimized out>, lenp=<optimized out>,
> buffer=<optimized out>, write=<optimized out>, table=<optimized out>)
> at kernel/sysctl.c:964
> 2  proc_dointvec_minmax (ppos=<optimized out>, lenp=<optimized out>,
> buffer=<optimized out>, write=<optimized out>, table=<optimized out>)
> at kernel/sysctl.c:964
> 3  proc_do_static_key (table=<optimized out>, write=1, buffer=0x0,
> lenp=0x0, ppos=0x7bf897061f9a0800) at kernel/sysctl.c:1643
> 4  0xffffffe000206792 in ftrace_make_call (rec=<optimized out>,
> addr=<optimized out>) at arch/riscv/kernel/ftrace.c:109
> 5  0xffffffe0002c9c04 in __ftrace_replace_code
> (rec=0xffffffe01ae40c30, enable=3) at kernel/trace/ftrace.c:2503
> 6  0xffffffe0002ca0b2 in ftrace_replace_code (mod_flags=<optimized
> out>) at kernel/trace/ftrace.c:2530
> 7  0xffffffe0002ca26a in ftrace_modify_all_code (command=5) at
> kernel/trace/ftrace.c:2677
> 8  0xffffffe0002ca30e in __ftrace_modify_code (data=<optimized out>)
> at kernel/trace/ftrace.c:2703
> 9  0xffffffe0002c13b0 in multi_cpu_stop (data=0x0) at kernel/stop_machine.c:224
> 10 0xffffffe0002c0fde in cpu_stopper_thread (cpu=<optimized out>) at
> kernel/stop_machine.c:491
> 11 0xffffffe0002343de in smpboot_thread_fn (data=0x0) at kernel/smpboot.c:165
> 12 0xffffffe00022f8b4 in kthread (_create=0xffffffe01af0c040) at
> kernel/kthread.c:292
> 13 0xffffffe000201fac in handle_exception () at arch/riscv/kernel/entry.S:236
>
>    0xffffffe00020678a <+114>:   auipc   ra,0xffffe
>    0xffffffe00020678e <+118>:   jalr    -118(ra) # 0xffffffe000204714 <patch_text_nosync>
>    0xffffffe000206792 <+122>:   snez    a0,a0
>
> (gdb) disassemble patch_text_nosync
> Dump of assembler code for function patch_text_nosync:
>    0xffffffe000204714 <+0>:     addi    sp,sp,-32
>    0xffffffe000204716 <+2>:     sd      s0,16(sp)
>    0xffffffe000204718 <+4>:     sd      ra,24(sp)
>    0xffffffe00020471a <+6>:     addi    s0,sp,32
>    0xffffffe00020471c <+8>:     auipc   ra,0x0
>    0xffffffe000204720 <+12>:    jalr    -384(ra) # 0xffffffe00020459c <patch_insn_write>
>    0xffffffe000204724 <+16>:    beqz    a0,0xffffffe00020472e <patch_text_nosync+26>
>    0xffffffe000204726 <+18>:    ld      ra,24(sp)
>    0xffffffe000204728 <+20>:    ld      s0,16(sp)
>    0xffffffe00020472a <+22>:    addi    sp,sp,32
>    0xffffffe00020472c <+24>:    ret
>    0xffffffe00020472e <+26>:    sd      a0,-24(s0)
>    0xffffffe000204732 <+30>:    auipc   ra,0x4
>    0xffffffe000204736 <+34>:    jalr    -1464(ra) # 0xffffffe00020817a <flush_icache_all>
>    0xffffffe00020473a <+38>:    ld      a0,-24(s0)
>    0xffffffe00020473e <+42>:    ld      ra,24(sp)
>    0xffffffe000204740 <+44>:    ld      s0,16(sp)
>    0xffffffe000204742 <+46>:    addi    sp,sp,32
>    0xffffffe000204744 <+48>:    ret
>
> (gdb) disassemble flush_icache_all-4
> Dump of assembler code for function flush_icache_all:
>    0xffffffe00020817a <+0>:     addi    sp,sp,-8
>    0xffffffe00020817c <+2>:     sd      ra,0(sp)
>    0xffffffe00020817e <+4>:     auipc   ra,0xfffff
>    0xffffffe000208182 <+8>:     jalr    -1822(ra) # 0xffffffe000206a60 <ftrace_caller>
>    0xffffffe000208186 <+12>:    ld      ra,0(sp)
>    0xffffffe000208188 <+14>:    addi    sp,sp,8
>    0xffffffe00020818a <+0>:     addi    sp,sp,-16
>    0xffffffe00020818c <+2>:     sd      s0,0(sp)
>    0xffffffe00020818e <+4>:     sd      ra,8(sp)
>    0xffffffe000208190 <+6>:     addi    s0,sp,16
>    0xffffffe000208192 <+8>:     li      a0,0
>    0xffffffe000208194 <+10>:    auipc   ra,0xfffff
>    0xffffffe000208198 <+14>:    jalr    -410(ra) # 0xffffffe000206ffa <sbi_remote_fence_i>
>    0xffffffe00020819c <+18>:    ld      s0,0(sp)
>    0xffffffe00020819e <+20>:    ld      ra,8(sp)
>    0xffffffe0002081a0 <+22>:    addi    sp,sp,16
>    0xffffffe0002081a2 <+24>:    ret
>
> (gdb) frame 5
> (rec=0xffffffe01ae40c30, enable=3) at kernel/trace/ftrace.c:2503
> 2503                    return ftrace_make_call(rec, ftrace_addr);
> (gdb) p /x rec->ip
> $2 = 0xffffffe00020817a -> flush_icache_all !
>
> When we modified flush_icache_all's patchable-entry with ftrace_caller:
>  - Insert ftrace_caller at flush_icache_all prologue.
>  - Call flush_icache_all to sync I/Dcache, but flush_icache_all is
> just we modified by half.
>
> Link: https://lore.kernel.org/linux-riscv/CAJF2gTT=oDWesWe0JVWvTpGi60-gpbNhYLdFWN_5EbyeqoEDdw@mail.gmail.com/T/#t
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> ---
>  arch/riscv/kernel/Makefile | 1 +
>  arch/riscv/mm/Makefile     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 27f10eb..62de075 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -6,6 +6,7 @@
>  ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_patch.o  = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_sbi.o    = $(CC_FLAGS_FTRACE)
>  endif
>
>  extra-y += head.o
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 6b4b7ec..7ebaef1 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -3,6 +3,7 @@
>  CFLAGS_init.o := -mcmodel=medany
>  ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
>  endif
>
>  KCOV_INSTRUMENT_init.o := n
> --
> 2.7.4
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

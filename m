Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D3BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdOwoC1x112tFkWOKg4RzLkR9vduJsO8EM0ombDi49M=; b=TyfcZJrMixJEpb
	oGEd4mzuaB+9QGg8UlH5wW9umFvga9GrUKMc3OZ2ZrJ8NaJDh86Ye1h+yacOaPpVBJYEC8wc9+N8y
	hIjcF3Hh7t3+DxQWuXV84eYjhozyVsoPbG/CuOnidJVVJMIxIV9sr891hYNXXz/VouQ4MOxHAj3OI
	a0moAPO2W0nUEldzWTJcAAMn5i5DJ6jWmTHZZKh7NnEmpV82nq1Vc45gl5JEZ6kavDQ6FaTW/5IV1
	PFqHxQIrC7VWMT1dklvQnUE+RIDDBGSM1YFhHDpL+qPv6RBIDSYrtC7msACC/SywExj0B7BW3UwyU
	0ELbK+4E6L76WHZ9P53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5s4-00Gezg-39; Mon, 07 Nov 2022 17:25:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5rz-00Geuy-Er
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 17:25:13 +0000
Received: by mail-ed1-x531.google.com with SMTP id i21so18677640edj.10
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HMksJP+cg89DwngzLf3MGalvoSB3xfzUltruCjJaWFI=;
        b=nMZVZpF/rkW83ru3cSaCKTYrEqC7AepjXTsH4a1bDHllvsKQz89sPTtufK9PYd43QG
         62LsdxqooPFiBmE8qy2hA2Z7TXvNLJPHMiE7TEGlxqtXIRwnRHcBAWM0PKZcZDoI9/+C
         v+fT90QdLp4OYHhUSyVgIi2MbTc6B4q525PlNNUD7EYvnVcsX+lJvS3ZM1pCH7c+rX4n
         PZeFexWqVqcXC95MeyH+8N/SNoePwbiUTyLTQ36idScNhfLr/mfWJty/ATAwE9t/9+Ub
         tz46bDpMTaKWh4cfSb8brNH7a9/jmxablW0QrlnsWs6YSQQEnZwylN4Fi+aS81utibf7
         1Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMksJP+cg89DwngzLf3MGalvoSB3xfzUltruCjJaWFI=;
        b=lLY8c8AjBM4ZtPfx19tERgPg5gAV0QWCH8GP16sdrPTEavYU0dW3IlmW7vXOQUQAcM
         IdyJizG8VRIrQ/29EpsNwq/mTTs1lUjJyGl5XNcyf8hA5FYb93ICC/cdctshs6KbNZs5
         XJ4DXA1W319h9otyg+rDKbtkLtGM8jI1FvEcrz2d9czoRP8cTSyu4sxBk00Ae982dimB
         f4XrQG9jNQsA+FybUkytLbXRKRC3ylwrOavQSe9z7ihxj8QkJDtLcJMbWCT565Jn4b/7
         BcARfqFEpBY+bDEb+YvuNrPy6KFndBJQMDyRgqZBABPgfi4HDOWyf1srcd7LiiMwO7L9
         37nA==
X-Gm-Message-State: ACrzQf2jSFrEfbqDuP4YhFehxDEOY34iC5+8OBTbBAIQOjskHgmdYdet
	EZtgkI/qAVhar30bSzwAH2z2FsE3nreDXMEIBJWsTg==
X-Google-Smtp-Source: AMsMyM4RTHYiHYFnESK063Xo9ZQ8xYjNoqL2GfxS/Lvgwa6bvb7MHjFRyZEO92XGOo+P313DYDzK5RZ6+3V5BnnPoRA=
X-Received: by 2002:aa7:d797:0:b0:462:1e07:1dd7 with SMTP id
 s23-20020aa7d797000000b004621e071dd7mr813331edq.293.1667841902929; Mon, 07
 Nov 2022 09:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20221031213225.912258-1-geomatsi@gmail.com> <CALE4mHo2yFPpF68RvvDbKji6_peAX60_cXqnFMxydJTLjnLnUQ@mail.gmail.com>
 <Y2WGIQ+m7jk5RPZv@curiosity> <CAAhSdy0bZsX1CCYvGJjHH4bXMJZU7eZ7dLcYR87CV4UaS+Kgeg@mail.gmail.com>
 <CALE4mHq0+iJju23rDKQiR1PbY-2Cy0jqRCkCKBBOy6JB4e_z3Q@mail.gmail.com> <CAK9=C2UmfeY2JJ9YLH6Ve392N9LrY2jdNi6CFADMNQgN=vVFxg@mail.gmail.com>
In-Reply-To: <CAK9=C2UmfeY2JJ9YLH6Ve392N9LrY2jdNi6CFADMNQgN=vVFxg@mail.gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Mon, 7 Nov 2022 12:24:51 -0500
Message-ID: <CALE4mHp2vvv3tFVsDHn_hCrN7iF2aTugsu57cSXE=wrxq7wa2w@mail.gmail.com>
Subject: Re: [RFC PATCH v1] riscv: support for hardware breakpoints/watchpoints
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Sergey Matyukevich <geomatsi@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_092511_546484_3A2A39F7 
X-CRM114-Status: GOOD (  49.06  )
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

On Mon, Nov 7, 2022 at 11:06 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Mon, Nov 7, 2022 at 8:21 PM Andrew Bresticker <abrestic@rivosinc.com> wrote:
> >
> > On Sat, Nov 5, 2022 at 5:10 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sat, Nov 5, 2022 at 3:07 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > >
> > > > Hi Andrew,
> > > >
> > > > > > RISC-V Debug specification includes Sdtrig ISA extension. This extension
> > > > > > describes Trigger Module. Triggers can cause a breakpoint exception,
> > > > > > entry into Debug Mode, or a trace action without having to execute a
> > > > > > special instruction. For native debugging triggers can be used to
> > > > > > implement hardware breakpoints and watchpoints.
> > > >
> > > > ... [snip]
> > > >
> > > > > > Despite missing userspace debug, initial implementation can be tested
> > > > > > on QEMU using kernel breakpoints, e.g. see samples/hw_breakpoint and
> > > > > > register_wide_hw_breakpoint. Hardware breakpoints work on upstream QEMU.
> > > > >
> > > > > We should also be able to enable the use of HW breakpoints (and
> > > > > watchpoints, modulo the issue mentioned below) in kdb, right?
> > > >
> > > > Interesting. So far I didn't think about using hw breakpoints in kgdb.
> > > > I took a quick look at riscv and arm64 kgdb code. It looks like there
> > > > is nothing wrong in adding arch-specific implementation of the function
> > > > 'kgdb_arch_set_breakpoint' that will use hw breakpoints if possible.
> > > > Besides it looks like in this case it makes sense to handle KGDB earlier
> > > > than hw breakpoints in do_trap_break.
> > > >
> > > > > > However this is not the case for watchpoints since there is no way to
> > > > > > figure out which watchpoint is triggered. IIUC there are two possible
> > > > > > options for doing this: using 'hit' bit in tdata1 or reading faulting
> > > > > > virtual address from STVAL. QEMU implements neither of them. Current
> > > > > > implementation opts for STVAL. So the following experimental QEMU patch
> > > > > > is required to make watchpoints work:
> > > > > >
> > > > > > :  diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > > > :  index 278d163803..8858be7411 100644
> > > > > > :  --- a/target/riscv/cpu_helper.c
> > > > > > :  +++ b/target/riscv/cpu_helper.c
> > > > > > :  @@ -1639,6 +1639,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > > > > > :           case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> > > > > > :               tval = env->bins;
> > > > > > :               break;
> > > > > > :  +        case RISCV_EXCP_BREAKPOINT:
> > > > > > :  +            tval = env->badaddr;
> > > > > > :  +            env->badaddr = 0x0;
> > > > > > :  +            break;
> > > > > > :           default:
> > > > > > :               break;
> > > > > > :           }
> > > > > > :  diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> > > > > > :  index 26ea764407..b4d1d566ab 100644
> > > > > > :  --- a/target/riscv/debug.c
> > > > > > :  +++ b/target/riscv/debug.c
> > > > > > :  @@ -560,6 +560,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
> > > > > > :
> > > > > > :       if (cs->watchpoint_hit) {
> > > > > > :           if (cs->watchpoint_hit->flags & BP_CPU) {
> > > > > > :  +            env->badaddr = cs->watchpoint_hit->hitaddr;
> > > > > > :               cs->watchpoint_hit = NULL;
> > > > > > :               do_trigger_action(env, DBG_ACTION_BP);
> > > > > > :           }
> > > >
> > > > ... [snip]
> > > >
> > > > > > +int arch_install_hw_breakpoint(struct perf_event *bp)
> > > > > > +{
> > > > > > +       struct arch_hw_breakpoint *info = counter_arch_bp(bp);
> > > > > > +       struct sbi_dbtr_data_msg *xmit;
> > > > > > +       struct sbi_dbtr_id_msg *recv;
> > > > > > +       struct perf_event **slot;
> > > > > > +       struct sbiret ret;
> > > > > > +       int err = 0;
> > > > > > +
> > > > > > +       xmit = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*xmit)), GFP_ATOMIC);
> > > > > > +       if (!xmit) {
> > > > > > +               err = -ENOMEM;
> > > > > > +               goto out;
> > > > > > +       }
> > > > > > +
> > > > > > +       recv = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*recv)), GFP_ATOMIC);
> > > > > > +       if (!recv) {
> > > > > > +               err = -ENOMEM;
> > > > > > +               goto out;
> > > > > > +       }
> > > > >
> > > > > Do these really need to be dynamically allocated?
> > > >
> > > > According to SBI extension proposal, base address of this memory chunk
> > > > must be 16-bytes aligned. To simplify things, buffer with 'power of two
> > > > bytes' size (and >= 16 bytes) is allocated. In this case alignment of
> > > > the kmalloc buffer is guaranteed to be at least this size. IIUC more
> > > > efforts are needed to guarantee such alignment for a buffer on stack.
> >
> > You should be able to declare the struct with __aligned(16) to get the
> > desired alignment on the stack.
> >
> > > Stack is not appropriate for this. Please use a per-CPU global
> > > data for this purpose which should be 16 byte aligned as well.
> >
> > Is the desire to not use the stack purely a defensive measure, i.e. to
> > defend against a buggy or malicious firmware/hypervisor? That's fine,
> > I'm just curious if there's rationale beyond that (though I'd argue
> > we're already implicitly trusting whatever software is sitting below
> > us).
>
> The kernel stack is fixed size so it is best to avoid large structures
> or arrays on kernel stack.

Of course, though I'm not sure I'd consider 32 bytes "large" :)

-Andrew

>
> Regards,
> Anup
>
> >
> > -Andrew
> >
> > >
> > > You may also allocate a per-CPU 4K page at boot-time where
> > > CPU X will use it's own 4K page for xmit (upper half) and
> > > recv (lower half).
> > >
> > > Regards,
> > > Anup
> > >
> > > >
> > > > > > +
> > > > > > +       xmit->tdata1 = info->trig_data1.value;
> > > > > > +       xmit->tdata2 = info->trig_data2;
> > > > > > +       xmit->tdata3 = info->trig_data3;
> > > > > > +
> > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_INSTALL,
> > > > > > +                       1, __pa(xmit) >> 4, __pa(recv) >> 4,
> > > > > > +                       0, 0, 0);
> > > > > > +       if (ret.error) {
> > > > > > +               pr_warn("%s: failed to install trigger\n", __func__);
> > > > > > +               err = -EIO;
> > > > > > +               goto out;
> > > > > > +       }
> > > > > > +
> > > > > > +       if (recv->idx >= dbtr_total_num) {
> > > > > > +               pr_warn("%s: invalid trigger index %lu\n", __func__, recv->idx);
> > > > > > +               err = -EINVAL;
> > > > > > +               goto out;
> > > > > > +       }
> > > > > > +
> > > > > > +       slot = this_cpu_ptr(&bp_per_reg[recv->idx]);
> > > > > > +       if (*slot) {
> > > > > > +               pr_warn("%s: slot %lu is in use\n", __func__, recv->idx);
> > > > > > +               err = -EBUSY;
> > > > > > +               goto out;
> > > > > > +       }
> > > > > > +
> > > > > > +       *slot = bp;
> > > > > > +
> > > > > > +out:
> > > > > > +       kfree(xmit);
> > > > > > +       kfree(recv);
> > > > > > +
> > > > > > +       return err;
> > > > > > +}
> > > >
> > > > ... [snip]
> > > >
> > > > > > +static int __init arch_hw_breakpoint_init(void)
> > > > > > +{
> > > > > > +       union riscv_dbtr_tdata1 tdata1;
> > > > > > +       struct sbiret ret;
> > > > > > +
> > > > > > +       if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
> > > > > > +               pr_info("%s: SBI_EXT_DBTR is not supported\n", __func__);
> > > > > > +               return 0;
> > > > > > +       }
> > > > > > +
> > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > > > > +                       0, 0, 0, 0, 0, 0);
> > > > > > +       if (ret.error) {
> > > > > > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > > > > > +               return 0;
> > > > > > +       }
> > > > > > +
> > > > > > +       pr_info("%s: total number of triggers: %lu\n", __func__, ret.value);
> > > > > > +
> > > > > > +       tdata1.value = 0;
> > > > > > +       tdata1.type = RISCV_DBTR_TRIG_MCONTROL6;
> > > > > > +
> > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > > > > +                       tdata1.value, 0, 0, 0, 0, 0);
> > > > > > +       if (ret.error) {
> > > > > > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > > > > > +               dbtr_total_num = 0;
> > > > > > +               return 0;
> > > > > > +       }
> > > > >
> > > > > nit: This is basically identical to hw_breakpoint_slots() -- just call
> > > > > it here, or perhaps pull the DBTR_NUM_TRIGGERS ECALL into its own
> > > > > function to reduce the duplication, e.g. 'dbtr_num_triggers(unsigned
> > > > > long type)'?
> > > >
> > > > Good point. More similar requests will be added, e.g. for MCONTROL and
> > > > possibly other trigger types. So I will add a separate
> > > > 'dbtr_num_triggers' function.
> > > >
> > > > > > +
> > > > > > +       pr_info("%s: total number of type %d triggers: %lu\n",
> > > > > > +               __func__, tdata1.type, ret.value);
> > > > > > +
> > > > > > +       dbtr_total_num = ret.value;
> > > > > > +
> > > > > > +       return 0;
> > > > > > +}
> > > >
> > > > Thanks!
> > > > Sergey
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

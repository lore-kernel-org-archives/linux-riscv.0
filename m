Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED24C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rz4nU0zMyRV/RgoTeRSzkBXFCNn0hXVjP+S2Mrz4+4I=; b=U8QjuQlS3QI5uz
	jadIAjH/oth0yOdTyWVfip35BSeo44/9wgIfqmhpZyB949UoxAgXA8KnpBtOceh3ZVKuPxE8F9nY5
	h7BhKntvvvzrgICh3tRJ7Bk9dLyyA3c9B4ddABEoS+5ctpwmWhwQrZCb8cAQ+FNcTP9fcqHz7KJRF
	QRgB8qI+B/+0GGkjVDspYrl+IxNF88S2DIljLxlYIx+PrGxdb/RtRv0n9U9yLMEsloieUYcKp8vRC
	R9Mv9U2zW8MFbp8olYP27zOmAPJQwA36Ly+HKcCJO0dmd6riDfsERwbpqXlyjgqX0S3yZAskLohAo
	zdApXd1dx0QDIiW22VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6GG-00GucJ-Uo; Mon, 07 Nov 2022 17:50:16 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6GD-00GubB-3C
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 17:50:15 +0000
Received: by mail-oi1-x229.google.com with SMTP id r76so12896763oie.13
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEIMn8yqnncddf2soubhdtYLY8R/bDuksYkV1v2yJJ8=;
        b=gsWIhAmJkCj/pDqvlfTvmGGHXTec+3xsAlHiGqvich0ae/2X0dr3YdhOdvpU8fu7p3
         03o79I4zjzsK+JnNAGz1SZVnLLeG0/3zpmjWta6Bdw3TfJNncQhOP644oV2Sk+wCNAE/
         E4oCbDuXXOl96XPJQP0y6G7hzPUo5GBDnWrLZogb2YhZ/ohSq17hTwIajq7JEcBdFTF/
         Ei0GRQi19yMFHYqYmiq7jUmkdEhVURMmD9L93TKH+JaoAXpZfLIgroINO+90FsgJJSKc
         HRxUq+sMt3csfRVC3js6oXGKaQLqbA2TZgIgUqSuEK9MmSpVZRFomAlZ3H1u1I8pBCFX
         uLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEIMn8yqnncddf2soubhdtYLY8R/bDuksYkV1v2yJJ8=;
        b=Y/cNnOFuFqBmzejXxgaZ/t6aXWcIXAg9EQIzReKXCvThPQzC2sU5G6RJfx6rqQPdzr
         NajouDku/z/3sKCFsS7u7d4B7f7OaHjL8q3YBd2ymeQq2jw5cjOE1+QGBzjFvVWzr68a
         ifNr+LWdYsNmlTNp9WZBPXhoIpef1bb3GcjZ5hywqxaJmot32mdgmuzAJ7hxecDh6KAX
         dNZv9Xw8ZYwMm8bpa34IGAsimLrnKBUQ8mLfAgAeVwuUsBodl1Z70UFqQde5drilskDh
         r3bouWuWL3naWh5H3LsdoeSA+K7v2E952BB0kLitgwgqKFX/z2ZwNqGH/IAYjB4scE7P
         LF8Q==
X-Gm-Message-State: ACrzQf3nV/PRswvgKIvGwsJgl28HCepebmikA2lTwlQ85CGZX486SZIl
	8LS3LAXU5WCcbh8Z6lmcnhRDKmPibe4tUVPf/AT/og==
X-Google-Smtp-Source: AMsMyM66pCOdJZ3V3LrQphyPnVqAcg7VvWLLBfKE2G3RaoEuSGRdx3sOMPWvfL7ss8o7lxFOP/iSzgbjo5DJMCZMnUQ=
X-Received: by 2002:a05:6808:e88:b0:351:2725:ed84 with SMTP id
 k8-20020a0568080e8800b003512725ed84mr34709844oil.17.1667843410876; Mon, 07
 Nov 2022 09:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20221031213225.912258-1-geomatsi@gmail.com> <CALE4mHo2yFPpF68RvvDbKji6_peAX60_cXqnFMxydJTLjnLnUQ@mail.gmail.com>
 <Y2WGIQ+m7jk5RPZv@curiosity> <CAAhSdy0bZsX1CCYvGJjHH4bXMJZU7eZ7dLcYR87CV4UaS+Kgeg@mail.gmail.com>
 <CALE4mHq0+iJju23rDKQiR1PbY-2Cy0jqRCkCKBBOy6JB4e_z3Q@mail.gmail.com>
 <CAK9=C2UmfeY2JJ9YLH6Ve392N9LrY2jdNi6CFADMNQgN=vVFxg@mail.gmail.com> <CALE4mHp2vvv3tFVsDHn_hCrN7iF2aTugsu57cSXE=wrxq7wa2w@mail.gmail.com>
In-Reply-To: <CALE4mHp2vvv3tFVsDHn_hCrN7iF2aTugsu57cSXE=wrxq7wa2w@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 7 Nov 2022 23:19:59 +0530
Message-ID: <CAK9=C2V_DZ+8jQ0Dg+P7sbke_SPzOnYydfwNGc-P0abvBkWB-A@mail.gmail.com>
Subject: Re: [RFC PATCH v1] riscv: support for hardware breakpoints/watchpoints
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Sergey Matyukevich <geomatsi@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_095013_166436_793A5C66 
X-CRM114-Status: GOOD (  50.23  )
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

On Mon, Nov 7, 2022 at 10:55 PM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> On Mon, Nov 7, 2022 at 11:06 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Mon, Nov 7, 2022 at 8:21 PM Andrew Bresticker <abrestic@rivosinc.com> wrote:
> > >
> > > On Sat, Nov 5, 2022 at 5:10 AM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Sat, Nov 5, 2022 at 3:07 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > > > >
> > > > > Hi Andrew,
> > > > >
> > > > > > > RISC-V Debug specification includes Sdtrig ISA extension. This extension
> > > > > > > describes Trigger Module. Triggers can cause a breakpoint exception,
> > > > > > > entry into Debug Mode, or a trace action without having to execute a
> > > > > > > special instruction. For native debugging triggers can be used to
> > > > > > > implement hardware breakpoints and watchpoints.
> > > > >
> > > > > ... [snip]
> > > > >
> > > > > > > Despite missing userspace debug, initial implementation can be tested
> > > > > > > on QEMU using kernel breakpoints, e.g. see samples/hw_breakpoint and
> > > > > > > register_wide_hw_breakpoint. Hardware breakpoints work on upstream QEMU.
> > > > > >
> > > > > > We should also be able to enable the use of HW breakpoints (and
> > > > > > watchpoints, modulo the issue mentioned below) in kdb, right?
> > > > >
> > > > > Interesting. So far I didn't think about using hw breakpoints in kgdb.
> > > > > I took a quick look at riscv and arm64 kgdb code. It looks like there
> > > > > is nothing wrong in adding arch-specific implementation of the function
> > > > > 'kgdb_arch_set_breakpoint' that will use hw breakpoints if possible.
> > > > > Besides it looks like in this case it makes sense to handle KGDB earlier
> > > > > than hw breakpoints in do_trap_break.
> > > > >
> > > > > > > However this is not the case for watchpoints since there is no way to
> > > > > > > figure out which watchpoint is triggered. IIUC there are two possible
> > > > > > > options for doing this: using 'hit' bit in tdata1 or reading faulting
> > > > > > > virtual address from STVAL. QEMU implements neither of them. Current
> > > > > > > implementation opts for STVAL. So the following experimental QEMU patch
> > > > > > > is required to make watchpoints work:
> > > > > > >
> > > > > > > :  diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > > > > :  index 278d163803..8858be7411 100644
> > > > > > > :  --- a/target/riscv/cpu_helper.c
> > > > > > > :  +++ b/target/riscv/cpu_helper.c
> > > > > > > :  @@ -1639,6 +1639,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > > > > > > :           case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> > > > > > > :               tval = env->bins;
> > > > > > > :               break;
> > > > > > > :  +        case RISCV_EXCP_BREAKPOINT:
> > > > > > > :  +            tval = env->badaddr;
> > > > > > > :  +            env->badaddr = 0x0;
> > > > > > > :  +            break;
> > > > > > > :           default:
> > > > > > > :               break;
> > > > > > > :           }
> > > > > > > :  diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> > > > > > > :  index 26ea764407..b4d1d566ab 100644
> > > > > > > :  --- a/target/riscv/debug.c
> > > > > > > :  +++ b/target/riscv/debug.c
> > > > > > > :  @@ -560,6 +560,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
> > > > > > > :
> > > > > > > :       if (cs->watchpoint_hit) {
> > > > > > > :           if (cs->watchpoint_hit->flags & BP_CPU) {
> > > > > > > :  +            env->badaddr = cs->watchpoint_hit->hitaddr;
> > > > > > > :               cs->watchpoint_hit = NULL;
> > > > > > > :               do_trigger_action(env, DBG_ACTION_BP);
> > > > > > > :           }
> > > > >
> > > > > ... [snip]
> > > > >
> > > > > > > +int arch_install_hw_breakpoint(struct perf_event *bp)
> > > > > > > +{
> > > > > > > +       struct arch_hw_breakpoint *info = counter_arch_bp(bp);
> > > > > > > +       struct sbi_dbtr_data_msg *xmit;
> > > > > > > +       struct sbi_dbtr_id_msg *recv;
> > > > > > > +       struct perf_event **slot;
> > > > > > > +       struct sbiret ret;
> > > > > > > +       int err = 0;
> > > > > > > +
> > > > > > > +       xmit = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*xmit)), GFP_ATOMIC);
> > > > > > > +       if (!xmit) {
> > > > > > > +               err = -ENOMEM;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       recv = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*recv)), GFP_ATOMIC);
> > > > > > > +       if (!recv) {
> > > > > > > +               err = -ENOMEM;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > >
> > > > > > Do these really need to be dynamically allocated?
> > > > >
> > > > > According to SBI extension proposal, base address of this memory chunk
> > > > > must be 16-bytes aligned. To simplify things, buffer with 'power of two
> > > > > bytes' size (and >= 16 bytes) is allocated. In this case alignment of
> > > > > the kmalloc buffer is guaranteed to be at least this size. IIUC more
> > > > > efforts are needed to guarantee such alignment for a buffer on stack.
> > >
> > > You should be able to declare the struct with __aligned(16) to get the
> > > desired alignment on the stack.
> > >
> > > > Stack is not appropriate for this. Please use a per-CPU global
> > > > data for this purpose which should be 16 byte aligned as well.
> > >
> > > Is the desire to not use the stack purely a defensive measure, i.e. to
> > > defend against a buggy or malicious firmware/hypervisor? That's fine,
> > > I'm just curious if there's rationale beyond that (though I'd argue
> > > we're already implicitly trusting whatever software is sitting below
> > > us).
> >
> > The kernel stack is fixed size so it is best to avoid large structures
> > or arrays on kernel stack.
>
> Of course, though I'm not sure I'd consider 32 bytes "large" :)

The current patch only configures one trigger at a time but if
we are configuring multiple triggers in one-go then the trigger
array will grow.

Regards,
Anup

>
> -Andrew
>
> >
> > Regards,
> > Anup
> >
> > >
> > > -Andrew
> > >
> > > >
> > > > You may also allocate a per-CPU 4K page at boot-time where
> > > > CPU X will use it's own 4K page for xmit (upper half) and
> > > > recv (lower half).
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >
> > > > > > > +
> > > > > > > +       xmit->tdata1 = info->trig_data1.value;
> > > > > > > +       xmit->tdata2 = info->trig_data2;
> > > > > > > +       xmit->tdata3 = info->trig_data3;
> > > > > > > +
> > > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_INSTALL,
> > > > > > > +                       1, __pa(xmit) >> 4, __pa(recv) >> 4,
> > > > > > > +                       0, 0, 0);
> > > > > > > +       if (ret.error) {
> > > > > > > +               pr_warn("%s: failed to install trigger\n", __func__);
> > > > > > > +               err = -EIO;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       if (recv->idx >= dbtr_total_num) {
> > > > > > > +               pr_warn("%s: invalid trigger index %lu\n", __func__, recv->idx);
> > > > > > > +               err = -EINVAL;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       slot = this_cpu_ptr(&bp_per_reg[recv->idx]);
> > > > > > > +       if (*slot) {
> > > > > > > +               pr_warn("%s: slot %lu is in use\n", __func__, recv->idx);
> > > > > > > +               err = -EBUSY;
> > > > > > > +               goto out;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       *slot = bp;
> > > > > > > +
> > > > > > > +out:
> > > > > > > +       kfree(xmit);
> > > > > > > +       kfree(recv);
> > > > > > > +
> > > > > > > +       return err;
> > > > > > > +}
> > > > >
> > > > > ... [snip]
> > > > >
> > > > > > > +static int __init arch_hw_breakpoint_init(void)
> > > > > > > +{
> > > > > > > +       union riscv_dbtr_tdata1 tdata1;
> > > > > > > +       struct sbiret ret;
> > > > > > > +
> > > > > > > +       if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
> > > > > > > +               pr_info("%s: SBI_EXT_DBTR is not supported\n", __func__);
> > > > > > > +               return 0;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > > > > > +                       0, 0, 0, 0, 0, 0);
> > > > > > > +       if (ret.error) {
> > > > > > > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > > > > > > +               return 0;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       pr_info("%s: total number of triggers: %lu\n", __func__, ret.value);
> > > > > > > +
> > > > > > > +       tdata1.value = 0;
> > > > > > > +       tdata1.type = RISCV_DBTR_TRIG_MCONTROL6;
> > > > > > > +
> > > > > > > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > > > > > > +                       tdata1.value, 0, 0, 0, 0, 0);
> > > > > > > +       if (ret.error) {
> > > > > > > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > > > > > > +               dbtr_total_num = 0;
> > > > > > > +               return 0;
> > > > > > > +       }
> > > > > >
> > > > > > nit: This is basically identical to hw_breakpoint_slots() -- just call
> > > > > > it here, or perhaps pull the DBTR_NUM_TRIGGERS ECALL into its own
> > > > > > function to reduce the duplication, e.g. 'dbtr_num_triggers(unsigned
> > > > > > long type)'?
> > > > >
> > > > > Good point. More similar requests will be added, e.g. for MCONTROL and
> > > > > possibly other trigger types. So I will add a separate
> > > > > 'dbtr_num_triggers' function.
> > > > >
> > > > > > > +
> > > > > > > +       pr_info("%s: total number of type %d triggers: %lu\n",
> > > > > > > +               __func__, tdata1.type, ret.value);
> > > > > > > +
> > > > > > > +       dbtr_total_num = ret.value;
> > > > > > > +
> > > > > > > +       return 0;
> > > > > > > +}
> > > > >
> > > > > Thanks!
> > > > > Sergey
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

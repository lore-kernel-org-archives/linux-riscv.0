Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBFBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNDXHrJIPEAIQD35nuHn1mNh2mdrsTBsTBJzkN9Hxio=; b=hN/NWX4i0m6V/y
	jo3QKJNrdLuXhtu5beIOm6+QK3Y93piYx5Yb7q7gQieExEojk3Qyt7g9OQ8Ju7/HFAPe5zvIPxw+e
	GSbYyGQWeYGPVkAkbNYTy8hysFD0jhNJuBEd8TccSMfD2tyrMIydqeJmSfd1IjpDU3GgPCWFq3gmT
	6T0POa7HagOKZ+23FCTBB8scAIPXxRiF6b+GajO3hyR8t7Z2UPYO341WErCnh68iIN27+9QW2E730
	taxZxMUz3R3SzjOgLQFOB6pel7pjAkjzsrwEbdz7T3zOyoW9NvEqNxSjPQNCdUOnIIU0Ickl8Bcto
	J+WyydlC1CXR3aLl3MtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lOF-001X7Q-5z; Thu, 16 Jun 2022 09:02:11 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lO2-001WyY-Ch
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 09:02:00 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-f2a4c51c45so1135053fac.9
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h3zsu71b4pMsQe9y3qHbb8DB1lWMTR9LJP+EMJGaafM=;
        b=MiMDJhpZ4ztZ/dhOTqy7abCK7iAgp4TxuR9vpNhk/VPG0TwqBOuanBhPAjWbt8cYLn
         DW3XTtOuJPwApxrmZ71q5EocpBxkGvmSlpX1ilzXV/mpNBRF/EUoD3G16u62tDxI8kNq
         lCrDhCuw1ayrXdV9bBTe0Dqf0q9dJhff7f7NOApKjpXIXZR3YWvdffZPvShAAZsF9dyr
         aFVQd0mhAFn5mxmslYzNUY4oVTFYjaj8RaPb4fRQ6qs3VhRebmszlb5jp/Rzi1P1znPB
         zBJfmR9Lenkr6kniF/TsG2c2z6JSm9raRbhzisB1ENljq6iyCb7ujx4fTh9KbJBg+jCJ
         54kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h3zsu71b4pMsQe9y3qHbb8DB1lWMTR9LJP+EMJGaafM=;
        b=IGhw0CjCVGkXJg3wmZqnPqNFm9Pa/0ef/Z9Q7EXrQ0vrz/Yl88zHOAYRW4qISbF58b
         LiuuWurXcSja8m/oLj/MT8MlS+GaJDIdQj0UiPSvuhwOoEnjCqpf3ghuKlzt/7uNbMzI
         abz6qGJC8jsNLH5WeWa4tE7vvf+Jt7MblhZweg7TRX8oxMehTOE/IkQ6pxNwN0yLn54E
         1UjW4V8s50h7RBqfdVYIGoi8Tu8XAnK2ZWGQP6i1M4b9DgLLeFZtmxXMyWKXclG9A0Cj
         PX/srQ5ZCPjzbfwEXtAuweZexNhAtIUnou/grnLbJQeYJpHlHPzh1FfGxC0CzXncAGuX
         0Xhw==
X-Gm-Message-State: AJIora/aqT7xZjcYgoKC2UcAoV5cCHFNg7uwH6Q+GWIq16bgcj69Yju6
	469HUJSjA9slw8mMG6NziqVi9qvLbWWDeNlB7/E0og==
X-Google-Smtp-Source: AGRyM1sxaBGC3I1EoJ4REj1kPwmiBwxD8uRBL9l5cBK7+QmttJciE/sHZlumfEOhNTjG/XT10N34Qr1w/OXQrTl8Fo8=
X-Received: by 2002:a05:6870:524b:b0:f3:2bb3:b236 with SMTP id
 o11-20020a056870524b00b000f32bb3b236mr2093089oai.195.1655370115246; Thu, 16
 Jun 2022 02:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com> <20220609071833.1051941-4-andy.chiu@sifive.com>
In-Reply-To: <20220609071833.1051941-4-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 Jun 2022 16:58:30 +0800
Message-ID: <CABgGipVKpq6Qj3L10Afsnz4iqrR5mVuTu8DGa6yfDg-8T5vZ6A@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 3/4] riscv: ftrace: use indirect jump to
 work with kernel preemption
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_020158_490214_25657048 
X-CRM114-Status: GOOD (  39.05  )
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

On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> forming a jump that jumps to an address over 4K. This may cause errors
> if we want to enable kernel preemption and remove dependency from
> patching code with stop_machine(). For example, if a task was switched
> out on auipc. And, if we changed the ftrace function before it was
> switched back, then it would jump to an address that has updated 11:0
> bits mixing with previous XLEN:12 part.
>
> p: patched area performed by dynamic ftrace
> ftrace_prologue:
> p|      REG_S   ra, -SZREG(sp)
> p|      auipc   ra, 0x? ------------> preempted
>                                         ...
>                                 change ftrace function
>                                         ...
> p|      jalr    -?(ra) <------------- switched back
> p|      REG_L   ra, -SZREG(sp)
> func:
>         xxx
>         ret
>
> To prevent such condition, we proposed a way to load or store target
> addresses atomically. We store a natually aligned 32-bit relative
> address into each ftrace prologue and use a jump at front to decide
> whether we should take ftrace detour. To reduce footprint of ftrace
> prologues, we clobber t0 and t1 and move ra (re-)storing into
> ftrace_{regs_}caller. This is similar to ARM64, which also clobbers x9 at
> each prologue.
>
> .align 4
> ftrace_prologue:
> p|      j       ftrace_cont <----> func
> p|      .word   0x? <=== store word to a 4B aligned address can be
>                          considered atomic to read sides using load word
> ftrace_cont:
>         auipc   t0, 0
>         lw      t1, -4(t0) <=== read side
>         add     t0, t0, t1
>         jalr    t0, t0
> func:
>         xxx
>         ret
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/riscv/include/asm/ftrace.h |  24 ------
>  arch/riscv/kernel/ftrace.c      | 130 ++++++++++++++++++++------------
>  arch/riscv/kernel/mcount-dyn.S  |  62 +++++++++++----
>  3 files changed, 127 insertions(+), 89 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 04dad3380041..eaa611e491fc 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -47,30 +47,6 @@ struct dyn_arch_ftrace {
>   */
>
>  #define MCOUNT_ADDR            ((unsigned long)MCOUNT_NAME)
> -#define JALR_SIGN_MASK         (0x00000800)
> -#define JALR_OFFSET_MASK       (0x00000fff)
> -#define AUIPC_OFFSET_MASK      (0xfffff000)
> -#define AUIPC_PAD              (0x00001000)
> -#define JALR_SHIFT             20
> -#define JALR_BASIC             (0x000080e7)
> -#define AUIPC_BASIC            (0x00000097)
> -#define NOP4                   (0x00000013)
> -
> -#define make_call(caller, callee, call)                                        \
> -do {                                                                   \
> -       call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -  \
> -                               (unsigned long)caller));                \
> -       call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -   \
> -                              (unsigned long)caller));                 \
> -} while (0)
> -
> -#define to_jalr_insn(offset)                                           \
> -       (((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
> -
> -#define to_auipc_insn(offset)                                          \
> -       ((offset & JALR_SIGN_MASK) ?                                    \
> -       (((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :    \
> -       ((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
>
>  /*
>   * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2086f6585773..a6eb1b1ac093 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -23,31 +23,29 @@ void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
>  }
>
>  static int ftrace_check_current_call(unsigned long hook_pos,
> -                                    unsigned int *expected)
> +                                    unsigned long expected_addr)
>  {
> -       unsigned int replaced[2];
> -       unsigned int nops[2] = {NOP4, NOP4};
> +       unsigned long replaced;
>
> -       /* we expect nops at the hook position */
> -       if (!expected)
> -               expected = nops;
> +       /* we expect ftrace_stub at the hook position */
> +       if (!expected_addr)
> +               expected_addr = (unsigned long) ftrace_stub;
>
>         /*
>          * Read the text we want to modify;
>          * return must be -EFAULT on read error
>          */
> -       if (copy_from_kernel_nofault(replaced, (void *)hook_pos,
> -                       MCOUNT_INSN_SIZE))
> +       if (copy_from_kernel_nofault(&replaced, (void *)hook_pos,
> +                       (sizeof(unsigned long))))
>                 return -EFAULT;
>
>         /*
>          * Make sure it is what we expect it to be;
>          * return must be -EINVAL on failed comparison
>          */
> -       if (memcmp(expected, replaced, sizeof(replaced))) {
> -               pr_err("%p: expected (%08x %08x) but got (%08x %08x)\n",
> -                      (void *)hook_pos, expected[0], expected[1], replaced[0],
> -                      replaced[1]);
> +       if (expected_addr != replaced) {
> +               pr_err("%p: expected (%016lx) but got (%016lx)\n",
> +                      (void *)hook_pos, expected_addr, replaced);
>                 return -EINVAL;
>         }
>
> @@ -57,55 +55,80 @@ static int ftrace_check_current_call(unsigned long hook_pos,
>  static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
>                                 bool enable)
>  {
> -       unsigned int call[2];
> -       unsigned int nops[2] = {NOP4, NOP4};
> +       unsigned long call = target;
> +       unsigned long nops = (unsigned long)ftrace_stub;
>
> -       make_call(hook_pos, target, call);
> -
> -       /* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
> +       /* Replace the target address at once. Return -EPERM on write error. */
>         if (patch_text_nosync
> -           ((void *)hook_pos, enable ? call : nops, MCOUNT_INSN_SIZE))
> +           ((void *)hook_pos, enable ? &call : &nops, sizeof(unsigned long)))
>                 return -EPERM;
>
>         return 0;
>  }
>
>  /*
> - * Put 5 instructions with 16 bytes at the front of function within
> - * patchable function entry nops' area.
> - *
> - * 0: REG_S  ra, -SZREG(sp)
> - * 1: auipc  ra, 0x?
> - * 2: jalr   -?(ra)
> - * 3: REG_L  ra, -SZREG(sp)
> + * Put 5 instructions and a 32-bit relative address to INSN1 with 24-byte at the
> + * front of function within patchable function entry nops' area.
>   *
>   * So the opcodes is:
> - * 0: 0xfe113c23 (sd)/0xfe112e23 (sw)
> - * 1: 0x???????? -> auipc
> - * 2: 0x???????? -> jalr
> - * 3: 0xff813083 (ld)/0xffc12083 (lw)
> + * INSN0_NOP: J     PC + 0x18 (jump to the real function entry)
> + * INSN0    : J     PC + 0x08 (jump to the fisrt insn)
> + * INSN1    : AUIPC T0, 0
> + * INSN2    : LW    T1, -4(T0)
> + * INSN3    : ADD   T0, T0, T1
> + * INSN4    : JALR  T0, T0
> + *
> + * At runtime, we want to patch the jump target atomically in order to work with
> + * kernel preemption. If we patched with a pair of AUIPC + JALR and a task was
> + * preempted after loading upper bits with AUIPC. Then things would mess up if
> + * we updated the jump target before the task were switched back.
> + *
> + * We also want to align all patchable function entries and, thus, the jump
> + * offset to a 4 Bytes aligned address so that each of them could be natually
> + * updated and observed by patching and running cores.
> + *
> + * | ADDR   | COMPILED | DISABLED         | ENABLED                |
> + * +--------+----------+------------------+------------------------+
> + * | 0x00   | NOP      | J     FUNC       | J  FTRACE              | <-
> + * | 0x04   | NOP      | XXXXXXXX         | 32-bit rel-jump offset | <- 4B aligned
> + * | FTRACE | NOP      | AUIPC T0, 0                               |
> + * | 0x0c   | NOP      | LW    T1, -4(T0)                          |
> + * | 0x10   | NOP      | ADD   T0, T0, T1                          |
> + * | 0x14   | NOP      | JALR  T0, T0                              |
> + * | FUNC   | X                                                    |
>   */
> -#if __riscv_xlen == 64
> -#define INSN0  0xfe113c23
> -#define INSN3  0xff813083
> -#elif __riscv_xlen == 32
> -#define INSN0  0xfe112e23
> -#define INSN3  0xffc12083
> -#endif
> +#define INSN0_NOP      0x0180006f
> +#define INSN0          0x0080006f
> +#define INSN1          0x00000297
> +#define INSN2          0xffc2a303
> +#define INSN3          0x006282b3
> +#define INSN4          0x000282e7
> +#define INSN_SIZE      4
> +
> +#define FUNC_ENTRY_JMP 8
>
> -#define FUNC_ENTRY_SIZE        16
> -#define FUNC_ENTRY_JMP 4
> +struct ftrace_prologue {
> +       unsigned int insn0;
> +       unsigned int jmp_target;
> +};
>
>  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  {
> -       unsigned int call[4] = {INSN0, 0, 0, INSN3};
> +       struct ftrace_prologue call = { .insn0 = INSN0 };
>         unsigned long target = addr;
>         unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
>
> -       call[1] = to_auipc_insn((unsigned int)(target - caller));
> -       call[2] = to_jalr_insn((unsigned int)(target - caller));
> +       call.jmp_target = (unsigned int)(target - caller);
> +       patch_insn_write(&((struct ftrace_prologue *)rec->ip)->jmp_target,
> +                        &call.jmp_target, sizeof(call.jmp_target));
> +
> +       /*
> +        * Make sure other cores do not get an out-dated jump target after it
> +        * jumps to INSN1.
> +        */
> +       smp_wmb();
>
> -       if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
> +       if (patch_text_nosync((void *)rec->ip, &call, INSN_SIZE))
>                 return -EPERM;
>
>         return 0;
> @@ -114,14 +137,24 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
>                     unsigned long addr)
>  {
> -       unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
> +       unsigned int nops[1] = {INSN0_NOP};
>
> -       if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
> +       if (patch_text_nosync((void *)rec->ip, nops, INSN_SIZE))
>                 return -EPERM;
>
>         return 0;
>  }
>
> +int __ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec,
> +                   unsigned long addr)
> +{
> +       unsigned int nops[6] = {INSN0_NOP, 0, INSN1, INSN2, INSN3, INSN4};
> +
> +       if (patch_text_nosync((void *)rec->ip, nops, sizeof(nops)))
> +               return -EPERM;
> +
> +       return 0;
> +}
>
>  /*
>   * This is called early on, and isn't wrapped by
> @@ -135,7 +168,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>         int out;
>
>         ftrace_arch_code_modify_prepare();
> -       out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +       out = __ftrace_init_nop(mod, rec, MCOUNT_ADDR);
>         ftrace_arch_code_modify_post_process();
>
>         return out;
> @@ -158,17 +191,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>                        unsigned long addr)
>  {
> -       unsigned int call[2];
> -       unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
>         int ret;
>
> -       make_call(caller, old_addr, call);
> -       ret = ftrace_check_current_call(caller, call);
> +       ret = ftrace_check_current_call(rec->ip, old_addr);
>
>         if (ret)
>                 return ret;
>
> -       return __ftrace_modify_call(caller, addr, true);
> +       return __ftrace_modify_call(rec->ip, addr, true);
>  }
>  #endif
>
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..6b7be23d02a0 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -13,7 +13,7 @@
>
>         .text
>
> -#define FENTRY_RA_OFFSET       12
> +#define FENTRY_RA_OFFSET       24
>  #define ABI_SIZE_ON_STACK      72
>  #define ABI_A0                 0
>  #define ABI_A1                 8
> @@ -25,7 +25,12 @@
>  #define ABI_A7                 56
>  #define ABI_RA                 64
>
> +# t0 points to return of ftrace
> +# ra points to the return address of traced function
> +
>         .macro SAVE_ABI
> +       REG_S   ra, -SZREG(sp)
> +       mv      ra, t0
>         addi    sp, sp, -SZREG
>         addi    sp, sp, -ABI_SIZE_ON_STACK
>
> @@ -53,10 +58,14 @@
>
>         addi    sp, sp, ABI_SIZE_ON_STACK
>         addi    sp, sp, SZREG
> +       mv      t0, ra
> +       REG_L   ra, -SZREG(sp)
>         .endm
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>         .macro SAVE_ALL
> +       REG_S   ra, -SZREG(sp)
> +       mv      ra, t0
>         addi    sp, sp, -SZREG
>         addi    sp, sp, -PT_SIZE_ON_STACK
>
> @@ -138,6 +147,8 @@
>
>         addi    sp, sp, PT_SIZE_ON_STACK
>         addi    sp, sp, SZREG
> +       mv      t0, ra # t0 is equal to ra here
> +       REG_L   ra, -SZREG(sp)
>         .endm
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>
> @@ -150,9 +161,9 @@ ENTRY(ftrace_caller)
>         REG_L   a1, ABI_SIZE_ON_STACK(sp)
>         mv      a3, sp
>
> -ftrace_call:
> -       .global ftrace_call
> -       call    ftrace_stub
> +ftrace_call_site:
> +       REG_L   ra, ftrace_call
> +       jalr    0(ra)
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>         addi    a0, sp, ABI_SIZE_ON_STACK
> @@ -161,12 +172,12 @@ ftrace_call:
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>         mv      a2, s0
>  #endif
> -ftrace_graph_call:
> -       .global ftrace_graph_call
> -       call    ftrace_stub
> +ftrace_graph_call_site:
> +       REG_L   ra, ftrace_graph_call
> +       jalr    0(ra)
>  #endif
>         RESTORE_ABI
> -       ret
> +       jr      t0
>  ENDPROC(ftrace_caller)
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> @@ -179,9 +190,9 @@ ENTRY(ftrace_regs_caller)
>         REG_L   a1, PT_SIZE_ON_STACK(sp)
>         mv      a3, sp
>
> -ftrace_regs_call:
> -       .global ftrace_regs_call
> -       call    ftrace_stub
> +ftrace_regs_call_site:
> +       REG_L   ra, ftrace_regs_call
> +       jalr    0(ra)
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>         addi    a0, sp, PT_RA
> @@ -190,12 +201,33 @@ ftrace_regs_call:
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>         mv      a2, s0
>  #endif
> -ftrace_graph_regs_call:
> -       .global ftrace_graph_regs_call
> -       call    ftrace_stub
> +ftrace_graph_regs_call_site:
> +       REG_L   ra, ftrace_graph_regs_call
> +       jalr    0(ra)
>  #endif
>
>         RESTORE_ALL
> -       ret
> +       jr      t0
>  ENDPROC(ftrace_regs_caller)
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> +
> +.align RISCV_SZPTR
> +ftrace_call:
> +       .global ftrace_call
> +       RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_graph_call:
> +       .global ftrace_graph_call
> +       RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_regs_call:
> +       .global ftrace_regs_call
> +       RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_graph_regs_call:
> +       .global ftrace_graph_regs_call
> +       RISCV_PTR ftrace_stub
> +
> --
> 2.36.0
>

Loop in: Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

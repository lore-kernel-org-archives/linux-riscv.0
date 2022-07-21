Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75CBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 05:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4cSae3OUhDcZrfE7eE++ziATXG2j+xcMpa+Emd0ZSkw=; b=mpe7efnbgwzZ/Pak3QE8KsM4BZ
	3RyaxQBR3ahDgmzhueR45kGioIENCvGzTktvaHpBgy32EnmmmdaIq8f8/9qCihhA/N39jq1Ujv4Rs
	cRIV2Cr1XEzAQfDqtKzeMAkK7ZlqeH+rli8qPpFb1pu9JLJu7kwJyWKV0IJ4Ofvw5kvUCPxig3ibT
	EasL9VMTOvG3kkSslNtxnOCF3lZGOaWE+aUuVPjZT/pc/VaCZ8Fsev4GHz+3m/Ov5LG+PGOFxFCc6
	eA4o+m350dR+n6tLoPlcW4EFp0g8v6eJ0fEaa4nXid5FphiWthS5vzyQvgGdPldjyQn+W3WcT8j9P
	S/DVjXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvL-0002Eo-6p; Thu, 21 Jul 2022 05:40:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvF-0001Zz-9F
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 05:40:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id b9so780352pfp.10
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 22:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Vig/6z9zmlZXLcY/V/Si+R/dib8H20ek9spgEh0QJEg=;
        b=cGFpVhJTA5Yv2ZcJt0HiN4hLT2XZa11yYwo6SZHGBJ0LjFmegfAyknI7T1j4/eZMt/
         QvfyXtpE3aJRceLneWqGpJIVBNGWyqOGki+MIoJzva+AXr14kNvgO4uEzeZCBb3AzabF
         Psp/tRO1CLMklIzfpY7keV0IFqlRHKrNpv8IRiMQGJmp4x4T+BUezFAnkzTUk3bkSUUr
         46nmx55qflYA8zi4ko7RZHXElqYntcolzWPe/qJ3fA3Q+M0z596BLl2dZaV66WMh3AIs
         MNyA8jpziVa45ZOlxWKtgk0XOciFNjEE5fMVKeZ8Bhm4mKg1WpADkXxCM6KmLHTdLfMh
         7jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Vig/6z9zmlZXLcY/V/Si+R/dib8H20ek9spgEh0QJEg=;
        b=V6IrkR0TYLZxiRKU0zkWMwGmEPefb/N02xq92cgOyulUrL0tGzZ/s+B478u8La1imL
         FN+dB03KkUz5KQzIXKlTAmJFony7MgPDITS3HtHaTkEvmpdHt+VAvtbVGy6YjVtgw9he
         Lz33CwTiBGLBqFUEAh5mZJu2X5hXU0v2vq7t/5y5D65h5eWleERDNahzY2k9DAxa1r5d
         sghl2TrkGBk730ST/dBekDhNANtKptYaOTEIdEzaCcsoEzqqIGlFL1/KFHfRT2F9zOwY
         YLFTy2ezRGsJZrUlaMCSWPJJsgPFCdY+mhAmiPnYRTdB+uDA9//UWX9laK3yYxCf+3bc
         uJ3w==
X-Gm-Message-State: AJIora/o2XCpuP0Z8lvo1M6SzFaXWSD0WDi8dsEHFv/BnVCzNkaA2DTf
	Gm9lx4BjUaIGlx3Rn1VpR0h+O7Qgapy67w==
X-Google-Smtp-Source: AGRyM1vSaeGZdYcYdbOiyKlljc/ANH/s/MBSc9vP2ilMcyqM0BQj6RMTobk94vTnKjCMRBiOQL2/EA==
X-Received: by 2002:a63:ec47:0:b0:419:7e6d:19b5 with SMTP id r7-20020a63ec47000000b004197e6d19b5mr37418272pgj.256.1658382018698;
        Wed, 20 Jul 2022 22:40:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902e88200b00168f08d0d12sm587986plg.89.2022.07.20.22.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 22:40:18 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:40:18 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Jul 2022 22:35:12 PDT (-0700)
Subject: Re: [RFC PATCH riscv/for-next 3/4] riscv: ftrace: use indirect jump to work with kernel preemption
In-Reply-To: <20220529143315.3678563-4-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, mingo@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rostedt@goodmis.org, guoren@linux.alibaba.com,
  andy.chiu@sifive.com, greentime.hu@sifive.com, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-68bdd58e-2250-47c1-bc54-4dfb0942e577@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_224029_366970_9152F46D 
X-CRM114-Status: GOOD (  50.17  )
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

On Sun, 29 May 2022 07:33:14 PDT (-0700), andy.chiu@sifive.com wrote:
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
> p|	REG_S	ra, -SZREG(sp)
> p|	auipc	ra, 0x? ------------> preempted
> 					...
> 				change ftrace function
> 					...
> p|	jalr	-?(ra) <------------- switched back
> p|	REG_L	ra, -SZREG(sp)
> func:
> 	xxx
> 	ret
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
> p|	j	ftrace_cont <----> func
> p|	.word	0x? <=== store word to a 4B aligned address can be
> 			 considered atomic to read sides using load word
> ftrace_cont:
> 	auipc	t0, 0
> 	lw	t1, -4(t0) <=== read side
> 	add	t0, t0, t1
> 	jalr	t0, t0
> func:
> 	xxx
> 	ret
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
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
>  #define MCOUNT_ADDR		((unsigned long)MCOUNT_NAME)
> -#define JALR_SIGN_MASK		(0x00000800)
> -#define JALR_OFFSET_MASK	(0x00000fff)
> -#define AUIPC_OFFSET_MASK	(0xfffff000)
> -#define AUIPC_PAD		(0x00001000)
> -#define JALR_SHIFT		20
> -#define JALR_BASIC		(0x000080e7)
> -#define AUIPC_BASIC		(0x00000097)
> -#define NOP4			(0x00000013)
> -
> -#define make_call(caller, callee, call)					\
> -do {									\
> -	call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -	\
> -				(unsigned long)caller));		\
> -	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
> -			       (unsigned long)caller));			\
> -} while (0)
> -
> -#define to_jalr_insn(offset)						\
> -	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
> -
> -#define to_auipc_insn(offset)						\
> -	((offset & JALR_SIGN_MASK) ?					\
> -	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
> -	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
>
>  /*
>   * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4716f4cdc038..d4bf0e5255f6 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -25,31 +25,29 @@ int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
>  }
>
>  static int ftrace_check_current_call(unsigned long hook_pos,
> -				     unsigned int *expected)
> +				     unsigned long expected_addr)
>  {
> -	unsigned int replaced[2];
> -	unsigned int nops[2] = {NOP4, NOP4};
> +	unsigned long replaced;
>
> -	/* we expect nops at the hook position */
> -	if (!expected)
> -		expected = nops;
> +	/* we expect ftrace_stub at the hook position */
> +	if (!expected_addr)
> +		expected_addr = (unsigned long) ftrace_stub;
>
>  	/*
>  	 * Read the text we want to modify;
>  	 * return must be -EFAULT on read error
>  	 */
> -	if (copy_from_kernel_nofault(replaced, (void *)hook_pos,
> -			MCOUNT_INSN_SIZE))
> +	if (copy_from_kernel_nofault(&replaced, (void *)hook_pos,
> +			(sizeof(unsigned long))))
>  		return -EFAULT;
>
>  	/*
>  	 * Make sure it is what we expect it to be;
>  	 * return must be -EINVAL on failed comparison
>  	 */
> -	if (memcmp(expected, replaced, sizeof(replaced))) {
> -		pr_err("%p: expected (%08x %08x) but got (%08x %08x)\n",
> -		       (void *)hook_pos, expected[0], expected[1], replaced[0],
> -		       replaced[1]);
> +	if (expected_addr != replaced) {
> +		pr_err("%p: expected (%016lx) but got (%016lx)\n",
> +		       (void *)hook_pos, expected_addr, replaced);
>  		return -EINVAL;
>  	}
>
> @@ -59,55 +57,80 @@ static int ftrace_check_current_call(unsigned long hook_pos,
>  static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
>  				bool enable)
>  {
> -	unsigned int call[2];
> -	unsigned int nops[2] = {NOP4, NOP4};
> +	unsigned long call = target;
> +	unsigned long nops = (unsigned long)ftrace_stub;
>
> -	make_call(hook_pos, target, call);
> -
> -	/* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
> +	/* Replace the target address at once. Return -EPERM on write error. */
>  	if (patch_text_nosync
> -	    ((void *)hook_pos, enable ? call : nops, MCOUNT_INSN_SIZE))
> +	    ((void *)hook_pos, enable ? &call : &nops, sizeof(unsigned long)))
>  		return -EPERM;
>
>  	return 0;
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

You could cut out a few instructions here by using a full 64-bit address 
and generating the PC by replacing the jump-past-trampoline with a "jal 
t0, ...", but it's probably best to sort out the ordering issues first.

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
> -#define INSN0	0xfe113c23
> -#define INSN3	0xff813083
> -#elif __riscv_xlen == 32
> -#define INSN0	0xfe112e23
> -#define INSN3	0xffc12083
> -#endif
> +#define INSN0_NOP	0x0180006f
> +#define INSN0		0x0080006f
> +#define INSN1		0x00000297
> +#define INSN2		0xffc2a303
> +#define INSN3		0x006282b3
> +#define INSN4		0x000282e7
> +#define INSN_SIZE	4
> +
> +#define FUNC_ENTRY_JMP	8
>
> -#define FUNC_ENTRY_SIZE	16
> -#define FUNC_ENTRY_JMP	4
> +struct ftrace_prologue {
> +	unsigned int insn0;
> +	unsigned int jmp_target;
> +};
>
>  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  {
> -	unsigned int call[4] = {INSN0, 0, 0, INSN3};
> +	struct ftrace_prologue call = { .insn0 = INSN0 };
>  	unsigned long target = addr;
>  	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
>
> -	call[1] = to_auipc_insn((unsigned int)(target - caller));
> -	call[2] = to_jalr_insn((unsigned int)(target - caller));
> +	call.jmp_target = (unsigned int)(target - caller);
> +	patch_insn_write(&((struct ftrace_prologue *)rec->ip)->jmp_target,
> +			 &call.jmp_target, sizeof(call.jmp_target));
> +
> +	/*
> +	 * Make sure other cores do not get an out-dated jump target after it
> +	 * jumps to INSN1.
> +	 */
> +	smp_wmb();

We're definately in a grey area here, but I don't see the ISA manual 
requiring this behavior from this fence: this orders the stores, but it 
doesn't even prevent reordering on the load side (and we don't have a 
load->load dependency here, but a fetch->load dependency).  I'm not 
entirely sure what the best way to enfornce this ordering is, as by the 
time we're executing any code on a remote hart we've gone through enough 
fences it doesn't really matter any more.

Without the ordering, there are three possible executions:

* Take the jump past the trampoline.  This is safe.
* Take the jump into the trampoline, then load the target offset.  This 
  is also safe.
* Take the jump into the trampoline, then load the old target offset.  
  This isn't safe, as the address may be invalid (it starts at 0, for 
  example).

I can't really figure out why hardware would produce that last case, but 
I also can't find anything that forbids it in the spec.  The whole 
instruction fetch ordering stuff is pretty loosly written so I'm not 
sure how strong of an argument that is, but we'd at least need some 
testing on actual hardware to sort out whether this works in practice.

That said, I think we can just avoid the problem entirely by making sure 
that last case executes correctly: just fill the initial data with a 
stub routine that does a full data fence (and a fence.i too) and 
re-tries the load.  It's still kind of vague when it comes to ISA 
requirements, but we've got this dependency baked into a bunch of other 
software and it's the biggest fence we can do so it's not like there's 
any better options.

> -	if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
> +	if (patch_text_nosync((void *)rec->ip, &call, INSN_SIZE))
>  		return -EPERM;
>
>  	return 0;
> @@ -116,14 +139,24 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
>  		    unsigned long addr)
>  {
> -	unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
> +	unsigned int nops[1] = {INSN0_NOP};
>
> -	if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
> +	if (patch_text_nosync((void *)rec->ip, nops, INSN_SIZE))
>  		return -EPERM;
>
>  	return 0;
>  }
>
> +int __ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec,
> +		    unsigned long addr)
> +{
> +	unsigned int nops[6] = {INSN0_NOP, 0, INSN1, INSN2, INSN3, INSN4};
> +
> +	if (patch_text_nosync((void *)rec->ip, nops, sizeof(nops)))
> +		return -EPERM;
> +
> +	return 0;
> +}
>
>  /*
>   * This is called early on, and isn't wrapped by
> @@ -137,7 +170,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  	int out;
>
>  	ftrace_arch_code_modify_prepare();
> -	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +	out = __ftrace_init_nop(mod, rec, MCOUNT_ADDR);
>  	ftrace_arch_code_modify_post_process();
>
>  	return out;
> @@ -160,17 +193,14 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>  		       unsigned long addr)
>  {
> -	unsigned int call[2];
> -	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
>  	int ret;
>
> -	make_call(caller, old_addr, call);
> -	ret = ftrace_check_current_call(caller, call);
> +	ret = ftrace_check_current_call(rec->ip, old_addr);
>
>  	if (ret)
>  		return ret;
>
> -	return __ftrace_modify_call(caller, addr, true);
> +	return __ftrace_modify_call(rec->ip, addr, true);
>  }
>  #endif
>
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..6b7be23d02a0 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -13,7 +13,7 @@
>
>  	.text
>
> -#define FENTRY_RA_OFFSET	12
> +#define FENTRY_RA_OFFSET	24
>  #define ABI_SIZE_ON_STACK	72
>  #define ABI_A0			0
>  #define ABI_A1			8
> @@ -25,7 +25,12 @@
>  #define ABI_A7			56
>  #define ABI_RA			64
>
> +# t0 points to return of ftrace
> +# ra points to the return address of traced function
> +
>  	.macro SAVE_ABI
> +	REG_S	ra, -SZREG(sp)
> +	mv	ra, t0
>  	addi	sp, sp, -SZREG
>  	addi	sp, sp, -ABI_SIZE_ON_STACK
>
> @@ -53,10 +58,14 @@
>
>  	addi	sp, sp, ABI_SIZE_ON_STACK
>  	addi	sp, sp, SZREG
> +	mv	t0, ra
> +	REG_L	ra, -SZREG(sp)
>  	.endm
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  	.macro SAVE_ALL
> +	REG_S	ra, -SZREG(sp)
> +	mv	ra, t0
>  	addi	sp, sp, -SZREG
>  	addi	sp, sp, -PT_SIZE_ON_STACK
>
> @@ -138,6 +147,8 @@
>
>  	addi	sp, sp, PT_SIZE_ON_STACK
>  	addi	sp, sp, SZREG
> +	mv	t0, ra # t0 is equal to ra here
> +	REG_L	ra, -SZREG(sp)
>  	.endm
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
>
> @@ -150,9 +161,9 @@ ENTRY(ftrace_caller)
>  	REG_L	a1, ABI_SIZE_ON_STACK(sp)
>  	mv	a3, sp
>
> -ftrace_call:
> -	.global ftrace_call
> -	call	ftrace_stub
> +ftrace_call_site:
> +	REG_L	ra, ftrace_call
> +	jalr	0(ra)
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  	addi	a0, sp, ABI_SIZE_ON_STACK
> @@ -161,12 +172,12 @@ ftrace_call:
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>  	mv	a2, s0
>  #endif
> -ftrace_graph_call:
> -	.global ftrace_graph_call
> -	call	ftrace_stub
> +ftrace_graph_call_site:
> +	REG_L	ra, ftrace_graph_call
> +	jalr	0(ra)
>  #endif
>  	RESTORE_ABI
> -	ret
> +	jr	t0
>  ENDPROC(ftrace_caller)
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> @@ -179,9 +190,9 @@ ENTRY(ftrace_regs_caller)
>  	REG_L	a1, PT_SIZE_ON_STACK(sp)
>  	mv	a3, sp
>
> -ftrace_regs_call:
> -	.global ftrace_regs_call
> -	call	ftrace_stub
> +ftrace_regs_call_site:
> +	REG_L	ra, ftrace_regs_call
> +	jalr	0(ra)
>
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  	addi	a0, sp, PT_RA
> @@ -190,12 +201,33 @@ ftrace_regs_call:
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>  	mv	a2, s0
>  #endif
> -ftrace_graph_regs_call:
> -	.global ftrace_graph_regs_call
> -	call	ftrace_stub
> +ftrace_graph_regs_call_site:
> +	REG_L	ra, ftrace_graph_regs_call
> +	jalr	0(ra)
>  #endif
>
>  	RESTORE_ALL
> -	ret
> +	jr	t0
>  ENDPROC(ftrace_regs_caller)
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
> +
> +.align RISCV_SZPTR
> +ftrace_call:
> +	.global ftrace_call
> +	RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_graph_call:
> +	.global ftrace_graph_call
> +	RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_regs_call:
> +	.global ftrace_regs_call
> +	RISCV_PTR ftrace_stub
> +
> +.align RISCV_SZPTR
> +ftrace_graph_regs_call:
> +	.global ftrace_graph_regs_call
> +	RISCV_PTR ftrace_stub
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

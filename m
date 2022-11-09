Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F73C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpXCOrSBhyHGK2AWT6nynmZew+W2c9V60LAblBwfW9w=; b=a8K0xduMiGljZt
	aIo338JOagRP4kp4Fxwa1/aln5wcgPUr3r/vdJ53CoTeoFuvcox6FyyWwFq0fgZw6OcDVOOl3445c
	2nCa6TRnasB8KvaKAa+gpkBLHKkAFwL+YzquFH+yhdSHVfhemKkEt1BlH6MD2K9MEl8k0z1/ZUYxW
	UrYly3d2UYzJWhvmvdhktiBDNpfs2ZdbAXBAFlG0eUrlv4TOm9IeIFWieJX8ZrD641h60zAjRC4kJ
	4W+f1uihhYg5O2AarnL9oiyRplhxQ2o9CFYmiY3YXro5VXnMD86f1xBioQg6b+mFtRZ+LjXjzkq0U
	6a3NUqaUGurXj0G8DIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osZsX-009eck-Vq; Wed, 09 Nov 2022 01:27:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osZsU-009ebE-PC
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 01:27:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id q9so15343589pfg.5
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 17:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTNMO4ck2krXz++IbBwhQ3ijjUgWxkKz9BEoZHo6y3I=;
        b=NQU8H5A4L1pu8n9aX/u/fdgBeTsB92TRoUCas++Wq2U47ze1vXQbN5kMKqbcdw4KU7
         pqcfiuhxAEtWlrgBhgfSRM9lzCvN1NKZRn1/Vrq1mQ/OAyipfmCn9AESHXkRAFU2ilIS
         Hb8tGealiQREStnxSFmSlDqKzawZ+Pgv8Dl9PSeYu65QVb9cx/2vPzwlL5kwI59PKLw1
         eFEUFuN1sJH3wTW8Bpmu9XggJby78Q4Wt3E3/jYCSC9ZOWvbbfba/brOOsEdpxcw98eK
         5a4nR4MfxzHMUw8rU4l4vqW64e3IkXtvha1KAltpzZ6lb6g8TcAcX58z8X9WgLHGrtlK
         Aesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTNMO4ck2krXz++IbBwhQ3ijjUgWxkKz9BEoZHo6y3I=;
        b=T6O1Q87vGUxfO2m1jyxorvKTTFgq+RGlmWgrOtJL7snogh4kHvoghxnTSEhg2gbVZd
         3RlafDKKUc8frZsaWEqYMGn4LGphMBat+uL4SuSh5Zy24NCC1R1uRXEPEydaRURSFoD7
         /8lMN3bXiq3jo9rFNNoaGn2f4wW9jLG37ch0dPl3pxO5DcVUOkbBiAPQQPkVl2rI4lmW
         P1iDE48cis9zGDRI5qxsx1mD62sS45nALjjIrbv/V7lsqi9G8xPEQTAz3gh3R/IuCjys
         j2dnkiUlIv1kuXb7w4FH7050Uo5Y+qqki9YFxncDgDKylXNBwM+M36kvHH//VpjA0SvW
         0/9g==
X-Gm-Message-State: ACrzQf0d0ezu0M9zwKQWGZEpD4TI0MuoRTWdVfkeg00RLDSkjwenxjpt
	ifLGvLpKlQ3WuOkS5f1PYMe7cg==
X-Google-Smtp-Source: AMsMyM6eL7brZj6EJJj1SSZHlqWgSus0UcfCF0Vgs3aUuypQ7Ex6Np8S09nwKj+b3bhTrjwlqsCprQ==
X-Received: by 2002:a05:6a00:140a:b0:56c:b679:f812 with SMTP id l10-20020a056a00140a00b0056cb679f812mr58769082pfu.46.1667957255680;
        Tue, 08 Nov 2022 17:27:35 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b00186e34524e3sm7556782plk.136.2022.11.08.17.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 17:27:35 -0800 (PST)
Message-ID: <0b065367-c51d-10fc-795c-697555d40863@rivosinc.com>
Date: Tue, 8 Nov 2022 17:27:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 10/17] riscv: Add sigcontext save/restore for vector
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dao Lu <daolu@rivosinc.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-arch <linux-arch@vger.kernel.org>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-10-stillson@rivosinc.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20220921214439.1491510-10-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_172742_853232_9492FBD2 
X-CRM114-Status: GOOD (  41.16  )
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

+CC linux-arch, Al Viro

On 9/21/22 14:43, Chris Stillson wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds sigcontext save/restore for vector. The vector registers
> will be saved in datap pointer. The datap pointer will be allocated
> dynamically when the task needs in kernel space. The datap pointer will
> be set right after the __riscv_v_state data structure to save all the
> vector registers in the signal handler stack.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>   arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
>   arch/riscv/kernel/asm-offsets.c          |   2 +
>   arch/riscv/kernel/signal.c               | 165 ++++++++++++++++++++++-
>   3 files changed, 187 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
> index 84f2dfcfdbce..b8a0fd7d7cfc 100644
> --- a/arch/riscv/include/uapi/asm/sigcontext.h
> +++ b/arch/riscv/include/uapi/asm/sigcontext.h
> @@ -8,6 +8,23 @@
>   
>   #include <asm/ptrace.h>
>   
> +/* The Magic number for signal context frame header. */
> +#define RVV_MAGIC	0x53465457
> +#define END_MAGIC	0x0
> +
> +/* The size of END signal context header. */
> +#define END_HDR_SIZE	0x0
> +
> +struct __riscv_ctx_hdr {
> +	__u32 magic;
> +	__u32 size;
> +};
> +
> +struct __sc_riscv_v_state {
> +	struct __riscv_ctx_hdr head;
> +	struct __riscv_v_state v_state;
> +} __attribute__((aligned(16)));
> +
>   /*
>    * Signal context structure
>    *
> @@ -17,6 +34,13 @@
>   struct sigcontext {
>   	struct user_regs_struct sc_regs;
>   	union __riscv_fp_state sc_fpregs;
> +	/*
> +	 * 4K + 128 reserved for vector state and future expansion.
> +	 * This space is enough to store the vector context whose VLENB
> +	 * is less or equal to 128.
> +	 * (The size of the vector context is 4144 byte as VLENB is 128)

At first glace it seems this only supports 128 byte V regs. Better to 
add some words saying that wider reg file is handled in code too.

> +	 */
> +	__u8 __reserved[4224] __attribute__((__aligned__(16)));

Is alignment of 8 not enough or is this future-proofing.

> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 37e3e6a8d877..80316ef7bb78 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -75,6 +75,8 @@ void asm_offsets(void)
>   	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
>   #endif
>   
> +	OFFSET(RISCV_V_STATE_MAGIC, __riscv_ctx_hdr, magic);
> +	OFFSET(RISCV_V_STATE_SIZE, __riscv_ctx_hdr, size);
>   	OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
>   	OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
>   	OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 38b05ca6fe66..41d9a02c7098 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -20,15 +20,16 @@
>   #include <asm/csr.h>
>   
>   extern u32 __user_rt_sigreturn[2];
> +static size_t rvv_sc_size;
>   
>   #define DEBUG_SIG 0
>   
>   struct rt_sigframe {
>   	struct siginfo info;
> -	struct ucontext uc;
>   #ifndef CONFIG_MMU
>   	u32 sigreturn_code[2];
>   #endif
> +	struct ucontext uc;
>   };

Just for the record this is NOT a userspace abi change (for SA_SIGINFO 
signal handlers in userspace) since they are only provided struct 
ucontext pointer. kernel is free to rearrange stuff in struct 
rt_sigframe as it deems fits.

>   
>   #ifdef CONFIG_FPU
> @@ -85,16 +86,155 @@ static long save_fp_state(struct pt_regs *regs,
>   #define restore_fp_state(task, regs) (0)
>   #endif
>   
> +#ifdef CONFIG_VECTOR
> +static long restore_v_state(struct pt_regs *regs, void **sc_reserved_ptr)

For ease of reading I would move save before restore.

> +{
> +	long err;
> +	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(*sc_reserved_ptr);
> +	void *datap;
> +	__u32 magic;
> +	__u32 size;
> +
> +	/* Get magic number and check it. */
> +	err = __get_user(magic, &state->head.magic);
> +	err = __get_user(size, &state->head.size);
> +	if (unlikely(err))
> +		return err;
> +
> +	if (magic != RVV_MAGIC || size != rvv_sc_size)
> +		return -EINVAL;
> +
> +	/* Copy everything of __sc_riscv_v_state except datap. */
> +	err = __copy_from_user(&current->thread.vstate, &state->v_state,
> +			       RISCV_V_STATE_DATAP);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Copy the pointer datap itself. */
> +	err = __get_user(datap, &state->v_state.datap);
> +	if (unlikely(err))
> +		return err;
> +
> +
> +	/* Copy the whole vector content from user space datap. */
> +	err = __copy_from_user(current->thread.vstate.datap, datap, riscv_vsize);
> +	if (unlikely(err))
> +		return err;
> +
> +	vstate_restore(current, regs);
> +
> +	/* Move sc_reserved_ptr to point the next signal context frame. */
> +	*sc_reserved_ptr += size;
> +
> +	return err;
> +}
> +
> +static long save_v_state(struct pt_regs *regs, void **sc_reserved_free_ptr)
> +{
> +	/*
> +	 * Put __sc_riscv_v_state to the user's signal context space pointed
> +	 * by sc_reserved_free_ptr and the datap point the address right
> +	 * after __sc_riscv_v_state.
> +	 */
> +	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)
> +		(*sc_reserved_free_ptr);
> +	void *datap = state + 1;
> +	long err;
> +
> +	*sc_reserved_free_ptr += rvv_sc_size;
> +
> +	err = __put_user(RVV_MAGIC, &state->head.magic);
> +	err = __put_user(rvv_sc_size, &state->head.size);

Can we copy these markers *after* the actual context is succesfully 
copied. What if it fails (user stack can't grow anymore etc), then we 
leave this half cooked state on stack.

Granted the process would most likely be killed anyways in such case.

> +
> +	vstate_save(current, regs);
> +	/* Copy everything of vstate but datap. */
> +	err = __copy_to_user(&state->v_state, &current->thread.vstate,
> +			     RISCV_V_STATE_DATAP);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Copy the pointer datap itself. */
> +	err = __put_user(datap, &state->v_state.datap);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Copy the whole vector content to user space datap. */
> +	err = __copy_to_user(datap, current->thread.vstate.datap, riscv_vsize);
> +
> +	return err;
> +}
> +#else
> +#define save_v_state(task, regs) (0)
> +#define restore_v_state(task, regs) (0)
> +#endif
> +
>   static long restore_sigcontext(struct pt_regs *regs,
>   	struct sigcontext __user *sc)
>   {
>   	long err;
> +	void *sc_reserved_ptr = sc->__reserved;
>   	/* sc_regs is structured the same as the start of pt_regs */
>   	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
>   	/* Restore the floating-point state. */
>   	if (has_fpu())
>   		err |= restore_fp_state(regs, &sc->sc_fpregs);
> +
> +	while (1 && !err) {
> +		__u32 magic, size;
> +		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_reserved_ptr;
> +
> +		err |= __get_user(magic, &head->magic);
> +		err |= __get_user(size, &head->size);
> +		if (err)
> +			goto done;
> +
> +		switch (magic) {
> +		case 0:
> +			if (size)
> +				goto invalid;
> +			goto done;
> +		case RVV_MAGIC:
> +			if (!has_vector())
> +				goto invalid;
> +			if (size != rvv_sc_size)
> +				goto invalid;
> +			err |= restore_v_state(regs, &sc_reserved_ptr);
> +			break;

See question below. Is this 2 pass header check due to Vector or for 
some future extension ?

> +		default:
> +			goto invalid;
> +		}
> +	}
> +done:
>   	return err;
> +
> +invalid:
> +	return -EINVAL;
> +}
> +
> +static size_t cal_rt_frame_size(void)

> +{
> +	struct rt_sigframe __user *frame;
> +	static size_t frame_size;
> +	size_t total_context_size = 0;
> +	size_t sc_reserved_size = sizeof(frame->uc.uc_mcontext.__reserved);

Perhaps nit-picking, but "sc_reserved_size" and such names are 
confusing. Its ok to call the mcontext field __reserved but in rest of 
code lets avoid reserved - plain sctxt or some such will suffice.

> +
> +	if (frame_size)
> +		goto done;
> +
> +	frame_size = sizeof(*frame);
> +
> +	if (has_vector())
> +		total_context_size += rvv_sc_size;
> +	/* Preserved a __riscv_ctx_hdr for END signal context header. */
> +	total_context_size += sizeof(struct __riscv_ctx_hdr);
> +
> +	if (total_context_size > sc_reserved_size)
> +		frame_size += (total_context_size - sc_reserved_size);
> +
> +	frame_size = round_up(frame_size, 16);
> +done:
> +	return frame_size;

This seems to be a one time computation, given we are checking a static 
frame_size everytime, could we just calculate this once in 
init_rt_signal_env() below in a now file scoped static variable ?

> +
>   }
>   
>   SYSCALL_DEFINE0(rt_sigreturn)
> @@ -103,13 +243,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   	struct rt_sigframe __user *frame;
>   	struct task_struct *task;
>   	sigset_t set;
> +	size_t frame_size = cal_rt_frame_size();
>   
>   	/* Always make any pending restarted system calls return -EINTR */
>   	current->restart_block.fn = do_no_restart_syscall;
>   
>   	frame = (struct rt_sigframe __user *)regs->sp;
>   
> -	if (!access_ok(frame, sizeof(*frame)))
> +	if (!access_ok(frame, frame_size))
>   		goto badframe;
>   
>   	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
> @@ -142,11 +283,20 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>   {
>   	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
>   	long err;
> +	void *sc_reserved_free_ptr = sc->__reserved;
> +
>   	/* sc_regs is structured the same as the start of pt_regs */
>   	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>   	/* Save the floating-point state. */
>   	if (has_fpu())
>   		err |= save_fp_state(regs, &sc->sc_fpregs);
> +	/* Save the vector state. */
> +	if (has_vector())
> +		err |= save_v_state(regs, &sc_reserved_free_ptr);
> +
> +	/* Put END __riscv_ctx_hdr at the end. */
> +	err = __put_user(END_MAGIC, &((struct __riscv_ctx_hdr *)sc_reserved_free_ptr)->magic);
> +	err = __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr *)sc_reserved_free_ptr)->size);

I really don't understand the need for this trailing header stuff. Is 
this due to variable sized vector or enginnering for a yet to be 
invented future extension's state.
But if so, won't we add a new ctx_hdr + magic for "foo" when that 
happens. After all we were not doing this for existing FP stuff, granted 
FP is all fixed size.

For Vector: magic+size tuple should be enough to identify/locate the ctx 
info.


>   	return err;
>   }
>   
> @@ -178,9 +328,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>   {
>   	struct rt_sigframe __user *frame;
>   	long err = 0;
> +	size_t frame_size = cal_rt_frame_size();
>   
> -	frame = get_sigframe(ksig, regs, sizeof(*frame));
> -	if (!access_ok(frame, sizeof(*frame)))
> +	frame = get_sigframe(ksig, regs, frame_size);
> +	if (!access_ok(frame, frame_size))
>   		return -EFAULT;
>   
>   	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
> @@ -326,3 +477,9 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
>   	if (thread_info_flags & _TIF_NOTIFY_RESUME)
>   		resume_user_mode_work(regs);
>   }
> +
> +void init_rt_signal_env(void);
> +void __init init_rt_signal_env(void)
> +{
> +	rvv_sc_size = sizeof(struct __sc_riscv_v_state) + riscv_vsize;

See above, should be precompute the output of cal_rt_frame_size() here too.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

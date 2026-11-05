Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A562606A32D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E0pudgsU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RN4YfyjO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=knNPZnAYUk8W/E0GHWZyY9tg6aTkrzCc9JD72C0qYvI=; b=E0pudgsUv+x6ZgoELebEAGZyqt
	9NsbBphWwjQIofi0QOVRqyZ8BBNRJTmWPHt3SzoEB0G3q8wCSfzAAPkLTStIPEqoedIgE6U8+TDc6
	kuuE4pSuPeznvB3D5ucQZITAmICx711nEpEXWJkhLJv7bwHvwuUqVEw0BtDmKrpJM3DVAeQg0SArO
	P932w2a7lVNS4QbNxaHKartQk7B6j1l8yQshxb+9n2jZQimAtqQCNLTHKLm6fw1Ut9nG/u9HYVqDS
	s5+EYicyd0XsGDRU/SePmXP3i4Xr2wAOnyztpaDiCo3pUDANRpXcT/rf9d0mZaq/7YTZ9MhB5ulUe
	ZzZVcjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxXt-000000097vX-1Lpa;
	Thu, 05 Nov 2026 13:30:25 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxXo-000000097ui-3bkc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 13:30:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XBahw6M146sZLugvzmS/iUpJqDvqvUDfx3QgY4OtwYg=;
	b=RN4YfyjOyS5ooaP/OoqlyjO4HSTgKglyVRvAwmVEwiinlbqINXY/ET1GFZdNx+ACF7CF2K21b
	GMltJwbdS6v8FwT2TBpiUpUas65+TPBMyv5V86ZErLqrrSu9ZrtVQWRF4bHHh0PeyPh1Liu3Cid
	DMPq+7XD1GxnaxoccEs+z30=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jL38G5xVrzKm6Y;
	Thu,  5 Nov 2026 21:30:06 +0800 (CST)
Received: from dggpemr500012.china.huawei.com (unknown [7.185.36.140])
	by mail.maildlp.com (Postfix) with ESMTPS id 33A2E40586;
	Thu,  5 Nov 2026 21:30:13 +0800 (CST)
Received: from whupemq100006.china.huawei.com (7.152.184.206) by
 dggpemr500012.china.huawei.com (7.185.36.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 5 Nov 2026 21:30:12 +0800
Received: from [10.67.110.154] (10.67.110.154) by
 whupemq100006.china.huawei.com (7.152.184.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 5 Nov 2026 21:30:10 +0800
Message-ID: <ad060270-6e32-4dcf-9830-6d2ffbfc0783@huawei.com>
Date: Thu, 5 Nov 2026 21:30:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 bpf-next 1/3] riscv: bpf: Add BPF private stack support
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<memxor@gmail.com>, <bjorn@kernel.org>, <puranjay@kernel.org>,
	<eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<ihor.solodrai@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <shuah@kernel.org>, <rgbi3307@gmail.com>,
	<guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261104100411.997-1-cp0613@linux.alibaba.com>
 <20261104100411.997-2-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20261104100411.997-2-cp0613@linux.alibaba.com>
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemq100006.china.huawei.com (7.152.184.206)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053021_561963_7A9CE31C 
X-CRM114-Status: GOOD (  38.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pei,

On 2026/11/4 18:04, Chen Pei wrote:
> A program on a private stack keeps its BPF frames in a per-CPU area of
> its own rather than on the kernel stack of whichever context entered it.
> bpf_enable_priv_stack() grants that mode only once the JIT reports
> bpf_jit_supports_private_stack(), which riscv64 did not: programs there
> always ran on the kernel stack, and a struct_ops program that requires
> one was rejected with -EACCES.
> 
> Allocate a per-CPU area of the verifier calculated depth plus a 16 byte
> guard region at each end, and point BPF_REG_FP (S5) at the top of it
> while leaving SP on the kernel stack. Every BPF stack access already
> goes through S5, and S5 is callee-saved with each subprog deriving its
> own, so nothing else in the JIT has to know about the private stack.
> 
> The outgoing stack argument area stays in the kernel frame: callers
> write it relative to SP, callees relative to RV_REG_FP, which the
> prologue sets to the caller's SP.
> 
> The per-CPU lookup is emitted after the tail call entry point: a program
> using a private stack can still be entered as a tail call target, and
> RV_TAILCALL_OFFSET is a constant added to the target's bpf_func, so what
> is in front of it must be the same size in every program.
> 
> The base is materialized with absolute moves, as on arm64, x86-64 and
> powerpc64: the vmalloc'd per-CPU area is beyond an auipc pair from the
> JIT region, and riscv64 has no register holding the per-CPU offset, so
> the address of __per_cpu_offset is loaded too. emit_imm() is a choice
> there, not a requirement; emit_addr() as used by
> insn_is_mov_percpu_addr() would need an extra_pass argument and an error
> return in bpf_jit_build_prologue(), touching bpf_jit_comp32.c too. Both
> constants are fixed before the offset convergence loop, so the prologue
> length is stable across passes.
> 
> The guard value follows arm64, x86-64 and powerpc64, and the 16 byte
> two-copy region at each end follows arm64 and powerpc64, since x86-64
> uses an 8 byte guard with a single copy. A jited program has them
> checked when it is freed, reporting the first corrupted CPU only;
> failure paths release the area unchecked since the image never ran,
> which also clears priv_stack_ptr for the later bpf_jit_free().
> 
> RV32 does not declare support and keeps the existing kernel stack
> behaviour.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   arch/riscv/net/bpf_jit.h        |  1 +
>   arch/riscv/net/bpf_jit_comp64.c | 42 +++++++++++++++--
>   arch/riscv/net/bpf_jit_core.c   | 84 +++++++++++++++++++++++++++++----
>   3 files changed, 115 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 21a190a6a6d9..efab2b6803e4 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -14,6 +14,7 @@
>   
>   #define RV_MAX_REG_ARGS		8
>   #define RV_EXTRA_STK_ARGS	(RV_MAX_REG_ARGS - MAX_BPF_FUNC_REG_ARGS)
> +#define PRIV_STACK_GUARD_SZ	16
>   
>   /* verify runtime detection extension status */
>   #define rv_ext_enabled(ext) \
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 371405598faa..a7a7d2f9da85 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -2134,12 +2134,34 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	return 0;
>   }
>   
> +static void emit_priv_stack_frame(struct rv_jit_context *ctx)
> +{
> +	u64 fp = (__force u64)ctx->prog->aux->priv_stack_ptr + PRIV_STACK_GUARD_SZ;
> +
> +	fp += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
> +	emit_imm(RV_REG_S5, fp, ctx);
> +#ifdef CONFIG_SMP
> +	emit_lw(RV_REG_T1, offsetof(struct thread_info, cpu), RV_REG_TP, ctx);
> +	emit_imm(RV_REG_T2, (u64)__per_cpu_offset, ctx);
> +	emit_sh3add(RV_REG_T1, RV_REG_T1, RV_REG_T2, ctx);
> +	emit_ld(RV_REG_T1, 0, RV_REG_T1, ctx);
> +	emit_add(RV_REG_S5, RV_REG_S5, RV_REG_T1, ctx);
> +#endif
> +}
> +
>   void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   {
> +	bool priv_stack = ctx->prog->aux->priv_stack_ptr;
>   	int i, stack_adjust = 0, store_offset, bpf_stack_adjust = ctx->stack_arg_sz;
>   
> -	bpf_stack_adjust += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
> -	if (bpf_stack_adjust)
> +	/*
> +	 * With a private stack only the outgoing stack argument area is left in
> +	 * this frame. It has to stay: the caller writes it relative to SP while
> +	 * the callee reads it relative to RV_REG_FP, the caller's SP set below.
> +	 */
> +	if (!priv_stack)
> +		bpf_stack_adjust += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
> +	if (bpf_stack_adjust || priv_stack)
>   		mark_fp(ctx);
>   
>   	if (seen_reg(RV_REG_RA, ctx))
> @@ -2217,7 +2239,16 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   
>   	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
>   
> -	if (bpf_stack_adjust)
> +	/*
> +	 * Point BPF_REG_FP at the top of this CPU's private stack. A program
> +	 * with one can still be entered as a tail call target, at
> +	 * RV_TAILCALL_OFFSET, so this has to come after that entry point; the
> +	 * offset is a constant added to the target's bpf_func, so everything in
> +	 * front of it must also be the same size in every program.
> +	 */
> +	if (priv_stack)
> +		emit_priv_stack_frame(ctx);
> +	else if (bpf_stack_adjust)
>   		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
>   
>   	ctx->stack_size = stack_adjust;
> @@ -2320,3 +2351,8 @@ bool bpf_jit_supports_hmul(void)
>   {
>   	return true;
>   }
> +
> +bool bpf_jit_supports_private_stack(void)
> +{
> +	return true;
> +}
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index f2497ec7d378..f2021088e447 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -9,6 +9,7 @@
>   #include <linux/bpf.h>
>   #include <linux/filter.h>
>   #include <linux/memory.h>
> +#include <linux/percpu.h>
>   #include <asm/text-patching.h>
>   #include <asm/cfi.h>
>   #include "bpf_jit.h"
> @@ -44,6 +45,62 @@ bool bpf_jit_needs_zext(void)
>   	return true;
>   }
>   
> +#define PRIV_STACK_GUARD_VAL	0xEB9F12345678eb9fULL

a nit, let move it with the PRIV_STACK_GUARD_SZ	macro.

others, looks good.

Reviewed-by: Pu Lehui <pulehui@huawei.com>

> +
> +static u32 priv_stack_size(struct bpf_prog *prog)
> +{
> +	return round_up(prog->aux->stack_depth, STACK_ALIGN) +
> +	       2 * PRIV_STACK_GUARD_SZ;
> +}
> +
> +static int alloc_priv_stack(struct bpf_prog *prog)
> +{
> +	u32 size = priv_stack_size(prog);
> +	u32 end = (size - PRIV_STACK_GUARD_SZ) / sizeof(u64);
> +	void __percpu *ptr;
> +	int cpu, i;
> +
> +	ptr = __alloc_percpu_gfp(size, STACK_ALIGN, GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	for_each_possible_cpu(cpu) {
> +		u64 *stack = per_cpu_ptr(ptr, cpu);
> +
> +		for (i = 0; i < PRIV_STACK_GUARD_SZ / sizeof(u64); i++) {
> +			stack[i] = PRIV_STACK_GUARD_VAL;
> +			stack[end + i] = PRIV_STACK_GUARD_VAL;
> +		}
> +	}
> +	prog->aux->priv_stack_ptr = ptr;
> +	return 0;
> +}
> +
> +static void priv_stack_check_guard(struct bpf_prog *prog)
> +{
> +	u32 end = (priv_stack_size(prog) - PRIV_STACK_GUARD_SZ) / sizeof(u64);
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		u64 *stack = per_cpu_ptr(prog->aux->priv_stack_ptr, cpu);
> +
> +		if (stack[0] != PRIV_STACK_GUARD_VAL ||
> +		    stack[1] != PRIV_STACK_GUARD_VAL ||
> +		    stack[end] != PRIV_STACK_GUARD_VAL ||
> +		    stack[end + 1] != PRIV_STACK_GUARD_VAL) {
> +			pr_err("bpf-jit: private stack overflow/underflow guard of prog %s corrupted on CPU %d\n",
> +			       bpf_jit_get_prog_name(prog), cpu);
> +			return;
> +		}
> +	}
> +}
> +
> +static void free_priv_stack(struct bpf_prog *prog)
> +{
> +	free_percpu(prog->aux->priv_stack_ptr);
> +	prog->aux->priv_stack_ptr = NULL;
> +}
> +
>   struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>   {
>   	unsigned int prog_size = 0, extable_size = 0;
> @@ -84,12 +141,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>   			    round_up((stack_arg_cnt - RV_EXTRA_STK_ARGS) * 8, STACK_ALIGN) : 0;
>   
>   	ctx->prog = prog;
> +	if (prog->aux->jits_use_priv_stack && alloc_priv_stack(prog))
> +		goto out_free_hdr;
> +
>   	ctx->offset = kvzalloc_objs(int, prog->len);
>   	if (!ctx->offset)
> -		goto out_offset;
> +		goto out_free_hdr;
>   
>   	if (build_body(ctx, extra_pass, NULL))
> -		goto out_offset;
> +		goto out_free_hdr;
>   
>   	for (i = 0; i < prog->len; i++) {
>   		prev_ninsns += 32;
> @@ -104,7 +164,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>   		ctx->prologue_len = ctx->ninsns;
>   
>   		if (build_body(ctx, extra_pass, ctx->offset))
> -			goto out_offset;
> +			goto out_free_hdr;
>   
>   		ctx->epilogue_offset = ctx->ninsns;
>   		bpf_jit_build_epilogue(ctx);
> @@ -124,7 +184,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>   							  bpf_fill_ill_insns,
>   							  bpf_prog_was_classic(prog));
>   			if (!jit_data->ro_header)
> -				goto out_offset;
> +				goto out_free_hdr;
>   
>   			/*
>   			 * Use the image(RW) for writing the JITed instructions. But also save
> @@ -190,10 +250,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>   			ctx->offset[i] = ctx->offset[i - 1];
>   		ctx->offset[0] = ninsns_rvoff(ctx->prologue_len);
>   		bpf_prog_update_insn_ptrs(prog, ctx->offset, jit_data->ro_image);
> -out_offset:
> -		kvfree(ctx->offset);
> -		kfree(jit_data);
> -		prog->aux->jit_data = NULL;
> +		goto out_free_ctx;

happy to see this, this place was indeed very confusing before.

>   	}
>   
>   	return prog;
> @@ -209,7 +266,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>   				   sizeof(jit_data->header->size));
>   		bpf_jit_binary_pack_free(jit_data->ro_header, jit_data->header);
>   	}
> -	goto out_offset;
> +	free_priv_stack(prog);
> +out_free_ctx:
> +	kvfree(ctx->offset);
> +	kfree(jit_data);
> +	prog->aux->jit_data = NULL;
> +	return prog;
>   }
>   
>   u64 bpf_jit_alloc_exec_limit(void)
> @@ -261,6 +323,10 @@ void bpf_jit_free(struct bpf_prog *prog)
>   		prog->bpf_func = (void *)prog->bpf_func - cfi_get_offset();
>   		hdr = bpf_jit_binary_pack_hdr(prog);
>   		bpf_jit_binary_pack_free(hdr, NULL);
> +		if (prog->aux->priv_stack_ptr) {
> +			priv_stack_check_guard(prog);
> +			free_priv_stack(prog);
> +		}
>   		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
>   	}
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

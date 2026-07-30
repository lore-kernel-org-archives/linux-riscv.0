Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A65C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVKa53c0nB63rOZUcuAMvvhwd2XnQjgy1V3rmcyGwWc=; b=RfiEknH2qcmPPm
	VoErmr6skbIVx6rtsrHN6EamyMw1vT0FQGk987guKXdwZnLflopiyij4XJH6gQg6ncj1LK2z473Xs
	FkHpiuFmEB8Xe4C34/Zc/t3YJGpUoH9QggKdygwvtA5e9VZMqRyUd625+1gW5IggBI80jfWnZMu6y
	EbYW26LS0pnbBowKqYn+eG+WKCDvgBwi50yvd+T6m3jMjFjQuOTGjJBTEnqDm7psUBd9L426S1sBA
	NrefFzpMcR6aPgdePsGrZsgWOUQf8C5ZEp7Pa/IRbILuU0IvbtxCx7JlzsCsP9O/h2qhDw1+ZkyNd
	bpivHHNS6QVe63/35H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMw3-00000009yvW-27ts;
	Thu, 30 Jul 2026 09:20:15 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMw0-00000009yuA-1pAj
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:20:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/28blu1NG36zbLxIrIgwc+Efg+/pqw6U48OltEuk0aY=;
	b=BcHBTWfVrUNK6NhhjQTKPiUOxiFOcExi/aAXvImQ9qaz5MGswsFbCylT7zCys3+D5pgtV28qm
	Qp1YOcw0mAld6Vm+ih7Aq4sreLDcejWKv+fLUCFo99UFbNvmrbkuZQb7tmpPDg7+tlWPaFPNxg3
	3tgRWQX10ptG8PeR1ubBf7Q=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h9k1n40F3z1prQc;
	Thu, 30 Jul 2026 17:10:21 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3AA0F4057F;
	Thu, 30 Jul 2026 17:19:51 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 30 Jul
 2026 17:19:50 +0800
Message-ID: <bb134352-087d-451f-948a-2c8b635047d0@huawei.com>
Date: Thu, 30 Jul 2026 17:19:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 4/6] riscv, bpf: Split prologue and epilogue
 into helper functions
Content-Language: en-US
To: Varun R Mallya <varunrmallya@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <bjorn@kernel.org>
CC: <alex@ghiti.fr>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<puranjay@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
 <20260722140015.1982158-5-varunrmallya@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260722140015.1982158-5-varunrmallya@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_022013_130245_B36DFE5F 
X-CRM114-Status: GOOD (  23.42  )
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


Hi Varun,

looks good to me, but some real small nits.

On 2026/7/22 22:00, Varun R Mallya wrote:
> Split bpf_jit_build_prologue() and __build_epilogue() into helpers.
> normal_stack_adjust() computes the frame size for the callee-saved
> registers a program actually clobbers, emit_normal_prologue() allocates
> the frame and spills those registers, and emit_normal_restore() reloads
> them.
> 
> The kcfi preamble, fentry nops and tail-call-counter setup are hoisted
> before the frame-size computation and they do not depend on it and the
> emitted instruction sequence is unchanged.
> 
> No functional change.
> 
> Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 152 ++++++++++++++++++--------------
>   1 file changed, 87 insertions(+), 65 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index ad089a9a4ea9..b804382075c4 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -198,9 +198,84 @@ static void emit_imm(u8 rd, s64 val, struct rv_jit_context *ctx)
>   		emit_addi(rd, rd, lower, ctx);
>   }
>   

pls use the following comment format:

/*
  * xxx
  */

or

/* xxx */

> -static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
> +/* Stack space for the callee-saved registers a normal program spills,

how about, the registers based strictly on what is seen in the bpf prog.

> + * excluding the BPF stack itself.
> + */
> +static int normal_stack_adjust(struct rv_jit_context *ctx)
>   {
> -	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
> +	int stack_adjust = 0;
> +
> +	if (seen_reg(RV_REG_RA, ctx))
> +		stack_adjust += 8;
> +	stack_adjust += 8; /* RV_REG_FP */
> +	if (seen_reg(RV_REG_S1, ctx))
> +		stack_adjust += 8;
> +	if (seen_reg(RV_REG_S2, ctx))
> +		stack_adjust += 8;
> +	if (seen_reg(RV_REG_S3, ctx))
> +		stack_adjust += 8;
> +	if (seen_reg(RV_REG_S4, ctx))
> +		stack_adjust += 8;
> +	if (seen_reg(RV_REG_S5, ctx))
> +		stack_adjust += 8;
> +	if (ctx->arena_vm_start)
> +		stack_adjust += 8;
> +	stack_adjust += 8; /* RV_REG_TCC */
> +
> +	return round_up(stack_adjust, STACK_ALIGN);
> +}
> +
> +/* Allocate the frame and save the callee-saved registers the program
> + * actually clobbers, then point FP at the frame top.
> + */
> +static void emit_normal_prologue(struct rv_jit_context *ctx, int stack_adjust)

prefer to let ctx as last param, and the following pls make a change.

> +{
> +	int store_offset = stack_adjust - 8;
> +	/* tailcall starts here, emit insn before it must be fixed */

remove this comment.

> +
> +	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
> +
> +	if (seen_reg(RV_REG_RA, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
> +		store_offset -= 8;
> +	}
> +	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
> +	store_offset -= 8;
> +	if (seen_reg(RV_REG_S1, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
> +		store_offset -= 8;
> +	}
> +	if (seen_reg(RV_REG_S2, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
> +		store_offset -= 8;
> +	}
> +	if (seen_reg(RV_REG_S3, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
> +		store_offset -= 8;
> +	}
> +	if (seen_reg(RV_REG_S4, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
> +		store_offset -= 8;
> +	}
> +	if (seen_reg(RV_REG_S5, ctx)) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
> +		store_offset -= 8;
> +	}
> +	if (ctx->arena_vm_start) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
> +		store_offset -= 8;
> +	}
> +
> +	/* store TCC from RV_REG_TCC to stack */
> +	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
> +	ctx->tcc_offset = store_offset;
> +
> +	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
> +}
> +
> +static void emit_normal_restore(struct rv_jit_context *ctx, int stack_adjust) > +{
> +	int store_offset = stack_adjust - 8;
>   
>   	if (seen_reg(RV_REG_RA, ctx)) {
>   		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
> @@ -235,6 +310,13 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
>   
>   	/* restore TCC from stack to RV_REG_TCC */
>   	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
> +}
> +
> +static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
> +{
> +	int stack_adjust = ctx->stack_size;
> +
> +	emit_normal_restore(ctx, stack_adjust);
>   
>   	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
>   	/* Set return value. */
> @@ -2006,34 +2088,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   {
> -	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
> +	int i, stack_adjust, bpf_stack_adjust;
>   
>   	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
>   	if (bpf_stack_adjust)
>   		mark_fp(ctx);
>   
> -	if (seen_reg(RV_REG_RA, ctx))
> -		stack_adjust += 8;
> -	stack_adjust += 8; /* RV_REG_FP */
> -	if (seen_reg(RV_REG_S1, ctx))
> -		stack_adjust += 8;
> -	if (seen_reg(RV_REG_S2, ctx))
> -		stack_adjust += 8;
> -	if (seen_reg(RV_REG_S3, ctx))
> -		stack_adjust += 8;
> -	if (seen_reg(RV_REG_S4, ctx))
> -		stack_adjust += 8;
> -	if (seen_reg(RV_REG_S5, ctx))
> -		stack_adjust += 8;
> -	if (ctx->arena_vm_start)
> -		stack_adjust += 8;
> -	stack_adjust += 8; /* RV_REG_TCC */
> -
> -	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
> -	stack_adjust += bpf_stack_adjust;
> -
> -	store_offset = stack_adjust - 8;
> -
>   	/* emit kcfi type preamble immediately before the  first insn */
>   	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
>   
> @@ -2046,46 +2106,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   	if (!is_subprog)
>   		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
>   
> -	/* tailcall starts here, emit insn before it must be fixed */

keep this comment here.

> -
> -	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
> -
> -	if (seen_reg(RV_REG_RA, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
> -		store_offset -= 8;
> -	}
> -	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
> -	store_offset -= 8;
> -	if (seen_reg(RV_REG_S1, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
> -		store_offset -= 8;
> -	}
> -	if (seen_reg(RV_REG_S2, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
> -		store_offset -= 8;
> -	}
> -	if (seen_reg(RV_REG_S3, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
> -		store_offset -= 8;
> -	}
> -	if (seen_reg(RV_REG_S4, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
> -		store_offset -= 8;
> -	}
> -	if (seen_reg(RV_REG_S5, ctx)) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
> -		store_offset -= 8;
> -	}
> -	if (ctx->arena_vm_start) {
> -		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
> -		store_offset -= 8;
> -	}
> -
> -	/* store TCC from RV_REG_TCC to stack */
> -	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
> -	ctx->tcc_offset = store_offset;
> -
> -	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
> +	stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
> +	emit_normal_prologue(ctx, stack_adjust);
>   
>   	if (bpf_stack_adjust)
>   		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD68C624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic0dE3OF+rVAO2fM0H+m5ioFbBJTw6mZOGa/HcBL5ZI=; b=iXgMf1p3KOgEsmBVXF/RIPeVbm
	9ghDl8Kl8Z75GcTfpVhHGVhmESQ33oyAPZupn/M0AKeJGiDIMvX9OADiWf/1uptL/G+WQjmSu+Ieg
	z4ocidGiSxPOF+XB1/WAA8rzLVp1/5CwIntEnM6UmdPjEtBVqfQ12y9sPfIxVmFGOAHgic2hESRKw
	wpD2KdhqDW6+BJr++cn+6MkJ5A+tGHI43xvo62GXwcR4qM7t5mSErHU51+gMl2swJibwJe8JV4TgO
	N4Kj31rdH+VetiYspbHVXlkiulFPkLUO3FvqyAfSk35n/erdX5A1S+2Fbzo51/SjPOWcKdb6Hpxe1
	ndWx3hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJz-00000003p0w-3GpJ;
	Sat, 05 Sep 2026 08:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lJv-00000003ozp-3axU
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B94B3600E2;
	Sat,  5 Sep 2026 08:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4976F1F00A3E;
	Sat,  5 Sep 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595214;
	bh=jd7wevDUqLErtg9VgaM84Yfx1htFuCdlyNRCsT18Zek=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=GhAXa2bhB9ZhppjTNXADjPibAvQc3qk/5nNOtwRFFfVIWXLRbMmtBI8I06ucospYN
	 iYO0q5XgbW1ZHxoNJ3p8dvxJCrwzCjwDisyj76IXFfZVwY8m+Oa6AIb5KWnKdWCbnD
	 WCJh8iN+nHcZGoHd3o/obkZTreAH5n7crSXo2HUjQ/ti7sDbpqE3MagnkYNgSiCleF
	 1stJqSDG7p0ROef4XBQMW9CskNvAeWb3/mKfI7ketdKSWKFkR7i/2PXpMwHPpqPp9b
	 tXthyzdThuMx32bqwibdaVi+haK7ewSVFLZQ+Byaa1nDt3Sq/0D9q01pLohtrgEy1C
	 5Q5h4JCLqRz8g==
Content-Type: multipart/mixed; boundary="===============8810913334160696580=="
MIME-Version: 1.0
Message-Id: <fc702295c9ff5bdad0622a0aebbeadb040a0fabc0b79c6e904c968a516de859b@mail.kernel.org>
In-Reply-To: <20260905070409.4141522-3-pulehui@huaweicloud.com>
References: <20260905070409.4141522-3-pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v4 2/3] riscv, bpf: Add BPF stack arguments support for RV64 JIT
From: bot+bpf-ci@kernel.org
To: pulehui@huaweicloud.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,jiangfeng@kylinos.cn
Cc: bjorn@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,alex@ghiti.fr,pulehui@huawei.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat,  5 Sep 2026 08:00:13 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8810913334160696580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 419b9d795f2a..039877f286fc 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -82,6 +82,7 @@ struct rv_jit_context {
>  	unsigned long flags;
>  	int stack_size;
>  	int tcc_offset;
> +	int stack_arg_sz;
>  	u64 arena_vm_start;
>  	u64 user_vm_start;
>  };
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index aac128b9f0a4..cda99c1f9ffe 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -498,6 +498,18 @@ static void emit_ldx(u8 rd, s16 off, u8 rs, u8 size, bool sign_ext,
>  	ctx->ex_jmp_off = ctx->ninsns;
>  }
>
> +static void emit_stack_arg_ldx(u8 rd, s16 off, struct rv_jit_context *ctx)
> +{
> +	int idx = off / 8 - 1;
> +
> +	if (idx < 3) {
> +		emit_mv(rd, RV_REG_A5 + idx, ctx);
> +		return;
> +	}
> +
> +	emit_ldx_insn(rd, (idx - 3) * 8, RV_REG_FP, BPF_DW, false, ctx);
> +}
> +

This isn't a bug, but the literal 3 appears seven times across this file
and bpf_jit_core.c (lines 505, 510, 535, 540, 563, 568, and bpf_jit_core.c
line 78). The value really represents RV_MAX_REG_ARGS - MAX_BPF_FUNC_REG_ARGS
(8 - 5). The file already defines RV_MAX_REG_ARGS symbolically and uses it in
the kfunc fix-up loop (if (idx < RV_MAX_REG_ARGS) / (idx - RV_MAX_REG_ARGS)),
but the stack argument helpers use the literal instead.

Would a named constant (e.g. NR_STACK_ARG_REGS = RV_MAX_REG_ARGS -
MAX_BPF_FUNC_REG_ARGS) placed in bpf_jit.h be worth it here, so the same
value in bpf_jit_core.c and the three emit helpers cannot drift apart? arm64
uses NR_STACK_ARG_REGS with an explicit stack_arg_reg[] table.

>  static void emit_st(u8 rd, s16 off, s32 imm, u8 size, struct rv_jit_context *ctx)
>  {
>  	emit_imm(RV_REG_T1, imm, ctx);
> @@ -515,6 +527,19 @@ static void emit_st(u8 rd, s16 off, s32 imm, u8 size, struct rv_jit_context *ctx
>  	ctx->ex_jmp_off = ctx->ninsns;
>  }
>
> +static void emit_stack_arg_st(s16 off, s32 imm, struct rv_jit_context *ctx)
> +{
> +	int idx = -off / 8 - 1;
> +
> +	emit_imm(RV_REG_T1, imm, ctx);
> +	if (idx < 3) {
> +		emit_mv(RV_REG_A5 + idx, RV_REG_T1, ctx);
> +		return;
> +	}
> +
> +	emit_stx_insn(RV_REG_SP, (idx - 3) * 8, RV_REG_T1, BPF_DW, ctx);
> +}
> +

This isn't a bug, but for idx < 3 (the common case, covering BPF args 6-8),
could this be emit_imm(RV_REG_A5 + idx, imm, ctx) directly, avoiding the
RV_REG_T1 round trip and one instruction per store? The emit_imm then emit_mv
sequence is carried over from emit_st() where materialising into a scratch
register is unavoidable because the destination is memory. Here in the
register case the immediate could be materialised straight into the
destination. The two sibling helpers (emit_stack_arg_ldx, emit_stack_arg_stx)
have no scratch use at all, and arm64's emit_stack_arg_store() writes the
immediate path directly into the argument register.

> +static void emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
> +{
> +	if (is_12b_int(off)) {
> @@ -531,6 +556,18 @@ static void emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
>  	ctx->ex_jmp_off = ctx->ninsns;
>  }
>
> +static void emit_stack_arg_stx(s16 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	int idx = -off / 8 - 1;
> +
> +	if (idx < 3) {
> +		emit_mv(RV_REG_A5 + idx, rs, ctx);
> +		return;
> +	}
> +
> +	emit_stx_insn(RV_REG_SP, (idx - 3) * 8, rs, BPF_DW, ctx);
> +}
> +

[ ... ]

> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index cbfcd287ea16..ed48005568c8 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -48,6 +48,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	int pass = 0, prev_ninsns = 0, i;
>  	struct rv_jit_data *jit_data;
>  	struct rv_jit_context *ctx;
> +	u16 stack_arg_cnt;
>
>  	if (!prog->jit_requested)
>  		return prog;
> @@ -71,6 +72,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>
>  	ctx->arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
>  	ctx->user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
> +
> +	stack_arg_cnt = bpf_out_stack_arg_cnt(env, prog);
> +	/* First 3 stack args in regs, rest on stack */
> +	ctx->stack_arg_sz = stack_arg_cnt > 3 ? round_up((stack_arg_cnt - 3) * 8, STACK_ALIGN) : 0;
> +
>  	ctx->prog = prog;
>  	ctx->offset = kvzalloc_objs(int, prog->len);
>  	if (!ctx->offset)


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33952202002
--===============8810913334160696580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8810913334160696580==--


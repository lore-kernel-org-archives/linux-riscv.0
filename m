Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A7AFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH3f/kPccwH37DsIKN5372IvOzx1XTTC2QMtrhM0Sx4=; b=ZmXuBp9lqIQQuwEw4PuUBMEBmK
	cAF0cYBDyua8nt4+TXkmVssk7yUHNLs0hidyoWJAayuRF/E/sA0oblDHhpIYz8aoMGbTeefUB+bs3
	KTHYcXLbn5027+znaPE3MXGmJq5MHXw9K0pZvaJJqZ0nHxWFN4Eu4O8n2bZHjl06i+emNfdGyWKaS
	HzpZxDVVWchyheWt3TXhcmQGmdT0SRZ13O+gi9X6VbWsheBiINGsyzhBE8NHFrEfnupKv/VKQNxzx
	9oNiYLmUIHjOt6fajvfeFSIzLmoNkgr3H51hmTzrJZZkUPBfJYnhjZt72bCQErgblk5GzZNlxWr9r
	fHSFqgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jK-00000003e67-3xwt;
	Wed, 29 Apr 2026 13:13:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jI-00000003e5J-3sYS
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 13:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4BD9419CB;
	Wed, 29 Apr 2026 13:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B99C19425;
	Wed, 29 Apr 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777468407;
	bh=IVUujablr4MgQBnJMVr/PI5mqLf/UiwDGu7fRHBTPhs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=ZbShTKQA+Z/1J33zT7I9IGOwp4IiZ+EBhHsxSQDLTGAKPE13cno2WDMvPKVLy60MG
	 ghejryKO8DyR6Cxkg+yRfG7nTri3HGFO3DdmfMlseful2EnEnRN1YweYqSFVvZ0D77
	 0Pl0Y6fU0R0mVWbG/TWbwOmUYH6+y9KjY+8eF4mghYxeeG1FIZEGAqtBXOBpxfMJk5
	 t4hB2zExcfIjS31njE1oP+DE/4av6YBBa2Z66ck4X2IEtOQ6iR6GEVHGzvnKu8q+3p
	 PQ+e1dfX9pwHjKpXVFKLauR+FqPPyV8l+sTFyfo1dd2lhQsFY1E9YS8qKDNAT+ZDB2
	 XsJEib2tJ0DTg==
Content-Type: multipart/mixed; boundary="===============6202103066093586817=="
MIME-Version: 1.0
Message-Id: <6e8625d76aa00e21260cbed92fdc217191ab162f42a4544aadd75c49f3242ec3@mail.kernel.org>
In-Reply-To: <20260429123513.3477780-2-visitorckw@gmail.com>
References: <20260429123513.3477780-2-visitorckw@gmail.com>
Subject: Re: [PATCH bpf-next 1/3] riscv, bpf: Fix support for BPF_SDIV and BPF_SMOD in RV32 JIT
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,luke.r.nels@gmail.com,xi.wang@gmail.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,alex@ghiti.fr,jserv@ccns.ncku.edu.tw,eleanor15x@gmail.com,marscheng@google.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,visitorckw@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 29 Apr 2026 13:13:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061329_006048_CE558885 
X-CRM114-Status: GOOD (  12.40  )
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

--===============6202103066093586817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index 592dd86fbf81..7396899ea276 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -509,7 +509,7 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
>  }
>
>  static void emit_alu_r32(const s8 *dst, const s8 *src,
> -			 struct rv_jit_context *ctx, const u8 op)
> +			 struct rv_jit_context *ctx, const u8 op, bool is_sdiv)
>  {
>  	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
>  	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
> @@ -539,10 +539,16 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
>  		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
>  		break;
>  	case BPF_DIV:
> -		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
> +		if (is_sdiv)
> +			emit(rv_div(lo(rd), lo(rd), lo(rs)), ctx);
> +		else
> +			emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
>  		break;
>  	case BPF_MOD:
> -		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
> +		if (is_sdiv)
> +			emit(rv_rem(lo(rd), lo(rd), lo(rs)), ctx);
> +		else
> +			emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
>  		break;
>  	case BPF_LSH:
>  		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
> @@ -959,6 +965,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  	u8 code = insn->code;
>  	s16 off = insn->off;
>  	s32 imm = insn->imm;
> +	bool is_sdiv = false;
>
>  	const s8 *dst = bpf2rv32[insn->dst_reg];
>  	const s8 *src = bpf2rv32[insn->src_reg];
> @@ -1041,7 +1048,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  			emit_imm32(tmp2, imm, ctx);
>  			src = tmp2;
>  		}
> -		emit_alu_r32(dst, src, ctx, BPF_OP(code));
> +		if ((BPF_OP(code) == BPF_DIV || BPF_OP(code) == BPF_MOD) && insn->off == 1)
> +			is_sdiv = true;
> +		emit_alu_r32(dst, src, ctx, BPF_OP(code), is_sdiv);
>  		break;
>
>  	case BPF_ALU | BPF_MOV | BPF_K:
> @@ -1065,7 +1074,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  		 * src is ignored---choose tmp2 as a dummy register since it
>  		 * is not on the stack.
>  		 */
> -		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
> +		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code), false);
>  		break;
>
>  	case BPF_ALU | BPF_END | BPF_FROM_LE:


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25109627626
--===============6202103066093586817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6202103066093586817==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB60C3ABBE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gfj/NVO7RD/eQZ9PUnL1yTdMkc9yqTM2+ZQ9uEj2H6Y=; b=VgdnkhFT+2c8ve
	DrrWr78MruYWbsMJbsQKxdwANoA8PP9YEx1TsdhHTkBy2aH3eFJ9SK/S+9REpNXvR8nyHG1HA6dT1
	T8yO96VhWwWaVWUCz5eJj4D0YJp8r9JLBGxQ98NflZAvkwADLvbE/rJV96lwjJuvwXfqO9l2ImJMc
	j40QfLZXuF6fs3Xl0p4YE15X5QJGq7ZC5YyObWSYFzx5DoARxVqQyJzHg67ikY3SjRgLiBy8S1PeN
	Mgj0Ym7B7kTx7uSoUB9q9wynseuWr4XPsThI57GaFm1LbOEw8Pj6USGVUS3ZCBog5awaoSYuNMR44
	qKgFQ+0IJe16nFh0AQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMoc-0000000Cwui-43bM;
	Tue, 06 May 2025 18:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ9u-0000000CIIr-0t7X
	for linux-riscv@bombadil.infradead.org;
	Tue, 06 May 2025 14:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3bvrdQpodTWEFeopZW47GI/64qqncXqoeKSTzuldTgs=; b=n3evTyIh2Ak6+xshxgA5GqNxHJ
	ksVn+maZNwyW3AWRX1m9JU+9oH4u6Nbv8Bue0tks5xUjVGUMNdzPuDzpSqnNZCH10VBMwR8r+lHVz
	4SikbtpEyc7k1jb9+hSVHM+RfuT5QJMOHpafOTOWA8xzjym8SwsppoOI2juSE6WpbUG30XBK4L//I
	bHCK9xj3wEtVyov2jsmwhzO0UV75g44j+VkZAVYAK/fQMkMc5LZsrP4DEgMtl/8kEGzpOAi/vTUPJ
	nSbtpND+lmAm+tBaAUC7X7vqePyFRhiGWWfOzFZRQN20WnA5cOpYhXkrQ2/maHSczrQcVjgC92nEh
	ozzJO49w==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCJ9p-0000000FeYX-3lIm
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 14:20:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZsL6k5ddBz2CdcW;
	Tue,  6 May 2025 22:16:30 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AEDA180044;
	Tue,  6 May 2025 22:20:06 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 22:20:04 +0800
Message-ID: <a50a1c64-683b-4356-99ec-103017f7a6be@huawei.com>
Date: Tue, 6 May 2025 22:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: Andrea Parri <parri.andrea@gmail.com>, <linux-riscv@lists.infradead.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <248aa4b0ef7e439e0446d25732af7246d119c6a9.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <248aa4b0ef7e439e0446d25732af7246d119c6a9.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_152031_284975_52F31F79 
X-CRM114-Status: GOOD (  23.79  )
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



On 2025/4/30 8:50, Peilin Ye wrote:
> From: Andrea Parri <parri.andrea@gmail.com>
> 
> Support BPF load-acquire (BPF_LOAD_ACQ) and store-release
> (BPF_STORE_REL) instructions in the riscv64 JIT compiler.  For example,
> consider the following 64-bit load-acquire (assuming little-endian):
> 
>    db 10 00 00 00 01 00 00  r1 = load_acquire((u64 *)(r1 + 0x0))
>    95 00 00 00 00 00 00 00  exit
> 
>    opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
>    imm (0x00000100): BPF_LOAD_ACQ
> 
> The JIT compiler will emit an LD instruction followed by a FENCE R,RW
> instruction for the above, e.g.:
> 
>    ld x7,0(x6)
>    fence r,rw
> 
> Similarly, consider the following 16-bit store-release:
> 
>    cb 21 00 00 10 01 00 00  store_release((u16 *)(r1 + 0x0), w2)
>    95 00 00 00 00 00 00 00  exit
> 
>    opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
>    imm (0x00000110): BPF_STORE_REL
> 
> A FENCE RW,W instruction followed by an SH instruction will be emitted,
> e.g.:
> 
>    fence rw,w
>    sh x2,0(x4)
> 
> 8-bit and 16-bit load-acquires are zero-extending (cf., LBU, LHU).  The
> verifier always rejects misaligned load-acquires/store-releases (even if
> BPF_F_ANY_ALIGNMENT is set), so the emitted load and store instructions
> are guaranteed to be single-copy atomic.
> 
> Introduce primitives to emit the relevant (and the most common/used in
> the kernel) fences, i.e. fences with R -> RW, RW -> W and RW -> RW.
> 
> Rename emit_atomic() to emit_atomic_rmw() to make it clear that it only
> handles RMW atomics, and replace its is64 parameter to allow to perform
> the required checks on the opsize (BPF_SIZE(code)).
> 
> Tested-by: Peilin Ye <yepeilin@google.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> [yepeilin@google.com: whitespace changes; cosmetic changes to commit
>                        title and message]
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/riscv/net/bpf_jit.h        | 15 +++++++
>   arch/riscv/net/bpf_jit_comp64.c | 77 ++++++++++++++++++++++++++++++---
>   2 files changed, 85 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 1d1c78d4cff1..e7b032dfd17f 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -608,6 +608,21 @@ static inline u32 rv_fence(u8 pred, u8 succ)
>   	return rv_i_insn(imm11_0, 0, 0, 0, 0xf);
>   }
>   
> +static inline void emit_fence_r_rw(struct rv_jit_context *ctx)
> +{
> +	emit(rv_fence(0x2, 0x3), ctx);
> +}
> +
> +static inline void emit_fence_rw_w(struct rv_jit_context *ctx)
> +{
> +	emit(rv_fence(0x3, 0x1), ctx);
> +}
> +
> +static inline void emit_fence_rw_rw(struct rv_jit_context *ctx)
> +{
> +	emit(rv_fence(0x3, 0x3), ctx);
> +}
> +
>   static inline u32 rv_nop(void)
>   {
>   	return rv_i_insn(0, 0, 0, 0, 0x13);
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 953b6a20c69f..b71a9c88fb4f 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -607,11 +607,65 @@ static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
>   	emit_sd(RV_REG_T1, 0, rs, ctx);
>   }
>   
> -static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
> -			struct rv_jit_context *ctx)
> +static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_jit_context *ctx)
> +{
> +	switch (imm) {
> +	/* dst_reg = load_acquire(src_reg + off16) */
> +	case BPF_LOAD_ACQ:
> +		switch (BPF_SIZE(code)) {
> +		case BPF_B:
> +			emit_load_8(false, rd, off, rs, ctx);
> +			break;
> +		case BPF_H:
> +			emit_load_16(false, rd, off, rs, ctx);
> +			break;
> +		case BPF_W:
> +			emit_load_32(false, rd, off, rs, ctx);
> +			break;
> +		case BPF_DW:
> +			emit_load_64(false, rd, off, rs, ctx);
> +			break;
> +		}
> +		emit_fence_r_rw(ctx);
> +		break;
> +	/* store_release(dst_reg + off16, src_reg) */
> +	case BPF_STORE_REL:
> +		emit_fence_rw_w(ctx);
> +		switch (BPF_SIZE(code)) {
> +		case BPF_B:
> +			emit_store_8(rd, off, rs, ctx);
> +			break;
> +		case BPF_H:
> +			emit_store_16(rd, off, rs, ctx);
> +			break;
> +		case BPF_W:
> +			emit_store_32(rd, off, rs, ctx);
> +			break;
> +		case BPF_DW:
> +			emit_store_64(rd, off, rs, ctx);
> +			break;
> +		}
> +		break;
> +	default:
> +		pr_err_once("bpf-jit: invalid atomic load/store opcode %02x\n", imm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int emit_atomic_rmw(u8 rd, u8 rs, s16 off, s32 imm, u8 code,
> +			   struct rv_jit_context *ctx)
>   {
>   	u8 r0;
>   	int jmp_offset;
> +	bool is64;
> +
> +	if (BPF_SIZE(code) != BPF_W && BPF_SIZE(code) != BPF_DW) {
> +		pr_err_once("bpf-jit: 1- and 2-byte RMW atomics are not supported\n");
> +		return -EINVAL;
> +	}
> +	is64 = BPF_SIZE(code) == BPF_DW;
>   
>   	if (off) {
>   		if (is_12b_int(off)) {
> @@ -688,9 +742,14 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
>   		     rv_sc_w(RV_REG_T3, rs, rd, 0, 1), ctx);
>   		jmp_offset = ninsns_rvoff(-6);
>   		emit(rv_bne(RV_REG_T3, 0, jmp_offset >> 1), ctx);
> -		emit(rv_fence(0x3, 0x3), ctx);
> +		emit_fence_rw_rw(ctx);
>   		break;
> +	default:
> +		pr_err_once("bpf-jit: invalid atomic RMW opcode %02x\n", imm);
> +		return -EINVAL;
>   	}
> +
> +	return 0;
>   }
>   
>   #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
> @@ -1259,7 +1318,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   {
>   	bool is64 = BPF_CLASS(insn->code) == BPF_ALU64 ||
>   		    BPF_CLASS(insn->code) == BPF_JMP;
> -	int s, e, rvoff, ret, i = insn - ctx->prog->insnsi;
> +	int s, e, rvoff, ret = 0, i = insn - ctx->prog->insnsi;
>   	struct bpf_prog_aux *aux = ctx->prog->aux;
>   	u8 rd = -1, rs = -1, code = insn->code;
>   	s16 off = insn->off;
> @@ -1962,10 +2021,14 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	case BPF_STX | BPF_MEM | BPF_DW:
>   		emit_store_64(rd, off, rs, ctx);
>   		break;
> +	case BPF_STX | BPF_ATOMIC | BPF_B:
> +	case BPF_STX | BPF_ATOMIC | BPF_H:
>   	case BPF_STX | BPF_ATOMIC | BPF_W:
>   	case BPF_STX | BPF_ATOMIC | BPF_DW:
> -		emit_atomic(rd, rs, off, imm,
> -			    BPF_SIZE(code) == BPF_DW, ctx);
> +		if (bpf_atomic_is_load_store(insn))
> +			ret = emit_atomic_ld_st(rd, rs, off, imm, code, ctx);
> +		else
> +			ret = emit_atomic_rmw(rd, rs, off, imm, code, ctx);
>   		break;
>   
>   	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
> @@ -2050,7 +2113,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		return -EINVAL;
>   	}
>   
> -	return 0;
> +	return ret;

`ret` may be a value greater than zero, which will potentially cause 
build_body to skip the next instruction. Let's `return 0` here, and 
`return ret` if the above fails.

>   }
>   
>   void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

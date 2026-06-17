Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D003DCD98EE
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 06:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZzk5nb9H8wlT0EhaG6FVUbu6wFT0mM4NBOSN6dWagc=; b=3ychuIQJSjJrCV
	WsOJRwzea9fKgIX8sh37LxXtLhTUmHabbSsWbjXHXCLx2xco9yLSc+Wk+M4Uj64ETSbXPxCcjz9Oj
	u4kQ51cVZU+OAbHFTB64JR3sCWFFgGwx+l/5jlpG3UOGF7smnIBOAvxNgeKhPn/Y5LND2sDHIhtJg
	dbtaTGipg8rMpBNOA6mXw0ojgaN+phf3gVF9id09dsLIgbittTl+k2WQ7r7Ckw2P2fJp0O/gfHyrF
	A0ENtDD1HX1KnJN1wvoGitpwzSEd89B7DBUYBMECLDvt0HMb7vpWu5yZ0DvSh8jhsmW1v/As0q6D7
	jAW03k69kVVDxGZR/f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk9W-0000000GkNn-1Cph;
	Wed, 17 Jun 2026 06:53:34 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk9S-0000000GkNB-1zmC
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 06:53:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=djA+SxTM/4DdX0nuhSS9rd5BRl3y7xbZwe5Na5XIBDQ=;
	b=l7pba1O4Jax4lanbsZdumec7DcFKMwARlx0KpuNousaYNfUrBf9Wx+Vh2Z0fpYcucI5n9WO8Z
	3twZ1jC6VjuG1jaZXqq9L8j5rLAwc+MJBKwKywMfXH1cq0wW9eE3WepYC5nOTcTNCLIABjO2Yc5
	7fr2PYmgDBIf9a0lxOZCkJ0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4ggDrJ3RjJz1K97S;
	Wed, 17 Jun 2026 14:45:20 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E3B4405D0;
	Wed, 17 Jun 2026 14:53:17 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 17 Jun
 2026 14:53:16 +0800
Message-ID: <c20a7c0e-121f-474c-945a-2a4705a45bd5@huawei.com>
Date: Wed, 17 Jun 2026 14:53:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/3] riscv, bpf: Fix support for BPF_SDIV and
 BPF_SMOD in RV32 JIT
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<eddyz87@gmail.com>, <memxor@gmail.com>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <alex@ghiti.fr>,
	<jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>, <marscheng@google.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
 <20260511221648.3251464-2-visitorckw@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260511221648.3251464-2-visitorckw@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235331_132625_FCA702CD 
X-CRM114-Status: GOOD (  15.09  )
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


lgtm, just some nits

On 2026/5/12 6:16, Kuan-Wei Chiu wrote:
> The current rv32 bpf jit compiler incorrectly treats BPF_SDIV and
> BPF_SMOD as unsigned operations. The BPF instruction set allows
> signed division and modulo by reusing the BPF_DIV and BPF_MOD opcodes
> with the instruction offset set to 1.
> 
> Update the emit_alu_r32() function to accept an 'is_sdiv' variable and
> emit the correct div and rem instructions when the offset is 1.
> 
> Before this patch:
> [   44.161771] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
> [   44.167385] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
> [   44.171053] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
> [   44.172081] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
> 
> After this patch:
> [   16.002192] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 95 PASS
> [   16.002983] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 1059 PASS
> [   16.017167] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 136 PASS
> [   16.023002] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 109 PASS
> 
> Fixes: ec0e2da95f72 ("bpf: Support new signed div/mod instructions.")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp32.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index 592dd86fbf81..7396899ea276 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -509,7 +509,7 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
>   }
>   
>   static void emit_alu_r32(const s8 *dst, const s8 *src,
> -			 struct rv_jit_context *ctx, const u8 op)
> +			 struct rv_jit_context *ctx, const u8 op, bool is_sdiv)

let's combind `op` and `is_sdiv` to `const struct bpf_insn *insn`, and 
better to name `is_signed = insn->off == 1`

>   {
>   	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
>   	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
> @@ -539,10 +539,16 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
>   		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
>   		break;
>   	case BPF_DIV:
> -		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
> +		if (is_sdiv)
> +			emit(rv_div(lo(rd), lo(rd), lo(rs)), ctx);
> +		else
> +			emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
>   		break;
>   	case BPF_MOD:
> -		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
> +		if (is_sdiv)
> +			emit(rv_rem(lo(rd), lo(rd), lo(rs)), ctx);
> +		else
> +			emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);

how about
emit(is_signed ? rv_rem(lo(rd) : rv_remu(lo(rd), lo(rd), lo(rs)), ctx)

>   		break;
>   	case BPF_LSH:
>   		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
> @@ -959,6 +965,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	u8 code = insn->code;
>   	s16 off = insn->off;
>   	s32 imm = insn->imm;
> +	bool is_sdiv = false;
>   
>   	const s8 *dst = bpf2rv32[insn->dst_reg];
>   	const s8 *src = bpf2rv32[insn->src_reg];
> @@ -1041,7 +1048,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			emit_imm32(tmp2, imm, ctx);
>   			src = tmp2;
>   		}
> -		emit_alu_r32(dst, src, ctx, BPF_OP(code));
> +		if ((BPF_OP(code) == BPF_DIV || BPF_OP(code) == BPF_MOD) && insn->off == 1)
> +			is_sdiv = true;
> +		emit_alu_r32(dst, src, ctx, BPF_OP(code), is_sdiv);
>   		break;
>   
>   	case BPF_ALU | BPF_MOV | BPF_K:
> @@ -1065,7 +1074,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		 * src is ignored---choose tmp2 as a dummy register since it
>   		 * is not on the stack.
>   		 */
> -		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
> +		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code), false);
>   		break;
>   
>   	case BPF_ALU | BPF_END | BPF_FROM_LE:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

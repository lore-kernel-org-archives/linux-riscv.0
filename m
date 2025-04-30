Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A3C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhXG01OsMn7foYkYU+wYBIGM1yXiV7+U9bMbFImwI44=; b=lop/ch0V6elMGL
	fTPw5AH0AryFwB5H9CY2jzOV+W75pQ2VgQU76yT8ZfwJ7IjbmwkDC8zjLxHarrlJNwu/sFlA7l+OD
	+eLLsP/35i1MVfGiLYQ9ZzWYhBxWmpYXKli3ShdS3PSfAcPMuuNhjnsjF5YJ6nP1a1rVUB/NMj0kd
	o7oT0eas2gWq3phTi+GuaXnh5k+W1XurXtUqWtWJtvaYMMO2jKUyMzwZoy/QyuTJdxBHhAZ1YZLV7
	sgJKAnmx1Ms6W5O3wbeR9/fxpAsJorkO3NvxwcmvZepROaEC/z1EiExOq9RK3trIE+VtuJfLwot4j
	24FzPejJwikgzT67O84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ySP-0000000BcQ7-2hFR;
	Wed, 30 Apr 2025 03:50:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yQu-0000000BcEw-3QfX
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 03:48:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZnNRK51GQz13LYh;
	Wed, 30 Apr 2025 11:47:09 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A72C140275;
	Wed, 30 Apr 2025 11:48:17 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 30 Apr 2025 11:48:16 +0800
Message-ID: <4b79abf9-7eb9-4530-b226-456c73f26b6b@huawei.com>
Date: Wed, 30 Apr 2025 11:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/8] bpf, riscv64: Introduce emit_load_*() and
 emit_store_*()
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
 <3fd92afabeb9ed92a513b2c0aac091b69dbb76aa.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <3fd92afabeb9ed92a513b2c0aac091b69dbb76aa.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_204829_197598_5FF2ADB3 
X-CRM114-Status: GOOD (  16.56  )
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
> We're planning to add support for the load-acquire and store-release
> BPF instructions.  Define emit_load_<size>() and emit_store_<size>()
> to enable/facilitate the (re)use of their code.
> 
> Tested-by: Peilin Ye <yepeilin@google.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> [yepeilin@google.com: cosmetic change to commit title]
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 242 +++++++++++++++++++-------------
>   1 file changed, 143 insertions(+), 99 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index ca60db75199d..953b6a20c69f 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -473,6 +473,140 @@ static inline void emit_kcfi(u32 hash, struct rv_jit_context *ctx)
>   		emit(hash, ctx);
>   }
>   
> +static int emit_load_8(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	int insns_start;
> +
> +	if (is_12b_int(off)) {
> +		insns_start = ctx->ninsns;
> +		if (sign_ext)
> +			emit(rv_lb(rd, off, rs), ctx);
> +		else
> +			emit(rv_lbu(rd, off, rs), ctx);
> +		return ctx->ninsns - insns_start;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> +	insns_start = ctx->ninsns;
> +	if (sign_ext)
> +		emit(rv_lb(rd, 0, RV_REG_T1), ctx);
> +	else
> +		emit(rv_lbu(rd, 0, RV_REG_T1), ctx);
> +	return ctx->ninsns - insns_start;
> +}
> +
> +static int emit_load_16(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	int insns_start;
> +
> +	if (is_12b_int(off)) {
> +		insns_start = ctx->ninsns;
> +		if (sign_ext)
> +			emit(rv_lh(rd, off, rs), ctx);
> +		else
> +			emit(rv_lhu(rd, off, rs), ctx);
> +		return ctx->ninsns - insns_start;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> +	insns_start = ctx->ninsns;
> +	if (sign_ext)
> +		emit(rv_lh(rd, 0, RV_REG_T1), ctx);
> +	else
> +		emit(rv_lhu(rd, 0, RV_REG_T1), ctx);
> +	return ctx->ninsns - insns_start;
> +}
> +
> +static int emit_load_32(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	int insns_start;
> +
> +	if (is_12b_int(off)) {
> +		insns_start = ctx->ninsns;
> +		if (sign_ext)
> +			emit(rv_lw(rd, off, rs), ctx);
> +		else
> +			emit(rv_lwu(rd, off, rs), ctx);
> +		return ctx->ninsns - insns_start;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> +	insns_start = ctx->ninsns;
> +	if (sign_ext)
> +		emit(rv_lw(rd, 0, RV_REG_T1), ctx);
> +	else
> +		emit(rv_lwu(rd, 0, RV_REG_T1), ctx);
> +	return ctx->ninsns - insns_start;
> +}
> +
> +static int emit_load_64(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	int insns_start;
> +
> +	if (is_12b_int(off)) {
> +		insns_start = ctx->ninsns;
> +		emit_ld(rd, off, rs, ctx);
> +		return ctx->ninsns - insns_start;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> +	insns_start = ctx->ninsns;
> +	emit_ld(rd, 0, RV_REG_T1, ctx);
> +	return ctx->ninsns - insns_start;
> +}
> +
> +static void emit_store_8(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	if (is_12b_int(off)) {
> +		emit(rv_sb(rd, off, rs), ctx);
> +		return;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> +	emit(rv_sb(RV_REG_T1, 0, rs), ctx);
> +}
> +
> +static void emit_store_16(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	if (is_12b_int(off)) {
> +		emit(rv_sh(rd, off, rs), ctx);
> +		return;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> +	emit(rv_sh(RV_REG_T1, 0, rs), ctx);
> +}
> +
> +static void emit_store_32(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	if (is_12b_int(off)) {
> +		emit_sw(rd, off, rs, ctx);
> +		return;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> +	emit_sw(RV_REG_T1, 0, rs, ctx);
> +}
> +
> +static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
> +{
> +	if (is_12b_int(off)) {
> +		emit_sd(rd, off, rs, ctx);
> +		return;
> +	}
> +
> +	emit_imm(RV_REG_T1, off, ctx);
> +	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> +	emit_sd(RV_REG_T1, 0, rs, ctx);
> +}
> +
>   static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
>   			struct rv_jit_context *ctx)
>   {
> @@ -1650,8 +1784,8 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
>   	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
>   	{
> -		int insn_len, insns_start;
>   		bool sign_ext;
> +		int insn_len;
>   
>   		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
>   			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
> @@ -1663,78 +1797,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   		switch (BPF_SIZE(code)) {
>   		case BPF_B:
> -			if (is_12b_int(off)) {
> -				insns_start = ctx->ninsns;
> -				if (sign_ext)
> -					emit(rv_lb(rd, off, rs), ctx);
> -				else
> -					emit(rv_lbu(rd, off, rs), ctx);
> -				insn_len = ctx->ninsns - insns_start;
> -				break;
> -			}
> -
> -			emit_imm(RV_REG_T1, off, ctx);
> -			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> -			insns_start = ctx->ninsns;
> -			if (sign_ext)
> -				emit(rv_lb(rd, 0, RV_REG_T1), ctx);
> -			else
> -				emit(rv_lbu(rd, 0, RV_REG_T1), ctx);
> -			insn_len = ctx->ninsns - insns_start;
> +			insn_len = emit_load_8(sign_ext, rd, off, rs, ctx);
>   			break;
>   		case BPF_H:
> -			if (is_12b_int(off)) {
> -				insns_start = ctx->ninsns;
> -				if (sign_ext)
> -					emit(rv_lh(rd, off, rs), ctx);
> -				else
> -					emit(rv_lhu(rd, off, rs), ctx);
> -				insn_len = ctx->ninsns - insns_start;
> -				break;
> -			}
> -
> -			emit_imm(RV_REG_T1, off, ctx);
> -			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> -			insns_start = ctx->ninsns;
> -			if (sign_ext)
> -				emit(rv_lh(rd, 0, RV_REG_T1), ctx);
> -			else
> -				emit(rv_lhu(rd, 0, RV_REG_T1), ctx);
> -			insn_len = ctx->ninsns - insns_start;
> +			insn_len = emit_load_16(sign_ext, rd, off, rs, ctx);
>   			break;
>   		case BPF_W:
> -			if (is_12b_int(off)) {
> -				insns_start = ctx->ninsns;
> -				if (sign_ext)
> -					emit(rv_lw(rd, off, rs), ctx);
> -				else
> -					emit(rv_lwu(rd, off, rs), ctx);
> -				insn_len = ctx->ninsns - insns_start;
> -				break;
> -			}
> -
> -			emit_imm(RV_REG_T1, off, ctx);
> -			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> -			insns_start = ctx->ninsns;
> -			if (sign_ext)
> -				emit(rv_lw(rd, 0, RV_REG_T1), ctx);
> -			else
> -				emit(rv_lwu(rd, 0, RV_REG_T1), ctx);
> -			insn_len = ctx->ninsns - insns_start;
> +			insn_len = emit_load_32(sign_ext, rd, off, rs, ctx);
>   			break;
>   		case BPF_DW:
> -			if (is_12b_int(off)) {
> -				insns_start = ctx->ninsns;
> -				emit_ld(rd, off, rs, ctx);
> -				insn_len = ctx->ninsns - insns_start;
> -				break;
> -			}
> -
> -			emit_imm(RV_REG_T1, off, ctx);
> -			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
> -			insns_start = ctx->ninsns;
> -			emit_ld(rd, 0, RV_REG_T1, ctx);
> -			insn_len = ctx->ninsns - insns_start;
> +			insn_len = emit_load_64(sign_ext, rd, off, rs, ctx);
>   			break;
>   		}
>   
> @@ -1879,44 +1951,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   	/* STX: *(size *)(dst + off) = src */
>   	case BPF_STX | BPF_MEM | BPF_B:
> -		if (is_12b_int(off)) {
> -			emit(rv_sb(rd, off, rs), ctx);
> -			break;
> -		}
> -
> -		emit_imm(RV_REG_T1, off, ctx);
> -		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> -		emit(rv_sb(RV_REG_T1, 0, rs), ctx);
> +		emit_store_8(rd, off, rs, ctx);
>   		break;
>   	case BPF_STX | BPF_MEM | BPF_H:
> -		if (is_12b_int(off)) {
> -			emit(rv_sh(rd, off, rs), ctx);
> -			break;
> -		}
> -
> -		emit_imm(RV_REG_T1, off, ctx);
> -		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> -		emit(rv_sh(RV_REG_T1, 0, rs), ctx);
> +		emit_store_16(rd, off, rs, ctx);
>   		break;
>   	case BPF_STX | BPF_MEM | BPF_W:
> -		if (is_12b_int(off)) {
> -			emit_sw(rd, off, rs, ctx);
> -			break;
> -		}
> -
> -		emit_imm(RV_REG_T1, off, ctx);
> -		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> -		emit_sw(RV_REG_T1, 0, rs, ctx);
> +		emit_store_32(rd, off, rs, ctx);
>   		break;
>   	case BPF_STX | BPF_MEM | BPF_DW:
> -		if (is_12b_int(off)) {
> -			emit_sd(rd, off, rs, ctx);
> -			break;
> -		}
> -
> -		emit_imm(RV_REG_T1, off, ctx);
> -		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
> -		emit_sd(RV_REG_T1, 0, rs, ctx);
> +		emit_store_64(rd, off, rs, ctx);
>   		break;
>   	case BPF_STX | BPF_ATOMIC | BPF_W:
>   	case BPF_STX | BPF_ATOMIC | BPF_DW:

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

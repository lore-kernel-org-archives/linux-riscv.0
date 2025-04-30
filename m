Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB11C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpa2hAqlVZuUuUxGvGTgeVRfus5a9Wpjpk9A1kRO4iw=; b=hYf/DnXr8Nbzda
	cpFB+xf4gwGhv1w1KrferiZqCXMr1sB7L47E+CCkF9YtFPpQsdsepPt1/NOWcGYTejCbs9uQgFLQg
	BQCs08YQ9QwWCIRrn6+uyzxy+Z0vF118bv6TBQTEG/9iUTkYlwlyrV5R0Jug2ZMS9AaFBnM+QlBvW
	6fwZlif/jukhpPU7KyWQJeMVde0VjjuAkweyeQFoxX9bpd8ENryOttXXt5UwxcUiGTWC+U3tNORho
	N/26Kngptc7DSx4rjlzg6E6gTH2iAEyCObBo5+XXczrS9McSXIBilA2VOAKa1QAlWomXSOuss4e4a
	9ZNRxaNVFPN/mNhd1OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yUI-0000000BccS-08PC;
	Wed, 30 Apr 2025 03:51:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yRZ-0000000BcLr-0sIU
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 03:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2sS5p9ELPndUDjPfPAYD9R9EmLRHlFr6nQik6dmiLmE=; b=P1B/GLml7xxIcsP3vfj5Y9qpHr
	zz0WYS6QMVQHNyuSJ6nYoPUSbKoTYdCIWZfzgeYemLpBFIsKhaZEDGp9wbJp91z8Xdi8zii0gjlS/
	AbkLFwh3h3GExkd+HOnURiOSH0KQkX+PUNBXVOrcXeFqYgHOUAEVrxcwZrpR75nGbBwJwfQSf+ylG
	KdgVfuy2mXzPUt39cvo2ekEhMMvk+ZYFHQEQ1FM37DCb6nD9275Eb7PTa7wpz4wNc1o8TQVTrp9Ei
	tl/PZfg9Di5iJAAjnZSCwqrpm8s0Jri/ezWxFi8qesWmpmYLh7wrtM4hNZScWyfSAhzvfzfnbTOkd
	62yOBMvg==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9yRR-0000000DfXi-20Qc
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 03:49:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZnNVB510nz27hVW;
	Wed, 30 Apr 2025 11:49:38 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 26E17140275;
	Wed, 30 Apr 2025 11:48:54 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 30 Apr 2025 11:48:52 +0800
Message-ID: <05cf616f-659d-4e27-97ee-95c516ad4468@huawei.com>
Date: Wed, 30 Apr 2025 11:48:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/8] bpf, riscv64: Skip redundant zext
 instruction after load-acquire
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
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
 <875edd356603dd5d7be30b79b97d8ee15ebc59b3.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <875edd356603dd5d7be30b79b97d8ee15ebc59b3.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_044902_477404_9DC4BF25 
X-CRM114-Status: GOOD (  21.55  )
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
> Currently, the verifier inserts a zext instruction right after every 8-,
> 16- or 32-bit load-acquire, which is already zero-extending.  Skip such
> redundant zext instructions.
> 
> While we are here, update that already-obsolete comment about "skip the
> next instruction" in build_body().  Also change emit_atomic_rmw()'s
> parameters to keep it consistent with emit_atomic_ld_st().
> 
> Note that checking 'insn[1]' relies on 'insn' not being the last
> instruction, which should have been guaranteed by the verifier; we
> already use 'insn[1]' elsewhere in the file for similar purposes.
> Additionally, we don't check if 'insn[1]' is actually a zext for our
> load-acquire's dst_reg, or some other registers - in other words, here
> we are relying on the verifier to always insert a redundant zext right
> after a 8/16/32-bit load-acquire, for its dst_reg.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 23 ++++++++++++++++++-----
>   arch/riscv/net/bpf_jit_core.c   |  3 +--
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index b71a9c88fb4f..4cb50dbbe94b 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -607,8 +607,13 @@ static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
>   	emit_sd(RV_REG_T1, 0, rs, ctx);
>   }
>   
> -static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_jit_context *ctx)
> +static int emit_atomic_ld_st(u8 rd, u8 rs, const struct bpf_insn *insn,
> +			     struct rv_jit_context *ctx)
>   {
> +	u8 code = insn->code;
> +	s32 imm = insn->imm;
> +	s16 off = insn->off;
> +
>   	switch (imm) {
>   	/* dst_reg = load_acquire(src_reg + off16) */
>   	case BPF_LOAD_ACQ:
> @@ -627,6 +632,12 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_
>   			break;
>   		}
>   		emit_fence_r_rw(ctx);
> +
> +		/* If our next insn is a redundant zext, return 1 to tell
> +		 * build_body() to skip it.
> +		 */
> +		if (BPF_SIZE(code) != BPF_DW && insn_is_zext(&insn[1]))
> +			return 1;
>   		break;
>   	/* store_release(dst_reg + off16, src_reg) */
>   	case BPF_STORE_REL:
> @@ -654,10 +665,12 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_
>   	return 0;
>   }
>   
> -static int emit_atomic_rmw(u8 rd, u8 rs, s16 off, s32 imm, u8 code,
> +static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
>   			   struct rv_jit_context *ctx)
>   {
> -	u8 r0;
> +	u8 r0, code = insn->code;
> +	s16 off = insn->off;
> +	s32 imm = insn->imm;
>   	int jmp_offset;
>   	bool is64;
>   
> @@ -2026,9 +2039,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	case BPF_STX | BPF_ATOMIC | BPF_W:
>   	case BPF_STX | BPF_ATOMIC | BPF_DW:
>   		if (bpf_atomic_is_load_store(insn))
> -			ret = emit_atomic_ld_st(rd, rs, off, imm, code, ctx);
> +			ret = emit_atomic_ld_st(rd, rs, insn, ctx);
>   		else
> -			ret = emit_atomic_rmw(rd, rs, off, imm, code, ctx);
> +			ret = emit_atomic_rmw(rd, rs, insn, ctx);
>   		break;
>   
>   	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index f8cd2f70a7fb..f6ca5cfa6b2f 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -26,9 +26,8 @@ static int build_body(struct rv_jit_context *ctx, bool extra_pass, int *offset)
>   		int ret;
>   
>   		ret = bpf_jit_emit_insn(insn, ctx, extra_pass);
> -		/* BPF_LD | BPF_IMM | BPF_DW: skip the next instruction. */
>   		if (ret > 0)
> -			i++;
> +			i++; /* skip the next instruction */
>   		if (offset)
>   			offset[i] = ctx->ninsns;
>   		if (ret < 0)

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

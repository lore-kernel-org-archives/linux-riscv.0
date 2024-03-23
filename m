Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C6DC54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTyWdRsk8lbJ+VH0l0vhLaxBMyKwzYhEAXbpkucsFpo=; b=su4G7ulhwCY+aX
	1aFI63K0PsgnfxFgEShhVLcBztVnL1350cZg/ZJ18U3zWNA1xORsgaoEsVDcWikfAIbqs+2EXEobI
	neXORzZCW3Q1XobD7GK+yLhXv35Lt5iPGxLKaregi/g2yIPUjmFNvwrbI5FrII0bwGGojo1uILbL4
	HutCWEHuT9GuOmPAiB5ERt7Zj0JF0Na9GLBcPFyO2r/SLiNTQ1uuAgnLuewFRe3Fxjtb/0XQcYUH2
	CnGUN5GQo0WgV5DRBYfq+DF85oFT7qpUhkeS/CWZ7ZC6kSB2q+l1SPfrGtdiQaux4F30GsRqtWQuU
	atFSgc3CJLZKOugVkvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4Qt-0000000AkCQ-1X81;
	Sat, 23 Mar 2024 16:41:23 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro4Qp-0000000AkAM-0UDD
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 16:41:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V24dB1K99z1h2m2;
	Sun, 24 Mar 2024 00:38:22 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C7521A0172;
	Sun, 24 Mar 2024 00:40:58 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 24 Mar 2024 00:40:57 +0800
Message-ID: <ea7ec9fe-a2e1-4e0f-b314-de7815bfd614@huawei.com>
Date: Sun, 24 Mar 2024 00:40:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/2] bpf,riscv: Implement PROBE_MEM32 pseudo
 instructions
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>
References: <20240323154652.54572-1-puranjay12@gmail.com>
 <20240323154652.54572-2-puranjay12@gmail.com>
CC: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240323154652.54572-2-puranjay12@gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_094119_338964_CB0CCF5A 
X-CRM114-Status: GOOD (  10.65  )
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


On 2024/3/23 23:46, Puranjay Mohan wrote:
> Add support for [LDX | STX | ST], PROBE_MEM32, [B | H | W | DW]
[snip]
>   
>   #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
>   #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
> +#define DONT_CLEAR		16	/* RV_REG_A6 unused in BPF */

This is a bit misleading. RV_REG_A6 is actually used in riscv64. Maybe 
"RV_REG_A6 unused in pt_regmap" or change to other register will be better.

>   
>   bool ex_handler_bpf(const struct exception_table_entry *ex,
[snip]
>   
>   	stack_adjust = round_up(stack_adjust, 16);
>   	stack_adjust += bpf_stack_adjust;
> @@ -1794,6 +1974,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   		emit_sd(RV_REG_SP, store_offset, RV_REG_S6, ctx);
>   		store_offset -= 8;
>   	}
> +	if (ctx->arena_vm_start) {
> +		emit_sd(RV_REG_SP, store_offset, RV_REG_S11, ctx);
> +		store_offset -= 8;
> +	}

I think it's fine to use s7 and keep the original dynamic stack code style.

>   
>   	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
>   
> @@ -1807,6 +1991,9 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   		emit_mv(RV_REG_TCC_SAVED, RV_REG_TCC, ctx);
>   
>   	ctx->stack_size = stack_adjust;
> +
> +	if (ctx->arena_vm_start)
> +		emit_imm(RV_REG_S11, ctx->arena_vm_start, ctx);
>   }
>   
>   void bpf_jit_build_epilogue(struct rv_jit_context *ctx)
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index 6b3acac30c06..9b6696b1290a 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -50,6 +50,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   	int pass = 0, prev_ninsns = 0, i;
>   	struct rv_jit_data *jit_data;
>   	struct rv_jit_context *ctx;
> +	u64 arena_vm_start;

unused variable

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4A4C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuFOMTHxYbxdQyoKn3O6degqDApz0r575+47CVuvu8g=; b=vgkCQ3De8zi7aJ
	drT3Rdl0pQTBb7/GlVBY4zzgaofyj1UhC3FZ3scQiM44cOdLR4l+lsKciTYl6I/1v8zLsYyr/mFkJ
	+CeWAXOrePXmK4rvuxe3pxJZldw9YNHQrbM3E9kh1q4Ggwlbjm1OYCSgp8XevIvIZPfpbO0Ix2TIj
	sGZPHwUYOB5y7rjK1YnE0a2w86pVPi1f9gXZR2Ef9y0OABm0qFO9myDDtPtxge1ajGn6hXv+vECga
	e5J5DDGgMvfiPRIRoQblQRJOUjK/fdESBPtTCRBNnkwfupS0dIXDYYXRBWu9nG8qe6d7Pax3dHvp9
	dzdLOBVcL3860NnkCExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fUM-000000027kk-3S2p;
	Wed, 22 May 2024 06:30:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fUJ-000000027iv-3wE2
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 06:30:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VkhFz58Wszcj7F;
	Wed, 22 May 2024 14:28:39 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 356FD1401E9;
	Wed, 22 May 2024 14:29:57 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 22 May 2024 14:29:56 +0800
Message-ID: <af4cf420-558a-4893-8469-c354d3e337eb@huawei.com>
Date: Wed, 22 May 2024 14:29:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Use STACK_ALIGN macro for size rounding up
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <bjorn@kernel.org>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <john.fastabend@gmail.com>, <kpsingh@kernel.org>,
	<sdf@google.com>, <haoluo@google.com>, <jolsa@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <haicheng.li@intel.com>
References: <20240522054507.3941595-1-xiao.w.wang@intel.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240522054507.3941595-1-xiao.w.wang@intel.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_233012_179485_775305F5 
X-CRM114-Status: GOOD (  11.09  )
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


On 2024/5/22 13:45, Xiao Wang wrote:
> Use the macro STACK_ALIGN that is defined in asm/processor.h for stack size
> rounding up, just like bpf_jit_comp32.c does.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 39149ad002da..bd869d41612f 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -858,7 +858,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   	stack_size += 8;
>   	sreg_off = stack_size;
>   
> -	stack_size = round_up(stack_size, 16);
> +	stack_size = round_up(stack_size, STACK_ALIGN);
>   
>   	if (!is_struct_ops) {
>   		/* For the trampoline called from function entry,
> @@ -1723,7 +1723,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   {
>   	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
>   
> -	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
> +	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
>   	if (bpf_stack_adjust)
>   		mark_fp(ctx);
>   
> @@ -1743,7 +1743,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
>   	if (seen_reg(RV_REG_S6, ctx))
>   		stack_adjust += 8;
>   
> -	stack_adjust = round_up(stack_adjust, 16);
> +	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
>   	stack_adjust += bpf_stack_adjust;
>   
>   	store_offset = stack_adjust - 8;

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

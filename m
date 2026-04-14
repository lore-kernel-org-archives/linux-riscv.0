Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17658F531CE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 01:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eekYZDI+oFCYzbjmbnbCwDI3KA+lf1LBZP8CmdK4l6Q=; b=uLs1IJW5GjIzGL
	j4yC+FAQRU3bp30fd3s/FoG+OtSnNgDXVXwFy8qaH6EP50+sdHpEaSz9vG9t2GE3a0Ujf1eATYJ0A
	iaB2h0AsvfXrvA8VQkT9u8MdZ69iyo+yBx1m2dWzq+EsPoWSMjPy6LDCXRy4zIB7GfS9Jv23xkjC/
	6IFGbuk6sRHtP1TONUIu2air3swy6i5SiclF6DaBeenUkVpm2ABhv436TrSpSbSO6CRmC+4I87/Qd
	0ZKUV+Qte7hK7WGCOJuR0kJxURykJ4LSJQDeWelCONTPcu/ELabTRACZ3YQuaBy9ARDXbpcicH7e3
	5FSzUMjxHbZxN/mYsY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCSM4-0000000GYR9-1lsD;
	Tue, 14 Apr 2026 01:14:16 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCSLz-0000000GYPg-2vEj;
	Tue, 14 Apr 2026 01:14:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wwwLs654l6TRJx+paG/bUIxIbs35+7AXfMc8chQ7/iU=;
	b=jNL5kmCIIYuPd/zWkmUvcDYti0PpsMK3r+eFp8ifV+x4+kUvvvPWqueyqpi3wazbxRtJDbNnx
	jM6gs6FqE8r/a/vYMqMlLqm8i+y1lxnRFLoviW2QICVez8WwbinZGnOX+VAqBKE4qNKuRGeAzWN
	YPmcDRp6rPzklYWl6CHxNG4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fvmNK50yzzpSvH;
	Tue, 14 Apr 2026 09:07:45 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id CD6AE40561;
	Tue, 14 Apr 2026 09:13:55 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 09:13:54 +0800
Message-ID: <775f4b9f-2bf4-4e6b-be7a-094e8f9528c2@huawei.com>
Date: Tue, 14 Apr 2026 09:13:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 2/2] bpf, riscv: Remove redundant
 bpf_flush_icache() after pack allocator finalize
Content-Language: en-US
To: Puranjay Mohan <puranjay@kernel.org>, <bpf@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Xu Kuohai
	<xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
	<xi.wang@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260413191111.3426023-1-puranjay@kernel.org>
 <20260413191111.3426023-3-puranjay@kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260413191111.3426023-3-puranjay@kernel.org>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_181412_114856_49BEE112 
X-CRM114-Status: GOOD (  16.20  )
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


On 2026/4/14 3:11, Puranjay Mohan wrote:
> bpf_flush_icache() calls flush_icache_range() to clean the data cache
> and invalidate the instruction cache for the JITed code region. However,
> since commit 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the
> BPF JIT"), this flush is redundant.
> 
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> patch_text_nosync(), and
> patch_text_nosync() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range.
> 
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
> 
> Fixes: 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the BPF JIT")
> Acked-by: Song Liu <song@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   arch/riscv/net/bpf_jit.h      | 6 ------
>   arch/riscv/net/bpf_jit_core.c | 7 -------
>   2 files changed, 13 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 632ced07bca4..da0271790244 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -11,7 +11,6 @@
>   
>   #include <linux/bpf.h>
>   #include <linux/filter.h>
> -#include <asm/cacheflush.h>
>   
>   /* verify runtime detection extension status */
>   #define rv_ext_enabled(ext) \
> @@ -105,11 +104,6 @@ static inline void bpf_fill_ill_insns(void *area, unsigned int size)
>   	memset(area, 0, size);
>   }
>   
> -static inline void bpf_flush_icache(void *start, void *end)
> -{
> -	flush_icache_range((unsigned long)start, (unsigned long)end);
> -}
> -
>   /* Emit a 4-byte riscv instruction. */
>   static inline void emit(const u32 insn, struct rv_jit_context *ctx)
>   {
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index b3581e926436..f7fd4afc3ca3 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -183,13 +183,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   			prog = orig_prog;
>   			goto out_offset;
>   		}
> -		/*
> -		 * The instructions have now been copied to the ROX region from
> -		 * where they will execute.
> -		 * Write any modified data cache blocks out to memory and
> -		 * invalidate the corresponding blocks in the instruction cache.
> -		 */
> -		bpf_flush_icache(jit_data->ro_header, ctx->ro_insns + ctx->ninsns);
>   		for (i = 0; i < prog->len; i++)
>   			ctx->offset[i] = ninsns_rvoff(ctx->offset[i]);
>   		bpf_prog_fill_jited_linfo(prog, ctx->offset);

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

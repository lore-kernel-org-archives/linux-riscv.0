Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDF1C531CB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPo/tmiLfg7oZxhLyaHaeh+oawqlFHsEYZhCeEfR770=; b=voYRF2JRts2Abx
	FqgT4E0xUDt1oXFqwt+76MS5VNWpJQFQZ6kbzRpT/k2iTqyRwbbXTzonRirw6ybNN7XPOYGNYXTd3
	kiDw7WHfgCVAluelcQXDNLLx0GisjmQrmMA1MBNIJw5EYypbqFQOUDicgpiWcjQqO2DMaj/05jA46
	z5rEDdgIjCC94/Ievq2KziXA6FKAFzVyhax99ZvHTSIR03l2eEEq6SfUxe+rJM1g918ktzxeRMvdH
	ymn2q7vmkwuRz0Xq1f15CVPOr5h4HiJb6oMc5YTz5ERkL370O7Gphu6zpvKnUgHAuDUUQHVDxnTLZ
	dcVZTYYIisjaw7LLd+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqNx-0000000DzQU-04p6;
	Thu, 23 Jul 2026 10:10:37 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqNt-0000000DzFG-1bW4
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 10:10:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4bq3O7+YsxRmC7Dd1A4Vy6325Gn0WoUc+loqYkx+dIk=;
	b=kBm9mYldUdKYVYoKmUQTjnabadxBkDbVLdCAs+J5KSMjHm2SMMGRddmwe1Id1MS9sd4ZxZ8Zn
	hXLwBHxGlUVgwoYU/Kr2Nm9Dz4G+449uvAQo02m2ZfnlNgTYYgPXAkbqtKd4vk2RhrSxZaKrtxu
	deqZttu/wQsgw8eGeIoU1jc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h5RTJ1xxWznTVx;
	Thu, 23 Jul 2026 18:00:52 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id E822440565;
	Thu, 23 Jul 2026 18:10:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Jul
 2026 18:10:21 +0800
Message-ID: <4b4c8567-b5f5-4703-b06f-6369bd47e0ed@huawei.com>
Date: Thu, 23 Jul 2026 18:10:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 1/3] bpf, riscv: add support for timed
 may_goto
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
 <20260723-riscv-bpf-timed-may-goto-v5-1-86acb54e5642@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-1-86acb54e5642@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_031034_146897_EDC44C94 
X-CRM114-Status: GOOD (  18.77  )
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


On 2026/7/23 13:41, Feng Jiang wrote:
> Implement arch_bpf_timed_may_goto() for the RV64 JIT. The argument and
> return value are carried in BPF_REG_AX, and BPF R0-R5 are preserved
> across the call to the generic bpf_check_timed_may_goto().
> 
> Enable bpf_jit_supports_timed_may_goto() so the verifier uses the timed
> expansion path.
> 
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>   arch/riscv/net/Makefile             |  2 +-
>   arch/riscv/net/bpf_jit_comp64.c     | 12 +++++++++-
>   arch/riscv/net/bpf_timed_may_goto.S | 47 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+), 2 deletions(-)


Reviewed-by: Pu Lehui <pulehui@huawei.com>

> 
> diff --git a/arch/riscv/net/Makefile b/arch/riscv/net/Makefile
> index 9a1e5f0a94e5..6458d4d51990 100644
> --- a/arch/riscv/net/Makefile
> +++ b/arch/riscv/net/Makefile
> @@ -3,7 +3,7 @@
>   obj-$(CONFIG_BPF_JIT) += bpf_jit_core.o
>   
>   ifeq ($(CONFIG_ARCH_RV64I),y)
> -	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
> +	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o bpf_timed_may_goto.o
>   else
>   	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp32.o
>   endif
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index ad089a9a4ea9..8fe8969fb8a0 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1841,7 +1841,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
>   			emit_sd(RV_REG_SP, ctx->tcc_offset, RV_REG_TCC, ctx);
>   
> -		if (insn->src_reg != BPF_PSEUDO_CALL)
> +		/*
> +		 * arch_bpf_timed_may_goto() is emitted by the verifier and
> +		 * returns its result in BPF_REG_AX instead of BPF_REG_0, so
> +		 * skip the normal "move return register into R0".
> +		 */
> +		if (insn->src_reg != BPF_PSEUDO_CALL && addr != (u64)arch_bpf_timed_may_goto)
>   			emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_A0, ctx);
>   		break;
>   	}
> @@ -2161,3 +2166,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
>   {
>   	return true;
>   }
> +
> +bool bpf_jit_supports_timed_may_goto(void)
> +{
> +	return true;
> +}
> diff --git a/arch/riscv/net/bpf_timed_may_goto.S b/arch/riscv/net/bpf_timed_may_goto.S
> new file mode 100644
> index 000000000000..02c637d87420
> --- /dev/null
> +++ b/arch/riscv/net/bpf_timed_may_goto.S
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2026 Feng Jiang <jiangfeng@kylinos.cn> */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +/*
> + * Trampoline for the BPF timed may_goto loop bound. Custom calling convention:
> + *	- input:  stack offset in BPF_REG_AX (t0)
> + *	- output: updated count in BPF_REG_AX (t0)
> + *
> + * Calls bpf_check_timed_may_goto(ptr) with the standard RISC-V ABI, where
> + * ptr = BPF_REG_FP (s5) + BPF_REG_AX (t0). BPF R0-R5 (a5, a0-a4) are saved
> + * across the call; BPF_REG_FP (s5) is callee-saved and needs no saving.
> + */
> +
> +SYM_FUNC_START(arch_bpf_timed_may_goto)
> +	addi	sp, sp, -(8*SZREG)
> +	REG_S	ra, 7*SZREG(sp)
> +	REG_S	s0, 6*SZREG(sp)
> +	addi	s0, sp, 8*SZREG
> +
> +	/* Save BPF registers R0-R5 (a5, a0-a4) */
> +	REG_S	a5, 5*SZREG(sp)
> +	REG_S	a0, 4*SZREG(sp)
> +	REG_S	a1, 3*SZREG(sp)
> +	REG_S	a2, 2*SZREG(sp)
> +	REG_S	a3, 1*SZREG(sp)
> +	REG_S	a4, 0*SZREG(sp)
> +
> +	add	a0, t0, s5
> +	call	bpf_check_timed_may_goto
> +	mv	t0, a0
> +
> +	/* Restore BPF registers R0-R5 */
> +	REG_L	a4, 0*SZREG(sp)
> +	REG_L	a3, 1*SZREG(sp)
> +	REG_L	a2, 2*SZREG(sp)
> +	REG_L	a1, 3*SZREG(sp)
> +	REG_L	a0, 4*SZREG(sp)
> +	REG_L	a5, 5*SZREG(sp)
> +
> +	REG_L	s0, 6*SZREG(sp)
> +	REG_L	ra, 7*SZREG(sp)
> +	addi	sp, sp, 8*SZREG
> +	ret
> +SYM_FUNC_END(arch_bpf_timed_may_goto)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

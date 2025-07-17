Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD177C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yafZOCam70aecHI6Os8gXXcIdJNN96aegrIrlVgQk6I=; b=pgvscnoAyhsBm4vsg7xd2CL4fo
	3tn9gg+7BD53UbfrUgo5tVbTIAD9tJAMFZLjMhxLBw+vxgh4OCKI3xaVGQ+VOyhy7r5Dy50jN1Fsi
	kVvPywBITikSHHGsgtDS1nquWz0ZpoWda/OwLZtaZs0q7X2RmhfZxW3ipC2YQ67P7+H4qkHCNY0Aa
	SIKy8xyyrUuL7qRR5oysl0AVEQjbSFlkTfkD64tw8T1J/6RKO1gnTd1ezHi93foCfdZTQ2UgiYlYH
	AvRCjlw6SC5+pg7mkEEK6Ls9llvq+T/PAJ2q2MVQIdk1j+9jG2RTspv5ABLvERllibPM/zK1J4Yrg
	UloYJk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPLD-0000000AKpz-1QgR;
	Thu, 17 Jul 2025 14:12:07 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOHm-0000000ACsm-0olY
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 13:04:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6497E44380;
	Thu, 17 Jul 2025 13:04:24 +0000 (UTC)
Message-ID: <c9ba6163-6703-441b-915c-d784044f862f@ghiti.fr>
Date: Thu, 17 Jul 2025 15:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] riscv: introduce percpu.h into include/asm
To: Yunhui Cui <cuiyunhui@bytedance.com>, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dennis@kernel.org, tj@kernel.org,
 cl@gentwo.org, linux-mm@kvack.org
References: <20250618034328.21904-1-cuiyunhui@bytedance.com>
 <20250618034328.21904-2-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250618034328.21904-2-cuiyunhui@bytedance.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeufeegheehgedtvdegleegjeejfedukeegteffieejgfevjeduheffffdtlefhhfenucfkphepudekhedrvddufedrudehgedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddvudefrdduheegrdduhedupdhhvghloheplgdutddrudegrddtrddufegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheptghuihihuhhnhhhuihessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthhopeihuhhrhidrnhhorhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsehrrghsmhhushhvihhllhgvmhhovghsrdgukhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrs
 ggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_060430_389859_163E330B 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Yunhui,

On 6/18/25 05:43, Yunhui Cui wrote:
> Current percpu operations rely on generic implementations, where
> raw_local_irq_save() introduces substantial overhead. Optimization
> is achieved through atomic operations and preemption disabling.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/include/asm/percpu.h | 138 ++++++++++++++++++++++++++++++++
>   1 file changed, 138 insertions(+)
>   create mode 100644 arch/riscv/include/asm/percpu.h
>
> diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
> new file mode 100644
> index 0000000000000..423c0d01f874c
> --- /dev/null
> +++ b/arch/riscv/include/asm/percpu.h
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_PERCPU_H
> +#define __ASM_PERCPU_H
> +
> +#include <linux/preempt.h>
> +
> +#define PERCPU_RW_OPS(sz)						\
> +static inline unsigned long __percpu_read_##sz(void *ptr)		\
> +{									\
> +	return READ_ONCE(*(u##sz *)ptr);				\
> +}									\
> +									\
> +static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
> +{									\
> +	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
> +}
> +
> +#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
> +static inline void							\
> +__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
> +{									\
> +	asm volatile (							\
> +	"amo" #amo_insn #sfx " zero, %[val], %[ptr]"			\
> +	: [ptr] "+A" (*(u##sz *)ptr)					\
> +	: [val] "r" ((u##sz)(val))					\
> +	: "memory");							\
> +}
> +
> +#define __PERCPU_AMO_RET_OP_CASE(sfx, name, sz, amo_insn)		\
> +static inline u##sz							\
> +__percpu_##name##_return_amo_case_##sz(void *ptr, unsigned long val)	\
> +{									\
> +	register u##sz ret;						\
> +									\
> +	asm volatile (							\
> +	"amo" #amo_insn #sfx " %[ret], %[val], %[ptr]"			\
> +	: [ptr] "+A" (*(u##sz *)ptr), [ret] "=r" (ret)			\
> +	: [val] "r" ((u##sz)(val))					\
> +	: "memory");							\
> +									\
> +	return ret + val;						\
> +}
> +
> +#define PERCPU_OP(name, amo_insn)					\
> +	__PERCPU_AMO_OP_CASE(.b, name, 8, amo_insn)			\
> +	__PERCPU_AMO_OP_CASE(.h, name, 16, amo_insn)			\
> +	__PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)			\
> +	__PERCPU_AMO_OP_CASE(.d, name, 64, amo_insn)			\
> +
> +#define PERCPU_RET_OP(name, amo_insn)					\
> +	__PERCPU_AMO_RET_OP_CASE(.b, name, 8, amo_insn)			\
> +	__PERCPU_AMO_RET_OP_CASE(.h, name, 16, amo_insn)		\
> +	__PERCPU_AMO_RET_OP_CASE(.w, name, 32, amo_insn)		\
> +	__PERCPU_AMO_RET_OP_CASE(.d, name, 64, amo_insn)
> +
> +PERCPU_RW_OPS(8)
> +PERCPU_RW_OPS(16)
> +PERCPU_RW_OPS(32)
> +PERCPU_RW_OPS(64)
> +
> +PERCPU_OP(add, add)
> +PERCPU_OP(andnot, and)
> +PERCPU_OP(or, or)
> +PERCPU_RET_OP(add, add)
> +
> +#undef PERCPU_RW_OPS
> +#undef __PERCPU_AMO_OP_CASE
> +#undef __PERCPU_AMO_RET_OP_CASE
> +#undef PERCPU_OP
> +#undef PERCPU_RET_OP
> +
> +#define _pcp_protect(op, pcp, ...)					\
> +({									\
> +	preempt_disable_notrace();					\
> +	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
> +	preempt_enable_notrace();					\
> +})
> +
> +#define _pcp_protect_return(op, pcp, args...)				\
> +({									\
> +	typeof(pcp) __retval;						\
> +	preempt_disable_notrace();					\
> +	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
> +	preempt_enable_notrace();					\
> +	__retval;							\
> +})
> +
> +#define this_cpu_read_1(pcp)		_pcp_protect_return(__percpu_read_8, pcp)
> +#define this_cpu_read_2(pcp)		_pcp_protect_return(__percpu_read_16, pcp)
> +#define this_cpu_read_4(pcp)		_pcp_protect_return(__percpu_read_32, pcp)
> +#define this_cpu_read_8(pcp)		_pcp_protect_return(__percpu_read_64, pcp)
> +
> +#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
> +#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
> +#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
> +#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
> +
> +#define this_cpu_add_1(pcp, val)	_pcp_protect(__percpu_add_amo_case_8, pcp, val)
> +#define this_cpu_add_2(pcp, val)	_pcp_protect(__percpu_add_amo_case_16, pcp, val)
> +#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
> +#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
> +
> +#define this_cpu_add_return_1(pcp, val)		\
> +_pcp_protect_return(__percpu_add_return_amo_case_8, pcp, val)
> +
> +#define this_cpu_add_return_2(pcp, val)		\
> +_pcp_protect_return(__percpu_add_return_amo_case_16, pcp, val)
> +
> +#define this_cpu_add_return_4(pcp, val)		\
> +_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
> +
> +#define this_cpu_add_return_8(pcp, val)		\
> +_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
> +
> +#define this_cpu_and_1(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_8, pcp, ~val)
> +#define this_cpu_and_2(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_16, pcp, ~val)
> +#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_32, pcp, ~val)
> +#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_andnot_amo_case_64, pcp, ~val)


Why do we define __percpu_andnot based on amoand, and use 
__percpu_andnot with ~val here? Can't we just define __percpu_and?


> +
> +#define this_cpu_or_1(pcp, val)	_pcp_protect(__percpu_or_amo_case_8, pcp, val)
> +#define this_cpu_or_2(pcp, val)	_pcp_protect(__percpu_or_amo_case_16, pcp, val)
> +#define this_cpu_or_4(pcp, val)	_pcp_protect(__percpu_or_amo_case_32, pcp, val)
> +#define this_cpu_or_8(pcp, val)	_pcp_protect(__percpu_or_amo_case_64, pcp, val)
> +
> +#define this_cpu_xchg_1(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
> +#define this_cpu_xchg_2(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
> +#define this_cpu_xchg_4(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
> +#define this_cpu_xchg_8(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
> +
> +#define this_cpu_cmpxchg_1(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> +#define this_cpu_cmpxchg_2(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> +#define this_cpu_cmpxchg_4(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> +#define this_cpu_cmpxchg_8(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> +
> +#include <asm-generic/percpu.h>
> +
> +#endif /* __ASM_PERCPU_H */


It all looks good to me, just one thing, can you also implement 
this_cpu_cmpxchg64/128()?

And since this is almost a copy/paste from arm64, either mention it at 
the top of the file or (better) merge both implementations somewhere to 
avoid redefining existing code :) But up to you.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

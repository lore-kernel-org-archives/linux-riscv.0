Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E855EC38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZCN5Vw5jY6yEihpN11CQ2jzUysOLynAW3K8H0U5ARw=; b=3LE48gjaJ8h7MJ
	SOju+GOWDIqX7zqEFX7NNQV22bPtNHwFKiZqMWuzKUHrZSkh+lccV6ODjsoAo2ETKLTwRk1Az6C2i
	NdJE/Bog51sPZHDUmXEzh1SrYD2Lu8wNC5zXCybcg++HlwU7vcXc6Gfel+WVToVNTh0742zb6Ixcv
	2kEtbKqEcUYg8SZzxof0g18lIJ8N/6yTFvPXx1nsx8xpcG3HFiAoQZlDNqDc/YF6nh8igwraK1Utb
	tqiRyeRl/dRE8vxtf5CeST2bRdCtAfCrdqBSxIKkNK0nNHe7r/C9PKDUssWewCGYhcRY2t1aV+wSp
	NL2E1x/oXeiuHm0QDzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onlY3-00Acl6-3d; Wed, 26 Oct 2022 18:54:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onlXz-00AckF-9e
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 18:54:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 25B48B8238C;
	Wed, 26 Oct 2022 18:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21A6C433C1;
	Wed, 26 Oct 2022 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666810474;
	bh=Ieo52/jNSdW27hzsdTn6oYBvOHTHSgTAdPGfBUcNP4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC4V3OvnH3tWXaHfzU4RZ+AC9GASpBSuAr3BBHRLfa4KKK58wnV0gYNSxG2b7DL0g
	 SUSkIwR9P/3Niskkm33goFHVefozJRt7rQDzkkKl5NDwCwON9dCIabexG4CgzMdeF9
	 1Y4lryEp2aDDdHlrIh4oDlQAZj81b18xoNthNokRyS4ftCkhWM+SrpPtjK8sb74nY5
	 0n8ZE/ZBP+kAecFdM92q6ErE8xFY5rkCMC+DfZCxz3GUHiBXaUUUAzW3RhHKxrcgQ7
	 2STV5dEq5JBMzsnU+3qhAVyoD6WoNXUj3CxjlQ+gwyWJMryi9Iw3mJ/hrLs3lSLOak
	 WfxIP9HcOrE3g==
Date: Wed, 26 Oct 2022 19:54:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Wen Yao <haiwenyao@uniontech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	dennis@kernel.org, tj@kernel.org, cl@linux.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] riscv: percpu:Add riscv percpu operations
Message-ID: <Y1mCZT8ejRpvCfw6@spud>
References: <20221026104015.565468-1-haiwenyao@uniontech.com>
 <20221026104015.565468-2-haiwenyao@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026104015.565468-2-haiwenyao@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_115439_643540_8A2CD745 
X-CRM114-Status: GOOD (  18.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Wen Yao,
Couple comments for you.

On Wed, Oct 26, 2022 at 06:40:14PM +0800, Wen Yao wrote:
> riscv: percpu:Add riscv percpu operations

Can you please consistently use ": " between parts of the commit
messages? For both this and patch 2/2.

> This patch use riscv AMO(Atomic Memory Operation) instructions to

nit: s/This patch/Use (or better:
"Optimise some ... using RISC-V AMO (Atomic..."

> optimise some this_cpu_and this_cpu_or this_cpu_add operations.
> It reuse cmpxchg_local() to impletment this_cpu_cmpxchg macros.

s/It Reuse/Reuse, and "impletment" is a typo.

> It reuse xchg_relaxed() to impletment this_cpu_xchg macros.
> 
> Signed-off-by: Wen Yao <haiwenyao@uniontech.com>
> ---
>  arch/riscv/include/asm/percpu.h | 101 ++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 arch/riscv/include/asm/percpu.h
> 
> diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
> new file mode 100644
> index 000000000000..ae796e328442
> --- /dev/null
> +++ b/arch/riscv/include/asm/percpu.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Union Tech Software Technology Corporation Limited
> + */
> +#ifndef __ASM_PERCPU_H
> +#define __ASM_PERCPU_H
> +
> +#include <asm/cmpxchg.h>
> +
> +#define PERCPU_OP(op, asm_op, c_op)                                            \
> +	static inline unsigned long __percpu_##op(void *ptr,                   \

Can you please make sure that these \s are actually aligned & swap the
spaces you've used for tabs? The other files that I checked in this
directory all use tabs for \ alignment in macros.

Thanks,
Conor.

> +						  unsigned long val, int size) \
> +	{                                                                      \
> +		unsigned long ret;                                             \
> +		switch (size) {                                                \
> +		case 4:                                                        \
> +			__asm__ __volatile__(                                  \
> +				"amo" #asm_op ".w"                             \
> +				" %[ret], %[val], %[ptr]\n"                   \
> +				: [ret] "=&r"(ret), [ptr] "+A"(*(u32 *)ptr)    \
> +				: [val] "r"(val));                             \
> +			break;                                                 \
> +		case 8:                                                        \
> +			__asm__ __volatile__(                                  \
> +				"amo" #asm_op ".d"                             \
> +				" %[ret], %[val], %[ptr]\n"                   \
> +				: [ret] "=&r"(ret), [ptr] "+A"(*(u64 *)ptr)    \
> +				: [val] "r"(val));                             \
> +			break;                                                 \
> +		default:                                                       \
> +			ret = 0;                                               \
> +			BUILD_BUG();                                           \
> +		}                                                              \
> +										\
> +		return ret c_op val;                                           \
> +	}
> +
> +PERCPU_OP(add, add, +)
> +PERCPU_OP(and, and, &)
> +PERCPU_OP(or, or, |)
> +#undef PERCPU_OP
> +
> +/* this_cpu_xchg */
> +#define _protect_xchg_local(pcp, val)                           \
> +	({                                                      \
> +		typeof(*raw_cpu_ptr(&(pcp))) __ret;             \
> +		preempt_disable_notrace();                      \
> +		__ret = xchg_relaxed(raw_cpu_ptr(&(pcp)), val); \
> +		preempt_enable_notrace();                       \
> +		__ret;                                          \
> +	})
> +
> +/* this_cpu_cmpxchg */
> +#define _protect_cmpxchg_local(pcp, o, n)                         \
> +	({                                                        \
> +		typeof(*raw_cpu_ptr(&(pcp))) __ret;               \
> +		preempt_disable_notrace();                        \
> +		__ret = cmpxchg_local(raw_cpu_ptr(&(pcp)), o, n); \
> +		preempt_enable_notrace();                         \
> +		__ret;                                            \
> +	})
> +
> +#define _pcp_protect(operation, pcp, val)                                     \
> +	({                                                                    \
> +		typeof(pcp) __retval;                                         \
> +		preempt_disable_notrace();                                    \
> +		__retval = (typeof(pcp))operation(raw_cpu_ptr(&(pcp)), (val), \
> +						  sizeof(pcp));               \
> +		preempt_enable_notrace();                                     \
> +		__retval;                                                     \
> +	})
> +
> +#define _percpu_add(pcp, val) _pcp_protect(__percpu_add, pcp, val)
> +
> +#define _percpu_add_return(pcp, val) _percpu_add(pcp, val)
> +
> +#define _percpu_and(pcp, val) _pcp_protect(__percpu_and, pcp, val)
> +
> +#define _percpu_or(pcp, val) _pcp_protect(__percpu_or, pcp, val)
> +
> +#define this_cpu_add_4(pcp, val) _percpu_add(pcp, val)
> +#define this_cpu_add_8(pcp, val) _percpu_add(pcp, val)
> +
> +#define this_cpu_add_return_4(pcp, val) _percpu_add_return(pcp, val)
> +#define this_cpu_add_return_8(pcp, val) _percpu_add_return(pcp, val)
> +
> +#define this_cpu_and_4(pcp, val) _percpu_and(pcp, val)
> +#define this_cpu_and_8(pcp, val) _percpu_and(pcp, val)
> +
> +#define this_cpu_or_4(pcp, val) _percpu_or(pcp, val)
> +#define this_cpu_or_8(pcp, val) _percpu_or(pcp, val)
> +
> +#define this_cpu_xchg_4(pcp, val) _protect_xchg_local(pcp, val)
> +#define this_cpu_xchg_8(pcp, val) _protect_xchg_local(pcp, val)
> +
> +#define this_cpu_cmpxchg_4(ptr, o, n) _protect_cmpxchg_local(ptr, o, n)
> +#define this_cpu_cmpxchg_8(ptr, o, n) _protect_cmpxchg_local(ptr, o, n)
> +
> +#include <asm-generic/percpu.h>
> +
> +#endif /* __ASM_PERCPU_H */
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

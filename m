Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A2ACA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKls5IPQqSJLoijH8dCq/X/gI0R8Ijco3j3P3LJa2hI=; b=NdWtwdJMsnJkKB
	E/lvAv3vpSWa7w1FWR0g3ii06MT5qYAUSKf3tWA5o7ID0gB+mjjQuj2PKK93VBijygS5ookIKb47G
	pqqpHrOt+xuBJGxqxLy9sSGH3tveEBQcKDQ09/5TjlBmlIYRxGyYSsNeECBZ/NWrEZ/fE5Zi4beQ6
	9ydzpt3M+rT9v39odFUIiGF42w/LKc0/kfyGUCRRrmMXet1TzMA7lzkHISd2qycDKeWXx6E0xeJiL
	r1TNOdJM8eUvZ5xYbyhhUOKpOxhFoltjwr8GWqGeAbVv85Kb1R3oBRxLjVgT2mHDTzFZc8C7/91cU
	pR2JiBLdtaekg7U6Z+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uouSd-0000000FV7d-1wLh;
	Thu, 21 Aug 2025 01:51:27 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosCc-0000000FCXT-29Y6
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 23:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755732405;
	bh=XCs0VqFMLGNvQBFfHYDkcYu1cR0YZLv0EaV6HUuJL2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N3/pVvEw5VXa8QdhAwM7HVfsSjcYmdRrJhvocdcN8UCejCGDhF62uLjAXytcrnHu6
	 5bildu1OCOXqaorSaUHO3HLKwcq6j6TDr66DrZxk3rgbrakV5SxgV4ZVa+CaSWiuvj
	 A/oSWIgOzgb/9v2BIAstrZsYZTI8wsP/Bt6eAXvo=
Received: by gentwo.org (Postfix, from userid 1003)
	id B433B40195; Wed, 20 Aug 2025 16:26:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id B3610400CA;
	Wed, 20 Aug 2025 16:26:45 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:26:45 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: yury.norov@gmail.com, linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    dennis@kernel.org, tj@kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] riscv: introduce percpu.h into include/asm
In-Reply-To: <20250819135007.85646-3-cuiyunhui@bytedance.com>
Message-ID: <e7653089-5c57-ee61-ed01-0b3245e10d82@gentwo.org>
References: <20250819135007.85646-1-cuiyunhui@bytedance.com> <20250819135007.85646-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_162646_587447_ECD59010 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, 19 Aug 2025, Yunhui Cui wrote:

> +#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
> +static inline void							\
> +__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
> +{									\
> +	asm volatile (							\
> +		"amo" #amo_insn #sfx " zero, %[val], %[ptr]"		\
> +		: [ptr] "+A" (*(u##sz *)ptr)				\
> +		: [val] "r" ((u##sz)(val))				\
> +		: "memory");						\
> +}

AMO creates a single instruction that performs the operation?

> +#define _pcp_protect(op, pcp, ...)					\
> +({									\
> +	preempt_disable_notrace();					\
> +	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
> +	preempt_enable_notrace();					\
> +})

Is "op" a single instruction? If so then preempt disable / endable would
not be needed if there is no other instruction created.

But raw_cpu_ptr performs a SHIFT_PERCPU_PTR which performs an addition.
So you need the disabling of preemption to protect the add.

Is there a way on RISC V to embedd the pointer arithmetic in the "AMO"
instruction? Or can you use relative addressing to a register that
contains the cpu offset. I believe RISC V has a thread pointer?

If you can do this then a lot of preempt_enable/disable points can be
removed from the core kernel and the instruction may be as scalable as x86
which can do the per cpu operations with a single instruction.

> +
> +#define _pcp_protect_return(op, pcp, args...)				\
> +({									\
> +	typeof(pcp) __retval;						\
> +	preempt_disable_notrace();					\
> +	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
> +	preempt_enable_notrace();					\
> +	__retval;							\
> +})

Same here.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

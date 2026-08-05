Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6774C56201
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f4WISWu6NRdkmDoOfcA+/HjLbV0sbsft2yDV6ni5nk=; b=iQrfhP/FW/p1ne
	U4C8QBXyB+6E6MRcGNDYPScNMlCkBeUmv3t+Xa6h+HpZy2iC/YLogW50bpNkv7Bzgjdc9qDYEjCZO
	cerxbmh7U2CSwJxBH7bxOzbA0YP4L8z8v9P5g01saPN/2zIXNz1S8xSyK8lvqTmMINXtihRtKB7oy
	+/i2BW8R7XPHGPaxVW/6OiqSEhJM2CVdxY9Kd9oUHiPoJQPlc6FDkpbBfKKwDrWurv/pYEMzb4QaB
	jFmlv1+hdgKvZkEN1lnWxVGI37P8AgqRIzEFVfcpqNaSsemDrrXV1avYHPEpsz60hQS7doeP9hAV4
	oo0yCddO8EV7UVKx0GWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZJD-00000003mON-3Jjb;
	Wed, 05 Aug 2026 10:57:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZJB-00000003mNW-37fm
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 10:57:15 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785927429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71fRqqtXUfO+bJD5KP+00ZcULR5gj5K2KGfVM/BikIM=;
	b=VKIJZzOg9WLmmsZzjEHjB05iOonmZ5dAuWlOaJtIh5Szvkq5tuQlX6hhRZ+DAEdIEOk5Yx
	GRwif/FtnVz6nHms7qtAfwWs8JfpEEgb3N7lvwoZdpWMXJoVnQSsrrV8KIDBySR5RSxogV
	SyUHeQpKaxK03xJVJtEldW37sEGXLa/Hre7q21pm/jff7yxddGgijV3l1XWmVPZuW89oka
	l+IzkrFI2e4Ow6bzoEQ+d/uNRm3T5AHbi1OglzyomLTPGipvZcTxJlz2pF04PPj2cPWZvQ
	kDn421dCoXOLZjn18RSPcJjTPeFAGkGL0Kcx15nxejXv03eSJsx3dH0EkFKnzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785927429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71fRqqtXUfO+bJD5KP+00ZcULR5gj5K2KGfVM/BikIM=;
	b=MYVbG8L2L5AnSpVAOWIlJO79Nwv09fVLBDBb1zO5HD84ZoSXQI+hq9Ag0BcMSkzTCV3a/G
	hPDc3ZR6OXaTPlBg==
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Jiakai Xu
 <xujiakai2025@iscas.ac.cn>, Matthew Bystrin <dev.mbstr@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rui Qi
 <qirui.001@bytedance.com>, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
In-Reply-To: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
References: <20260705063656.237676-1-xujiakai2025@iscas.ac.cn>
Date: Wed, 05 Aug 2026 12:57:08 +0200
Message-ID: <87y0ek96nv.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_035713_919064_719702EA 
X-CRM114-Status: GOOD (  13.17  )
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

Jiakai Xu <xujiakai2025@iscas.ac.cn> writes:

> The fp_is_valid() function uses ALIGN(sp, THREAD_SIZE) as the upper
> bound for the frame pointer check. This bound is calculated relative
> to the current sp and shifts upward when sp itself exceeds the valid
> stack region, allowing the unwinder to read past the end of the
> allocated task stack and triggering KASAN stack-out-of-bounds.
>
> Fix this by using absolute stack boundaries determined once before
> the unwind loop:
>
> - When sp is on the task stack, use the task's pt_regs as the upper
>   bound.
> - When sp is on the overflow_stack (CONFIG_VMAP_STACK=y), use the
>   overflow_stack's top as the boundary.
> - When sp is on the IRQ stack (CONFIG_IRQ_STACKS=y), use the IRQ
>   stack's top as the boundary.
> - When sp is not on any known stack, warn and return.
> - For remote tasks (task != current), if sp is not on the task
>   stack, warn and return since we cannot reliably determine the
>   correct boundary from a different CPU's stacks.
>
> Make the DECLARE_PER_CPU(overflow_stack) unconditional in
> asm/stacktrace.h so that stacktrace.c can use
> IS_ENABLED(CONFIG_VMAP_STACK) instead of #ifdef, in line with the
> kernel coding style which discourages the use of #ifdef in .c files
> (https://docs.kernel.org/process/coding-style.html).  This is safe
> because the DEFINE_PER_CPU (memory allocation) in traps.c remains
> guarded by CONFIG_VMAP_STACK; the reference in stacktrace.c is only
> compiled when IS_ENABLED(CONFIG_VMAP_STACK) evaluates to true.
>
> Fixes: a2a4d4a6a0bf ("riscv: stacktrace: fixed walk_stackframe()")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V3.2

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

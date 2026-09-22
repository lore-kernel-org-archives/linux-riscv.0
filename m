Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E934DC982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+XiLgpZQXKjIczwCh7d0by3RYf38tGwDn2TYVJY+h0=; b=XgK/Z9VdKuqjpI
	EBenxTiuK8HTMKIPFc6FW/2OsRgCyCKv4hFRcN3IKw3iki70Of9/oOVSraypeu2Gd6BWGoPPRD8Fx
	sjGv1YOidQmB5HrwDQOo5SadnLxDp4JxF+EKGAryyiJdqL3Kpy+51OcW1bbQRZMAWDlEq22gPgDNq
	COZJBh0iYUzkKj2BvetiSo2jho2vSOfkpuXUXv5t0DWclQEVaD+Fubsvcm8RPMCPR/3VBY66li3YI
	vpG602OLq9OrYMPge0CPNHu4zqn4nz0h0N9aiE/+6eJw7R6DnOPL17nwV2PA6h3RB2iP9dM72S483
	Uqkx6/YMyHcY9zSOqgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90gw-00000005YMa-1HXB;
	Tue, 22 Sep 2026 13:37:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90gr-00000005YD6-3fuZ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 13:37:49 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790084248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvslMemEIQYmmgSSXmqQM0ksEJnRmaYS73vHFe+6v+0=;
	b=uOOt1tLek33ASdST8Yp73mPMfjxRAhA6LrtLNjU6yUWCbokjxvS2s+0CAL/DWDDp10yFSG
	ToK0/Y+RCiN63JbK/1XRlBr0CXRmqiuQnIRc5QLHQQuCfbFEqGKqIUrj+eRevxdKOwnXbI
	FJxmQdk+nux3jx1NZagQETe00QPwUqPJlBjD38AkUUdqNoo/MkNrr3Qy+y2VIz8IkX9V1P
	0yqeBmTRuJWVIBT0OeOu4YHzpMZMOCuT1uN/lsHaUuwIVEXEan7pZY8XAIIoRTQKtVR5KG
	yujDPKNoYaUKVh4jV6pK83RPXPhtaM84OWtdUvg9tbzAMyBpsuwuEQE4zD7c9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790084248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvslMemEIQYmmgSSXmqQM0ksEJnRmaYS73vHFe+6v+0=;
	b=18LxCme+fDfgzUn5Ao3SE31boe+hDT+mIs3XLqQ1LVMiaDa6X/gjpKPOUydP7Ak3Oy89Or
	sCj78VykyBHC9fCw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v4 1/2] riscv: probes: reject kprobes inside LR/SC
 sequences
In-Reply-To: <20260828091202.1124-2-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
 <20260828091202.1124-2-yuanxiaofeng@eswincomputing.com>
Date: Tue, 22 Sep 2026 15:37:27 +0200
Message-ID: <87v77xe7ag.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_063746_062266_2FC1076A 
X-CRM114-Status: GOOD (  25.12  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> kallsyms_lookup_size_offset() returns the offset of the probe from the
> start of the enclosing symbol, which is used to find the function start.
> If the probe address exactly matched a kallsyms symbol, that offset would
> be 0 and the forward scan would be skipped, silently missing the LR/SC
> sequence.

...okay, that sounds like a problem.

> To avoid this, global labels should not be placed at interior
> instructions of an LR/SC sequence.

"Should not be placed" by whom? Kernel developers, compilers? And how do
we ensure that?

> In practice this is not a
> restriction: LR/SC sequences are tight retry loops and generally do not
> carry global labels inside them, so the enclosing function start is
> resolved correctly and the forward scan proceeds as intended.

"Generally" not a problem is not good enough, sorry. It either is a
problem and we must deal with it, or it is never a problem.

I am not sure if labels will be placed between LR and SC. But a label on
the LR instruction sounds entirely possible.

What confuses me is that this case does not sound difficult to
accommodate. Any reason why we should not or cannot do that?

> +/*
> + * A trap taken in the middle of an LR/SC sequence clears the load
> + * reservation, so an SC following the probed instruction would always
> + * fail and the enclosing retry loop would re-enter the breakpoint.
> + * Reject probes inside such a sequence.
> + *
> + * A constrained LR/SC loop (Zalrsc) is at most 16 instructions and
> + * must be contained in a 64-byte contiguous region of memory, so only
> + * instructions within that window preceding the probe can open a
> + * sequence containing it.  RISC-V instruction boundaries cannot be
> + * recovered by walking backwards - a 32-bit instruction whose upper
> + * halfword looks like a compressed instruction is ambiguous - so walk
> + * forward from the function start, a known instruction boundary, up to
> + * the probe address and track whether an LR is still outstanding.
> + */
> +#define MAX_ATOMIC_CONTEXT_SIZE	64

Doesn't this mean we can walk for more than 16 instructions and
therefore can have false rejection?

> +static bool __kprobes riscv_probe_insn_in_atomic(unsigned long addr)
> +{
> +	unsigned long start, offset, pc;
> +	bool in_atomic = false;
> +
> +	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
> +		return false;
> +
> +	start = addr - offset;
> +	pc = start;
> +
> +	while (pc < addr) {
> +		u16 halfword = *(u16 *)pc;
> +		unsigned int len = (halfword & 0x3) == 0x3 ? 4 : 2;

We already have a macro to get the instruction length, please use that.

And why do we need to separately load 16-bit 'halfword' here, and load
32-bit 'insn' later on? Can't we use 'insn' for both usage?

> +
> +		if (addr - pc <= MAX_ATOMIC_CONTEXT_SIZE) {
> +			if (len == 4) {
> +				u32 insn = get_unaligned((u32 *)pc);
> +
> +				if (riscv_insn_is_lr(insn))
> +					in_atomic = true;
> +				else if (riscv_insn_is_sc(insn))
> +					in_atomic = false;
> +			}
> +		}
> +
> +		pc += len;
> +	}
> +
> +	return in_atomic;
> +}
> +
>  int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  {
>  	u16 *insn = (u16 *)p->addr;
> @@ -79,6 +130,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  	if (!arch_check_kprobe((unsigned long)p->addr))
>  		return -EILSEQ;
>  
> +	if (riscv_probe_insn_in_atomic((unsigned long)p->addr))
> +		return -EINVAL;
> +

arch_check_kprobe() is already doing a walk. It probably is a good idea
to merge this with that, to avoid walking twice.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

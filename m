Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34473C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxPpmuVs0psDDLxfuRcA0Ex8hvXLecO42FKTSJwmQ4Q=; b=RyQXJCgZ1ucPMn
	FD3zvoS1H4p0HH4cDiDAR6Ioe1VWlZgH5oBSh4OK7Rq7Dkr08kh1RpzsmLI7Y1+uoNvhL9rjHjyah
	/MuojpkSNuVO2zD3MHIfLCCBV75gvjP8woLaUDmhKoHUW7hgIT3t4oru5XvSAFm0Is7lpktXoCCje
	URteHS/M3a8XTcuEY88FKSClGPKU1Jxb18GA6707lBxTEG6LuxWvi7SQoMFy2L1xqlxrMsxYJALHP
	ZtewJotmM97fB35dfVaiZCmgU0FILp+QAr60yF2wDT09+GD6urdc9+8x9m+ZL5BDnVa8lyCtDjMFx
	5VcvLEsNcVQ34Mta6vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfUW-00000009kiL-1tsI;
	Wed, 19 Aug 2026 12:34:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfUT-00000009kgq-2WlV
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 12:33:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787142835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GUmvpv/qhdwns6mT62MT5RE9RITs56cprUq89W6UKxM=;
	b=007vOlfsJ+ZARvErkPXbN5s7th0P6PbVX6fXMQOneWk3mrTrvVtdbJPelvhU0cqJaBYEHs
	NoP/g1dvlyEYDjX74SeyYhwieIxWTistB8ujlPFunohDnmYoei5VlJruP5MSfBpb3fXy/6
	bc95O2RP2IROYzHYEVYcHSrZeJGMIBRsb05lUesomprYP7UUFAlheWmDDsSlt+wPJq+avX
	z7CdhdbtZhWO4qW/1C/DFpJBpNOoZXmg2nit7MG7+hlj17rzAoVYExJ3AoUeNJqYgli/rh
	U+gKsa2BLUDfRF6NMkDMugTrqGFyRDnO1581QZRthgoLV51d151EXOrczl2oFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787142835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GUmvpv/qhdwns6mT62MT5RE9RITs56cprUq89W6UKxM=;
	b=MppqYGa2QrwMSLNnWRKZsjPmuex86ragutfUN2PO8y2TjuTBVM1USSunmkR1dl/4qFyutH
	MVRLEx7ggiLDmxBw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 yuanxiaofeng@eswincomputing.com
Subject: Re: [PATCH] riscv: probes: reject kprobes inside LR/SC sequences
In-Reply-To: <20260819102922.1747-1-yuanxiaofeng@eswincomputing.com>
References: <20260819102922.1747-1-yuanxiaofeng@eswincomputing.com>
Date: Wed, 19 Aug 2026 14:33:55 +0200
Message-ID: <87tsoql26k.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_053357_783314_1BBB2E0A 
X-CRM114-Status: GOOD (  12.03  )
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
> +/*
> + * A trap taken in the middle of an LR/SC sequence clears the load
> + * reservation, so an SC following the probed instruction would always
> + * fail and the enclosing retry loop would re-enter the breakpoint.
> + * Reject probes inside such a sequence.
> + *
> + * A constrained LR/SC loop (Zalrsc) is limited to 16 instructions placed
> + * sequentially in memory (64 bytes in the base ISA), so scanning back
> + * that far covers every possible enclosing sequence.
> + */
> +#define MAX_ATOMIC_CONTEXT_SIZE	64

What about C extension? Does this 64 still work?

> +
> +static bool __kprobes riscv_probe_insn_in_atomic(unsigned long addr)
> +{
> +	unsigned long tmp, offset, scan_start;
> +	bool in_atomic = false;
> +
> +	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
> +		return false;
> +
> +	tmp = addr - offset;				/* function entry */
> +
> +	if (offset > MAX_ATOMIC_CONTEXT_SIZE)
> +		scan_start = addr - MAX_ATOMIC_CONTEXT_SIZE;

What guarantees that 'scan_start' points to the beginning of an instruction?

> +	else
> +		scan_start = tmp;
> +
> +	/* advance to the scan window, keeping instruction alignment */
> +	while (tmp < scan_start)
> +		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
> +
> +	/* scan the window, tracking whether an LR is still outstanding */
> +	while (tmp < addr) {
> +		if (GET_INSN_LENGTH(*(u16 *)tmp) == 4) {

Why is tmp casted to (u16 *)? An instruction can be 32 bits.

It still works, I think, but looks confusing.

> +			u32 insn = *(u32 *)tmp;

Reuse this insn for the GET_INSN_LENGTH() above?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

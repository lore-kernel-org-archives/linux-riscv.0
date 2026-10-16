Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D042BCCA464
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRhzVTM/5kd9UeRFnMwLN4495bH4ncauII4Wahetomk=; b=xukqsPV4tVsu20
	t67akqL0qDNf/H7leVu6DgHf1NsKp1dBG2lkVD5n5ubg4eymGyMEDFXDO+JdJLxRNCeL3jFkFbp7j
	bsTjLUgb4Ygjnt684rkdohDIFnXj1p4OIBv2fT8F5+2CQs74Ocio0OLbyBpIZFZxZpDAdek/EVMT5
	ouNLkJLlLovHBTOkl5Bh2hRdqlnBZOEzgsi3lXCgdk4ALWfjl6Mc/P4seD+lFz/c2H5HcXf0UkrRT
	HYCtSz06zqOdAf10AaE3RK+7xuY/HVOzfT8fa0AhjDDOYPLqlMO+quZY9LnzN83a8ILGAf/3MaG/m
	x644g4fubJYPKD2ibOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHewu-00000002a8Q-3cpR;
	Fri, 16 Oct 2026 10:14:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHews-00000002a7w-1FoG
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 10:14:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792145640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvR7oQutL7jrEfWP/R+GUbT2UYY00800fNri/81jLPU=;
	b=FPIhoC9f0f1LKG/er39KVSu3yahFfZdPBlbmS9+1ehXmWapObPU416wKuzRi+iHzH3arg9
	HNz5Ys/TusyBKAGCllDKSei2QkhaddF8FAmswoZDUJrsPx+X/OvScRAJ1Im3xvY3lPKRW7
	dhRfxdUx7NSx8T7MOts3jNBQO8zSGAhxqPm5J7e6KUUH+QJ/bRgPs+YAoP1hgBNh57sXoH
	6d/ihnaA5j+nWfdaHNO3sOE6iXkBo+qgztWC1rG/PXh3Bato/GNVw03Nw+kjtGpCORj3D1
	N9x1l9Y1G+nvlKWTpGPiFfnHxUCaoBUR4wBqQKwBMaE+O8vq9GGEhmJXSqmRBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792145640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvR7oQutL7jrEfWP/R+GUbT2UYY00800fNri/81jLPU=;
	b=QK4XbgSfnoSubrvKF6JfO+oY1KD696knkPtcae5qxtQ3E47EwqyE0unPnbWiI4FDCDh/oM
	Nmr71tfyPbGQSDDA==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Naveen N Rao <naveen@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Masami Hiramatsu
 <mhiramat@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Xiaofeng
 Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v6 1/2] riscv: kprobes: reject probes inside LR/SC
 sequences
In-Reply-To: <20261016081706.1085-2-yuanxiaofeng@eswincomputing.com>
References: <20261016081706.1085-1-yuanxiaofeng@eswincomputing.com>
 <20261016081706.1085-2-yuanxiaofeng@eswincomputing.com>
Date: Fri, 16 Oct 2026 12:13:58 +0200
Message-ID: <87se263qc9.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_031402_491229_95A89A67 
X-CRM114-Status: GOOD (  11.60  )
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
> +static __always_inline bool riscv_insn_is_lr(u32 code)
> +{
> +	u32 funct5 = (code >> 27) & 0x1f;
> +	u32 funct3 = (code >> 12) & 0x7;
> +
> +	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_AMO &&
> +	       funct5 == RVG_AMO_FUNCT5_LR &&
> +	       (funct3 == RVG_FUNCT3_AMO_W || funct3 == RVG_FUNCT3_AMO_D) &&
> +	       !(code & GENMASK(24, 20));
> +}
> +
> +static __always_inline bool riscv_insn_is_sc(u32 code)
> +{
> +	u32 funct5 = (code >> 27) & 0x1f;
> +	u32 funct3 = (code >> 12) & 0x7;
> +
> +	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_AMO &&
> +	       funct5 == RVG_AMO_FUNCT5_SC &&
> +	       (funct3 == RVG_FUNCT3_AMO_W || funct3 == RVG_FUNCT3_AMO_D);
> +}

There are already RV_EXTRACT_FUNCT3() and RV_EXTRACT_RS2_REG(), we
should use them to avoid code duplications.

And I think we should also have RV_EXTRACT_FUNCT5() to stay consistent.

> +static int __kprobes arch_check_kprobe(unsigned long addr)
>  {
> -	unsigned long tmp, offset;
> +	unsigned long pc, offset;
> +	int outstanding_lr = -1;
>  
> -	/* start iterating at the closest preceding symbol */
>  	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
> -		return false;
> +		return -EILSEQ;
>  
> -	tmp = addr - offset;
> +	/* pc starts at the closest preceding symbol, a known instruction boundary */
> +	pc = addr - offset;
>  
> -	while (tmp <= addr) {
> -		if (tmp == addr)
> -			return true;
> +	while (pc < addr) {
> +		u32 insn = get_unaligned((u32 *)pc);
> +		unsigned int len = GET_INSN_LENGTH(insn);
>  
> -		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
> +		if (riscv_insn_is_lr(insn))
> +			outstanding_lr = 0;
> +		else if (riscv_insn_is_sc(insn))
> +			outstanding_lr = -1;
> +		else if (outstanding_lr >= 0 && ++outstanding_lr > MAX_LRSC_GAP)
> +			outstanding_lr = -1;
> +
> +		pc += len;
>  	}

The spec says "The loop comprises only an LR/SC sequence and code to
retry the sequence in the case of failure, and must comprise at most 16
instructions placed sequentially in memory". The 16 instructions limit
includes LR. So I think this implementation is off by one:

    lr     (outstanding_lr=0)
    inst1  (outstanding_lr=1)
    inst2  (outstanding_lr=2)
    ...
    inst16 (outstanding_lr=16)
    inst17 (outstanding_lr=-1)

As it is considering instruction from LR to inst16 to be a loop, so it
allows 17 instructions.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

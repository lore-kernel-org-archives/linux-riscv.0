Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656BFC48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FZq3XnTm8MSMwKXjzM+kN8vISxGtD+Qmod81+rhQKs=; b=ZrX47BkOpM1EXD
	hP2iszl1WDakh6UU02/yokzwL7ZfGNxHA/pOVzt1F7FqEhClhf5n/sl7vDG3YKpZIEWbsmbd+VNS5
	a7ZLtdw/lEs0W8NJT+Q2Opg2DA+67fOSa4HtJUKKFgru5jU1iEtDJ4RQmEPhkm/AWRs0jp89l3suW
	9TzyAkCrQBZfqCOayqFXd/syc4c/W4UYoO3QWCotLZBbkrZXUjyOdxOTCA4D86k0JB4dOvgaCXBXX
	cwNVheIzoD7WWVI6PUSaPmeFLCJvY/KjRB9qlc6/knQCx6QZ/dZsKFiwqMvj4R3M0kE6QZnoQYjrs
	pFWCNOm8CZ3ypHo1S9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWGX-00000005Tnx-344q;
	Mon, 12 Feb 2024 13:22:33 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWGU-00000005TlD-1xdU
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 13:22:32 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 4768A5C0091;
	Mon, 12 Feb 2024 08:22:22 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute7.internal (MEProxy); Mon, 12 Feb 2024 08:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707744142; x=1707830542; bh=tYVEFq3KKz
	S37pkWyX/NsqZeEFJtfC+Kq3xqJ9xTUUw=; b=2IDabaR/c5r7d0u6aFiFX+gumQ
	jMW8jt0nS+HZAdZ8nxsX2VdAaY8xI+1WhfLuLcSK5r53s7Ki/8jsrqiH4bWs9NsV
	CgcZiMYo7rkHxDJsxDmWpNhj7Z9CaqrReRR0A79n1YnW+nI1PbVHpWjoWlUo7vh7
	FQNOamToROwO8i7cFOGr/9csN2cLgcvIvWinycxy8BMTBqwxkUjP8SLBwWUT3u2a
	XilQw2JP/x5FOKCMPsd7cl9k1CmieeZwcaWT0jI1G5XiiGUaehLEXLbrTBhiTBsW
	wSG6WaEjMHLzdVsmoclglJNuE/Nirz67QF5K2NKr7RJIsDMRDI2Dr5h++YlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707744142; x=1707830542; bh=tYVEFq3KKzS37pkWyX/NsqZeEFJt
	fC+Kq3xqJ9xTUUw=; b=Qu3c62fkEzwLe4zVsFeTcyfEPKecebSJOt9Ijws3FKK/
	nlX8GLbVeA/SFcc92j7tfxoC+ZqlEMom/zXQa4OzOiAa3LrTK0MefB6hmrhDtUFo
	5CbnVo7UA2Y6CP5cfPzaFils8r2Jk3BqV4IZREI8ccMKwyK8Nw0tHueUvmGjwRx9
	h6T5jKo3QAhHPabjdecrdOA5e0X0lz/eOU4p+ePrSjXAN+hA1O9952q1RanGiYmU
	FNzWKpSUD8nCbsiTCEsdxsbbvhHo6wjxdJuXWS+VLhZe9id538OqaVxsR+/bk7k3
	ACw2Ydu8dVB5C83yFfKZVfZiBVUz/0ZZvpRnbcA1Fw==
X-ME-Sender: <xms:jhvKZU_Z3l9oXS-8vieFhUr2clmUpfXFw9mpQHArVcLerTt1K4XcNg>
    <xme:jhvKZTn8VEqFD0kHe8dg-SA7lJMHrMPENVXBjlSS98NKhAeGBgm6uxTh0is4uVtx0
    WJ6CMJsPrrgJDzKAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuthgv
    fhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueehgedtueetgefhheejjeeigffhieefjeehuddvueegtdfh
    heevgfeggfektdenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsohhrvggrrhesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:jhvKZW8b6P0WMstMn4TE8hgAytgqMpybfxscv8mrDCQJl3kDhGvRgg>
    <xmx:jhvKZRlyoJ426oqFfB_wyZjGy_fyZewuoPV9nLFRngBgiOmbzFpYhw>
    <xmx:jhvKZT3LDfEg7ERXsYiIIQ2O7fN_9qsoTUI28-EBuo_KlCFyh4nMAw>
    <xmx:jhvKZU5OPiOkLZOwMGT-L4EMv3Yu6RGdfdchJlPA88gCFUSudcpuCQ>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1F8501700093; Mon, 12 Feb 2024 08:22:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <f1d370c1-a7d8-4240-a15a-a55616f5b4a6@app.fastmail.com>
In-Reply-To: <20240212022642.1968739-2-samuel.holland@sifive.com>
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
 <20240212022642.1968739-2-samuel.holland@sifive.com>
Date: Mon, 12 Feb 2024 08:21:58 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
Subject: Re: [PATCH -fixes 2/2] riscv: Save/restore envcfg CSR during CPU suspend
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_052231_032836_041EA87D 
X-CRM114-Status: GOOD (  25.23  )
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

On Sun, Feb 11, 2024, at 9:26 PM, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
>
> Because the [ms]envcfg CSR is part of the base RISC-V privileged ISA
> specification, it cannot be detected from the ISA string. However, most
> existing hardware is too old to implement this CSR. As a result, it must
> be probed at runtime.
>
> Extend the logic for the Zicsr ISA extension to probe for the presence
> of specific CSRs. Since the CSR number is encoded as an immediate value
> within the csrr instruction, a switch case is necessary for any CSR that
> must be probed this way. Use the exception table to handle the illegal
> instruction exception raised when the CSR is not implemented.

We support non-conforming extensions, so we can't assume that if an
implementation does not provide the Ss1p12 extension which defines senvcfg,
the corresponding CSR number will not be used for other purposes.

-s

> Cc: stable@kernel.org
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  arch/riscv/include/asm/csr.h     | 23 +++++++++++++++++++++++
>  arch/riscv/include/asm/suspend.h |  1 +
>  arch/riscv/kernel/cpufeature.c   | 23 +++++++++++++++++++++++
>  arch/riscv/kernel/suspend.c      |  2 ++
>  4 files changed, 49 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2468c55933cd..daff95feb817 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -542,6 +542,29 @@
>  			      : "memory");			\
>  })
> 
> +#define ALT_CSR_READ(csr)					\
> +({								\
> +	unsigned long __v;					\
> +	__asm__ __volatile__ (					\
> +		ALTERNATIVE("li %[v], 0", "csrr %[v], %[r]", 0,	\
> +			    csr << 16 | RISCV_ISA_EXT_ZICSR, 1)	\
> +		: [v] "=r" (__v)				\
> +		: [r] "i" (csr)					\
> +		: "memory");					\
> +	__v;							\
> +})
> +
> +#define ALT_CSR_WRITE(csr, val)					\
> +({								\
> +	unsigned long __v = (unsigned long)(val);		\
> +	__asm__ __volatile__ (					\
> +		ALTERNATIVE("nop", "csrw %[r], %[v]", 0,	\
> +			    csr << 16 | RISCV_ISA_EXT_ZICSR, 1)	\
> +		: : [r] "i" (csr), [v] "rK" (__v)		\
> +		: "memory");					\
> +	__v;							\
> +})
> +
>  #endif /* __ASSEMBLY__ */
> 
>  #endif /* _ASM_RISCV_CSR_H */
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 02f87867389a..491296a335d0 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -14,6 +14,7 @@ struct suspend_context {
>  	struct pt_regs regs;
>  	/* Saved and restored by high-level functions */
>  	unsigned long scratch;
> +	unsigned long envcfg;
>  	unsigned long tvec;
>  	unsigned long ie;
>  #ifdef CONFIG_MMU
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c5b13f7dd482..934090270ae5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -954,6 +954,27 @@ void riscv_user_isa_enable(void)
>  }
> 
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> +static bool riscv_cpufeature_probe_csr(u16 csr)
> +{
> +	bool ret = false;
> +
> +	switch (csr) {
> +#define PROBE_CSR_CASE(_csr)			\
> +	case _csr:				\
> +		asm("1:	csrr zero, %[csr]\n"	\
> +		    "	li %[r], 1\n"		\
> +		    "2:\n"			\
> +		    _ASM_EXTABLE(1b, 2b)	\
> +			: [r] "+r" (ret)	\
> +			: [csr] "i" (_csr));	\
> +		break
> +	PROBE_CSR_CASE(CSR_ENVCFG);
> +#undef PROBE_CSR_CASE
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * Alternative patch sites consider 48 bits when determining when to patch
>   * the old instruction sequence with the new. These bits are broken into a
> @@ -974,6 +995,8 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
>  		return true;
> 
>  	switch (id) {
> +	case RISCV_ISA_EXT_ZICSR:
> +		return riscv_cpufeature_probe_csr(value);
>  	case RISCV_ISA_EXT_ZICBOZ:
>  		/*
>  		 * Zicboz alternative applications provide the maximum
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 239509367e42..fe544f12a5c5 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -15,6 +15,7 @@
>  void suspend_save_csrs(struct suspend_context *context)
>  {
>  	context->scratch = csr_read(CSR_SCRATCH);
> +	context->envcfg = ALT_CSR_READ(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
> 
> @@ -36,6 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, context->scratch);
> +	ALT_CSR_WRITE(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
> 
> -- 
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287CCC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaZnTdr+q0X9DABu/IYpyPxixNvWdsx2een2cIOzcI8=; b=0mRz1tTtsBoMXx
	+4DFjrOuQ9Lc0QxBlgepqlw5IvSn/EH83DVJcZ0Pt02IafdXVB2nJG/gPBpcy5cinJjGNkv67V6CP
	YQSeJQbDQ2x0NzHJ9rsaZRPlS14GcyheWtVSFOwsq7O+CaFdBdu7ESLJiLmiBvqFiWEVCRJNwiNlt
	TeFfROrzhhddttQgLpmkFej7v3hqeYmN0pMEKmFammJjNAAqq5QjzNmWNifNwVnYH9q6EN9HIXi1B
	f7Uhg2KBUQcq5lwTMBFUKwGMQbrTEQRKsrSrjtlV5MybeEoWsgrEmQDEkA2FGWz/HaqIK2sTZmYV0
	h7JEFTS8sOVVOdP01IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTPn-00000004qeY-1ttO;
	Mon, 12 Feb 2024 10:19:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTPl-00000004qdp-0iuW
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 10:19:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so3885305a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 02:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707733191; x=1708337991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvQWREAbmI4M99JLIGIgWuWSahreIBj4RerUN8XO8hU=;
        b=elzxLKU7DkaCvgDoNWEX01m7BxA3dWVuu2Pcq9kPX6GIOamWQLj5vITWfNcOtGKLEf
         qYNdqrfJarQGUkPJR60HTDUxwzllPpbIhaJPAiiXb+KbDCk7CFvibq/R+VeHglk8aCnH
         2o+J7ik2LmJdfDuUnphpDkDnNet1SE+cKR88HWxOmgLxR48Qz0TEDD8Vpf5Ng6J7Lh7t
         Ut2+l/HcLPosHl2ekA4YZsef4hVUpu5NwYauKttUChhcPwg9wduXG8vlrk1fZig2hgCQ
         MEvywhIRVPZypdT//8w7ObS1jbuXig52ZHnLAaGJ5dhNnL4IRbRMEYZbF1f9sZ/CKmqo
         RReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733191; x=1708337991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvQWREAbmI4M99JLIGIgWuWSahreIBj4RerUN8XO8hU=;
        b=PrVoaByS/4AkGMzYjPk1KsirSjP/HLPERfmzeGzcnXQIB5cfcf4iqVN3hMmt4BumbV
         ktT5Yxa7ZnD+uPjTEfrd0hB3tSNy0on60c3ps4tBxBGrFNyGXosc9CoZflPommJrMgk3
         LNcnR7aLXEPfidQ+iR5GgPyAgf+lzm19R/pqEwEUgD7n81ulOPr1Ko4J8szJWWAvheRE
         Dvm9AHOzRqOxHKRo3ffKmIOzmHX8eDNWzUkizhYT89Lu2kdbQ3GVeF8FPW5LgneZJcmZ
         eMsQswfq8UCkcaQUzHVCL8oH8iyXiyBFHXRodh2JtQqm4kYsjchIjpSDT43UTU8Eot4j
         b1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlntUBqzXNepKwLCp5kO0FYc/39y6itbjMy/u3xvRVr64gny3bllUvJISpDPLZKDZMKNpn671zoUY258dXxdoED8FcEwzt3HnQbSKafve+
X-Gm-Message-State: AOJu0Yybfc+zeSJowTj14IsWqUURy3v/Vk8TUtkPQul+wqhfeb0IBOEp
	ztmDAUWz4FyeArHBwTcB2gS8o2iVJc0lZTjpznQS/pDai0vhIIRyR5XRjOnUcOg=
X-Google-Smtp-Source: AGHT+IHlsTal0b91kFfibooXXny8PGCQtBgjmj4hfoNc/+LJNCtv/jeHO2qaGel1Ug7B3Ev++yRt5w==
X-Received: by 2002:a17:906:d96a:b0:a3c:89b0:e668 with SMTP id rp10-20020a170906d96a00b00a3c89b0e668mr2112915ejb.36.1707733191304;
        Mon, 12 Feb 2024 02:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV67dp3FLi/peU2IOFWDLk7uCQ1YgdnzVTUYHUcexVvVv5h7WYXgpunkZbZe4aBX7CRRGTpMgSOfDuJfFrtvhSu6qCzhJ6tudZxsA5lxSGcZ2a/MdIsgweoDI4u5SB0FLL0mslqaVsCRoAcvxlc4SXf3F42zvjQ2ICJDxNM8hSI4A==
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h13-20020a170906718d00b00a3c8dbdcf74sm59112ejk.29.2024.02.12.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:19:50 -0800 (PST)
Date: Mon, 12 Feb 2024 11:19:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH -fixes 2/2] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240212-9bb1aef7caf675693458455c@orel>
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
 <20240212022642.1968739-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212022642.1968739-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_021953_242946_1C2F1FC0 
X-CRM114-Status: GOOD (  25.33  )
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

On Sun, Feb 11, 2024 at 06:26:15PM -0800, Samuel Holland wrote:
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
> 
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

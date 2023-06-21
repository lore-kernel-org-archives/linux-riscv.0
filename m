Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4B0EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN8ZKIuME9h6aQe2zUJVKgr0two/M0tUTAI7CPoHc80=; b=rjVzDR4JvGIQPD
	15qmVmk5G4t+C920ivoviHu1ZmgloD0nHhFXITQ5alJEVI85vuy8i/IHlaNsHSg3WUhcXsqTEouV6
	+Ii0mMiscsWmZxdQ8w8+9DFgB8k1FgGvtps7EIMtalcKMJLO15g9SJ9BTTI+LBQDl9QIgyhEN8nwT
	fXxMAXFiN1NTb5FQ6g+JdoiHsTY3nXR+t7oMh80Prp/UdpO3gmQhDNBqnAAuQ6p4F0t5njFd7EM6h
	z+B42yGEXMj1l6oeOMn+AEK20oxOhbJ9LRCDN3D7wcKqJqBUxpxaiEnY3HCQOEi6yqh4kheK8T4oD
	Qo6izKAG4Iz/ipwUcj4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByby-00En2k-2q;
	Wed, 21 Jun 2023 14:15:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBybv-00En1P-0K
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 14:15:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9741caaf9d4so726753766b.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687356899; x=1689948899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kU1ZiKurhJLcGchiVnztyssu+PpzlefSmFjprXGXeys=;
        b=luCcAgkK2aIAMiCMLZMuE+c6/DCRa0LN7lSepG9tev02tRGrUWDTCHMVVM1oZueRd5
         kcmlLqb1VrvvI9u0HpFGUfl3Pp3u0dm2EbFsc76ampRerd2XW1rhojSNffUL4Z6U6crn
         kawJBgHoVd9/Vmi6/sNrqUJYCgTx9DiKJWg97eCeLnp8KKdw6ENFJsBhVAjYAnKF/Dhc
         CdsmmQUoNOQXL3Dxo3UP8ThxCeoiH4pnNmgES+wq1Xh+twXjPJh3v7jpIg7OtM2AtYrH
         KC1obSC2VVVIqOk9PkBCF4NifqABpZGB2Bv0onJ9MMg3JBYy5ll/ajBRZbHYzqDyGpkf
         LDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356899; x=1689948899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU1ZiKurhJLcGchiVnztyssu+PpzlefSmFjprXGXeys=;
        b=NT590JN/IuxkQH2Bb3Gq7PFQmy0JKW3k9mcE4ydJmij3R/O1z/YjVLcG5ooCFrYHwA
         wiym4p3CB/Hc2esyh66ncA4AQuoN6LQn2YHWG7P96d0rbSjqtzRjk1bYiXFcaEv9Gz+G
         eSpvD9yVVPhNSetDnosuqHHb+8Clv1IfHmAgMzG2xoiYiHiCAszJEUHkZk7oOPqBHcpM
         sP0HKjY8CoTUJsMuP8qyY9miFt2lDH7rsNasrl1d84EFfpbNVXVjWqRwpA+i5swMt42+
         AZlOp6d5DVqZ86yMN5GavK7RsTB9J8YdH6y5rgv+lt5reo5pqnr+NhkpNAoNxmffn+Oq
         uBVw==
X-Gm-Message-State: AC+VfDzkiApxnZL4FzGsmOUnT2CgdLShUKO7cRVgH++axdHkxPklzEaL
	WDcYTt+bmWdB7vxcvnHKqEw4oQ==
X-Google-Smtp-Source: ACHHUZ4FRHKhbyK7oUPDuQHpoRUMNCWc/HydANFJC2v48WV9/NbTrewPwW1h6uOqvsPFFva9F7oNig==
X-Received: by 2002:a17:907:2d28:b0:973:940e:a01b with SMTP id gs40-20020a1709072d2800b00973940ea01bmr16645094ejc.60.1687356898626;
        Wed, 21 Jun 2023 07:14:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906698700b009745417ca38sm3166407ejr.21.2023.06.21.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:14:58 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:14:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/1] riscv: mm: use svinval instructions instead of
 sfence.vma
Message-ID: <20230621-ca3ea20b1717d7bbf44cb836@orel>
References: <20230621124133.779572-1-mchitale@ventanamicro.com>
 <20230621124133.779572-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621124133.779572-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_071503_168036_79C24B31 
X-CRM114-Status: GOOD (  24.91  )
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

On Wed, Jun 21, 2023 at 06:11:33PM +0530, Mayuresh Chitale wrote:
> When svinval is supported the local_flush_tlb_page*
> functions would prefer to use the following sequence
> to optimize the tlb flushes instead of a simple sfence.vma:
> 
> sfence.w.inval
> svinval.vma
>   .
>   .
> svinval.vma
> sfence.inval.ir
> 
> The maximum number of consecutive svinval.vma instructions
> that can be executed in local_flush_tlb_page* functions is
> limited to PTRS_PER_PTE. This is required to avoid soft
> lockups and the approach is similar to that used in arm64.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/mm/tlbflush.c | 62 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 77be59aadc73..ade0b5cf8b47 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -5,6 +5,12 @@
>  #include <linux/sched.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
> +#include <asm/hwcap.h>
> +#include <asm/insn-def.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;
>  
>  static inline void local_flush_tlb_all_asid(unsigned long asid)
>  {
> @@ -26,19 +32,63 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>  static inline void local_flush_tlb_range(unsigned long start,
>  		unsigned long size, unsigned long stride)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page(start);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {
> +		if (has_svinval()) {
> +			asm volatile(SFENCE_W_INVAL() ::: "memory");
> +			while (size) {
> +				asm volatile(SINVAL_VMA(%0, zero)
> +					     : : "r" (start) : "memory");
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}

nit: The four while loops added by this patch could all be written more
concisely as

  unsigned long end = start + size;

  while (start < end) {
    /* flush one */
    start += stride;
  }

And we could shift everything one level of indentation left with

  if ((size / stride) > tlb_flush_all_threshold) {
    local_flush_tlb_all();
    return;
  }

  if (has_svinval()) {
  ...

Thanks,
drew

> +			asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page(start);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>  		local_flush_tlb_all();
> +	}
>  }
>  
>  static inline void local_flush_tlb_range_asid(unsigned long start,
>  		unsigned long size, unsigned long stride, unsigned long asid)
>  {
> -	if (size <= stride)
> -		local_flush_tlb_page_asid(start, asid);
> -	else
> +	if ((size / stride) <= tlb_flush_all_threshold) {
> +		if (has_svinval()) {
> +			asm volatile(SFENCE_W_INVAL() ::: "memory");
> +			while (size) {
> +				asm volatile(SINVAL_VMA(%0, %1) : : "r" (start),
> +					     "r" (asid) : "memory");
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +			asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +		} else {
> +			while (size) {
> +				local_flush_tlb_page_asid(start, asid);
> +				start += stride;
> +				if (size > stride)
> +					size -= stride;
> +				else
> +					size = 0;
> +			}
> +		}
> +	} else {
>  		local_flush_tlb_all_asid(asid);
> +	}
>  }
>  
>  static void __ipi_flush_tlb_all(void *info)
> -- 
> 2.34.1
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

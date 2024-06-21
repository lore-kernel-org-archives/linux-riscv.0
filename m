Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726CFC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7m+dRIuVAtgCLeadUGhf6idPlwj/uwyOj6XruAOko4=; b=jBYqJa1Fkwy+Ud
	gTmO33c6jmKxkGGoSOj9GePfBn+9kg7AjD/MxOFTebprxZFiPDOpSO+vjnWZOiNkHVVDbwX5Jaao/
	GSKAUrJxQBBOfBsiUJzxf61CqeDSSR/yCk5uaSJdBVT6EqyprbtUAy6CmgPAvS1Vb0j5V9wMEsqHs
	bRVgKq1sI3MgGppw1j2TtbL3NHa8ALK2R1KEES9yQYEuPPVTsgOgYNOUU9gMgKItqPSQRN27Rprh9
	/nUM7Ha74QBZf0AdcG3xjaLKsUgvTE0jP9KSrGwtgJjdCymq4SUhqXyuCeZeMELfhD8gheq08ng4c
	0DpKZcv83ATR6Yyeiz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKaND-00000008VWS-2Faa;
	Fri, 21 Jun 2024 09:15:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKaNA-00000008VVe-2LEJ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 09:15:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52cc9b887f1so2107778e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718961354; x=1719566154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2jvjig3AYIEyRn3flEvgDjFbBS4OpGQwrJnUvDqBBI=;
        b=eCrSUG2Ve6JTPrjEvkCu9YISPVaxqHI+/+5IUZPDRxYTFk6dZhEzTfvlPKsF1adjot
         S+nW6pTPjzFE2NHfHAuphaPmBwAPYHyxVfANwiJfeBg9qj2F0Lq4vztvkICQgRlCMgog
         zTx77WSUnWy5qFUTTbS1Rhk1xuI7/mV749O6nshuxplQYxw3/ESXp8GvzYyRSZ5Mu9kz
         m+I4eft+yR66uQIiluBD+YVqKKb4T2o4Ao2pOkXg+XLungP3qE+GDPHunH3jolqYQ4IZ
         YzMSS9eqBMayQ17f4ZM0oRvHmdgsGxb7gDpNyZmZsvpicQ/Ko2pZ21yAs+EJFr66P3W1
         ZmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718961354; x=1719566154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2jvjig3AYIEyRn3flEvgDjFbBS4OpGQwrJnUvDqBBI=;
        b=tsgFG7qMJ/EEM8W3jW0XlVX/rfvOyFWAZeQB5ew0OcqG1q1Xc01cALseIZjB68zTmq
         NeQNvVfNxTkJl6KZZprAc0b6UEkXEOwEEEZ8tYt4FuNwOkbxmJA7/427/L5f2xSY7JXH
         pX5RybHL3r7q0rkds0cMgt7oV4oDNbdcyxarcxiJaLCGWcRVOz2CR/7YvgCKQaPxhqsK
         G7nA/IKPiBfPXXddZ5uwjPa1XhZV0MbZASmyrDKpp9h+y2bAimbVJjTzgxammP9y/wMg
         g8/2POuSdvlEpWa2Xwd11KpV+FbWyEcsapnvCKUZuayhWts3T10Xiw+0BncW/Vz6X+NA
         rldQ==
X-Gm-Message-State: AOJu0Yyy/t8oeeapVrxoaTQTpZ/3sEgTY4oF2B2qk6LqEzfX7rv1vzQ/
	+KVUXUVqGH9YwxDidfRIKA77ZdHy4gq5P3MQb2JJ/OKb1V6z8ZfDk0/I0sGvOTM=
X-Google-Smtp-Source: AGHT+IFKJNicO3uhmDyrJLucOIHE0vfinnnmMr9OxG7eOes5d7m8ZFjdrD3XNJP1E8qkltVhFzuPCQ==
X-Received: by 2002:ac2:597a:0:b0:52c:7f25:dbac with SMTP id 2adb3069b0e04-52ccaa5d210mr3865442e87.20.1718961353465;
        Fri, 21 Jun 2024 02:15:53 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56e9f3sm60866566b.215.2024.06.21.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:15:53 -0700 (PDT)
Date: Fri, 21 Jun 2024 11:15:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v6 1/1] riscv: mm: Add support for Svinval extension
Message-ID: <20240621-469a3d5eb7bb2c0cc8ae0611@orel>
References: <20240609112103.285190-1-mchitale@ventanamicro.com>
 <20240609112103.285190-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609112103.285190-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_021556_629554_F9A6B224 
X-CRM114-Status: GOOD (  26.97  )
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

On Sun, Jun 09, 2024 at 04:51:03PM GMT, Mayuresh Chitale wrote:
> The Svinval extension splits SFENCE.VMA instruction into finer-grained
> invalidation and ordering operations and is mandatory for RVA23S64 profile.
> When Svinval is enabled the local_flush_tlb_range_threshold_asid function
> should use the following sequence to optimize the tlb flushes instead of
> a simple sfence.vma:
> 
> sfence.w.inval
> svinval.vma
>   .
>   .
> svinval.vma
> sfence.inval.ir
> 
> The maximum number of consecutive svinval.vma instructions that
> can be executed in local_flush_tlb_range_threshold_asid function
> is limited to 64. This is required to avoid soft lockups and the
> approach is similar to that used in arm64.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/mm/tlbflush.c | 58 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9b6e86ce3867..49d7978ac8d3 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -6,6 +6,54 @@
>  #include <linux/hugetlb.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
> +#include <asm/cpufeature.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +static inline void local_sfence_inval_ir(void)
> +{
> +	/*
> +	 * SFENCE.INVAL.IR
> +	 * 0001100 00001 00000 000 00000 1110011
> +	 */
> +	__asm__ __volatile__ (".word 0x18100073" ::: "memory");
> +}
> +
> +static inline void local_sfence_w_inval(void)
> +{
> +	/*
> +	 * SFENCE.W.INVAL
> +	 * 0001100 00000 00000 000 00000 1110011
> +	 */
> +	__asm__ __volatile__ (".word 0x18000073" ::: "memory");
> +}
> +
> +static inline void local_sinval_vma_asid(unsigned long vma, unsigned long asid)

Please name this to

  void local_sinval_vma(unsigned long vaddr, unsigned long asid)

to match the spec's naming. But, if we want the arguments in the name,
then it should be something like

  void local_sinval_vma_addr_asid(unsigned long vaddr, unsigned long asid)

but I think that's unnecessary.

> +{
> +	if (asid != FLUSH_TLB_NO_ASID) {
> +		/*
> +		 * rs1 = a0 (VMA)
> +		 * rs2 = a1 (asid)
> +		 * SINVAL.VMA a0, a1
> +		 * 0001011 01011 01010 000 00000 1110011
> +		 */
> +		__asm__ __volatile__ ("add a0, %0, zero\n"
> +					"add a1, %1, zero\n"
> +					".word 0x16B50073\n"
> +					:: "r" (vma), "r" (asid)
> +					: "a0", "a1", "memory");
> +	} else {
> +		/*
> +		 * rs1 = a0 (VMA)
> +		 * rs2 = 0
> +		 * SINVAL.VMA a0
> +		 * 0001011 00000 01010 000 00000 1110011
> +		 */
> +		__asm__ __volatile__ ("add a0, %0, zero\n"
> +					".word 0x16050073\n"
> +					:: "r" (vma) : "a0", "memory");
> +	}

Please create an SINVAL_VMA instruction in insn-def.h to allow the
compiler to choose which registers will be used for asid and vaddr. And,
since SINVAL_VMA will be in insn-def.h, then we might as well add
SFENCE_INVAL_IR and SFENCE_W_INVAL there too for consistency, even though
they don't have operands. We should still create the three static inline
wrapper functions here though.

> +}
>  
>  /*
>   * Flush entire TLB if number of entries to be flushed is greater
> @@ -26,6 +74,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>  		return;
>  	}
>  
> +	if (has_svinval()) {
> +		local_sfence_w_inval();
> +		for (i = 0; i < nr_ptes_in_range; ++i) {

Where do we limit this to 64 as the commit message states it does?

> +			local_sinval_vma_asid(start, asid);
> +			start += stride;
> +		}
> +		local_sfence_inval_ir();
> +		return;
> +	}
> +
>  	for (i = 0; i < nr_ptes_in_range; ++i) {
>  		local_flush_tlb_page_asid(start, asid);
>  		start += stride;
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

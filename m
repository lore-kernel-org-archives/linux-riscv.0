Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA327C3065B
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 06:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGc0bFfoj+xg2OoaCGsgjSuBjj1hsNxpJCUjKkJAFHU=; b=wE9cDAKYDfBj+T
	N0u2/IZQbZt8fujIb8pAAqBTaAFaNfr95abe/YW2Hn8t7VrfcgfpIAUZWTLJ/ypvZkMjsLmteVWC+
	B33HrW71bnBDniIYMz2rraoDuUa0PLc1bd7zo1HJWL02oKqp44k9VW4nwPf02+HEXKlCAGTfrrzW0
	Zy/LdHar7nOefC2E/6czAseDM/VHM+L0/3RVJvU/obm0+c/0mIKyMwwZd4aJCINAtBh6r6jZQE76Q
	+sDFYAjlHalXkM+5siWyhNpSg8fciwJAllHYKZVuIlD7t/x9r0uf8OLYV1gUN62frl+IQGVH642cT
	42VYblYQE9QG5SnQCdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOAsF-00000001uxX-3djk;
	Mon, 01 Jul 2024 06:50:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOAs1-00000001uuW-0YGZ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 06:50:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-36733f09305so1462113f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719816635; x=1720421435; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+82xXOObJXSSEXX4f5vUKX0gC2e+jrB9oaTEOo05T28=;
        b=CfJt3NUkpJLQzl/UCwse7IzGmBfnGm4+kpWXlkV0ENlahcsuojvQAKZQrcVXJ4Ei3A
         CpegKtdl6RQzmYpKQa2QbyL+BoZX8TDunVW8d1Yf1lIKZ/NbZHjyF9tyVHGN6Bim29jE
         Rnu1+W/+GLxQYfah+1bWW5NlQCD7JEq5ivIox3nJ13sRnQP+H1GKV+boniLuzkX3VARG
         oV+LFY8Rgg6zsBSWWkman0faHyu6yN6ndYUWfdeMkqJb0yyKcuoWOl6EpCBwNhQeTSeq
         54uHAIo3+bI0lM4n8g+pL/KJB+QLJG63rQKAjMwc47p1s6lW/fJCile3oTXUSAqYtXC/
         tldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719816635; x=1720421435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+82xXOObJXSSEXX4f5vUKX0gC2e+jrB9oaTEOo05T28=;
        b=UfDQZVWs3D1CM+qiHYqrMN2YKFpyt3mRjGeWoL/Ch7iB9LkpgINtSeaFxoZ7BbJXLB
         vpJA8ImylqAc1J/sBHm8kUPimp5Dd3Qc7S0iVCTlKkJ2npic77altg8xkxc+20qEg8FS
         R8O9LdumaYrhY27mpqkGvkXFgmeb/GwqgxaOYJYN9x0leqmvb8t/soCwNJ+v2pvqwU/d
         T0I9LO2O7NWZ6U1iU+mdhPn7xN1HURPLv40QoRKIKyfNZw9sCPt7IGus/xXlXkiUfBFI
         9XAq0eqDp9lEzW1tGskkAImamxNeDCnCYD0VJfBiBjGDz02TDLbR1T3yszYsNypbiRZV
         MsUA==
X-Gm-Message-State: AOJu0YyXZ4l7tz9DbwykPbzjENsrGhjo/BSrTUZk8YcoJCfD7tv4eVJm
	qIbr9Ka32OVlxMtrV4L4N19VCGHZ92Yxq970ZtSYiPzd5xXaIlW5k9Yu/MtbRAE=
X-Google-Smtp-Source: AGHT+IGht03/zPzx2c8cKSAQtR+IcFVIo76qxL/DRVmO6lA7XA4iaFCK3fDNblnfvw0NkXXmzNb00Q==
X-Received: by 2002:a05:6000:1b09:b0:354:fc65:39d6 with SMTP id ffacd0b85a97d-367756a9d37mr2820526f8f.26.1719816634538;
        Sun, 30 Jun 2024 23:50:34 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42577a0dda2sm55934635e9.0.2024.06.30.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:50:34 -0700 (PDT)
Date: Mon, 1 Jul 2024 08:50:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v7] riscv: mm: Add support for Svinval extension
Message-ID: <20240701-5ea27de0b3592ecf9d9564e8@orel>
References: <20240627165327.7685-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627165327.7685-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_235037_200638_07728E14 
X-CRM114-Status: GOOD (  27.13  )
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

On Thu, Jun 27, 2024 at 10:23:27PM GMT, Mayuresh Chitale wrote:
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
> Changes in v7:
> - Use existing svinval macros in the insn-def.h
> - Rename local_sinval_vma_asid to local_sinval_vma
> 
> Changes in v6:
> - Rebase on latest torvalds/master
> 
> Changes in v5:
> - Reduce tlb flush threshold to 64
> - Improve implementation of local_flush_tlb* functions
> 
> Changes in v4:
> - Rebase and refactor as per latest changes on torvalds/master
> - Drop patch 1 in the series
> 
> Changes in v3:
> - Fix incorrect vma used for sinval instructions
> - Use unified static key mechanism for svinval
> - Rebased on torvalds/master
> 
> Changes in v2:
> - Rebased on 5.18-rc3
> - update riscv_fill_hwcap to probe Svinval extension
> 
>  arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9b6e86ce3867..d3396619d8c4 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -6,6 +6,28 @@
>  #include <linux/hugetlb.h>
>  #include <asm/sbi.h>
>  #include <asm/mmu_context.h>
> +#include <asm/cpufeature.h>
> +
> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
> +
> +static inline void local_sfence_inval_ir(void)
> +{
> +	asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +}
> +
> +static inline void local_sfence_w_inval(void)
> +{
> +	asm volatile(SFENCE_W_INVAL() ::: "memory");
> +}
> +
> +static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
> +{
> +	if (asid != FLUSH_TLB_NO_ASID)
> +		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) :
> +			     "memory");

nit: no need to wrap this line, we can go to 100 chars.

> +	else
> +		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
> +}
>  
>  /*
>   * Flush entire TLB if number of entries to be flushed is greater
> @@ -26,6 +48,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>  		return;
>  	}
>  
> +	if (has_svinval()) {
> +		local_sfence_w_inval();
> +		for (i = 0; i < nr_ptes_in_range; ++i) {
> +			local_sinval_vma(start, asid);
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

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

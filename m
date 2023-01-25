Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B027C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEK7y94+A+OAOyUU4ctqfHvIPn9qA4bdkvLuLdsgsZ0=; b=HqIuf6Vf4bHRSm
	jcKSdxpMpmdpuQX7R4wg1A80d4+9fXQCzMMLZbQ9jvOhOE5WC1C8xtmaxgPaVkkrO9lH1MlJQwL7K
	+9G0sHiVkR6x762+LyfpkfJu7CVWsc77dyXNsRz8eYUwo9XNefl3XQelqbEATUlUS2BQhT4xKEeRu
	9E+SSlqbl2XV2trnTR2gGsBXUgXdaD2BeuOSsfVtGcU8VMdwYYRlEdpttC/EaxAbdLNDLl2NqxPql
	HH7t7CrKBUtu9a6319sM2SiJrRsn4XcSsnOotRFUrnNNA4uzWODmxD3LQs8IQBJ6C2MvHgxw/PgYX
	tkjrKw9ULkh65URtAn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhoX-007q7Y-EL; Wed, 25 Jan 2023 15:35:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhoT-007q6t-8I
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 15:35:50 +0000
Received: by mail-ed1-x52d.google.com with SMTP id u21so298806edv.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNPXlvb9gkbcKlUwfNJNiYMy0VBLqB8zZwj2lv6Ub/0=;
        b=nX5P/6Nht4t7ieJuVXfNgJIpgsQKr/jZUE/ZFS+FRNta+MeeFOSgNVO+f+C0EYmslM
         4Xk1Pj/wKOuY383dRHOwGOkzjciP/1t9kOh9UU1CEorQ6kz/tfYMppw00Phdx2UJktMW
         4eSiaKYOkp3+ODgDxuMffGrhcoqf0bi4R90byG0TQU+jRfxpkae/3K8W7O8CAPlatmYW
         UAC2Iw3TyQxuokfClq+/YX+jzII3a0J23ZNsBQwDEucCwF/4/6CvOuNdEZZ2blNfnNB/
         c/p6/zCF8sDUbxnGWsj3+x12lGtxMMF9OyhjNISuritszHVd2Cvc/9KQwfDMwF1au3Pf
         YkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNPXlvb9gkbcKlUwfNJNiYMy0VBLqB8zZwj2lv6Ub/0=;
        b=foD+jUctf9OQ2E/piYke34whHUbjNYOu6FEzPP/NX9T55sJH1EPoD1aBHc9EJkT7S+
         WomHD12EaonN47ocn9Yqc4t+cX4/2WI24tL3hWoVRXwudoech/hxxWSHPo3hdFsZBU2o
         K230UnruWUNBWxOnqt3XAhGllnyK+aB+VhXraGbEqyDrZ4JAsLhFIqrRGR+3R5szOpJo
         DrkHIss9kWKx+0JflkqAUIyqTY918/yQZNZpzHA7miHnFcph6H76M1xXuWDZdjIvoAt7
         b6DltxN59te3sTpiC4C7ZnbNzRlJdYaaiiW5fXDOTxlX65hrF08LoVvCw8UrOPu54BeB
         76rA==
X-Gm-Message-State: AO0yUKXeBEN7bpwvhE+6x8qdYQEgCAVVPl3u/DZOVe2r8NSx73bsXgso
	tz6PD3ZmWUn5rnRLsikzdEhPFw==
X-Google-Smtp-Source: AK7set/SNRd3UBwh6FDEeUW4ZBl0sEZWynF1vsAJvEKIdxF6Y3adApT60jTnNFVaP76zPGuHYfesbw==
X-Received: by 2002:a05:6402:3582:b0:49f:bf08:b5fd with SMTP id y2-20020a056402358200b0049fbf08b5fdmr9028465edc.7.1674660946268;
        Wed, 25 Jan 2023 07:35:46 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h3-20020a170906828300b0086dc174caf2sm2504530ejx.220.2023.01.25.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 07:35:45 -0800 (PST)
Date: Wed, 25 Jan 2023 16:35:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Nanyong Sun <sunnanyong@huawei.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
Message-ID: <20230125153544.lgukbnh2qkntph4l@orel>
References: <20230125125512.2494577-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125125512.2494577-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_073549_316712_A7D771E2 
X-CRM114-Status: GOOD (  23.57  )
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

On Wed, Jan 25, 2023 at 06:25:11PM +0530, Mayuresh Chitale wrote:
> When THP is enabled, 4K pages are collapsed into a single huge
> page using the generic pmdp_collapse_flush() which will further
> use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> using address specific SFENCEs which results in repetitive (or
> unpredictable) page faults on RISC-V implementations which cache
> non-leaf PTEs.
> 
> Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> cached leaf and non-leaf PTEs are invalidated by using non-address
> specific SFENCEs as recommended by the RISC-V privileged specification.
> 
> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4eba9a98d0e3..6d948dec6020 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>  	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
>  }
> +
> +#define pmdp_collapse_flush pmdp_collapse_flush
> +static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> +					unsigned long address, pmd_t *pmdp)
> +{
> +	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);

The generic version of this function has a couple sanity checks for
kernels compiled with CONFIG_DEBUG_VM. Shouldn't we duplicate those?

Thanks,
drew

> +
> +	/*
> +	 * When leaf PTE enteries (regular pages) are collapsed into a leaf
> +	 * PMD entry (huge page), a valid non-leaf PTE is converted into a
> +	 * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
> +	 * specification allows implementations to cache valid non-leaf PTEs,
> +	 * but the section "4.2.1 Supervisor Memory-Management Fence
> +	 * Instruction" recommends the following:
> +	 * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
> +	 * with rs1=x0. If any PTE along the traversal path had its G bit set,
> +	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
> +	 * the translation is being modified."
> +	 * Based on the above recommendation, we should do full flush whenever
> +	 * leaf PTE entries are collapsed into a leaf PMD entry.
> +	 */
> +	flush_tlb_mm(vma->vm_mm);
> +	return pmd;
> +}
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  /*
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3838C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vnau9I7xLCBwQIVYuyJtMzbO5RCFL8ic5HsIO5gBo0=; b=GwZ83LOLCz5/0t
	bpjpIKZ1mqbK4X8NXmccC7jqWiSOMPT7SeaOYcBGQCDr4mZ+1NGiklYBHCg4SmEfS4scWbEZSPI+i
	CwAysZOXqAt7H/IS0o08jgiUXblG2u/ndLUpMuGG+35sB01R4/iFEP5WSzl7AtI7kDSErqGaBDWQs
	/pFP8pAeRPmKyr3y6Ycr2CXQBCekAUqawdXohUH6CEY8G3imARXQaUkTXestSHwGcOnzx+Vvu5Zv8
	01V7oksaCygp6o/jj9pk9ssPudX5iKqKrCkD8lNESKn9AI5UdLmZGCfu5dhScTOaW3biSnvXPVlki
	aBj8zokI/30MxiwiB0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNOu-009vqj-2A;
	Fri, 28 Apr 2023 12:40:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNOr-009vmx-32
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:40:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f086770a50so66896075e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682685630; x=1685277630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaouctOWZBOsKFA2vqArt/NLD4fDZB6ir2IWOV4YLBs=;
        b=Q3NHV1/dhHD6vIVZyRd0jJ00SQFLKwAQxGc5846tQx4++tcsE79l1LxDprLXH8zIlV
         m62Ewpm9KbLPFkG+pNSNLDfpsSuier0Sct68hBu03tMQajcaM/rXlirc9NM+QlcdsN6J
         kz6UAFUZWCMMLTVVZmXdwzAieLMuUWErRkT2uRYRTpJfAU+YZYr4KMTEV6l9341sB10q
         pLcDDtrCFit8PDjv4vSAc+0hWBQ/xeZD5j/xSOp/ML/PIe6wpvumqesSs7EaxazGNPaZ
         qdb9okUxzwHlZrkE5rQyN92GLP1MdzFTiKzjo5GG3TtqN2Fsy4qNaySdnQcvDTIQC3wK
         yFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682685630; x=1685277630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaouctOWZBOsKFA2vqArt/NLD4fDZB6ir2IWOV4YLBs=;
        b=CJ4wnALOUWa5wpwual0U+jEYMfYwlodPl4h/bz1ESrsAvqL+vyuecIu+Bhu7DZuDB5
         nkEuajsuh+8PSFgSgP2Zg5FWQ5IkLVDe3D4f0X82zrW6xwuBPlDo73rjajbN++TP+dx7
         gFtn/nJJYKnqXH+IPnNhlMlbU/tx1n9sciJVkN3x2Vjk7Vn2WKDItHlpPWjPr0rXVe52
         VAuUDz1oG3BaWw4HMcr0TP4Tn8ZjmrvJiWxPDJ40UDB9J19t1mNo1EoCeihMYbX2S9ww
         S/I4x+q/dJ0ej3xWkCQBJHuNBEFx+pAeI0/WIJhsTRrGb0Nq+NcXfWy/quNQLkmCQew4
         lFbA==
X-Gm-Message-State: AC+VfDxLRNTFQq0spZPmugJ4Sroa9qYcFwnGODQE+GaFCxcLhC4kXqB+
	Xxer2bSdE+oY0JVNPxPDVy2AwQ==
X-Google-Smtp-Source: ACHHUZ5FmuCTkr22XOwD5Tj0SaZURbIqao0sH/3Yu6cxhKOiGkjH32HPfuGFfPr1N5luTAUHxR0eYg==
X-Received: by 2002:a05:600c:acf:b0:3ed:4b0f:5378 with SMTP id c15-20020a05600c0acf00b003ed4b0f5378mr4320880wmr.27.1682685630183;
        Fri, 28 Apr 2023 05:40:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q17-20020a1cf311000000b003eeb1d6a470sm24200166wmq.13.2023.04.28.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:40:29 -0700 (PDT)
Date: Fri, 28 Apr 2023 14:40:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 2/2] riscv: Implement missing huge_ptep_get
Message-ID: <t7beh3jeodkkltiurnhvk4jkjhmhkbfvfxlzi7x5p6m3mkgreq@oblek3mii7zf>
References: <20230428120120.21620-1-alexghiti@rivosinc.com>
 <20230428120120.21620-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428120120.21620-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_054033_984761_1018A648 
X-CRM114-Status: GOOD (  19.02  )
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

On Fri, Apr 28, 2023 at 02:01:20PM +0200, Alexandre Ghiti wrote:
> huge_ptep_get must be reimplemented in order to go through all the PTEs
> of a NAPOT region: this is needed because the HW can update the A/D bits
> of any of the PTE that constitutes the NAPOT region.
> 
> Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hugetlb.h |  3 +++
>  arch/riscv/mm/hugetlbpage.c      | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
> index fe6f23006641..ce1ebda1a49a 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -36,6 +36,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  			       unsigned long addr, pte_t *ptep,
>  			       pte_t pte, int dirty);
>  
> +#define __HAVE_ARCH_HUGE_PTEP_GET
> +pte_t huge_ptep_get(pte_t *ptep);
> +
>  pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
>  #define arch_make_huge_pte arch_make_huge_pte
>  
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 238d00bdac14..e0ef56dc57b9 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -3,6 +3,30 @@
>  #include <linux/err.h>
>  
>  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> +pte_t huge_ptep_get(pte_t *ptep)
> +{
> +	unsigned long pte_num;
> +	int i;
> +	pte_t orig_pte = ptep_get(ptep);
> +
> +	if (!pte_present(orig_pte) || !pte_napot(orig_pte))
> +		return orig_pte;
> +
> +	pte_num = napot_pte_num(napot_cont_order(orig_pte));
> +
> +	for (i = 0; i < pte_num; i++, ptep++) {
> +		pte_t pte = ptep_get(ptep);
> +
> +		if (pte_dirty(pte))
> +			orig_pte = pte_mkdirty(orig_pte);
> +
> +		if (pte_young(pte))
> +			orig_pte = pte_mkyoung(orig_pte);
> +	}
> +
> +	return orig_pte;
> +}
> +
>  pte_t *huge_pte_alloc(struct mm_struct *mm,
>  		      struct vm_area_struct *vma,
>  		      unsigned long addr,
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

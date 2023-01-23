Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57111C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNucykp2g0b977i0jiZB42AEA6Ja/wovsqNQQ/i6ub8=; b=PPPfgJwfXRr54o
	oxUL9S863drnNCrnABCFVqh93lGQWVcf0Wfje/m9sZ/rgEFJXDY9uc7Mp/hb6G3fhZjEDJWJ14bGZ
	r9Bbkg0HR3Sb3t5wsm0Ty1tP0mGZAen7idNltPBZIhjQkzUzdRYcTrRd0ZPE2s5UMfaJRB8hncIoF
	v5SBFdKUPi5AYWqXjkXksurguxIG4vgXK6dENGKrdvrSqMq63SeX49NIbvegKnwIZ8c6XHojzecTM
	4+hwWg3cvREjgPgRFHOeTiG7MezEco8JifYhZl2jCZygmTOTBKgRkrN6X9wB7lNCPMjWde84w+hbt
	4ZIGBuS7sT/5BbUlQajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuc5-00GvCI-J0; Mon, 23 Jan 2023 11:03:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuc2-00GvAt-HQ
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 11:03:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id qx13so29332044ejb.13
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 03:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8nHM8yyaEmBjEgyXWgFGonFD03pg+zSiWIDjK0eEjVE=;
        b=nX2aRVwWQF/kuuaDEfzKMZcjnFkarUOQ4gPJgSlQf4L3jbvoqNlv86tpWgJFzhmZoR
         Zcdy0xMr2C9LqaAwYUwGLx61pC6INiLCNZ4wqblpdym+vJD73m2aeanKyMaHD9mJtfgA
         3kCZKCUH087vDrCt3LtRbxJ60JwVPzs3I7Sc0N9WyEiEzO+HSPPS5AlcCTVMRMbsE6XN
         L5HS5m/W/nHzNbfuhYAfAKzxoQqqJpAKNa9sGw9N0HhqdWI9GYzBWqOBqvLZoWgzOQDp
         OlTrJJ8xodzsDiZNTzLAst61echxAb58Jw+d1nQZA+ZJwyKyFr+lIHEoUxkRjcPdk16Q
         SPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nHM8yyaEmBjEgyXWgFGonFD03pg+zSiWIDjK0eEjVE=;
        b=75fbhvWHJOiBP6Bx/PUdXNhcuJGgdKcltsZ5/Ka/umYI0tRh5JG6DNQTgSM0nh+6XR
         jfDTxrRKyOKU1okQchEpoXEMeVUly4Q8XB5XnjWtK3bhEIISlhdKDcIB16rzbIaWS2x1
         KX021C1SmeeLr8thVQdRikOk413C7PQOdVeIZx5dKRROR5fbgMKFMuW18R1ZEhKL3xIJ
         6dokC6pfxbEnk1gEOIU1ChpaWgBahNE6YjGx6xovlPYXwaNXhzsWkJ3Xd5QEKa2HDpOD
         wCkSdXZjBUefhaYkJWur8BK5e1vRmuFQG8oDiCN4i33f4Shj5yXQbwuEZeGnO8PE9pAV
         kV/w==
X-Gm-Message-State: AFqh2kqTc9eP8A0Mp9rH1XGUgzMRoZYk8WfKE1LyxNcm/FS/PxSs7gvN
	PxSoSzMUfUBJ5+PbEbT17xbNFw==
X-Google-Smtp-Source: AMrXdXu3hOZNQbMBpbg9WG/nQ6yc7jkGkZRbARoAECj3fYCt8bkyPvibGlnW08h2f5aXenyZ3S9Ciw==
X-Received: by 2002:a17:907:b9da:b0:872:21b2:9a1f with SMTP id xa26-20020a170907b9da00b0087221b29a1fmr25436642ejc.58.1674471818955;
        Mon, 23 Jan 2023 03:03:38 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w26-20020a1709060a1a00b0087768737091sm7252459ejf.207.2023.01.23.03.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 03:03:38 -0800 (PST)
Date: Mon, 23 Jan 2023 12:03:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page
 sizes
Message-ID: <20230123110337.3pmsk7nvip3sxlc4@orel>
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123092928.808014-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_030342_622149_0598CF0A 
X-CRM114-Status: GOOD (  18.07  )
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

On Mon, Jan 23, 2023 at 10:29:28AM +0100, Alexandre Ghiti wrote:
> At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> PGDIR_SIZE into PUD_SIZE.

Can you please add a sentence as to how you found this? Some test case
or just by analysis?

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kvm/mmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 34b57e0be2ef..dbc4ca060174 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (!kvm->arch.pgd)
>  		return false;
>  
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>  
>  	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>  				   &ptep, &ptep_level))
> @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (!kvm->arch.pgd)
>  		return false;
>  
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>  
>  	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>  				   &ptep, &ptep_level))
> @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	if (logging || (vma->vm_flags & VM_PFNMAP))
>  		vma_pagesize = PAGE_SIZE;
>  
> -	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> +	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
>  		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
>  
>  	mmap_read_unlock(current->mm);
>  
> -	if (vma_pagesize != PGDIR_SIZE &&
> +	if (vma_pagesize != PUD_SIZE &&
>  	    vma_pagesize != PMD_SIZE &&
>  	    vma_pagesize != PAGE_SIZE) {
>  		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
> -- 
> 2.37.2
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34047C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cft35UhfJ7GAvqOPcKH/LgmqTCB3xdIs33RZ26x5uVk=; b=1ihtHpB2yW1RrdZ+/3DrsEbkqr
	BNy6wU7kjJaKfP0WuUBxWQpayz1Rnorb7AbG+Ob8T4oAS9lQseEwCtey1WscMQaI67UzFAoay3s3+
	W/NrIGZK0vHIxSK2S63CzmLfqn457zDIkKc2y5l43E9/F3pd/K+wgaUKndk1WTID4FyO/k6zs/T2E
	dfFwEvORf/HvXMl2IT9mEzAQGGTLIGfnEo2WMN3bXIqUmYdF0YoEqBsz5c26E3GQj2Nxsyea9UhSn
	Js96hGrHXVwzDukBB7H5ZGud2G74qMXD8AaOgurjKmCVcm0omdnLVXOFusa8PTMhXqGNUnLoqme12
	Pt2xUo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtAs-00GWts-14; Mon, 23 Jan 2023 09:31:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtAo-00GWrh-1i; Mon, 23 Jan 2023 09:31:31 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 49BFB240009;
	Mon, 23 Jan 2023 09:31:21 +0000 (UTC)
Message-ID: <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr>
Date: Mon, 23 Jan 2023 10:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page
 sizes
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel
 <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230123092928.808014-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_013130_266443_17284E61 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

@Anup: Sorry, forgot to add -fixes to the patch title, as I think this 
should go into your fixes branch for 6.2.

On 1/23/23 10:29, Alexandre Ghiti wrote:
> At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> PGDIR_SIZE into PUD_SIZE.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/kvm/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 34b57e0be2ef..dbc4ca060174 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.pgd)
>   		return false;
>   
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
>   	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>   				   &ptep, &ptep_level))
> @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.pgd)
>   		return false;
>   
> -	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> +	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
>   
>   	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
>   				   &ptep, &ptep_level))
> @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   	if (logging || (vma->vm_flags & VM_PFNMAP))
>   		vma_pagesize = PAGE_SIZE;
>   
> -	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> +	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
>   		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
>   
>   	mmap_read_unlock(current->mm);
>   
> -	if (vma_pagesize != PGDIR_SIZE &&
> +	if (vma_pagesize != PUD_SIZE &&
>   	    vma_pagesize != PMD_SIZE &&
>   	    vma_pagesize != PAGE_SIZE) {
>   		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

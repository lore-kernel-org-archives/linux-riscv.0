Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B7C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QNGlne53aLWsG9bdXGCbd8Q/NwJWBtr3hiTJJr2DVNU=; b=4jgaXud27Xyl6Yxz9yhC6mzLGL
	Gmd39VQOW15dtufXE0O2gPfatK99nfMyJJmEP161JrYueV7VxPM7g8f6HmECxUZOHASUK7pUebgs6
	wTOsCzwM0xURsRVOoZdmo5f0Rdfy/8Me+PKfoFOjEboQiSfyJAioxA8Q1POxrvc83vl7Gr/9lMQW8
	mrT1OlUKtEalblCWvxoHllo0xXyjvrsf6A2GV8wfpisTTwTbIsEMZQRGEmjjiEeMNq6XMTI4k8TMw
	Ra4Kt0Wj0cTZJS2PYwWqM7SYdXfZnWUSiY7/tdGzQDFmijelSwmNxV+VVK4Q7mbnKVF2hG7WP0s5a
	VsV/LTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppW2R-008OQ8-2q;
	Thu, 20 Apr 2023 15:17:35 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppW2P-008OP0-0T
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 15:17:34 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1a4f798cfb9so7692075ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682003851; x=1684595851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fvh5Bs16xnW1weT2SPid3PSg+u8/Q14PbTNxokyuWo=;
        b=0Lwk6zvT1sdE3h8JzGU30U5B2GAF3IGSbkbBGobwWjNzCZvLtIOzkNc+aveiepxTAs
         WaAK/i7YbEhDG2NDLUpNX6THYw8haqXyojuWZ4wmeO7iGc3cq8HwF3oUxq8Ol92O1z2T
         hi4MCRBBTGq2u6EMEsQiLxQDCm+QEsU263UVSRUL2PE43LmOVPxu0eFMHRPbEkDg4TfT
         uobdLbwf2YItMZtIgpTxQ2rIfnYXNx+lpmvnNGMtHXSo0bDbtU6H888CU9MzugYu3YZg
         DWMBre8DaUAzW3gfyRElbNJemM8dx6YakEoK9mD3yLdn1MRKe/fRStX26QgHS1FoeyUV
         uNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682003851; x=1684595851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fvh5Bs16xnW1weT2SPid3PSg+u8/Q14PbTNxokyuWo=;
        b=hCkhSvlId87gy/di1YBmH9QFxDZg+cDwb66Wcu/bCbk8wXJDkvrdbJGKGJV4zL1o+q
         eK5sDMOSr9HPK7/F4MYNtpwkUGGI/TJqIh1BnIn+CXcsvRGMHb8KT9vDrp461XChlE2A
         RJj3JFwm9uEQTySy9y7tUtJAtaTiOeldoZAj9PFoWREDfwisXgyDGHheOd5hnr4F0Uhc
         zIVkcZpJXos9QBJOD/aYe1D7qWjHgdw4dhcOsHqn+Dh1MTEyB16ZA+nsmohaYDbXUZzq
         rnbdV2Ds6Su7D3KnecG62ZLE/ERMETglf0DG1VaEXotVOzE68UIB5UoU2BAq5f+zBH8/
         cNPg==
X-Gm-Message-State: AAQBX9fTKhTN3wF5T/sOKVg6K6Rf27vSEPW2XUkPgXe9ql0ueqIpjg7f
	AHWg/nfYvjfZakjlgPv2VKK21kdpOp0=
X-Google-Smtp-Source: AKy350ZBzilYp4PKzE37W4X5nKyyeFADvasG2SeZc5SDTlWjPiAdZDU+NJV1a/nzmUjYdsysw7dwNLoKUeU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:50d:b0:1a6:3fb2:f52d with SMTP id
 jn13-20020a170903050d00b001a63fb2f52dmr618731plb.3.1682003850946; Thu, 20 Apr
 2023 08:17:30 -0700 (PDT)
Date: Thu, 20 Apr 2023 08:17:29 -0700
In-Reply-To: <20230419221716.3603068-11-atishp@rivosinc.com>
Mime-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-11-atishp@rivosinc.com>
Message-ID: <ZEFXiXu+0XLSdRkQ@google.com>
Subject: Re: [RFC 10/48] RISC-V: KVM: Implement static memory region measurement
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	"=?iso-8859-1?Q?Bj=F6rn_T=F6pel?=" <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_081733_184583_67D73523 
X-CRM114-Status: GOOD (  23.04  )
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

On Wed, Apr 19, 2023, Atish Patra wrote:
> +int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr)
> +{
> +	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
> +	int rc = 0, idx, num_pages;
> +	struct kvm_riscv_cove_mem_region *conf;
> +	struct page *pinned_page, *conf_page;
> +	struct kvm_riscv_cove_page *cpage;
> +
> +	if (!tvmc)
> +		return -EFAULT;
> +
> +	if (tvmc->finalized_done) {
> +		kvm_err("measured_mr pages can not be added after finalize\n");
> +		return -EINVAL;
> +	}
> +
> +	num_pages = bytes_to_pages(mr->size);
> +	conf = &tvmc->confidential_region;
> +
> +	if (!IS_ALIGNED(mr->userspace_addr, PAGE_SIZE) ||
> +	    !IS_ALIGNED(mr->gpa, PAGE_SIZE) || !mr->size ||
> +	    !cove_is_within_region(conf->gpa, conf->npages << PAGE_SHIFT, mr->gpa, mr->size))
> +		return -EINVAL;
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +
> +	/*TODO: Iterate one page at a time as pinning multiple pages fail with unmapped panic
> +	 * with a virtual address range belonging to vmalloc region for some reason.

I've no idea what code you had, but I suspect the fact that vmalloc'd memory isn't
guaranteed to be physically contiguous is relevant to the panic.

> +	 */
> +	while (num_pages) {
> +		if (signal_pending(current)) {
> +			rc = -ERESTARTSYS;
> +			break;
> +		}
> +
> +		if (need_resched())
> +			cond_resched();
> +
> +		rc = get_user_pages_fast(mr->userspace_addr, 1, 0, &pinned_page);
> +		if (rc < 0) {
> +			kvm_err("Pinning the userpsace addr %lx failed\n", mr->userspace_addr);
> +			break;
> +		}
> +
> +		/* Enough pages are not available to be pinned */
> +		if (rc != 1) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +		conf_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!conf_page) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +
> +		rc = cove_convert_pages(page_to_phys(conf_page), 1, true);
> +		if (rc)
> +			break;
> +
> +		/*TODO: Support other pages sizes */
> +		rc = sbi_covh_add_measured_pages(tvmc->tvm_guest_id, page_to_phys(pinned_page),
> +						 page_to_phys(conf_page), SBI_COVE_PAGE_4K,
> +						 1, mr->gpa);
> +		if (rc)
> +			break;
> +
> +		/* Unpin the page now */
> +		put_page(pinned_page);
> +
> +		cpage = kmalloc(sizeof(*cpage), GFP_KERNEL_ACCOUNT);
> +		if (!cpage) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +
> +		cpage->page = conf_page;
> +		cpage->npages = 1;
> +		cpage->gpa = mr->gpa;
> +		cpage->hva = mr->userspace_addr;

Snapshotting the userspace address for the _source_ page can't possibly be useful.

> +		cpage->is_mapped = true;
> +		INIT_LIST_HEAD(&cpage->link);
> +		list_add(&cpage->link, &tvmc->measured_pages);
> +
> +		mr->userspace_addr += PAGE_SIZE;
> +		mr->gpa += PAGE_SIZE;
> +		num_pages--;
> +		conf_page = NULL;
> +
> +		continue;
> +	}
> +	srcu_read_unlock(&kvm->srcu, idx);
> +
> +	if (rc < 0) {
> +		/* We don't to need unpin pages as it is allocated by the hypervisor itself */

This comment makes no sense.  The above code is doing all of the allocation and
pinning, which strongly suggests that KVM is the hypervisor.  But this comment
implies that KVM is not the hypervisor.

And "pinned_page" is cleared unpinned in the loop after the page is added+measured,
which looks to be the same model as TDX where "pinned_page" is the source and
"conf_page" is gifted to the hypervisor.  But on failure, e.g. when allocating
"conf_page", that reference is not put.

> +		cove_delete_page_list(kvm, &tvmc->measured_pages, false);
> +		/* Free the last allocated page for which conversion/measurement failed */
> +		kfree(conf_page);

Assuming my guesses about how the architecture works are correct, this is broken
if sbi_covh_add_measured_pages() fails.  The page has already been gifted to the
TSM by cove_convert_pages(), but there is no call to sbi_covh_tsm_reclaim_pages(),
which I'm guessing is necesary to transition the page back to a state where it can
be safely used by the host.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

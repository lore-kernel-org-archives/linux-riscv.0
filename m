Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2743FC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mx3GXeLw02OgeFw6aiwZmOKgw3BKDY2vI2gzWz2Wkcc=; b=13qf/rZ5CUPayP
	b7gPyLtGxbrifN5Ad/eOmzVGgS4xccN+1KbZ/9qaGCu/XRoTkytvA0kzEK+SBgYLN6W4rk0cU64gp
	hdeina8VDSsC1IcfwE7aVbeMnstJY7C8rom3JWfneeOMAMbbES0ZO9jB31Lw1KZROZVqDU1fQUwWe
	V8rulhb3EW83xQ7OzanyYjgo8oZ9zdNIEGkZ0PsGGbRj9fJYOEdrHaPjbvwHejfgOe+E0MXR9uvDI
	FTRhxjuDvjNXHLIPweoiLOpTaEWRrHEFzRX8aCZJuqb0xsV64RBJipSvIrJGd9jNUJQPCjS0gRz03
	id6si45yqaX7deZhG3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYioA-0000000ERPH-0Yn5;
	Tue, 30 Jul 2024 09:06:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYini-0000000ERI0-0Ati
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 09:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y8G0Rsvl2ZfKQVim3WYEu/ULpMdQ5SB3TZr8FpmD1gs=;
	b=LF7byxQPSh4tpVGk/8dOl4m1YawPMCp/IgX+IJvWLVgwmkeR0JVejiqQbF/nOxkQ/dpnzQ
	/5cmEXty/6TPSiAM6A59cbhMdjYUbvAOIvD6Cf8lN8lr0KfeXA1TEHzZGAu6VdDCf3/wCg
	l0TTxmfxW4xXmn9qmREzb8aPaOFCCsM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-pfHhb_WBPhK8uZ7DL_tYLQ-1; Tue, 30 Jul 2024 05:05:39 -0400
X-MC-Unique: pfHhb_WBPhK8uZ7DL_tYLQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a77f0eca75bso415440566b.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 02:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722330338; x=1722935138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8G0Rsvl2ZfKQVim3WYEu/ULpMdQ5SB3TZr8FpmD1gs=;
        b=a3R1cSz7wPNGB6vl6nCL5vKmJhkvNvo7F88MP5q6iezDVm+KjdGKELUbRDeAPpW8+3
         hoWgA9QryvYxbjMxkMRh3ffvJf/OysdF32L/Maqzee+GN377QVoejqNdBVAHWzsTsDt8
         yh+5zB21drA6CPzW2P9lT1vW2ZzTNtqgl41mtrHL2UvFxH6SsaRSu5SpLD6YtKKWLFmd
         o/WPIbvXK2sEkJ91bFGgHqD708TSrCxsiPP0OLTYJn1b8KFyt7KnWb9qGoAeyN4wWgWE
         3v3uk8nE84ImpFMA7TxD0GK2aJQOQ79uehFgUtM5bAEmI+vNsUrf0w3KzBK0UyOCq2X4
         DZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCXCRUav70u4afaSwDk2ZWmEFrGD2PDNlRJy8jg2gDMDm6uOT0tYlEuJvsh/A4BmDcsFuRQbZTMHkWWNFBtv3mBfHf1QBoGz5J2B8RKUF0gu
X-Gm-Message-State: AOJu0Yx95rxRipkByyFyNFgaBmMoRoskdMfqwmVRO3PTt9FRtwHWQ8+w
	q5LD+JO5CqHyVg/8tMtVRVSN8ol6/2in/d/iqlcFwlnK5LkgtOOtsnjONPMCmdD2y62eJSz5n42
	CA6Mhvl8sfAPJg+XsC6jVJJBTBSFayfgI++beavbAIJ2DW/txuhIC0o7Jj3E+1AQc8g==
X-Received: by 2002:a17:907:9803:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a7d4011446bmr605767366b.44.1722330338313;
        Tue, 30 Jul 2024 02:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHe4aJyS1Uxr4GJW4wjt2WBKjxS53+1D2JV4zXUtkqi7IDeNByS7dwef5YTgCXCGFtY96FA==
X-Received: by 2002:a17:907:9803:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a7d4011446bmr605763366b.44.1722330337702;
        Tue, 30 Jul 2024 02:05:37 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7acab23157sm617304466b.33.2024.07.30.02.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 02:05:37 -0700 (PDT)
Message-ID: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Date: Tue, 30 Jul 2024 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-46-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-46-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_020546_184330_8CF3E403 
X-CRM114-Status: GOOD (  16.31  )
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

On 7/27/24 01:51, Sean Christopherson wrote:
> Provide the "struct page" associated with a guest_memfd pfn as an output
> from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
        ^^^^^^^^^^^^^^^^^^^^

Just "kvm_gmem_get_pfn()".

> directly put the page instead of having to rely on
> kvm_pfn_to_refcounted_page().

This will conflict with my series, where I'm introducing
folio_file_pfn() and using it here:
> -	page = folio_file_page(folio, index);
> +	*page = folio_file_page(folio, index);
>   
> -	*pfn = page_to_pfn(page);
> +	*pfn = page_to_pfn(*page);
>   	if (max_order)
>   		*max_order = 0;

That said, I think it's better to turn kvm_gmem_get_pfn() into
kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
to the caller as applicable.  This highlights that the caller always
gets a refcounted page with guest_memfd.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 901be9e420a4..bcc4a4c594ef 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4348,13 +4348,14 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
  		return -EFAULT;
  	}
  
-	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
+	r = kvm_gmem_get_page(vcpu->kvm, fault->slot, fault->gfn, &fault->refcounted_page,
  			     &max_order);
  	if (r) {
  		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
  		return r;
  	}
  
+	fault->pfn = page_to_pfn(page);
  	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
  	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
  							 fault->max_level, max_order);
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a16c873b3232..db4181d11f2e 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3847,7 +3847,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
  		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
  		struct kvm_memory_slot *slot;
-		kvm_pfn_t pfn;
+		struct page *page;
  
  		slot = gfn_to_memslot(vcpu->kvm, gfn);
  		if (!slot)
@@ -3857,7 +3857,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * The new VMSA will be private memory guest memory, so
  		 * retrieve the PFN from the gmem backend.
  		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_page(vcpu->kvm, slot, gfn, &page, NULL))
  			return -EINVAL;
  
  		/*
@@ -3873,7 +3873,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		svm->sev_es.snp_has_guest_vmsa = true;
  
  		/* Use the new VMSA */
-		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
+		svm->vmcb->control.vmsa_pa = page_to_phys(page);
  
  		/* Mark the vCPU as runnable */
  		vcpu->arch.pv.pv_unhalted = false;
@@ -3886,7 +3886,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * changes then care should be taken to ensure
  		 * svm->sev_es.vmsa is pinned through some other means.
  		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
  	}
  
  	/*
@@ -4687,6 +4687,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  	struct kvm *kvm = vcpu->kvm;
  	int order, rmp_level, ret;
  	bool assigned;
+	struct page *page;
  	kvm_pfn_t pfn;
  	gfn_t gfn;
  
@@ -4712,13 +4713,14 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  		return;
  	}
  
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret = kvm_gmem_get_page(kvm, slot, gfn, &page, &order);
  	if (ret) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
  				    gpa);
  		return;
  	}
  
+	pfn = page_to_pfn(page);
  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
  	if (ret || !assigned) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
@@ -4770,7 +4772,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  out:
  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
  out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
  }
  
  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)


And the change in virt/kvm/guest_memfd.c then is just as trivial, apart
from all the renaming:

-	*pfn = folio_file_pfn(folio, index);
+	*page = folio_file_page(folio, index);


Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

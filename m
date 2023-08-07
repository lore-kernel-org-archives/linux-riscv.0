Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0CC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 23:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=/30doK4Csa5uJpawja9cHZHBkgHvid/CPAys4+PNsuI=; b=fOj
	Lg7Y6FVyeWKriVVnIxy9emQw57YBR1MLSMAOtIgQxCYs0DIhTVydaVdmMaa0uJAIqDd+lvZKLR2gx
	Wg4aE4LBIyFcqj1DoW0O+edy2FKEyJU+PZOuwFJlFN6oE3JZGENL25/CkTgjixgP6CMMNldtnRubh
	YRed/1SaZquJl1xpEQi7AL3g6BMOfPE75hT9d9nJvua0Xcal/eAGEh+sgOxvVBxLXpb2RJ5AYpu2d
	bAKJtdQEzsWwffFllbBtU5sAkrzg9eZkAENBnFF8/Z+/JbmlWC0WiAAacq4pnfkG70OkhBTPqw7YV
	noGa5fQ7o7IvZLqWNjTOP4UavTQfGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9U5-001BQG-2k;
	Mon, 07 Aug 2023 23:17:57 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9U3-001BNM-2G
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 23:17:57 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d061f324d64so5647365276.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691450271; x=1692055071;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6ADKvrj6NKuTG8K0De5TN5TBG7YUj/XYIH2D8dp568=;
        b=rHwQlDZDzym7DX7JPTeHFjVedtFRUtAMiKX2VU1EjC3DDPS+GKehZ420ny5GaoR1ql
         DJZSgsfTVJl3vHuTgVdsaoMbYWxHvGzjOU0b7lDeewUWBnmHCx4rEyCV+u7mMO4LYlh5
         X/eCH8/74nhTzgvQgUg3W7ew8mnRsIapj5OejxlfXYe7B7oIEIOpl62BZW0oI322fnfO
         0Voq/X8G0TvKlJzbTSRNfra4zE+z5UETF5mjVUp3srNKrf5MdQ1+J9GDHb9R/7Klrk79
         sQ7ciz1qdHaVGW7a/1FblT/tag2WVBkp7Xupx92Rz9XtAvp0t79KGYAXs3GugjDd4DWz
         Be4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691450271; x=1692055071;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6ADKvrj6NKuTG8K0De5TN5TBG7YUj/XYIH2D8dp568=;
        b=RCUWR23RJnCsNQrCR7j0dsMaAApzLONlXKXKk/aYyx++fPKQdzfp1feUqM+LfN0fXt
         fMeP1PM91sjbFpyTLjY5EaZBg7RENuvVEvC8zB6M1kE95/nUYvDOL1NKR3mkh39DI3pg
         nE1X5hvoa/CCfMHzLp0+NGb0ZMaTwdZgXk3+9zjqg6qjuT0a7LKfp1PBR6m2n+4q7j/j
         6+zbYok8JZKMURkOFximF+aKaBlx9ipNSpL47cDj+8vOWc7kP6yfkMwcirkTGBtnkgSk
         ufZNGBsb72HDRYg3vFFUhzapG8w/R2rAvhmAOntRxewfd+oUx066MI/yH0nuX1xCMf/P
         3e0A==
X-Gm-Message-State: AOJu0YyOMwDjwy9yWfvXspNIOSY8jaZqY3loxPwGm45JsP8VrvZaA4yD
	OonC2CjUwaGCvKscAztOevx2rtmrw2+FeTR3BA==
X-Google-Smtp-Source: AGHT+IGSgl+5gSINX//lCEXF+ifa5KuvDte/Vqkh35HGceplFQQ8fBj/FZjwVUabZs4KoYQYU07HEfGWMf/BZUZt+g==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:ce50:0:b0:d4f:d7a5:ba3b with SMTP
 id x77-20020a25ce50000000b00d4fd7a5ba3bmr34924ybe.8.1691450270921; Mon, 07
 Aug 2023 16:17:50 -0700 (PDT)
Date: Mon, 07 Aug 2023 23:17:49 +0000
In-Reply-To: <20230718234512.1690985-28-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:10 -0700)
Mime-Version: 1.0
Message-ID: <diqzr0oe30iq.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 27/29] KVM: selftests: Expand set_memory_region_test
 to validate guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, willy@infradead.org, akpm@linux-foundation.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_161755_740792_73DAE952 
X-CRM114-Status: GOOD (  13.59  )
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

Sean Christopherson <seanjc@google.com> writes:

> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Expand set_memory_region_test to exercise various positive and negative
> testcases for private memory.
>
>  - Non-guest_memfd() file descriptor for private memory
>  - guest_memfd() from different VM
>  - Overlapping bindings
>  - Unaligned bindings
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> [sean: trim the testcases to remove duplicate coverage]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 10 ++
>  .../selftests/kvm/set_memory_region_test.c    | 99 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 334df27a6f43..39b38c75b99c 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -789,6 +789,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
>  	return ____vm_create(VM_SHAPE_DEFAULT);
>  }
>  

> <snip>

> +
> +static void test_add_private_memory_region(void)
> +{
> +	struct kvm_vm *vm, *vm2;
> +	int memfd, i;
> +
> +	pr_info("Testing ADD of KVM_MEM_PRIVATE memory regions\n");
> +
> +	vm = vm_create_barebones_protected_vm();
> +
> +	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
> +
> +	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "Regular memfd() should fail");

This should be

test_invalid_guest_memfd(vm, memfd, 0, "Regular memfd() should fail");

> +	close(memfd);
> +
> +	vm2 = vm_create_barebones_protected_vm();
> +	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
> +	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
> +
> +	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +	kvm_vm_free(vm2);
> +
> +	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
> +	for (i = 1; i < PAGE_SIZE; i++)
> +		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
> +
> +	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +
> +	kvm_vm_free(vm);
> +}
> +

> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

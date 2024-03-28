Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC9FCD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UTo1M6Ca8ejfU6Xj3HCWj6wywE7xrsBQ+kHI/utMaTs=; b=YOnuS3QriYdMrvGDp+d+YNdgP0
	0HStNpIS+Ehz56J3JeV5V4wCvxDcwDCfacIztIx5YQ/q9Rb9ZKYiKUAARS2i1RTkaJcm5DBqeV5IY
	Cq8fec7ksN6VooAUE1GgUmXPo/TUJctlWDZCLGm5r5GL820oJzggPIYTDNW6zxa16xfCybvAmFj6z
	F+FdxXn6QyV5p5I8pZNg3uXsKD06sHETg/5NoKaHFb8f+a3xdSa+5s820sliO2uemrc5916RluOZ2
	CR6X8zaHRDs1f+lTpSTKZ2hUY8LzkuFLCkU1Y01/1V/5M0wNfHHnItfzYgkz+9pjz9WDBYWaAQzIo
	xrECv2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfaO-0000000C7Gd-0E7B;
	Thu, 28 Mar 2024 02:33:48 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfaK-0000000C7Dv-3ZMR
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:33:46 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60cd073522cso8796697b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711593220; x=1712198020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkoXrrgQLG0OC6iY0Ar2KtEiFjbb+Lcngub56vU+bHo=;
        b=rd/fdEn0A5r/QOMuReNl0nj5n312bTBdOzM+oPmOaxi5+i+TScetygRCaxxuX8GFtx
         eYuq09bwjE7f+Ng4D8L+1kNrGEUOgCqxONwqR/6dFL51Wh3L6inUORjPaBxt12dCfTLt
         UozvmUpHgZ6X7qLVm5hbql51ny/aJ27HnCSgXYlZBJ5A7BpMMhfL5uS3XnYGi4p9gvC3
         pgOmYty5u/9U4nq8GTM3RdP6u6+6wDIMyaJAHcySZtn9FwXha1NDG0QagkFLJG8pi9iq
         OMbbykrq1Q/709gHT35Y2HTxn4dasxJCtXs7SEbfd39vMOf9k7w2JjVbbdItEF6VxrXS
         DTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711593220; x=1712198020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkoXrrgQLG0OC6iY0Ar2KtEiFjbb+Lcngub56vU+bHo=;
        b=HynW944uqjgHdaEcSFJ2JJsfTltVOyVMkGOLJ3yBOmpUp4duZ/JaIet8gycS5H+qFI
         QgkUcUBKYOiyLpkROHdEcbbagtTa9R1uaaC4BSvEdIq/ED4/6lxICRnRMGAv2zHliBMo
         CV4sO1OW4quUYfVyVe+oWnwP1vIWj8iWmWSlLWRi4mmdGd2yNWizONdbMgjykXxs9qZm
         I5X8HHKulDE/PjQpuLCGDxypSIjkpuwaGQ0PvVnLZNelNJO0stMgiABu9UK5pvSiCohE
         g7qdYvaNG15YKU7IVfq8VVZwR05GOsjAKh3tmsCc7V+N2xDsDgFdNQKUu5w+TkQDC/Fw
         4h2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiRg9XQZJSMHebs9guHodfl1QZ7HSWdqY5xJzE9mANVC0GyAJGhoU5MnWS69uuQeUwjE8ZB6oNUwEtWJHvv/cmTz1FsuD9lGMnFyP/upYQ
X-Gm-Message-State: AOJu0YwiVVob98RjZ31m9yaui/UtLUiB1m5sC/5Oyr894G4W38Wq0qB0
	nTzw99x2YXWZ665/ssaEhUu27HS3f9ypUzvHsQ2unSj3Kw8O2B97COkiLVjSB1ijmQ0Sft+2ILC
	6rWukMwTt/V1AVgFbKGZ6Bw==
X-Google-Smtp-Source: AGHT+IHG+Q0Rs/vnujOAAu0Ep0Ci2zjwBo/RrccQVLVpOf2JlGdWJkUk21aGZnHKjC8iP2W+VnN97KkaXY/g7E7Z7w==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:690c:d8f:b0:611:9268:b63a with
 SMTP id da15-20020a05690c0d8f00b006119268b63amr350712ywb.9.1711593220342;
 Wed, 27 Mar 2024 19:33:40 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:33:36 +0000
In-Reply-To: <20240314232637.2538648-13-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-13-seanjc@google.com>
Message-ID: <diqz4jcrm6f3.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 12/18] KVM: selftests: Allocate x86's GDT during VM creation
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_193344_898435_3FD6629F 
X-CRM114-Status: GOOD (  15.64  )
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

> Allocate the GDT during creation of non-barebones VMs instead of waiting
> until the first vCPU is created, as the whole point of non-barebones VMs
> is to be able to run vCPUs, i.e. the GDT is going to get allocated no
> matter what.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index f4046029f168..8547833ffa26 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -518,9 +518,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  
>  static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
>  {
> -	if (!vm->arch.gdt)
> -		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -
>  	dt->base = vm->arch.gdt;
>  	dt->limit = getpagesize() - 1;
>  }
> @@ -644,6 +641,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  	extern void *idt_handlers;
>  	int i;
>  
> +	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	/* Handlers have the same address in both address spaces.*/
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B88C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 04:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3Ybnpv46NzWit8Hfs8fqg3UQyHa92jNoVD/Uu7cNLbI=; b=aBoC1jXSlaBmvu7NHGDoJBrht9
	lI8KBnEzaCY56BzIgsbrCbXSn74oEioPQZHFsWjrdb9L9TgH++yfkEzkH8npZid3GnbmJM1crNRkC
	/3vYTlt8ApRcp6Sr+nNXXlzBwDX3q5mr4nRv7A5EsgIUb7dM0NTdkZqKilXdj4o14UYrAylLqCUqM
	WO+NpIN356FjCG+AjZ8Z0/Rm4N3AcB29puem3Fir6WPPQI7m/Vwg1nBE9aBt7zCUQciosaAIH1sW1
	pHUtfPkHkplewyUuY9G/YWS1PozscQci0lzy2cImiNUYrQexx6ddsKo4Rm90kv/fAzIxHL74aLvqT
	buK4Mirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpgzG-0000000CKz8-1RdL;
	Thu, 28 Mar 2024 04:03:34 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfr0-0000000CAQK-1UK1
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:51:00 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dd944567b6cso678752276.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594256; x=1712199056; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=seKwScTc9wqkrhGrgx5tr+y5GeB++CIZke1OsGxBUZc=;
        b=4EsivyFGWSegbyqGWRHGbOc1hNFTdTvDgXM3t18Sxr/wZFJv4DzcFYCYkX6tljJTX1
         YLQjr78BH/72UQA1oz5dgMnaKF228H/6naz2sNZSEQRxEK22fVUg1zmPNTktwQQOI+Tb
         INhp30oxAw+DFLPwe4+7Rizy2I/aKFovFsiFpn5G/x4BQGfXjbu6C0OD8BKnXmrmP10V
         yD+u8ZuAl3u8eq3ps0a9RdySrfY6FlB81wzeLZUij2YQ7vp8bp0NSFPnV54scg03OdUQ
         k5BOkalj7sG2VWAj90qT/T1NUoLtWXTWuYWDg7qag7Rgva9r3Oai5f3X9iHlc6JK2fEh
         TZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594256; x=1712199056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seKwScTc9wqkrhGrgx5tr+y5GeB++CIZke1OsGxBUZc=;
        b=sJwrAZdd/g0p/eIWWhGYN8SdYNuEobM3zRkfNKukAxwekbsY1DdAOUiLeMom1rzMJ0
         TjYnC7jvehotQ38PLPnQJU/F564q2xTqBa5JZXOb598Mo5IXnw3OTeXgjdz5A+cfZl/r
         ewsR3BgfpGHErBXb6GO8JX2EknRr3Qv65gCrylWDDZ/RdPWndoVxb8wR+cmXORgRJJK/
         GufvYxX13DPsYnd144/BQJCSZtjXs7qc9yUR7QKHVdvZPyj72C67fK9ZyKP7nNnvqnJE
         V4h8eFm5aKqfVnrIy4IVHWgBW3eIAEjyrsbi17z57KpJLmJ2RCZdqpNEZLzie6rVeE/4
         DpMw==
X-Forwarded-Encrypted: i=1; AJvYcCWa7WbEIq7vbfQdXGThv9+KvG+AkqKpPkjcCVNnryQkAGGdzXkM9a/oLjFhoeVfOfL5E5yJW32Stq36214jABz55EVLNu1lX7HK02LalEGN
X-Gm-Message-State: AOJu0Yxg+j5v9ps8M9qQEwxid1dEVp/2HJ3l4CFPE0haWd0H8By+FYM9
	83aVG+XBJ6Vqk+Sx6BAIVxLlXfeA6yjYl7QitCGNvvTWCHjwITpYmH0uPXAedMHafwqS6rg7kaK
	lsCsmq2iGgFmSkiksgniAow==
X-Google-Smtp-Source: AGHT+IEO9/kWiBlfm+yWQ+WCwdKpSW8LEFVaawt8sTBofKxrZN8NZmXedY9jk9Xhy7bDK1Xf3oVmIhdKSvQRsIc+mA==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:160f:b0:dcc:79ab:e522 with
 SMTP id bw15-20020a056902160f00b00dcc79abe522mr160235ybb.11.1711594255835;
 Wed, 27 Mar 2024 19:50:55 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:50:52 +0000
In-Reply-To: <20240314232637.2538648-16-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-16-seanjc@google.com>
Message-ID: <diqzcyrfkr1v.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 15/18] KVM: selftests: Allocate x86's TSS at VM creation
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
X-CRM114-CacheID: sfid-20240327_195058_633264_7EB025AC 
X-CRM114-Status: GOOD (  15.22  )
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

> Allocate x86's per-VM TSS at creation of a non-barebones VM.  Like the
> GDT, the TSS is needed to actually run vCPUs, i.e. every non-barebones VM
> is all but guaranteed to allocate the TSS sooner or later.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 5cf845975f66..03b9387a1d2e 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -519,9 +519,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
>  static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
>  				int selector)
>  {
> -	if (!vm->arch.tss)
> -		vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> -
>  	memset(segp, 0, sizeof(*segp));
>  	segp->base = vm->arch.tss;
>  	segp->limit = 0x67;
> @@ -619,6 +616,8 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
>  	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +	vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
> +
>  	/* Handlers have the same address in both address spaces.*/
>  	for (i = 0; i < NUM_INTERRUPTS; i++)
>  		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

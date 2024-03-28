Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B64C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v2wT4SjTdZUw4f5I6EHAP/JLRi8ub3W/wh3joZIN64Q=; b=PcZNpOGaFrK3mJcHYeW5qy2gfs
	+8vL9EIqZEIxB1oA8cAGtWR9kQXAmZuToqZfXqJbqHSY2oZi8IJgbRrDp+pfJiXkswCiwM+Gx7dzU
	7ZQEDifgAgOc/lWLmKlPbogk8yXf75XCpP+SwlAdpDszStpvitCD2knPINydJpglzzUbu9JHE8Z9C
	QTeTamqTD6WnWFPgjntMeqiEnH57ISN+PoY8O/UfrB2VB2hyUcrrumF7sUGh2+FJ6BNDjng22HnKj
	Tyd4wFZBDldahMR5ZUDFf8CGhO/RP6CLHa7pZH6QGct26/Wi8zXsiyrTSShrqM2IXzGxFeLONSRbM
	kw6Or25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfsq-0000000CBJ6-2bfi;
	Thu, 28 Mar 2024 02:52:52 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfsj-0000000CBFg-13ru
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:52:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcbee93a3e1so732662276.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594364; x=1712199164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pg1Koe+Yskb8UPW0Ibn6wgFaDBKMELyCNXaqBSGpiIg=;
        b=jff9rW1c97ceT9xKhgX7fVvLbhnYOxpop5IA9VbQOc7HelG/6jz1KzY5VBoGinRiyc
         qGyoh47HpFthyXkPXUyiYSRHCw8TaN32nkZfJwhfhQj7PVU2S5N0x6qdCy25MPPiELjK
         SDqVGwL+emV1VlZHcDVcDYY07S6taFrXYW2d1E7X2JE65TN7ezO49kvxr1Y450Iy8Lqv
         vcMBkRAyFdjQasfA1tZ50yr0cYADIeQINxzuSQNSj40wvWujzky/Yqhxx6btVkpTokB6
         VSsuOXnL9qg7yfW4m8mJRv2aEAawoe4KzQsr6qwkLCsqEZtros73dNEM4RziEEj4xWnd
         nvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594364; x=1712199164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pg1Koe+Yskb8UPW0Ibn6wgFaDBKMELyCNXaqBSGpiIg=;
        b=S3hCJ/f+ZQYhspfeA/T0QoWgvJsTH0GTQf3iMrnEHeiUDHeu251DyTw3XZE9DL3j7i
         OdqhmijWSfBLmzlYu5wWMiWpGs4rjyQxS33YBqLZZJt2ezIpKvYzxm81+4XcuJWtyP5g
         /nemTRWo03RswhkqHJkJZ2qT7Nx1Jm/tOKyTB0HafxMblvH75fnZNrsVU8X3UJyhg4gZ
         MVt/UHER2N2NCc+7cg2MRF37qvkNloCKCrQMxpQk7C4L9NznLMoGQf1aWWcZBIAaa/kx
         vR09wpFoS+od2UScoNaNeomwZeJtB+Z4hSyHSW4C7l31sGhZBtmFKerHHeUqAvSpFNWy
         zXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBX+BuYUBfZK1SQI6yplOy4ETq0eSIXXM2rqrNMp1oUYuaDRgm1xjynBLNV4PLpT5cDDpShPeEu6S0/Tdmj1tr7lcEb3RxC8La5kcb8e/
X-Gm-Message-State: AOJu0YydzO3/dK6J1jgvHNds7iGnEStK17YnM0jewkFZ+LkNQmsgfiKZ
	JzuJ1pvulJ3z5pYtMxuQgudJPH3/07kg3zR6KcctUbiK+rhPR+NITWIu4trvIHYEOJhPmzKoeUH
	ldjQFi/PVwZvKe5maWRtPKQ==
X-Google-Smtp-Source: AGHT+IGamct0CFbVaOo18kFqPCJIWWo6VB9ZmUglKKzir5OBthVLSFpJRBv0Ez69oxdAsU/6PDiZ+aH4G55jCyDSpg==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:124c:b0:dcc:8be2:7cb0 with
 SMTP id t12-20020a056902124c00b00dcc8be27cb0mr125722ybu.0.1711594363911; Wed,
 27 Mar 2024 19:52:43 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:52:39 +0000
In-Reply-To: <20240314232637.2538648-17-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-17-seanjc@google.com>
Message-ID: <diqz4jcrkqyw.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 16/18] KVM: selftests: Add macro for TSS selector, rename
 up code/data macros
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
X-CRM114-CacheID: sfid-20240327_195245_318757_A09108CB 
X-CRM114-Status: GOOD (  17.27  )
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

> Add a proper #define for the TSS selector instead of open coding 0x18 and
> hoping future developers don't use that selector for something else.
>
> Opportunistically rename the code and data selector macros to shorten the
> names, align the naming with the kernel's scheme, and capture that they
> are *kernel* segments.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c       | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 03b9387a1d2e..67235013f6f9 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -15,8 +15,9 @@
>  #define NUM_INTERRUPTS 256
>  #endif
>  
> -#define DEFAULT_CODE_SELECTOR 0x8
> -#define DEFAULT_DATA_SELECTOR 0x10
> +#define KERNEL_CS	0x8
> +#define KERNEL_DS	0x10
> +#define KERNEL_TSS	0x18
>  
>  #define MAX_NR_CPUID_ENTRIES 100
>  
> @@ -547,11 +548,11 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
>  	kvm_seg_set_unusable(&sregs.ldt);
> -	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
> -	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
> -	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
> -	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
> -	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
> +	kvm_seg_set_kernel_code_64bit(vm, KERNEL_CS, &sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(vm, KERNEL_DS, &sregs.es);
> +	kvm_seg_set_kernel_data_64bit(NULL, KERNEL_DS, &sregs.gs);
> +	kvm_setup_tss_64bit(vm, &sregs.tr, KERNEL_TSS);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> @@ -620,8 +621,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  
>  	/* Handlers have the same address in both address spaces.*/
>  	for (i = 0; i < NUM_INTERRUPTS; i++)
> -		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
> -			DEFAULT_CODE_SELECTOR);
> +		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
>  
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

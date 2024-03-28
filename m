Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A73C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rHT+oWD9xSXln8KPImHkDY0fPiN54dY8hdE0wKN1M6w=; b=lzl9jDJvg7CLKjGv2kO+CnstRm
	sVn097XeL3ro64urSwZ13zcYtUDqRt9uped351aG8vDN04fWhM1YPKv6PoAuo6wcCNVBtWisW6O7O
	pCyKRpD2BRtIMoMdObNNl6tszFKJf5C7qgvkepPyMZsTXj9PCTDC4mbo3SsH1sxPv6y3xuBGPK1G4
	nlB7h1hBo/I4irzbONaDKCBnYVkxeU77m4bsPuMOgRdf6int6AXpNj4lnEp53H7y2igFPL4yBL+83
	3HzazNdUqsufvuwuyWUtnOTB9Y9gpxNxl2ajPEJyDA2EZmPkYwjnbcUiJh7UUT8WmDBJspaNiDpIc
	KykRXXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfVp-0000000C6PP-0HtX;
	Thu, 28 Mar 2024 02:29:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfVl-0000000C6Ne-2GuT
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:29:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1so748920276.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711592938; x=1712197738; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/QmOyqM5X2MNASCMJ2dyKBKMwyn+XBPI/URXs6ak0lY=;
        b=t5vZWdajOKePbji6QLpf0E4dqhmVRWa27APwLouPILVhFaXqRbRCWwLYkSfVjP/pGL
         rLlxfB1fap98NkdkD+8jOLh72NBln0vYRrPIxiSuGoTZzVcdHERdOzMS/tCt7PRRLHce
         yF6TSocPqCKTf92vyBJBpeopG/ou8Iak/twXS6TYpakE4kBb677DAVEaBVaLRq2oCXEE
         bThSUBzwjKTRIoTA25oFqhVzgKIA2hlg+aNrUMR+U0IfCmFrjpojUMh4BjnPDb11tMUd
         WBNZEB1gCZzF1PKg0D1gebskgj6Wl8XVdg68wcpJGS8K/x0cOuNfJ5YgtmNnBBKvRfht
         v5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592938; x=1712197738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QmOyqM5X2MNASCMJ2dyKBKMwyn+XBPI/URXs6ak0lY=;
        b=jW+yPBpJOYGhflPPMUNXjeQnas5B8z35iKHSJ55wATi5MOaTr56W0yZaPh/ajTuZFQ
         zxzTr4i13UJAYVtyBZyrVcB0DPK9TSfdb+5Eun2lTKKCk9M9EbPdBexFBg8acH96VjoY
         1KecAimxnbsysN+EjvBDl4LP1i1b0O0wulpGT0HW7XevEREWNohfYbWExci4KkCnhmgv
         2ULHPbqVaMdkogW8ZIgVuHVs9lPk0D7ROnv44Fvs5Bq14yNkDR92lYS40v/EyzqLhL5u
         PvVdiVUn0fg5g4/LnElrGsnfPjVTY0XXsoiDpyQmM76L1WumrcqqaiBjDxaR+M0G/8V9
         NkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh1chzjt2i6Ls37B6WFev2GDDF1vq/9oiApaQ5GLnSlj3BUUxBqioIUiXTrP7VSFw/ER3f0l9qV3CFlNP1zzkKgSnF90zBCQ9/ITE2OMyb
X-Gm-Message-State: AOJu0Yw2E7th/jcdM/OZQOOsb7gRlEtbqQU9QtuqDhiw8dtzslM//Phk
	/PdKOcecokiC/WpIDvGLab7h4592pvtpcQQDHJlj+wGjuzDNJUIfve5I2Ssw6edFozWHQeCjBw+
	l6y6+Qugh5kEYhI7WHKAcHw==
X-Google-Smtp-Source: AGHT+IG3h7UFptSbhQThXKYXVUxHjXW9GcRNRwfD8DnNx4fzNFxp960mZTVoDNqHvfoMy5v3WIivsTHuarJXGtUe7A==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:2290:b0:dc7:48ce:d17f with
 SMTP id dn16-20020a056902229000b00dc748ced17fmr489931ybb.10.1711592938320;
 Wed, 27 Mar 2024 19:28:58 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:28:51 +0000
In-Reply-To: <20240314232637.2538648-14-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-14-seanjc@google.com>
Message-ID: <diqz7chnm6n0.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 13/18] KVM: selftests: Drop superfluous switch() on
 vm->mode in vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240327_192901_663557_4F10F55B 
X-CRM114-Status: GOOD (  15.73  )
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

> Replace the switch statement on vm->mode in x86's vcpu_init_sregs()'s with
> a simple assert that the VM has a 48-bit virtual address space.  A switch
> statement is both overkill and misleading, as the existing code incorrectly
> implies that VMs with LA57 would need different to configuration for the
> LDT, TSS, and flat segments.  In all likelihood, the only difference that
> would be needed for selftests is CR4.LA57 itself.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/lib/x86_64/processor.c      | 25 ++++++++-----------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 8547833ffa26..561c0aa93608 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -555,6 +555,8 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_sregs sregs;
>  
> +	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
> +
>  	/* Set mode specific system register values. */
>  	vcpu_sregs_get(vcpu, &sregs);
>  
> @@ -562,22 +564,15 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  
>  	kvm_setup_gdt(vm, &sregs.gdt);
>  
> -	switch (vm->mode) {
> -	case VM_MODE_PXXV48_4K:
> -		sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
> -		sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
> -		sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
> +	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
> +	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
> +	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
>  
> -		kvm_seg_set_unusable(&sregs.ldt);
> -		kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
> -		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
> -		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
> -		kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
> -		break;
> -
> -	default:
> -		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
> -	}
> +	kvm_seg_set_unusable(&sregs.ldt);
> +	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
> +	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
> +	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
> +	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
>  
>  	sregs.cr3 = vm->pgd;
>  	vcpu_sregs_set(vcpu, &sregs);
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

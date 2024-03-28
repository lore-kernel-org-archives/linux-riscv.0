Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733BC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rD1/sEPKmmY4wdlfJrCCkgJqiSdvt64RL13pX0dqXT8=; b=miSlTUjdDA1nKv32Jr8BJQ839p
	P7n2yke28W9JU0ZMAQfk0TiEqeURA7vwUjZFisWK+2ua2h+7oc4BgQ7vgS/N9Jz20YHlMSJby/mbs
	Q3n+gEueI/MA/dBUpPcspvkB0lN3t22J2hDKIpFsvllfieTjaESTpNNrDfSBlV+qVAui9zBYB8UeB
	I0R4NY9qllTj1YIuuABWz+TbyoaxRfrYB2olbllYzB54F+JkzGUsEJwAEFBw05oNHvAPKGfEbLmm0
	DiiyMWjkhntq+Ik1SzGcWvdmbl0nDT4VSFjPxJ00VoCR9a810i1pqZcUPapIp0p/Wv+Jtx6ZsFCmJ
	0YnONtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfcP-0000000C7k5-0SYX;
	Thu, 28 Mar 2024 02:35:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfcN-0000000C7ic-0D9r
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:35:52 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39so822411276.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711593348; x=1712198148; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tn1V7cT0/uugUJxaDzYA8tibaw31zbYQ1co3qQTHee4=;
        b=mbCTPEfB9f1XgZ5t1gX9HBmhEBPodaB7hZVbZlVWCrxiKvOSciaENUVnI2XVStU/7p
         nUpokv3x4cJRdk+/vHTQHaWG8Y9upLZxVq3zzmskTPkG8+J+lTWdC9/49hIqkkQjFEU8
         CeP70I+K5MdHA1ncJiBI6lTgtxdmLoDIQOC7bo/kujJ/pAVJi/jR3b1P3FKlcCn7Mt/K
         J6ELB7VV0h1G6Or6g5wwaeRGGBxV/tglh5qGDAM/lgqw98Fmrat/BlK61X0uV794OEK3
         MK+MnHKACp4slnl0eTPDcZp1DiBq3V2ldic9hrfjPJ436GOekycfuJ8W3a0Tx7nQ5mwg
         M+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711593348; x=1712198148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tn1V7cT0/uugUJxaDzYA8tibaw31zbYQ1co3qQTHee4=;
        b=bsSxC/aNdBwI734PMFv903AbuGpVxsSAi4PybBw7l1FkRmdPgKcPknV7zKUpboBHUG
         jRTgzTtM72B4Zms2qXSS4AiGJrpStikoeqLgj1UlL00uZ2MaMi2tNuhsRM99dDlJUiya
         nJSUub0fJBayk8gup/jX8/7AMuct0eaoMSQbfoERw5T6PZfs8cvGw12Ve5iTDBElFuY9
         477b0P2WdY+yNFNUuJfLlHLGBnV7Z7PKPgRnLdCJEeP5avMUabdJThD4lUMsHGH/RniN
         IIoMql3TGdOfzBQerJ381shlnkwZxICqmRnvxBF6nPRbbrVmx0DWEd4DiqIkA0Neocpg
         NAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnF3YMBbJi1Pw7ccXdb3T1SZuityQHn73w3iHY8YZyPlb7skHfSGpUywuXWGjWGZrgsHjaIL1vrX6mRtplwd5Bnv+FHAIJmxJYrjcnLAyb
X-Gm-Message-State: AOJu0YwTY1ICVCHWfdOhg70xlatK4o/tdrjhEBn9yYijWqXBOXks78xH
	9bYErIp9RvV2obX+FdUwUjfDYl3ljjzyTAaGD4k7IOlT8W8I5np7R3YFfea8nswIcAjHfNaWuq+
	k8MtCxrH6Eks1l/56quouvw==
X-Google-Smtp-Source: AGHT+IFmu/wyvjPJ86C2YpqmMzCjCxqoKynwb/5895KHOEbiGTXB3f51zjw8tqW3FQ608rm4NQTJd4dFZkDKVH6OPw==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:1007:b0:dcd:ad52:6932 with
 SMTP id w7-20020a056902100700b00dcdad526932mr540194ybt.5.1711593348331; Wed,
 27 Mar 2024 19:35:48 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:35:44 +0000
In-Reply-To: <20240314232637.2538648-12-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-12-seanjc@google.com>
Message-ID: <diqz1q7vm6bj.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 11/18] KVM: selftests: Map x86's exception_handlers at VM
 creation, not vCPU setup
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
X-CRM114-CacheID: sfid-20240327_193551_130597_4E2D5A56 
X-CRM114-Status: GOOD (  13.67  )
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

> Map x86's exception handlers at VM creation, not vCPU setup, as the
> mapping is per-VM, i.e. doesn't need to be (re)done for every vCPU.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 5813d93b2e7c..f4046029f168 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -552,7 +552,6 @@ static void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
>  	sregs.gdt.limit = getpagesize() - 1;
>  	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
>  	vcpu_sregs_set(vcpu, &sregs);
> -	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
>  
>  static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> @@ -651,6 +650,8 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
>  	for (i = 0; i < NUM_INTERRUPTS; i++)
>  		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
>  			DEFAULT_CODE_SELECTOR);
> +
> +	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
>  
>  void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

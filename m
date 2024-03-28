Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B01C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3TkaN5VrasAzsFA14r6zJHyn1e3v404b3eMT1hdbN5Y=; b=y97/6351BArgJlcITyZ+LuklGW
	GKN7PtJq36kQYOphpWdNOnEZz9VJb7Q04+4UPSNwFr7LWsqr/lMrxySIqOkQ8Dn8Py/JyYncGp4IU
	KQx+FFUBMPnCeQMihyHOVPoNNLRG4xMns4AT3NxokVPqxpFwxMINNt1wXzIxUMc6tNFJ9YQGeUr40
	rz4dWIV8v2ZaqYYhcbDmTEdCK2G8k5c/+AS1h9u3dTF7ZR/PbQqCHONWyF5T12KSe5LQzyPqAD0Q+
	Aus20uGausqcASxwoUqmwRIgGwfbkQqJQH8F1AmdN2p0su4Nq9EWZiU6kiq+R39b4wQp/Gac6+Pt9
	lfW+GMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfnX-0000000C91N-0esX;
	Thu, 28 Mar 2024 02:47:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfnV-0000000C90U-41K3
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Mar 2024 02:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zwKAKqKSkPlBh99CpC5Ho4X+oKbKwu1UgbqAZ4JZV3w=; b=kcfmoDMA5M/AwDj+p+9uuxUQNy
	DuMHuuplWafvc2nB6OC61f/+v1EyykjhL9JUhmkpV1F6s0fPF5bSxLuGqZDrxXnnxpa1Jwlyqe7V9
	F25MIyMkZVvSS25LWR4lQurj7/GvpjOKLQB2GVMcLqQk5H+CmJaK5mEMIpmAhu0Mx5ioUi9Z4g2sT
	1vogbrfy98wBqw+36GJ2xRjPo3qkwR4v3Gap6kYUeJAxTiw6eSh/c05P+WT2N/e6Oz+lc7bV1cJW2
	4NuYf53qMk6umglcFOt6u6QEdekua53ue8atL4BpYtUbtjOV/lkoqLFLM5XqBchUFmPkbf3lonSui
	jw7rb9DA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfnN-00000000izZ-0Gpk
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:47:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60cd073522cso8921267b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711594029; x=1712198829; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwKAKqKSkPlBh99CpC5Ho4X+oKbKwu1UgbqAZ4JZV3w=;
        b=vzpXHRe88Wc3l88g5gXNIflcaF3s6yu5GxZlbJphXo88CuxkXgAQGXj4xhNBatzeVE
         EHRiDyS17gS5EdT0G6zVnopcWcuJ7wup32mTolZpWWzx65dbdXGezHXGH/4o/R4Q0s0a
         t+LjyS4VFrrdQ14S2PAgP8UVtbODy+Ry9Wtr3tfsQhCgkt+rtXwmb5dvn6j1cis+bIMy
         EXlPnTUW1yw0oOP/5pt3wtl4d35njf/e3ftpC7D0D9ZGTAwG6yVmLu1e4Khu24TEn7h1
         nm8fJAG8tE/Pm94ghJDiTL/mmZs7Vrws1hI20i/LoQ/5QoKYGdmMsuknC6rkwdIXwGda
         +3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711594029; x=1712198829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwKAKqKSkPlBh99CpC5Ho4X+oKbKwu1UgbqAZ4JZV3w=;
        b=LaYQvh6otD1rJPCu5as3LwiUYJOjDdwgukGzEW7nLGPU/casqv1fkwuQdWPcYYCaDn
         fBhUOdvOPBTfw2aFtP2pcKbTrt6nK9KT6YHJ54jDgMh/7HF4Q14IBJdPfGwGyFRVXANC
         /SZ1yJs1p5JdWjYEbCf1bzJX+Y8rbBj/p1UwNZvnLSQbLBelYctAuCOsELPrX4YYx6oK
         b7PDS99iKlK64KDoez0BAH64ZK/Ff+slHoYq5H6ksdOSK6NaRvY2I7Z8gtC39NkZ35PU
         EO8sskQi0cdbPpyoo75opLAQNjyXmbIEGKlyol8I9pfUdPdPQiR/7HqW+haEF0uMu4f0
         iycQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt66d0vvDTE3eGIHtVyIqz61/SU232DWvo5hbDumkR2wPPV5vaUUwBG4UvWMcLXheHuGAyBmLaq8OK9kRkeexU7xmXN6WNBCYRdGhmClRS
X-Gm-Message-State: AOJu0YyYyf8dBOevCsu2MFnmasLMI1i1RPp+6IzDWxkX2E0dIAUeLqMC
	qih3l70hDtCJIR8cOMaZkq2pASKzjI7dWph0FJIbK4M54Ep+rPcc5ehNG/707RXHEoGdJJ2StbI
	X2sEAEHGSTjOW1yqvw8mnsA==
X-Google-Smtp-Source: AGHT+IFuDAD4wtNUkP/2UEse7mwv3qapG5IVIY191z0pQp8MOjMKC9JPX6Ry++6lYE8vhg/RF4vUjCFCzCP7/uR5QA==
X-Received: from ctop-sg.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:1223])
 (user=ackerleytng job=sendgmr) by 2002:a05:690c:30c:b0:610:c400:9e8a with
 SMTP id bg12-20020a05690c030c00b00610c4009e8amr207011ywb.2.1711594029051;
 Wed, 27 Mar 2024 19:47:09 -0700 (PDT)
Date: Thu, 28 Mar 2024 02:47:05 +0000
In-Reply-To: <20240314232637.2538648-10-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com> <20240314232637.2538648-10-seanjc@google.com>
Message-ID: <diqzttkrkr86.fsf@ctop-sg.c.googlers.com>
Subject: Re: [PATCH 09/18] KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240328_024715_931951_9F5B3D31 
X-CRM114-Status: GOOD (  14.10  )
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

> Rename vcpu_setup() to be more descriptive and precise, there is a whole
> lot of "setup" that is done for a vCPU that isn't in said helper.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index 3640d3290f0a..d6bfe96a6a77 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -555,7 +555,7 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
>  	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
>  }
>  
> -static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> +static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_sregs sregs;
>  
> @@ -716,7 +716,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
>  
>  	vcpu = __vm_vcpu_add(vm, vcpu_id);
>  	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
> -	vcpu_setup(vm, vcpu);
> +	vcpu_init_sregs(vm, vcpu);
>  
>  	/* Setup guest general purpose registers */
>  	vcpu_regs_get(vcpu, &regs);
> -- 
> 2.44.0.291.gc1ea87d7ee-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

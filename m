Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EB8C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BTu3Uzs7cmyJ7w3uiOhNmKxNR9a2MxUwjSYuzx8DLN0=; b=qrd7KIPiQN3LJ30BZEbZIUdP5u
	SWHJEfqOOw10SYfHYuwyrwjKNzB+e+0nzBtJejf1S2Lb9JG6m2Vf1doiFsGbxz2cDysOMLiaSvcTI
	fpWFWDDFkP717r0LTlnd0X8638qZcyJ6YvYUoahCRg0jhJXym9aYqnoSQFGm9MPMiTfBnqnXDkDdE
	daRy53gTxG5Zcwcw7r+Yl9CK7G8Zeiyli6bdFHP5hPSbA/3K2cZw3IyYf+eVfi/XiJvnmHY0AmR0f
	+5qrR0t533DV+EAvNrASZeJeZt4SpgGn7vT8Ywm0WRaIjPLmRNn2psR5Barm3yDmDgrRnPVzOJ5qP
	mJPMorHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2J1-00000001n1F-090k;
	Tue, 28 May 2024 19:16:19 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2Iy-00000001my4-06iQ
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 19:16:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62777fe7b86so16952387b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716923773; x=1717528573; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=4q8gr4cbJIuH59Eol9cXvLj0/T2KFUv+r5itMAIp/7A40gRZSO8kCKUbEouZlildrA
         SgNPfOd65omjZnAKBSKYGkN00ZK+TMvPyWwJZxcKc1kB1H8rc3cM/x6FXP2W4D93Sk2d
         dBOnDuGlvduIAlCFIaBL3Mpp9rcU2/cyXEA1MzDVkzcoh5J+gNXyOJmcAi6DU+qtGdeQ
         zgoBmCIGJrQiQMYH0PAUcuS1+s/ObGoZ8UoGAVoLbOBdb0bRgfk8i7LfUbQ/Nkpm90f/
         DTb+v3oINlCqian8fLOEfmer5NzMpzr3zGqACvkSbiuD9PmcUACSeEhxz4YSgN+iGFDj
         cluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923773; x=1717528573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN1FoCckBsPH3nlr2F+fxU8+3rgvDDBf83ZZTupmDzY=;
        b=qBq+LHeCjeXAYukNJF2XS/vmZzpjxh9PqQnJWWQGzsunlgzFsXKkKgVn1WOI9q1Z3a
         qEKSgpgVXzpD7QfVi7DHsBDCmuIpflqOhq/15k7g0YkYuyBkRFb9/H7IpjwwOdmUaW6z
         ZoyiPsSMrtUHP3PJIiM72vmpkeWzBIshXdxq1lIkS7YfJ2sIVzSa5dAjYYOjXxfItTQl
         Ml7WbXe7+aJWZkfSjZgZT3RLJhHUVAvy/WTdGMRWz9C/AJeYvKpAKAOjsP9W9GqR5P8K
         eboLPB1R7zf57E8LPwZo9K5cwBW9Q6JHyK+vzVT2bZ4X1U0j4b4Q5zbgPTKoVpdcDorR
         2W+Q==
X-Forwarded-Encrypted: i=1; AJvYcCViBH+ZQ1AxvJjLRZ8ZMoMVI/6/5FxbukTJ7icqmGDwx8eqPf0gD/xoOFjjsFIdTOkPZus++JYou+hTmuSzWaLAT6ZNSCQVdIkZvbzVXBWq
X-Gm-Message-State: AOJu0YzxJU4TJLv9VQty5dXo/kDQkZG+cepXF/4SeMpQ7kqL4QqMmvfX
	T+6c0UwvHBc33hAnFVasHnfw45AfRBym0AbCWOm1XyYMwGWTGVk/K8rLKNMsV95lesDyL05sQJm
	dzA==
X-Google-Smtp-Source: AGHT+IEYffSoUdZ4cg7KX8v+KoP4uvokISlIeu5qUtxtXAQ85EyWGJZei7jVgr6jZvnufr8gfWsoMUgR1K8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10c3:b0:df7:943d:f935 with SMTP id
 3f1490d57ef6-df7943e55a0mr788014276.2.1716923773190; Tue, 28 May 2024
 12:16:13 -0700 (PDT)
Date: Tue, 28 May 2024 12:16:11 -0700
In-Reply-To: <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com> <20240522014013.1672962-4-seanjc@google.com>
 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Message-ID: <ZlYte16cvQpPGHkx@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_121616_095570_0C1C376D 
X-CRM114-Status: GOOD (  11.38  )
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

On Fri, May 24, 2024, Kai Huang wrote:
> > @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   	struct vcpu_svm *svm = to_svm(vcpu);
> >   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> [...]
> 
> > @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >   {
> >   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > +		shrink_ple_window(vcpu);
> > +
> 
> Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)

Heh, that duplicate code annoys me too.  The problem is the "old" window value
comes from the VMCS/VMCB, so either we'd end up with multiple kvm_x86_ops, or
we'd only be able to consolidate the scheduled_out + kvm_pause_in_guest() code,
which isn't all that interesting.

Aha!  Actually, VMX already open codes the functionality provided by VCPU_EXREG_*,
e.g. has vmx->ple_window_dirty.  If we add VCPU_EXREG_PLE_WINDOW, then the info
get be made available to common x86 code without having to add new hooks.  And
that would also allow moving the guts of handle_pause()/pause_interception() to
common code, i.e. will also allow deduplicating the "grow" side of things.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

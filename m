Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C3FC27C78
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YVZCmYO7oIQ4H6sfjRTMYrynhj7nlqdzmj6KRB+53es=; b=fDcnTQsJec3I/9IvbFnANe2rs3
	wIOxNsoUftOkYVJZIEsQaIdL55MxsIZOpoJrhG8PEIsXsEscTi/PC7azJ7hwnVk04hc3oJIx4HMI4
	77EYWFgju08I6B2WfcALZMv9Wyw6tXzZ3SqrGpWn+1WLwJ1P/KJYqC47WbGWoisZ72b5Zp/W2rWp1
	1oviIhPSSFLPdXFfKgVTErYwU8KVIT4Oj4qXPiEz7cHj5K2veM2yPH0vTV5mGxs+2LDLwDvS2IgAd
	lCPyNF05crV8iV8hQl5MEF7qmvoJy8VlklmBy0AipbtPvbv8mcRUa0rUkUB8uX6WOK+SZ76Vp+b7U
	qrPv4ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCdf-0000000AejM-1zaE;
	Wed, 12 Jun 2024 01:18:59 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHCdb-0000000Aegw-1zdC
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 01:18:58 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1f70c39d17fso2900925ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718155128; x=1718759928; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gH/VrRThVAqNqdnAJ8qqfFFTLj74e8FaAJgriK6mdbo=;
        b=UqBJPSMw4xOgq48Lfm7bI5mVKc7JfFPs6S4QOKP5hWWILeyej+BSmRohCJOWOJu6Ib
         RYEMWod0QGj3YFtMlzxFqNOOiKAqlj4KkJLwgIt6amFIp7aw5scZMQ0P7KO43Zwf80cK
         5cGXNojI5UIrv5ApLWgU6JYNTD4Ml8yBr4Udg+EmNLeIaKcggcAL9/m9zUTeMGaex9yA
         f3/Fi3xOdWRA9KFYl86emNor9K2yJZsSmJMG1wi06dIPpxQiLxGQ61lX80j1S7B1BAeJ
         fPJ2qLfOKN3oJjN2JrK17IKaaDvBGUMIX8bCdFW+Y8T9dfngQ9iLRDn5SWQ3AbBJeg/8
         qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718155128; x=1718759928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gH/VrRThVAqNqdnAJ8qqfFFTLj74e8FaAJgriK6mdbo=;
        b=PjfxpftoCpiGNQoSoIp29f3JxcKNEL/mQqJ1FqAPlVMWtvnb43/n1I1vgCEoxzRW/2
         JQ2jvELUrdf2Xj/qvTiuaEB7QLnbLT4Ug5Gb61jYLdbWFPCOb48DuhqgK2vTXsZvTz4D
         5aDttj5CtYGI4Ej8hxxkwfrw4WpPIjECMhsMmQlcbBjFkrmYQ7R3fM0DL6Izzd2V3GuU
         btt5w1ihnAWIZor8P2EVxLqjvuTvdEduGeeT+y8hSiFSRsBcwp+kCSwz5GIpDVOOiSoS
         YckVBRmSKmQ7tqgvM7sEe1rU9ronoTE+m8L3kNRQrziWp1ZbJ1nZfPITKIzAS4zaY5mi
         AgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcr/d7idKSJCA5ezI7b21moFB0hRk7Jv1V8s4N9qn+EWXPN+Mqk2kW6a/A9ARzz3wEqCC11RclefsYESLCKNI/VqsaLzEBF+VbqiDgrjF6
X-Gm-Message-State: AOJu0YyQor5Xydxf4fX06VK+A4PXDNVxEs39CAanFSNP11rgy2Nlra9C
	sDhxwXCDU6gWSFTVTWw32ukK8ldG0gsnP1V2sx1reJBJaOTXSF7ukML6BcG+j8mYFMi/uL56mmK
	pWw==
X-Google-Smtp-Source: AGHT+IFA7Nf2gM73IakGhMLgjpKn7tnJ0y7JJoAyUgWaeTxteQw7ecnDkGCPi06xyYh6rqY8tUOLbz5+Rl4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce82:b0:1f7:516:4235 with SMTP id
 d9443c01a7336-1f83b1af087mr431195ad.6.1718155127840; Tue, 11 Jun 2024
 18:18:47 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:18:27 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <171813751765.307375.7908491276602596005.b4-ty@google.com>
Subject: Re: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_181855_576808_6D8D7AFD 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, 21 May 2024 18:40:07 -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
> to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
> back in.
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/6] KVM: Add a flag to track if a loaded vCPU is scheduled out
      https://github.com/kvm-x86/linux/commit/d1ae567fb8b5
[2/6] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
      https://github.com/kvm-x86/linux/commit/5d9c07febb86
[3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
      https://github.com/kvm-x86/linux/commit/8fbb696a8f53
[4/6] KVM: Delete the now unused kvm_arch_sched_in()
      https://github.com/kvm-x86/linux/commit/2a27c4314007
[5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during vCPU load
      https://github.com/kvm-x86/linux/commit/ef2e18ef3750
[6/6] KVM: x86: Drop now-superflous setting of l1tf_flush_l1d in vcpu_run()
      https://github.com/kvm-x86/linux/commit/3dee3b187499

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2354E7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BaxqMGlPaV7MrzjQbWh9hgB8IN6e6lwiMC8gLMuiRuQ=; b=VwBcToc4JtMMsUmMxnMqtIzaCH
	szizDPEVHAxNFsZ+rQ6oDNXVDDzu3WYWw+q6pZRB6uTkoz7HsmI4sZaXCKO7HsEVWFHApKfr22S5X
	BGgcrczsrA2D4/IYNk/AuAsebDFqUEzzqhW3hwkR745vgQ6L29EEQAUrkxEQk2ZAdoFuRwaHuW6Po
	zEZJsHSknZzpjuBhwrJepWJYse+xAa8jwM+C/0hVFQWKoRJtNzwzpRGd3l+4F9nWT2IQyHu6k9Ho8
	oz8Fwd5JXO5PHt8RMa4HaBGLJJxmo7bUFkRfd1WHSDj07Xwx5mGG3MhP5gTjU85sZnXzgUgexu+QW
	uZCUi54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3dY-0000000DjGj-1GvB;
	Fri, 10 Jan 2025 01:16:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3cH-0000000Dj0k-0Rdo
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 01:15:14 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so3918445a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 17:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736471712; x=1737076512; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VwFFFatQRWj4k7jYl4E+a9CzYdFY2Mg+JsqSac4RoA=;
        b=LPsO0zuHAL4nPbLeQxujqIZhyqSIzxxmbqPKG03cjLjbk+Z3O5bAlu42/35W+TajoS
         uiJkw0TCbRWHtc7RszKm5WKjrM+CJyae+4EFf/e96A+GWlBfHp7HH1GlDAL/u/fYolw5
         M5M25af+pnBLb1bxhfptFJVBewbeQ+kcbcSAY6dNJJcIoI9ePgEh/3PgKp3p7ch0C3uK
         jNBaflYdg5/3lDC2+u+Pi3FvZQPa1eQ9HnwQA6wSmyXYVFr9JV59Bm3DhgEVf5ELjjOA
         NPz6mwOW8brKJF37fDVvmrZVVohjP0V1cAtTSIMDUIQQV6cw798artJchh2bhbk/tdgW
         Ombg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736471712; x=1737076512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VwFFFatQRWj4k7jYl4E+a9CzYdFY2Mg+JsqSac4RoA=;
        b=MExOR2CcI7FGGluFjZV/TjBfT39cH7vh954tzJ+tFhkg98+pih5ftOH3S+G24O4Lvz
         TOmmAimWimClL6xCqc28WTbvGDeHvnqRIKdQvEuOuFIYgPslN0Ji4GpJyNhJZ1YMsPbV
         +34reN3qRWb8p1SVJoUYHn6hFDgPzIVqb/FjDuyv97OXFsBghjyyZqteOjDImOhhSdhr
         DDY8meOibUwx/3XhYNysllKP604CzsP1xeSy6YureVrLYX5KcTStHakomI16ZMUl0X0V
         5KBARhkAT3BRjNcIr1CW59CLJaPP9st6/edPRZDqr9u83IPd+09g21S9Uq2qbGTUpNz+
         kUSA==
X-Forwarded-Encrypted: i=1; AJvYcCVMV2MQocUP35yA4cG5l72Hw6Owug2LQlDVBmW9oR98Ylv4uKNr0MxWtj5b9RZfneDDgBLRzrojUbCYoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ecGwF8aVkiWCl7GNu3rrZNxvLS7h5askpt2nZfzXtUh0mDPA
	4wWYQkiKaVN91P8cogD4dn8oAyVgQ68XkqE4remVk8MNU898q6IXkSDMYoeTms+r2d/mRXolqYK
	wTw==
X-Google-Smtp-Source: AGHT+IHAhOQ1hNL+2ODVngM4YtoUZlDh3MWUPi4xjwAS/ekbAexZ0ECdQPoeafSTa9dwqEUdAQpSzA4aRUA=
X-Received: from pfiu8.prod.google.com ([2002:a05:6a00:1248:b0:72d:35ed:213f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e83:b0:725:b7dd:e668
 with SMTP id d2e1a72fcca58-72d2201700cmr11665849b3a.17.1736471711800; Thu, 09
 Jan 2025 17:15:11 -0800 (PST)
Date: Thu, 9 Jan 2025 17:15:04 -0800
In-Reply-To: <173645122896.885867.13450184481916964756.b4-ty@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com> <173645122896.885867.13450184481916964756.b4-ty@google.com>
Message-ID: <Z4B0mJOwH6xGjuZ6@google.com>
Subject: Re: [PATCH 0/8] KVM: selftests: Binary stats fixes and infra updates
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_171513_161743_146A8107 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Jan 09, 2025, Sean Christopherson wrote:
> On Thu, 19 Dec 2024 17:38:58 -0800, Sean Christopherson wrote:
> > Fix a handful of bugs in the binary stats infrastructure, expand support
> > to vCPU-scoped stats, enumerate all KVM stats in selftests, and use the
> > enumerated stats to assert at compile-time that {vm,vcpu}_get_stat() is
> > getting a stat that actually exists.
> > 
> > Most of the bugs are benign, and AFAICT, none actually cause problems in
> > the current code base.  The worst of the bugs is lack of validation that
> > the requested stat actually exists, which is quite annoying if someone
> > fat fingers a stat name, tries to get a vCPU stat on a VM FD, etc.
> > 
> > [...]
> 
> Applied 1-7 to kvm-x86 selftests (x86 wants to build tests on the vCPU-scoped
> stats infrastructure).  
> 
> I'll hold off on the compile-time assertions stuff until there's consensus that
> we want to go that route for all architectures (not at all urgent).
> 
> [1/8] KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
>       https://github.com/kvm-x86/linux/commit/b68ec5b6869f
> [2/8] KVM: selftests: Close VM's binary stats FD when releasing VM
>       https://github.com/kvm-x86/linux/commit/a59768d6cb64
> [3/8] KVM: selftests: Assert that __vm_get_stat() actually finds a stat
>       https://github.com/kvm-x86/linux/commit/52ef723593fe
> [4/8] KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name string
>       https://github.com/kvm-x86/linux/commit/7884da344973
> [5/8] KVM: selftests: Add struct and helpers to wrap binary stats cache
>       https://github.com/kvm-x86/linux/commit/384544c026f6
> [6/8] KVM: selftests: Get VM's binary stats FD when opening VM
>       https://github.com/kvm-x86/linux/commit/6d22ccb1c309
> [7/8] KVM: selftests: Add infrastructure for getting vCPU binary stats
>       https://github.com/kvm-x86/linux/commit/60d432517838

Argh, apparently I only tested this series on platforms with high RLIMIT_NOFILE
values.  Creating the stats fd for all vCPUs causes kvm_create_max_vcpus to fail
on some of my systems due to doubling the number of fds needed.

One option would be to figure out a clean way to avoid creating the stats fds
for barebones VMs, but x86's recalc_apic_map_test also fails.  That test creates
512 (max "supported" by selftests) using vm_create_with_vcpus().

Doubling the rlimit from 1024+100 to 2048+100 for the max test doesn't seem insane,
so my plan is to move the rlimit twiddling into common code, and then account for
the vCPU stats fds.

I'll drop the above commits and post a v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

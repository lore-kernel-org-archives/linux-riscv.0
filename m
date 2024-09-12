Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E342EEB597
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qU2mkVcjZ+x8avnRt8QlZdPxe3OVbLGXdG+I6qlKKw4=; b=ha+CF/ZRFSGPwl
	SvrSh33l7L3EkvkpWZfPL820tdKQWVe60TeoEbzqoSiRpHg7nWfbQ7nGv8z6uy+zAby7FHtqzYjnj
	4uo9TmJgAlDnQZKqanueSINyP6VuQPI46vmn1JwOVP9sdorl4ylQCA5NpyUWwtz2GShJjZ51j9CE1
	fFwUnaMs0IMFYZrtpEFJEkthO0UbCnwT9gGqy8viElVZodkrPb3qNjn3A5nHG4DqzH4K49RXKahc7
	46ndkCo8gTLFZyXxzprzGsSOVgwsMVj38ds0Sqn38tiN7LTAr/ltcEduk6MgKpTtbGWsa8zfVfwHp
	eQeL3c3Yd9UEgJEsc3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soiKg-0000000CuEt-1ipv;
	Thu, 12 Sep 2024 11:49:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soiJT-0000000Ctzs-3OHq
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 11:48:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so5875275e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 04:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726141716; x=1726746516; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4n+GYZ6xQGCnhlI0MzrUhScT+W1XwcIKjMSfmbo9NU=;
        b=Dp4da/UGMNTrCmxrk+/Y0t+86XgR48s9aBtfAAk2ANmQ8ROBBPc4mZtzqymC21pvbr
         +kOxrbbuqCEfIG3nUfDbsLX6SHUwUl2Igtzp11wBG5bIyg0sxItBWIeJH1uXzQ8Yr9vk
         ObMesbOVXoK8uscG0NVzJ7N30sqx+avc4S9MmgPBn0L0uIZJYOPEfy1IdxWlYYn/1O6r
         gON8pFj8d9T9LppB0xabebbV5kWcJGEyoFf02EdkpX22vo4x4BlgT26MN9SkqBZpatYX
         2tatkIvVTr45bbMGMVFJAJNNzEYtECRGcsZSHYJc3lGlKAnT46we6T05fHT6A7A6MkF6
         lV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726141716; x=1726746516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4n+GYZ6xQGCnhlI0MzrUhScT+W1XwcIKjMSfmbo9NU=;
        b=hmfrND0gu5vgyBHq/ddC3CwtG7n092FIsW9CPhxgYG+fgtX4hoVPiU8sFj+xu4/g9a
         ZRbJwGwrdluOyIRmjMBYAF9NmZk87YCj13w5EXHwk3zfrGBUGbJQ3D8xlhl03hIMQNb3
         6fy979u0HYKtEtSiDd32w75m5d1iLt+jhXMdm4J2suiWPhyfKYOFHJfYbLGT+BZkfgfz
         2rQgLx3JFu5EFgKHPfUkwIPK9fPAcEEyLehkR1Aju3XYr4ri88vlJKm1CI+hTo0R2rYY
         p9vxcY4ZjbodVm9TF5KBZp8U2WrKgtu8XtBFHNt/H2YFzo+/jygVnNQK4z5Jjd9k/L8X
         6J0w==
X-Forwarded-Encrypted: i=1; AJvYcCWPf1TG6D6U+jzGoOJQMRc6PGzEfsv1i06JtT8xED/YkLwdSsAq+p+LNp7Z9Jta8Y0q136uMmuZrICf4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuWu5oFBWeCpdAL9PgKJI33Llnb9buO0H4PiV/iJ3ulPZlutJh
	cFKkrBrH84O916iJMOqYPyRELBpHG53nWVNmHktEjfbShOV/qCJxqEZpxWf5vz/L4FsruGFljKL
	dbmg=
X-Google-Smtp-Source: AGHT+IGuLMW5PBxZVZzC5sjGav8GQCfg4HAZBPxOo7KZmIvu+1pf6lJkOGjLrp49iZcF/LWq3PE2sw==
X-Received: by 2002:a05:600c:548e:b0:42c:a905:9384 with SMTP id 5b1f17b1804b1-42cdb54d606mr17694175e9.20.1726141714874;
        Thu, 12 Sep 2024 04:48:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm14162196f8f.50.2024.09.12.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 04:48:34 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:48:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v2 00/13] KVM: selftests: Morph max_guest_mem to
 mmu_stress
Message-ID: <20240912-757a952b867ea1136cb260cf@orel>
References: <20240911204158.2034295-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_044839_910441_DB3B91B7 
X-CRM114-Status: GOOD (  37.87  )
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

On Wed, Sep 11, 2024 at 01:41:45PM GMT, Sean Christopherson wrote:
> Marc/Oliver,
> 
> I would love a sanity check on patches 2 and 3 before I file a bug against
> gcc.  The code is pretty darn simple, so I don't think I've misdiagnosed the
> problem, but I've also been second guessing myself _because_ it's so simple;
> it seems super unlikely that no one else would have run into this before.
> 
> On to the patches...
> 
> The main purpose of this series is to convert the max_guest_memory_test into
> a more generic mmu_stress_test.  The patches were originally posted as part
> a KVM x86/mmu series to test the x86/mmu changes, hence the v2.
> 
> The basic gist of the "conversion" is to have the test do mprotect() on
> guest memory while vCPUs are accessing said memory, e.g. to verify KVM and
> mmu_notifiers are working as intended.
> 
> Patches 1-4 are a somewhat unexpected side quest that I can (arguably should)
> post separately if that would make things easier.  The original plan was that
> patch 2 would be a single patch, but things snowballed.
> 
> Patch 2 reworks vcpu_get_reg() to return a value instead of using an
> out-param.  This is the entire motivation for including these patches;
> having to define a variable just to bump the program counter on arm64
> annoyed me.
> 
> Patch 4 adds hardening to vcpu_{g,s}et_reg() to detect potential truncation,
> as KVM's uAPI allows for registers greater than the 64 bits the are supported
> in the "outer" selftests APIs ((vcpu_set_reg() takes a u64, vcpu_get_reg()
> now returns a u64).
> 
> Patch 1 is a change to KVM's uAPI headers to move the KVM_REG_SIZE
> definition to common code so that the selftests side of things doesn't
> need #ifdefs to implement the hardening in patch 4.
> 
> Patch 3 is the truly unexpected part.  With the vcpu_get_reg() rework,
> arm64's vpmu_counter_test fails when compiled with gcc-13, and on gcc-11
> with an added "noinline".  AFAICT, the failure doesn't actually have
> anything to with vcpu_get_reg(); I suspect the largely unrelated change
> just happened to run afoul of a latent gcc bug.
> 
> Pending a sanity check, I will file a gcc bug.  In the meantime, I am
> hoping to fudge around the issue in KVM selftests so that the vcpu_get_reg()
> cleanup isn't blocked, and because the hack-a-fix is arguably a cleanup
> on its own.
> 
> v2:
>  - Rebase onto kvm/next.
>  - Add the aforementioned vcpu_get_reg() changes/disaster.
>  - Actually add arm64 support for the fancy mprotect() testcase (I did this
>    before v1, but managed to forget to include the changes when posting).
>  - Emit "mov %rax, (%rax)" on x86. [James]
>  - Add a comment to explain the fancy mprotect() vs. vCPUs logic.
>  - Drop the KVM x86 patches (applied and/or will be handled separately).
> 
> v1: https://lore.kernel.org/all/20240809194335.1726916-1-seanjc@google.com
> 
> Sean Christopherson (13):
>   KVM: Move KVM_REG_SIZE() definition to common uAPI header
>   KVM: selftests: Return a value from vcpu_get_reg() instead of using an
>     out-param
>   KVM: selftests: Fudge around an apparent gcc bug in arm64's PMU test
>   KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
>   KVM: selftests: Check for a potential unhandled exception iff KVM_RUN
>     succeeded
>   KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
>   KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
>   KVM: selftests: Compute number of extra pages needed in
>     mmu_stress_test
>   KVM: selftests: Enable mmu_stress_test on arm64
>   KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
>   KVM: selftests: Precisely limit the number of guest loops in
>     mmu_stress_test
>   KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
>   KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
> 
>  arch/arm64/include/uapi/asm/kvm.h             |   3 -
>  arch/riscv/include/uapi/asm/kvm.h             |   3 -
>  include/uapi/linux/kvm.h                      |   4 +
>  tools/testing/selftests/kvm/Makefile          |   3 +-
>  .../selftests/kvm/aarch64/aarch32_id_regs.c   |  10 +-
>  .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
>  .../selftests/kvm/aarch64/hypercalls.c        |   6 +-
>  .../testing/selftests/kvm/aarch64/psci_test.c |   6 +-
>  .../selftests/kvm/aarch64/set_id_regs.c       |  18 +-
>  .../kvm/aarch64/vpmu_counter_access.c         |  27 ++-
>  .../testing/selftests/kvm/include/kvm_util.h  |  10 +-
>  .../selftests/kvm/lib/aarch64/processor.c     |   8 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    |   3 +-
>  .../selftests/kvm/lib/riscv/processor.c       |  66 +++----
>  ..._guest_memory_test.c => mmu_stress_test.c} | 161 ++++++++++++++++--
>  .../testing/selftests/kvm/riscv/arch_timer.c  |   2 +-
>  .../testing/selftests/kvm/riscv/ebreak_test.c |   2 +-
>  .../selftests/kvm/riscv/sbi_pmu_test.c        |   2 +-
>  tools/testing/selftests/kvm/s390x/resets.c    |   2 +-
>  tools/testing/selftests/kvm/steal_time.c      |   3 +-
>  20 files changed, 236 insertions(+), 107 deletions(-)
>  rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (60%)
> 
> 
> base-commit: 15e1c3d65975524c5c792fcd59f7d89f00402261
> -- 
> 2.46.0.598.g6f2099f65c-goog

I gave this test a try on riscv, but it appears to hang in
rendezvous_with_vcpus(). My platform is QEMU, so maybe I was just too
impatient. Anyway, I haven't read the test yet, so I don't even know
what it's doing. It's possibly it's trying to do something not yet
supported on riscv. I'll add investigating that to my TODO, but I'm
not sure when I'll get to it.

As for this series, another patch (or a sneaky change to one
of the patches...) should add 

 #include "ucall_common.h"

to mmu_stress_test.c since it's not there yet despite using get_ucall().
Building riscv faild because of that.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

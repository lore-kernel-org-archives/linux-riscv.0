Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C49CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UhhSyGYQqyje9WSGr0MVlH+n9qgRyQbLwF4xzqd1VFc=; b=quqc35FF4LlwD/
	7M8SIh6GjcXAreROvag5Ua8Ua2kA6B/q9SFxHE+S9U6QB+yj1UM135jukyLaUR7VAPRijpV9qywZy
	DbruVChXY+RKnkfhqkdwcFG47vzqrnTR9wX3aYYmcExJkT4TzBqbr1EBdQOHjboQRhG3cA1YaD+4+
	MX+2ReLx6ZK6z49wh7HJTgTKGz9OLlg2ACr7BF01h8Jxnlv+DjDd5ekpQiqp2pLEKa19LG1H3SVXD
	Br9MlJhXZxzi6hcWOywp77fMRvg17AvJncinKp6uo25Ogw03KnbUAEtagAXWIIVPridcAtyWUMFti
	TDA1/FbIJE8K8Xy/QHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syYz7-00000009oYo-1224;
	Wed, 09 Oct 2024 15:52:21 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYwn-00000009nzn-3Njd
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:49:59 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so8833017a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728488996; x=1729093796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mp1GmMvEsdG1xOqt7J6qefXNw1tx4nozkIWjiF4j3SI=;
        b=IutsCtbi8727Qay0nh9a5iM0k49/t3K39IcpMtHwSBd63wamLV+Ngqg0uYkIeo7+qf
         rTUsM0tWsPLY/qqOliK5hnvmcpwRtjf9xaPLawLF6nv5T7+udc6tsjU8Nno/J845D9IP
         xy3tlFhgh4VJynkf32udSVHXzHNPTaFEtqhcMyKRhSOOm7fvIQR8z6B2Q1k7zlN12Gp9
         yl6cjyCFHxk4wX54KiXvPz9jWROLineolLEQGOOs38DX8ORkgSvSMN84UbC3cZkHo/4t
         u75R4slENbtwnnLYBuvgkBGcxl+31kARUJIITp/RdtyySCWCIbXi20Gl6n0xLwDsWAWm
         d86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728488996; x=1729093796;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp1GmMvEsdG1xOqt7J6qefXNw1tx4nozkIWjiF4j3SI=;
        b=fVsGmTOA0ySFcyqZoaMZZpAh5yZvs/lOsS0pYa9xxWe0qODiPt05eKUHkq9IFjXRaY
         qmbsu13Up4S8n11UUBZo/3jUEKrs0pOo0hmepCHsyMSQxOC6OesYqJx33BJHZZGEQWBL
         uweKqUFm8lf/fdwJGhBFqCk1CTueRDHQGnmpl1yAWoi16bRi0VFxr7NjG8mSs21A1c/h
         wN6L3P0EAMRP8X2tvti8Vf3eoYubzQDUIMicJ/mZr7WJdlD3nvkzDKVKZvzSQ13G+0Vg
         NPrPxouYUhEOmdyBnqwdSdXzN47cpSozUHkM5+LKDfZgo092InUXyJLcT8v5wWvHzzWm
         NjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZt4kJraSM26MeixIrB8Idv+Cb+//iHAt/92ICg2c7vx9mT2AC3ak3ybZdxj4JMbvem0yx9q89Ickg/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmJMTHf9iPRLtaPqC9L9Nuvy6HeyWdhy+4pfnSInNA6NZciMo1
	KIeSBlKeWrXPvdo290AUhG9+ecNyWwuNK1ftQ4eYJ4kUMTZsH3tmLvlhyMvNr5aucO/BUjFdzGq
	3ew==
X-Google-Smtp-Source: AGHT+IEKF1Ho4VsrxKapa7g6WWX3VRxIkgUDz21gNBA5z4SeEUBMmHmDj2XN+crbLzcKc/g4iyRtc0M+qRE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:468a:b0:2e0:6c40:e384 with SMTP id
 98e67ed59e1d1-2e2a251444emr3074a91.4.1728488995562; Wed, 09 Oct 2024 08:49:55
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:39 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-1-seanjc@google.com>
Subject: [PATCH v3 00/14] KVM: selftests: Morph max_guest_mem to mmu_stress
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_084957_875696_F0C954E0 
X-CRM114-Status: GOOD (  16.17  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The main purpose of this series is to convert the max_guest_memory_test
into a more generic mmu_stress_test.  The basic gist of the "conversion"
is to have the test do mprotect() on guest memory while vCPUs are
accessing said memory, e.g. to verify KVM and mmu_notifiers are working
as intended.

Patches 1-4 are a somewhat unexpected side quest.  The original plan was
that patch 3 would be a single patch, but things snowballed.

Patch 3 reworks vcpu_get_reg() to return a value instead of using an
out-param.  This is the entire motivation for including these patches;
having to define a variable just to bump the program counter on arm64
annoyed me.

Patch 4 adds hardening to vcpu_{g,s}et_reg() to detect potential
truncation, as KVM's uAPI allows for registers greater than the 64 bits
that are supported in the "outer" selftests APIs ((vcpu_set_reg() takes a
u64, vcpu_get_reg() now returns a u64).

Patch 1 is a change to KVM's uAPI headers to move the KVM_REG_SIZE
definition to common code so that the selftests side of things doesn't
need #ifdefs to implement the hardening in patch 4.

Patch 2 is the truly unexpected part.  With the vcpu_get_reg() rework,
arm64's vpmu_counter_test fails when compiled with gcc-13, and on gcc-11
with an added "noinline".  Long story short, selftests are being compiled
with strict aliasing enabled, which allows the compiler to optimize away
"u64 *" => "uint64_t *" casts as u64 (unsigned long long) and uint64_t
(unsigned long) are technically not aliases of each other.  *sigh*

v3:
 - Rebased onto v6.12-rc2.
 - Disable strict aliasing to fix the PMCR snafu.
 - Collect reviews. [Drew]
 - Minor changelog fixes. [Drew]
 - Include ucall_common.h to prep for RISC-V. [Drew]

v2:
 - Rebase onto kvm/next.
 - Add the aforementioned vcpu_get_reg() changes/disaster.
 - Actually add arm64 support for the fancy mprotect() testcase (I did this
   before v1, but managed to forget to include the changes when posting).
 - Emit "mov %rax, (%rax)" on x86. [James]
 - Add a comment to explain the fancy mprotect() vs. vCPUs logic.
 - Drop the KVM x86 patches (applied and/or will be handled separately).

v1: https://lore.kernel.org/all/20240809194335.1726916-1-seanjc@google.com

Sean Christopherson (14):
  KVM: Move KVM_REG_SIZE() definition to common uAPI header
  KVM: selftests: Disable strict aliasing
  KVM: selftests: Return a value from vcpu_get_reg() instead of using an
    out-param
  KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
  KVM: selftests: Check for a potential unhandled exception iff KVM_RUN
    succeeded
  KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
  KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
  KVM: selftests: Compute number of extra pages needed in
    mmu_stress_test
  KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
  KVM: selftests: Enable mmu_stress_test on arm64
  KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
  KVM: selftests: Precisely limit the number of guest loops in
    mmu_stress_test
  KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
  KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)

 arch/arm64/include/uapi/asm/kvm.h             |   3 -
 arch/riscv/include/uapi/asm/kvm.h             |   3 -
 include/uapi/linux/kvm.h                      |   4 +
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/aarch32_id_regs.c   |  10 +-
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/hypercalls.c        |   6 +-
 .../selftests/kvm/aarch64/no-vgic-v3.c        |   2 +-
 .../testing/selftests/kvm/aarch64/psci_test.c |   6 +-
 .../selftests/kvm/aarch64/set_id_regs.c       |  18 +-
 .../kvm/aarch64/vpmu_counter_access.c         |  19 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  10 +-
 .../selftests/kvm/lib/aarch64/processor.c     |   8 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |   3 +-
 .../selftests/kvm/lib/riscv/processor.c       |  66 +++----
 ..._guest_memory_test.c => mmu_stress_test.c} | 162 ++++++++++++++++--
 .../testing/selftests/kvm/riscv/arch_timer.c  |   2 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   2 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   2 +-
 tools/testing/selftests/kvm/s390x/resets.c    |   2 +-
 tools/testing/selftests/kvm/steal_time.c      |   3 +-
 21 files changed, 241 insertions(+), 105 deletions(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (60%)


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

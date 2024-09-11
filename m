Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689DEEE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sJABMyF2bc1Q+StIxcILY1niXsP2oX7xfz9TXhJQU4Y=; b=h5DoNKvd4KJOb8
	ZsT/5/qNn9XvJkZ5LoeeKGhj1Xy0CynC7xwKhVxO6+xOSvdUYQaV5QamQumQDYcwCjXbWwKBOOWdv
	TYtcfLDFqa23cPO5wVuX2BL+fYJ+lm/JwrHuIuEUs827T1YdZtlGTA9LvhtuyBgKZ1PFaqiGKL9Xw
	3du1EOAsIbxID83WLq55CmLeFF8oe4sp9zh5tZBdEmMyGeiOYUNOs46Av77MrGc6PIfyjJ/stNPWO
	ikxPJjNzzaWhRD3pPRXnf3d4KtogQSKFGReJGuh7LRbXRM2MS//BR4OUjyykMZ5NHhF3xmJMu5jqr
	U/vrm6j4vLZKupp7H6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUBb-0000000AxQK-3ghf;
	Wed, 11 Sep 2024 20:43:35 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAQ-0000000AwtT-2T1h
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:25 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2056364914eso4741425ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087340; x=1726692140; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orNyJOAcZD+rHQnmy1du5vjxEg5EiEek+mzQd7BXIvg=;
        b=dpJJEboN+BQSoUC1nPGytBpeJWuOqGLe+8OmftYexMeWWD+lTXLFlhRC2GwJWB85Vc
         NED4lBwmFSuepPADmsffDi1gmCRZ0KBUeL0KGVWq+EbrXQ84zXCAh9s89GM/uXmsswNu
         9xsdoZoXERItQV7YDkPbPzI824mvdmpt8WpMsXC3FZBLziE9na+pzc1vFF+KmJKOLsFW
         BsLTcH28q0ULXe85Ut8TvV1gsMij4ZCpslrQqeeclAAzTTRnHrUmEgFCJWBiBytrwuMf
         y/Z22C0Euf0j0yk1dfBd0YIDwWkEE89RUMiWlZko3awhUgq+Y5ASwumM7eDObuBw76Tk
         823A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087340; x=1726692140;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orNyJOAcZD+rHQnmy1du5vjxEg5EiEek+mzQd7BXIvg=;
        b=Uz167rn7ffaSr9epIcyGTxSptAo91MU2f1h+nrxY/NJb31Hahy6JRQWcrIx92w8zV1
         bWnCcX28XO7v78hzV2x9rAbvIBuC6aTZkdz6RYPrQa6DOv9+ARmhdJIfUJw36DIRglVR
         Mlhcu7W+MWLGB1tDoaFVqzcvgg0RYuyM8i8+YqkVA68WddEouG1ZL/+UdN2GN3qYFTrW
         jlE7bk+CSMF5/+A2R/WrwPKMJWzTw2sksOKvIYBChNKQeqCtPl0K8UpqP7SLvH4oF5LU
         +Crmc87XTsT+VYG85F8AttFAqcamcgAmVDC2AtuAv1NPK+hX865Vu+9xrMlNdbkrDxfY
         nR6A==
X-Forwarded-Encrypted: i=1; AJvYcCXpSvDoSy75ou1he7I5xqVgBKp9Q5okZXnNb4nd1Hpg7iF1zMrXgEqoltMMp6GE96OGjc1QtfyE42B44g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrG4UD4iD/sNF3A8Wzenae044eRxTFIEfXBtbx+LQ62/qATC8g
	OEkXTBC2fbDdxbePJzFZPGFxXinFiDS2UUCOf/5A2bAS0CUY87uZVn/QyveE3YM8DpNbtXGTj00
	qEQ==
X-Google-Smtp-Source: AGHT+IFaujE7hEx/7weEqZv4CBEUENGoY66e8hJCtiz3GOrHctREiAah0BDLkxA9YXouCGo9V+1XVtyv7hY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac9:b0:1fd:60c4:6930 with SMTP id
 d9443c01a7336-2076e44762amr350555ad.10.1726087340433; Wed, 11 Sep 2024
 13:42:20 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:45 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-1-seanjc@google.com>
Subject: [PATCH v2 00/13] KVM: selftests: Morph max_guest_mem to mmu_stress
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134222_646031_40C8353C 
X-CRM114-Status: GOOD (  20.75  )
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

Marc/Oliver,

I would love a sanity check on patches 2 and 3 before I file a bug against
gcc.  The code is pretty darn simple, so I don't think I've misdiagnosed the
problem, but I've also been second guessing myself _because_ it's so simple;
it seems super unlikely that no one else would have run into this before.

On to the patches...

The main purpose of this series is to convert the max_guest_memory_test into
a more generic mmu_stress_test.  The patches were originally posted as part
a KVM x86/mmu series to test the x86/mmu changes, hence the v2.

The basic gist of the "conversion" is to have the test do mprotect() on
guest memory while vCPUs are accessing said memory, e.g. to verify KVM and
mmu_notifiers are working as intended.

Patches 1-4 are a somewhat unexpected side quest that I can (arguably should)
post separately if that would make things easier.  The original plan was that
patch 2 would be a single patch, but things snowballed.

Patch 2 reworks vcpu_get_reg() to return a value instead of using an
out-param.  This is the entire motivation for including these patches;
having to define a variable just to bump the program counter on arm64
annoyed me.

Patch 4 adds hardening to vcpu_{g,s}et_reg() to detect potential truncation,
as KVM's uAPI allows for registers greater than the 64 bits the are supported
in the "outer" selftests APIs ((vcpu_set_reg() takes a u64, vcpu_get_reg()
now returns a u64).

Patch 1 is a change to KVM's uAPI headers to move the KVM_REG_SIZE
definition to common code so that the selftests side of things doesn't
need #ifdefs to implement the hardening in patch 4.

Patch 3 is the truly unexpected part.  With the vcpu_get_reg() rework,
arm64's vpmu_counter_test fails when compiled with gcc-13, and on gcc-11
with an added "noinline".  AFAICT, the failure doesn't actually have
anything to with vcpu_get_reg(); I suspect the largely unrelated change
just happened to run afoul of a latent gcc bug.

Pending a sanity check, I will file a gcc bug.  In the meantime, I am
hoping to fudge around the issue in KVM selftests so that the vcpu_get_reg()
cleanup isn't blocked, and because the hack-a-fix is arguably a cleanup
on its own.

v2:
 - Rebase onto kvm/next.
 - Add the aforementioned vcpu_get_reg() changes/disaster.
 - Actually add arm64 support for the fancy mprotect() testcase (I did this
   before v1, but managed to forget to include the changes when posting).
 - Emit "mov %rax, (%rax)" on x86. [James]
 - Add a comment to explain the fancy mprotect() vs. vCPUs logic.
 - Drop the KVM x86 patches (applied and/or will be handled separately).

v1: https://lore.kernel.org/all/20240809194335.1726916-1-seanjc@google.com

Sean Christopherson (13):
  KVM: Move KVM_REG_SIZE() definition to common uAPI header
  KVM: selftests: Return a value from vcpu_get_reg() instead of using an
    out-param
  KVM: selftests: Fudge around an apparent gcc bug in arm64's PMU test
  KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
  KVM: selftests: Check for a potential unhandled exception iff KVM_RUN
    succeeded
  KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
  KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
  KVM: selftests: Compute number of extra pages needed in
    mmu_stress_test
  KVM: selftests: Enable mmu_stress_test on arm64
  KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
  KVM: selftests: Precisely limit the number of guest loops in
    mmu_stress_test
  KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
  KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)

 arch/arm64/include/uapi/asm/kvm.h             |   3 -
 arch/riscv/include/uapi/asm/kvm.h             |   3 -
 include/uapi/linux/kvm.h                      |   4 +
 tools/testing/selftests/kvm/Makefile          |   3 +-
 .../selftests/kvm/aarch64/aarch32_id_regs.c   |  10 +-
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/hypercalls.c        |   6 +-
 .../testing/selftests/kvm/aarch64/psci_test.c |   6 +-
 .../selftests/kvm/aarch64/set_id_regs.c       |  18 +-
 .../kvm/aarch64/vpmu_counter_access.c         |  27 ++-
 .../testing/selftests/kvm/include/kvm_util.h  |  10 +-
 .../selftests/kvm/lib/aarch64/processor.c     |   8 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |   3 +-
 .../selftests/kvm/lib/riscv/processor.c       |  66 +++----
 ..._guest_memory_test.c => mmu_stress_test.c} | 161 ++++++++++++++++--
 .../testing/selftests/kvm/riscv/arch_timer.c  |   2 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   2 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   2 +-
 tools/testing/selftests/kvm/s390x/resets.c    |   2 +-
 tools/testing/selftests/kvm/steal_time.c      |   3 +-
 20 files changed, 236 insertions(+), 107 deletions(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (60%)


base-commit: 15e1c3d65975524c5c792fcd59f7d89f00402261
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

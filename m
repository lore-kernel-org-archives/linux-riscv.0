Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364CAC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 03:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fQyGTnB6ObX4Xkrxr+2eph2QgVV3okN0/obOPxuKkWQ=; b=zOW
	GmwcD5d6Lt9uEcPksFWLDStlxLg9/kwBPdR298X1zMcRksGzpOkKP2oeUx3JLzVAgMQjpz44xqxca
	crPX9ptX4zviod4P9j4hedl9iCGXXfvJ+srwT5idupXCdNKchzrarnIF8CCNTtL35qM86pG6lBfTA
	5qVZHEShe1VFlkTYwC4mKJhAkrrwnFBV2JzIEIFreX4Xx20EXx98tBuW2hTLTUBZ92EZDdEe+ivQV
	csC3zFSDDL0RTIMmrUjMWxtyGpVHXe72W7aml0Woi+D4C5axCIDZgGzQa26ZiosVW3NxL0AMuOpU/
	6Xza0xln8VTJ6iSc0YvmGGKxAS20cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxS-00ACTo-2A; Wed, 24 Aug 2022 03:21:34 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxD-00ACMP-Hf
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 03:21:22 +0000
Received: by mail-pj1-x1049.google.com with SMTP id a16-20020a17090abe1000b001fad8c29b0bso200787pjs.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 20:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:reply-to:from:to:cc;
        bh=0PgRhcNFQ7wUH/xHyENNgGO5Y68ff82pBwc9ifNEyXw=;
        b=cqHjEyrC8/5Ptg3s0VemFx6Afe05DyCrV8I1WrMH2BuvEwwsDY1YsrbGXctw65VldG
         fAmhyiPz7pkRXrbwBZ38vyCPLv5QBCP4oH+/gu1mKhgYTPOR+Ya+5b3VA+2WH98XQmBq
         1FOvFOP3tIyLS9BehwIqIBtCj8lM/BvWhTdiI/ce9pRiN9eKP9sHPyAITpNwOJ3sO+2N
         4YCabFxHGqjIDcC9CP17NKHtJTtA5CdGAUad7ynG0wNtC4Vfe2QJX6PECaOymuHUk10t
         PuRSnM35P9sTAO+sSnGlTY4exlZjjiMPgXiy+eydM2ZxalQexAZSKP4RIGtkmpgCQfsB
         7euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:reply-to
         :x-gm-message-state:from:to:cc;
        bh=0PgRhcNFQ7wUH/xHyENNgGO5Y68ff82pBwc9ifNEyXw=;
        b=CdcHoXqsKCgk/u5LVH4l0eN0DTQ2vQxdeziY8a4aHj4K9Tx3F4Axo8iWPydXJDS1fi
         urLd1pGxKFbUMsJBHnC6Auj7BGfiOiEJzBYCIN3XhK5TFoKWT/Bq0ECrklqCj+BJsuXk
         TYF5wngVgSm4QWE8Td9NBh1UxnVqczAofUvT5u4nxBgXIMhYm7jc9wwAKKl3RE4kFCJI
         QxJNf2TCcv/PR77Y0xB+MJZLDKnS0UDr8lGpgxvXgreE+6uHpPtev2YhwbDkKCm0LQg7
         vNYY+Jv3f6ndUvRSpLl9BIwZ8ZxwuFXOYx8pgeiCv3G9aayCUF2wyRsvJcmv7HVytQkW
         H16Q==
X-Gm-Message-State: ACgBeo2FkL150b9kNXgh+fT7dRcrbPlh1FCyLtKxizblhKpY1Hhftsvv
	7W5zZDDPMAqI9liksNEzR/5nrhKSv6E=
X-Google-Smtp-Source: AA6agR63ilrlfg+EIittKBqsUyfiZ4SJp+plrm1tSJz8p5Jon3Gzg8eg5LcSRgWaSK1dHMSOxMnJUkNlhh0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ba8e:b0:172:ddb9:fe45 with SMTP id
 k14-20020a170902ba8e00b00172ddb9fe45mr14718860pls.86.1661311277642; Tue, 23
 Aug 2022 20:21:17 -0700 (PDT)
Date: Wed, 24 Aug 2022 03:21:09 +0000
Message-Id: <20220824032115.3563686-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 0/6] KVM: selftests: Implement ucall "pool" (for SEV)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_202119_612897_D29A18D4 
X-CRM114-Status: GOOD (  10.08  )
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

This is "v4" of Peter's SEV series, minus the actual SEV tests.  My plan
is to get this queued sooner than later so that Peter can build on top.

Non-KVM folks, y'all got pulled in because of the atomic_test_and_set_bit()
patch.

Rework the ucall infrastructure to use a pool of ucall structs to pass
memory instead of using the guest's stack.  For confidential VMs with
encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
and so can't be used to communicate with the host.

Convert all implementations to the pool as all of the complexity is hidden
in common code, and supporting multiple interfaces adds its own kind of
complexity. 

Tested on x86 and ARM, compile tested on s390 and RISC-V.

Peter Gonda (2):
  tools: Add atomic_test_and_set_bit()
  KVM: selftests: Add ucall pool based implementation

Sean Christopherson (4):
  KVM: selftests: Consolidate common code for populating ucall struct
  KVM: selftests: Consolidate boilerplate code in get_ucall()
  KVM: selftests: Automatically do init_ucall() for non-barebones VMs
  KVM: selftests: Make arm64's MMIO ucall multi-VM friendly

 tools/arch/x86/include/asm/atomic.h           |   7 ++
 tools/include/asm-generic/atomic-gcc.h        |  12 ++
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/arch_timer.c        |   1 -
 .../selftests/kvm/aarch64/debug-exceptions.c  |   1 -
 .../selftests/kvm/aarch64/hypercalls.c        |   1 -
 .../testing/selftests/kvm/aarch64/psci_test.c |   1 -
 .../testing/selftests/kvm/aarch64/vgic_init.c |   2 -
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   1 -
 tools/testing/selftests/kvm/dirty_log_test.c  |   2 -
 .../selftests/kvm/include/kvm_util_base.h     |  16 +++
 .../selftests/kvm/include/ucall_common.h      |  13 +-
 .../selftests/kvm/kvm_page_table_test.c       |   1 -
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 101 +++-------------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  11 ++
 .../selftests/kvm/lib/perf_test_util.c        |   2 -
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  40 ++----
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  37 ++----
 .../testing/selftests/kvm/lib/ucall_common.c  | 114 ++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |  37 ++----
 .../testing/selftests/kvm/memslot_perf_test.c |   1 -
 tools/testing/selftests/kvm/rseq_test.c       |   1 -
 tools/testing/selftests/kvm/steal_time.c      |   1 -
 .../kvm/system_counter_offset_test.c          |   1 -
 24 files changed, 213 insertions(+), 192 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c


base-commit: 372d07084593dc7a399bf9bee815711b1fb1bcf2
-- 
2.37.1.595.g718a3a8f04-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

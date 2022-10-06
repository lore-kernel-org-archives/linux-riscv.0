Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD988C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 00:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=47opQ1z1VlgcE2vRvqiLD0/JOl8ytmpWXQdlKASLS2c=; b=Mv4u1NYTGNVcp/
	2iAfLkwwVh5xeX7TM2JNn7zddMAsMef7Yi6pMJ0xE0b2r0gml5j0g2QcDKnNkQWRyB/HFmYc+z6hH
	vAFo4818s3RyXuyvEdfrN4bxjwZJnU2jMxOixfFTyeLLLaGgFOh5K+2QmhjhjF5AaNCDrsFsoHtCn
	45KH3LxqHlbNGyM8xFUJ/Mam7IWA07pAFg5/vnaP41VheW+WwMglOUtVUS6o9rT84zHiNgrQWlX9A
	sGJtx1qJIkMqP+8epGwAu70D4EtH9vWirYD5pay5tMYEh3TlbGsb3ok6bGKKb1aqywOhbU9Pzli/4
	rN82Fl8Ykiti5ANtNjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogEqI-00GdB8-G1; Thu, 06 Oct 2022 00:34:26 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogEqC-00Gczz-6k
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 00:34:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id e15-20020a25370f000000b006be3091eee2so384465yba.10
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 17:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aS/Wdb92KUsn+dSQWf+yYhnYTdFnVqHuKhKCKXyH9JU=;
        b=F2g4wdl3c+W55IiNBL1XgO+YOlTtL/Cjx1CGVdwkn3nnZikiuEYRXFu5+yxq8XvD8Q
         UnKjxO/Ihl2o7nKCs3Fyoj+597+kBPoBQydqP9spHLrAFp/AZkuV37eBUc24VeghkL8e
         haVbAgTXMwnfUeqSyaf7Qwgnc7VBxGWvMqqr4+HraCL4gw0nLFgfcM8h2qRhivdOmTbl
         xQjAAvTL/Xx+nRVqFB2hx/oPVgCumgax0xpgJ8zPH4AnDa+A0Era8LoseKjRTriNUs2+
         2sp1R3eQ6bZssw7ySWObtNTOd4+HTkPE6I6ZntqOMrN6qr4SUaYKMJUhxZG0gWES5RFm
         M2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS/Wdb92KUsn+dSQWf+yYhnYTdFnVqHuKhKCKXyH9JU=;
        b=boigjXnck0F38+xyowWWvij407OTOHukGM8+TyKox5Oz+On2XLuKLk8EaCCBsMu5o0
         5TYW/qRnxJve5FbFLZwYb2aBaWyDqeqfZx2b0ZxN20QeE+NkBUYsjlHslz9/alIlB93t
         b2V3VlUuzQ0Vewq6Ul/LON9eXKwAqRjbShtDxGIGM2gn4y451rPJhdEnnfBpl8ykgF/l
         lmlURL4L5U8xEvP+38nyVBsZf9VFlFNlXd8+7/UWE5KLdIod5FXU5aFQzTHxCJjek/iN
         ToiJotCA+9U+VPhBmL7YJNcraTqhTc0eDuyrHJuAml4c2xZsZHxkn1WE47vLQEcIaiKz
         CJdQ==
X-Gm-Message-State: ACrzQf2NSWQ3YRaKnYZrSPHQR6TRvvf4wEZb9974ouM1ggxhEIMcdqj9
	nnoxBDOvfddI4Igb/7WtCITWPWacgQY=
X-Google-Smtp-Source: AMsMyM5GoF0VwOlSnE1/Af4DhxMzGTCQS3omOdlhLBZkXBmerEM6VVh7882ZBLcBagfLbnLAIrgnQoTB6v4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad13:0:b0:6bd:9745:a428 with SMTP id
 y19-20020a25ad13000000b006bd9745a428mr2331326ybi.563.1665016454054; Wed, 05
 Oct 2022 17:34:14 -0700 (PDT)
Date: Thu,  6 Oct 2022 00:34:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221006003409.649993-1-seanjc@google.com>
Subject: [PATCH v6 0/7] KVM: selftests: Implement ucall "pool" (for SEV)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Peter Gonda <pgonda@google.com>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_173420_262223_36C607D4 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Rework the ucall infrastructure to use a pool of ucall structs to pass
memory instead of using the guest's stack.  For confidential VMs with
encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
and so can't be used to communicate with the host.

Convert all implementations to the pool as all of the complexity is hidden
in common code, and supporting multiple interfaces adds its own kind of
complexity. 

v6:
 - Collect tags. [Andrew, Peter]
 - Drop an unnecessary NULL check on in_use. [Andrew]

v5:
 - Use less convoluted method of writing per-VM "globals". [Oliver]
 - Add patch to drop ucall_uninit().

v4: https://lore.kernel.org/all/20220824032115.3563686-1-seanjc@google.com

Peter Gonda (2):
  tools: Add atomic_test_and_set_bit()
  KVM: selftests: Add ucall pool based implementation

Sean Christopherson (5):
  KVM: selftests: Consolidate common code for populating ucall struct
  KVM: selftests: Consolidate boilerplate code in get_ucall()
  KVM: selftests: Automatically do init_ucall() for non-barebones VMs
  KVM: selftests: Make arm64's MMIO ucall multi-VM friendly
  KVM: selftest: Drop now-unnecessary ucall_uninit()

 tools/arch/x86/include/asm/atomic.h           |   7 ++
 tools/include/asm-generic/atomic-gcc.h        |  12 ++
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/arch_timer.c        |   1 -
 .../selftests/kvm/aarch64/debug-exceptions.c  |   1 -
 .../selftests/kvm/aarch64/hypercalls.c        |   1 -
 .../testing/selftests/kvm/aarch64/psci_test.c |   1 -
 .../testing/selftests/kvm/aarch64/vgic_init.c |   2 -
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   1 -
 tools/testing/selftests/kvm/dirty_log_test.c  |   3 -
 .../selftests/kvm/include/kvm_util_base.h     |  15 +++
 .../selftests/kvm/include/ucall_common.h      |  10 +-
 .../selftests/kvm/kvm_page_table_test.c       |   2 -
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 102 +++--------------
 tools/testing/selftests/kvm/lib/kvm_util.c    |  11 ++
 .../selftests/kvm/lib/perf_test_util.c        |   3 -
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  42 +------
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  39 +------
 .../testing/selftests/kvm/lib/ucall_common.c  | 103 ++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |  39 +------
 .../testing/selftests/kvm/memslot_perf_test.c |   1 -
 tools/testing/selftests/kvm/rseq_test.c       |   1 -
 tools/testing/selftests/kvm/steal_time.c      |   1 -
 .../kvm/system_counter_offset_test.c          |   1 -
 24 files changed, 190 insertions(+), 210 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/ucall_common.c


base-commit: e18d6152ff0f41b7f01f9817372022df04e0d354
-- 
2.38.0.rc1.362.ged0d419d3c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

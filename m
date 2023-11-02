Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A829C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W74GhYxjpDDPqLa63x/2PgpGdUGoTaGIe+xPJ61Bzhg=; b=bgQfhQ+rfpxSi/
	fYy1yBWn52gLgbVL1R7we3MQRFBWjPBfCfT6crnPDcXi3BO7TzwVF/jJhSULSTdq0xt9cjJk8tnkg
	C3Ehin2kzWjF2U1VOEjYVaf2pZPPdi+sp4J8/p4uSiiNs+f/ErVdNzUqPUWu540lJewDDY3XCZpl0
	DUgR9rF7ROYiXNBXjIMNYXbn/YPPyBhCnF9SelF6aJoO71mYC62tL6CxX6nqkjSvGmGM4YIgYPv91
	yFMXibZ5mKoECuxzvqi7I+ahx2tqx5S2dfhpfiXTQcp3ZBrgSIytT135b6At3O3chApfWffwDDWUG
	pTroz2XPFgJOLCSv2UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadL-009s64-1k;
	Thu, 02 Nov 2023 16:33:27 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyad9-009rxY-0V;
	Thu, 02 Nov 2023 16:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942795; x=1730478795;
  h=from:to:cc:subject:date:message-id;
  bh=cdPiSKd/31m3AqChZgVeKDRUhuu5sQ7j4sET0CgQF7k=;
  b=Xfqh4bMTGaDQDPpO2QYBGMkXJDQxwTJqCn/dWdxH5FB8IwkKcvspO46d
   tH2vbfD0WBEwpmgDcKdOKasMd0aIVDP+stTWAwfA3IBLMiYn3siaU8pkk
   uh4BPBJzplOs+/4cMTe6T6e+9EZRh4zHPQOvxJM7K9UlYXNab+n+Uz6oe
   4scXNUfxkACIFQ3Rdt1V6ky05cQHppRm8IjsEMVq0s80LSZgSPgwRJZPI
   NHU9BDM7METWV7y1bTAduG/brgDdMGl0dIberFLq3cn4+H+DTxpKVvvoS
   YX2/Prb/tyhsVAEGxRbjQi3N4INawl8I+g2gHwMuFPHSVPslpiAzokS3b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388570842"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388570842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448383"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:00 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [RFC PATCH v1 0/8] KVM: seftests: Support guest user mode execution and running
Date: Thu,  2 Nov 2023 23:51:03 +0800
Message-Id: <20231102155111.28821-1-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093315_234724_E5820D78 
X-CRM114-Status: UNSURE (   9.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series give a proposal to support guest VM running
in user mode and in canonical linear address organization as
well.

First design to parition the 64-bit canonical linear address space
into two half parts belonging to user-mode and supervisor-mode
respectively, similar as the organization of linear addresses used
in linux OS. Currently the linear addresses use 48-bit canonical
format in which bits 63:47 of the address are identical.

Secondly setup page table mapping the same guest physical address
of test code and data segment onto both user-mode and supervisor-mode
address space. It allows guest in different runtime mode, i.e.
user or supervisor, can run one code base in the corresponding
linear address space.

Also provide the runtime environment setup API for switching to
user mode execution.     


Zeng Guang (8):
  KVM: selftests: x86: Fix bug in addr_arch_gva2gpa()
  KVM: selftests: x86: Support guest running on canonical linear-address
    organization
  KVM: selftests: Add virt_arch_ucall_prealloc() arch specific
    implementation
  KVM : selftests : Adapt selftest cases to kernel canonical linear
    address
  KVM: selftests: x86: Prepare setup for user mode support
  KVM: selftests: x86: Allow user to access user-mode address and I/O
    address space
  KVM: selftests: x86: Support vcpu run in user mode
  KVM: selftests: x86: Add KVM forced emulation prefix capability

 .../selftests/kvm/include/kvm_util_base.h     |  20 ++-
 .../selftests/kvm/include/x86_64/processor.h  |  48 ++++++-
 .../selftests/kvm/lib/aarch64/processor.c     |   5 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |   6 +-
 .../selftests/kvm/lib/riscv/processor.c       |   5 +
 .../selftests/kvm/lib/s390x/processor.c       |   5 +
 .../testing/selftests/kvm/lib/ucall_common.c  |   2 +
 .../selftests/kvm/lib/x86_64/processor.c      | 117 ++++++++++++++----
 .../selftests/kvm/set_memory_region_test.c    |  13 +-
 .../testing/selftests/kvm/x86_64/debug_regs.c |   2 +-
 .../kvm/x86_64/userspace_msr_exit_test.c      |   9 +-
 11 files changed, 195 insertions(+), 37 deletions(-)

-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

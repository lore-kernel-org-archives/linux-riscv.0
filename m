Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F37EE57C2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Et8J4+Raq7yOruIuKos5GROC9Cxf0XB/SWFHTJmKf4=; b=V7NHT/yILB1fOG
	WXMl20yA8TMlj5eo72BXHkkvsh5KvoGiUHqLxh/5MboU1+wDGSfz6Mkwaa1YLOcmML13fInfpeu++
	yUiaeYp84pmqPficamqlnFE/bA0cQtOyAuJt1q4wmiwWocGMkAEOpOa2v6DWfSIqHrg87IKysOn8a
	SFLNAUw8R+Cjd7yeC8ix8DQnrEecKOCWuwaog8rSju5gUeJFEcTr4pR1Wo5l+RkHswJK93y2jozaz
	Kz5gkuLrQB5bMUtUnvKsxx8Gz/LKoSekZdmac4xeRyG4ZxcLMN20lQ2bYRkPX6Vx6B/NT0rDESwmm
	1PaBgOKHgo9DRapm60og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijC-00000005Mkp-1VWs;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiiw-00000005Mem-0xbX
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7d481452732so19496352b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135713; x=1767740513; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=SpTDVzH5NHaMWwc4acDPlpijEnOy95gZp/YZacjeRGKdqMozNnn4/aJ5Ia06rPScvZ
         0QoZNEK7N4dlYZdV3jwhRCPCwNO2zIS0ktfEmOpGwkL02GhhruYBB33aP9e+LnfjHOt7
         wSsVgxjDhYPucvc1wmFbSgPnLtiqHWTMkD1Na1/ybCrmjgbldayBf2IRBNbdp0nlm2q/
         lu2oSE6pjXHd7cGyavmOWxy7N/Ws1yiP/5k18TpHdbQWs55AkXE4mMoPQ9xEtqWUJMq6
         AizNnDgNa4GWLMKww5ItchvMZGgDhg2RAroR1WFeBaezffgGtCZYaltp1SSMLWpSUwKZ
         nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135713; x=1767740513;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DduiMfmTpcy5dWbJfJJBZV4wRgqp4T0woAtqbJ6bKWQ=;
        b=qxSRUAo+DP9AIgj6Wuwn3pm+KjgRZfXG1iodFdBiCQ1x63RLcgzH+QfhQlFDIJE0us
         pf+sSAjux+6qWi09+vvXK6SF+agp/6s2mfJXQbxFd80cvvZvlmq9qB4D915JP07kV6OC
         z37AcbKUqeql0i9vT0O3Ea6Ql3s1dtHTb6PEU9G29jMjh+E96xihSvujlmkYnlgmRtBG
         kW9ot++RNlP4S/MVUBbY/scsjwom8TWpTR/VF++I85DZDLFxk6Y1E7Lu5cxpTD8vK2f1
         pSXB/G6RBBapwNjcfyxvmeWgnZIwFSh6d5m1EVOjISC7BpNiTX390Wwpi6oHGjvQBHi/
         QjwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmxXvJ1A5aoiEC7hxhGmFCYnj4bhXUhsKj+D41hHA075W6SHVOQYXPLjFDQZKlMNduAb1h3jrVmwe7CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv76p76zd9uN/ztoe/sYzS8TaaKys/VAjAkV3/Ke4AP4p+WaNR
	1ZsKQ2UvwUDvzFcw7HxYEsopK3bmN2OQy69gbgGjeMKO2Xf8Puv0fLZINUGOFaMP9BxGtu4dflc
	w60MdvA==
X-Google-Smtp-Source: AGHT+IFl5YLLzZS88Mfh7NFRVwFsdWY7dXmSPWiNHP66M1DsoJkgDWwQHxi6m97nCMs9lyQggVclX+5VgK0=
X-Received: from pjbge24.prod.google.com ([2002:a17:90b:e18:b0:34c:cb46:dad7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e083:b0:361:3bec:fe28
 with SMTP id adf61e73a8af0-376a9de5b35mr35584887637.37.1767135712714; Tue, 30
 Dec 2025 15:01:52 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:29 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-1-seanjc@google.com>
Subject: [PATCH v4 00/21] KVM: selftests: Add Nested NPT support
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150154_274631_AB88A464 
X-CRM114-Status: GOOD (  13.80  )
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

Yosry's series to add support for nested NPT, and extends vmx_dirty_log_test
and kvm_dirty_log_test (with -n, using memstress) to cover nested SVM.

Note, I'm mildly concerned the last patch to extend nested_dirty_log_test to
validate KVM's handling of READ faults could be flaky, e.g. maybe if someone
is running the test under heavy memory pressure and the to-be-access page is
swapped between the write-from-host and read-from-guest?  But unless someone
knows/shows it'll be flaky, I'm inclined to apply it and hope for the best.

v4:
 - Document the likely reason for setting A/D bits.
 - Put "mmu" structure in common "struct kvm".
 - Make it clear PTE accessors are predicates.
 - Assert that the stage-2 MMU is initialized at most once.
 - Make READABLE a standalone bit (don't overload USER).
 - Don't alias PRESENT => READABLE for EPT.
 - Fix the A/D bit definitions for EPT.
 - Drop the function comment for __tdp_map().
 - Add a patch to extend the nested_dirty_log_test to verify that KVM creates
   writable SPTEs when the gPTEs are writable and dirty.

v3:
 - https://lore.kernel.org/all/20251127013440.3324671-1-yosry.ahmed@linux.dev
 - Dropped the patches that landed in kvm-x86.
 - Reshuffled some patches and cleanups.
 - Introduced kvm_mmu data structures to hold the root, page table
   levels, and page table masks (Sean).
 - Extended memstress as well to cover nested SVM.

v2: https://lore.kernel.org/kvm/20251021074736.1324328-1-yosry.ahmed@linux.dev

Sean Christopherson (7):
  KVM: selftests: Add "struct kvm_mmu" to track a given MMU instance
  KVM: selftests: Plumb "struct kvm_mmu" into x86's MMU APIs
  KVM: selftests: Add a "struct kvm_mmu_arch arch" member to kvm_mmu
  KVM: selftests: Add a stage-2 MMU instance to kvm_vm
  KVM: selftests: Move TDP mapping functions outside of vmx.c
  KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
  KVM: selftests: Test READ=>WRITE dirty logging behavior for shadow MMU

Yosry Ahmed (14):
  KVM: selftests: Make __vm_get_page_table_entry() static
  KVM: selftests: Stop passing a memslot to nested_map_memslot()
  KVM: selftests: Rename nested TDP mapping functions
  KVM: selftests: Kill eptPageTablePointer
  KVM: selftests: Stop setting A/D bits when creating EPT PTEs
  KVM: selftests: Move PTE bitmasks to kvm_mmu
  KVM: selftests: Use a TDP MMU to share EPT page tables between vCPUs
  KVM: selftests: Stop passing VMX metadata to TDP mapping functions
  KVM: selftests: Reuse virt mapping functions for nested EPTs
  KVM: selftests: Allow kvm_cpu_has_ept() to be called on AMD CPUs
  KVM: selftests: Add support for nested NPTs
  KVM: selftests: Set the user bit on nested NPT PTEs
  KVM: selftests: Extend vmx_dirty_log_test to cover SVM
  KVM: selftests: Extend memstress to run on nested SVM

 tools/testing/selftests/kvm/Makefile.kvm      |   2 +-
 .../kvm/include/arm64/kvm_util_arch.h         |   2 +
 .../testing/selftests/kvm/include/kvm_util.h  |  18 +-
 .../kvm/include/loongarch/kvm_util_arch.h     |   1 +
 .../kvm/include/riscv/kvm_util_arch.h         |   1 +
 .../kvm/include/s390/kvm_util_arch.h          |   1 +
 .../selftests/kvm/include/x86/kvm_util_arch.h |  22 ++
 .../selftests/kvm/include/x86/processor.h     |  58 +++-
 .../selftests/kvm/include/x86/svm_util.h      |   9 +
 tools/testing/selftests/kvm/include/x86/vmx.h |  16 +-
 .../selftests/kvm/lib/arm64/processor.c       |  38 +--
 tools/testing/selftests/kvm/lib/kvm_util.c    |  28 +-
 .../selftests/kvm/lib/loongarch/processor.c   |  28 +-
 .../selftests/kvm/lib/riscv/processor.c       |  31 ++-
 .../selftests/kvm/lib/s390/processor.c        |  16 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  66 +++--
 .../testing/selftests/kvm/lib/x86/processor.c | 237 ++++++++++++----
 tools/testing/selftests/kvm/lib/x86/svm.c     |  24 ++
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 251 ++++-------------
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |   2 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c | 259 ++++++++++++++++++
 .../x86/smaller_maxphyaddr_emulation_test.c   |   4 +-
 .../selftests/kvm/x86/vmx_dirty_log_test.c    | 179 ------------
 .../kvm/x86/vmx_nested_la57_state_test.c      |   2 +-
 24 files changed, 726 insertions(+), 569 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
 delete mode 100644 tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

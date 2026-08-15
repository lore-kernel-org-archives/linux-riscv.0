Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF5C5CFC1
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ttm48Vlsy/5iXm014DuJCQBUOY/9wH0B1JgYGAywAPI=; b=qxsDGInujdEjts
	QOowB7r8WPB93ByGFeiNV0JZy87DlWa7ic4y4DCkHf7+/PfNao7Kn7alSUb2/S6hqmuEa/ucvSvOx
	YsuPfYD2RK7jgRxcCrXs46WGeQ90tj22BfvWR6XMlJn+mEDH5K55DbyA7piEfcKc4GP5jDN2Ac8Wp
	dcZd9QOGXa9bD+hG7Jy15xlIvrtxc/S98y9UiVErLMDTwYeKo5x04B1iaPa7ofUC+KMbMNINy+ONZ
	X8SQUFHNezHAEC6wviGF5/MNF2WRk08GagHn7zVaU8u49K107B5m8MDa8Vs+ZF2RJpvJcC5t9cRby
	/eU2OJAnTbioUYsyhRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC6J-00000003lSD-45fM;
	Sat, 15 Aug 2026 10:58:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC6G-00000003lRP-3aCt
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:58:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-480001972b8so723132f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2026 03:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786791530; cv=none;
        d=google.com; s=arc-20260327;
        b=S1aSi9NJdZwkgcjVlw7vnsFLMMrfqAgc88xJBi7Q2U20oF/fLwbbwNuK1rtwjbEASK
         dmEd1OHwSYCi1ieqI9wsDoZawj8mtb0+O3jDGAmlm0n/WfU0AxYuC6KjpgmK/qeV+Zf7
         ODSPErH01MuK/L+lTpuxfZ2g215fZep2pK02NvdaD37z8A8CzLq7stRegwKvS2lmO2lO
         ZIm8kCaD6I8FnyS1+Qb5Q3onQ5aWUzbA4NZJRpi067XbrKvyUjEKPudH6HV5iDp/ZG+d
         CUe0NqTzqPVgNp9icm/Nt838j79ooopU0ZHFNU6fOZDkMthBsFiYovZO9PMTPy8YSbRk
         7ETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mJc/szzNzWXMtgLBzdckrrrIF9x+kqLUtWQrhBRAmT8=;
        fh=PuUsQnUcPwPR8v7C4QKV9zT6ZdWGHmJNI3Lqejz76W4=;
        b=lyEdNRYXJJRd9AceI/cOPtyTtkHQ/ci5QA766EvACKcrn72alzD5K9/en6h1QWRlux
         urOLC1mMFkjIUNZ0c0gEHhBeBUlSsQIxcENl3WDdfnWjVUn2IHL/FtRuTIKNX8PTmYn3
         cK3+agf0dWkiNYNVq0Bv4YnzfV/vMgUVM08BaGIs/lttz96ubAzsMUelgOO+qjnTeYWu
         4ZDwIBe84S8m4BrxhfposxpTw16r5QTw1qmm5YypuUIlrufB3DdCo01k2BBwkscHQED+
         NAT1oiMFjMdu5oIFOdst8jgNlvEMQk+CzWdjtOYWTKn7q0v45n0zwiL+A5UEZWHp3Wnc
         rDFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786791530; x=1787396330; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJc/szzNzWXMtgLBzdckrrrIF9x+kqLUtWQrhBRAmT8=;
        b=XpCah3YpdVPHDapSzOakSX///TAO/AK7IeuUBEeyhlqhmAZvPHWIwWJ7z9bG0KnWmF
         XeLzXu7K3eJiUyMXu1TsZvnzHTFDJZqMe7V2NJe9mj0ffLRuW4Ohb3qWP4GEsSi3+YGa
         0Z8pVh7njITIetbre3nP8TubA/PrDiRjLg2C9pzRCVbJf9BnddLB6IOsoLdXWweyDW/j
         ZlvUahaAK6VePpezZilklUzYV+AR2HGy9asjT+OBFZRDUnIgbePrn8w+nlzVt41V2nxD
         bwRF7qNL+RMLJTMeX5jx+g1sKZ9aWMioy/Ju7wWGTVaiDAwCzwaIuzQjfKnHrp7ZLRIE
         W3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791530; x=1787396330;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mJc/szzNzWXMtgLBzdckrrrIF9x+kqLUtWQrhBRAmT8=;
        b=Y4oWTGYSHP2+S36Oy+IIryeVkPXj3V6S2y/0J9KWCiC2GfhwLE9j/MMuIDJRznR/bl
         4H0DGKzxcoyHbOmrApAQiHb/jqSzpTKMeruz5zLXonHnN1ZEep5IKefUgDSPEgu/WFvW
         GuJj4FxVoA21X4S1q8xLJYk5r99S+RDhWYSdiqJMlJ++ZhcBkxGbehkPxF9LMy3pkQq+
         Qth/sCOYCyME2b3uvLUDRNXQKtFWb1vhe0qZpq1hIJtZCsKjHVGu7MbNyN4LHczulIVd
         6mX5/EPvS198tq7+qerDOkrkKg9sXz85i4TX60dbiEDgy5h98nPhfNLafMcLQZvj7GN8
         NUvQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro02CnPNjgabYMU4YvAkBaLDY4p3NpZ0grcRNZl5qFHkois9Vb6H/vglp2fvSMZ0jsiXDrRShkI+NFYzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzBjV/xhB9dcfd+CIgUzmHnHQnlB3z5SFC/jnhm7+iwHgofZPx
	7OaeWNV23Lcs/d6kNZQTgd0ejLSCOraSElU9VEucZjOt0k5UdjQC7B6mCD+oP+Cl1ywS+lUkrQf
	dzogwyxE1qLfr2H436Xxb3Kmz9bOh8gTEZPFEPWgAgw==
X-Gm-Gg: AR+sD10hQAzwZgeoP0LuxD+1o2M2U2av8WK6Q27VrFAAdZWmtYXDJzuOSYjXZEMyrhk
	rJ+PFy2xm87KJMFhGDPfSOLFmGOgu6vXw0dGPzgMrXlj6O8XcHrtsk9OUeiWzNv30+7i+n8howW
	lWZKgfbHDxfxh2va3y7r2KNRA3O34rPezxiiWARbfjIEUlQ6Exb66444dX+Da8vRQtSUhPz1rMs
	2k+4vfZXfQCoVnvh6JJMP+L0RHKRivB6de30wxqiZf/TIfeRxJa4esVi9ION9oGDaLzLkeHptr3
	m8qwAxijcxaJ2KhKA6JTfr2S9vqbYVwVlw71p4UJ9Gs++pAXeEUNX9VmH0bWiW0X573DLZS8b7G
	CAxuOvjCmdob+RysZ2AxIjgWq20MEdgjx2vthN9DTIEOGI5x3X/IbMTwZMgHxL90=
X-Received: by 2002:a5d:5f95:0:b0:481:568d:7759 with SMTP id
 ffacd0b85a97d-481607a8cb8mr18006131f8f.24.1786791529832; Sat, 15 Aug 2026
 03:58:49 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 15 Aug 2026 16:28:37 +0530
X-Gm-Features: AcwNN1XpJvJiEIJbZgwLDNwXgQA4L3oZs626j0Q3Fhh-BkbsS9CxXWYf4rtYk8c
Message-ID: <CAAhSdy2AOkykd1JyrF6kJNsZv9M8rYJqVX1TUZNe3RDehZMxHQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.3
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_035852_937727_5C1C1AFA 
X-CRM114-Status: GOOD (  10.02  )
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

Hi Paolo,

We have the following KVM RISC-V changes for 7.3:
1) Svadu/Zicfiss/Zicfilp FWFT support for Guest
2) Use try_cmpxchg for IMSIC MRIF RMW
3) More arch-specific tracepoints in KVM RISC-V
4) Eager Page Splitting for KVM RISC-V
5) Optimize hfence request handling for SMP Guests
6) Improve dirty log clearing by skipping zero bits in mask
7) Guard HFENCE range loops against overflow
8) CPU PM notifiers in KVM RISC-V for non-retentive idle states
9) Fix kernel-mode vector context save/restore for Guest

In addition to the above, we also have a few small fixes such as
limit checks, array overflow checks, data type changes, etc.

Please pull.

Regards,
Anup

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.3-1

for you to fetch changes up to b5060a4aa33d7d78a8c1837ab08ef0c81ea96650:

  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
(2026-08-13 13:20:02 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.3

- Svadu/Zicfiss/Zicfilp FWFT support for Guest
- Use try_cmpxchg for IMSIC MRIF RMW
- More arch-specific tracepoints in KVM RISC-V
- Eager Page Splitting for KVM RISC-V
- Optimize hfence request handling for SMP Guests
- Improve dirty log clearing by skipping zero bits in mask
- Guard HFENCE range loops against overflow
- CPU PM notifiers in KVM RISC-V for non-retentive idle states
- Fix kernel-mode vector context save/restore for Guest

----------------------------------------------------------------
Andy Chiu (3):
      riscv: vector: refactor riscv_v_start_kernel_context
      riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
      RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

Bingyu.Xian (2):
      RISC-V: KVM: Use unsigned int for vma_pageshift
      RISC-V: KVM: Widen G-stage fault address to gpa_t

Guidong Han (1):
      RISC-V: KVM: Fix PMU event info array size overflow

Inochi Amaoto (11):
      RISC-V: KVM: Add support for Svadu FWFT features
      KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
      RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
      RISC-V: KVM: Add ssp context save/restore
      RISC-V: KVM: Handle software-check exits for VCPU
      RISC-V: KVM: Add support for control-flow integrity FWFT features
      KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
      RISC-V: KVM: Add SBI extension validate callback
      RISC-V: KVM: Add SBI FWFT validation support
      RISC-V: KVM: Reset the SBI extension when disable it
      RISC-V: KVM: Mark the reset callback of FWFT extension always dirties CSR

Pengpeng Hou (4):
      RISC-V: KVM: Allow memslots ending at the GPA limit
      RISC-V: KVM: Reject overlapping AIA IMSIC address fields
      RISC-V: KVM: Guard HFENCE range loops against overflow
      RISC-V: KVM: Avoid one-word masks for SBI v0.1 all-harts

Wang Yechao (8):
      RISC-V: KVM: Add the split page cache for ioctl context
      RISC-V: KVM: Split huge pages when dirty logging is enabled
      RISC-V: KVM: Remove redundant TLB flush operations
      RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
      RISC-V: KVM: Add the eager_page_split module parameter
      RISC-V: KVM: Separate req and fallback_req masks in make_xfence_request
      RISC-V: KVM: Introduce make_xfence_request_nodata for FENCE.I requests
      RISC-V: KVM: Improve dirty log clearing by skipping zero bits in mask

Yicong Yang (1):
      RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW

Yong-Xuan Wang (2):
      KVM: RISC-V: Clear former VCPU cache on virtualization disable
      KVM: RISC-V: Add CPU PM notifier for non-retention idle states

Yuhang.Chen (1):
      RISC-V: KVM: Add more arch-specific tracepoints

Yuhang.chen (1):
      RISC-V: KVM: Account VM-scoped allocations to the VM cgroup

Zongmin Zhou (1):
      KVM: riscv: Fix infinite loop in NACL hfence entry allocation

 Documentation/admin-guide/kernel-parameters.txt  |   7 +-
 arch/riscv/include/asm/csr.h                     |   1 +
 arch/riscv/include/asm/kvm_aia.h                 |   3 +
 arch/riscv/include/asm/kvm_gstage.h              |   9 +-
 arch/riscv/include/asm/kvm_host.h                |  10 ++
 arch/riscv/include/asm/kvm_vcpu_insn.h           |   4 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h            |   4 +
 arch/riscv/include/asm/kvm_vcpu_vector.h         |  24 +++
 arch/riscv/include/asm/processor.h               |   8 +
 arch/riscv/include/asm/simd.h                    |  16 +-
 arch/riscv/include/asm/vector.h                  |   5 +
 arch/riscv/include/uapi/asm/kvm.h                |  13 ++
 arch/riscv/kernel/kernel_mode_vector.c           |  88 +++++++---
 arch/riscv/kvm/aia.c                             |  42 +++++
 arch/riscv/kvm/aia_aplic.c                       |   3 +-
 arch/riscv/kvm/aia_device.c                      |   6 +
 arch/riscv/kvm/aia_imsic.c                       |  18 +-
 arch/riscv/kvm/gstage.c                          |  82 ++++++++-
 arch/riscv/kvm/isa.c                             |   2 +
 arch/riscv/kvm/main.c                            | 112 ++++++++++--
 arch/riscv/kvm/mmu.c                             | 108 +++++++++++-
 arch/riscv/kvm/nacl.c                            |   2 +-
 arch/riscv/kvm/tlb.c                             | 117 ++++++++++---
 arch/riscv/kvm/trace.h                           |  81 ++++++++-
 arch/riscv/kvm/vcpu.c                            |  34 ++++
 arch/riscv/kvm/vcpu_config.c                     |   2 +
 arch/riscv/kvm/vcpu_exit.c                       |  20 ++-
 arch/riscv/kvm/vcpu_insn.c                       |  17 +-
 arch/riscv/kvm/vcpu_onereg.c                     |  68 +++++++-
 arch/riscv/kvm/vcpu_pmu.c                        |  16 +-
 arch/riscv/kvm/vcpu_sbi.c                        |  30 ++++
 arch/riscv/kvm/vcpu_sbi_fwft.c                   | 207 ++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_sbi_v01.c                    |  52 +++---
 arch/riscv/kvm/vcpu_vector.c                     |  26 ++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c |  90 ++++++++++
 35 files changed, 1169 insertions(+), 158 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

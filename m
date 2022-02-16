Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B16C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 03:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ff9uDW/GqA6abUwBeIvEBUDoX+OlVILIyKxWbl+Uc2c=; b=dnU3967TOEeaCZ
	FPnjWCC+76nA3RNiRzsoZHtHtVE8MlB8K1rLbHbVjAYAKHQjYHBe8KSI3Jwt4XJHYxxDRDE2cG+p3
	Fc5aCF+RZe9cHHCwwrdgpZHMtBkAN9Iq4X4olHEv8+x8h70Kdt3aeec1FaNNhF+5mDyNNBBs9y0xQ
	CuhadSflWQoORYggq5mff1TokJi5/KB2pekr65wLxa92++kGHh/rFfHNTECnwGnW8JT3NW2HxtCo2
	/NHoI0IQMZJSfYUcYdPptcnZXzCaoWqx3heTiVFieJB7Gm36TCnG0vte72B4WXw/hV3selm9lvgPD
	akxh703lsLoDoSvFxbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKAnK-005NdE-8f; Wed, 16 Feb 2022 03:15:54 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKAnF-005NcQ-QH; Wed, 16 Feb 2022 03:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644981349; x=1676517349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QTNgfjCEcX1QhsvTX1L+Tjbtrc8LR7Y4aspA8SJiUsY=;
 b=JwBB0DbylUBY2K3e//TrI8m1LQawXcoZwceWmpubMWe0giVf7YIPEwUe
 duP7lcXCIOm9A0lnVIotI0XiHMTlbn6gEVIxnrVtFKk/xectxV0djtRuJ
 A9v0PfXFmDtJjm/wnwqqtuqALzL0+UDHdBddGebkPTGjzfF73sIS8quKw
 AkbSYG116omhG4VzRlqLH/PeafkFHaLC6heTiK2eDWkR9dJxKmx8F1RC8
 ELDfIQYflM0ZjCXATv/t14EbgA4je8RVIOwDaaPOThRrIFMr3YeAubZ2D
 ybISafQCEeBomQsPKrkd6a+MLiVq2W2/I5Dq2LeLIbBDSqNf8Wb3cRutc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="336944962"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="336944962"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:15:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="773798119"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.22])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:15:36 -0800
From: Chao Gao <chao.gao@intel.com>
To: seanjc@google.com, maz@kernel.org, kvm@vger.kernel.org,
 pbonzini@redhat.com, kevin.tian@intel.com, tglx@linutronix.de
Cc: Chao Gao <chao.gao@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Andrew Jones <drjones@redhat.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hector Martin <marcan@marcan.st>, Heiko Carstens <hca@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, James Morse <james.morse@arm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jia He <justin.he@arm.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 John Garry <john.garry@huawei.com>, Juergen Gross <jgross@suse.com>,
 kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Qi Liu <liuqi115@huawei.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Richter <tmricht@linux.ibm.com>,
 Tom Zanussi <tom.zanussi@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Will Deacon <will@kernel.org>,
 x86@kernel.org
Subject: [PATCH v4 0/6] Improve KVM's interaction with CPU hotplug
Date: Wed, 16 Feb 2022 11:15:15 +0800
Message-Id: <20220216031528.92558-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_191549_915933_2606B24C 
X-CRM114-Status: GOOD (  12.48  )
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

Changes from v3->v4:
 - rebased to the lastest kvm/next branch.
 - add Sean's reviewed-by tags
 - add Marc's patch to simplify ARM's cpu hotplug logic in KVM

Changes from v2->v3:
 - rebased to the latest kvm/next branch. 
 - patch 1: rename {svm,vmx}_check_processor_compat to follow the name
	    convention
 - patch 3: newly added to provide more information when hardware enabling
	    fails
 - patch 4: reset hardware_enable_failed if hardware enabling fails. And
	    remove redundent kernel log.
 - patch 5: add a pr_err() for setup_vmcs_config() path.

Changes from v1->v2: (all comments/suggestions on v1 are from Sean, thanks)
 - Merged v1's patch 2 into patch 1, and v1's patch 5 into patch 6.
 - Use static_call for check_processor_compatibility().
 - Generate patch 2 with "git revert" and do manual changes based on that.
 - Loosen the WARN_ON() in kvm_arch_check_processor_compat() instead of
   removing it.
 - KVM always prevent incompatible CPUs from being brought up regardless of
   running VMs.
 - Use pr_warn instead of pr_info to emit logs when KVM finds offending
   CPUs.

KVM registers its CPU hotplug callback to CPU starting section. And in the
callback, KVM enables hardware virtualization on hotplugged CPUs if any VM
is running on existing CPUs.

There are two problems in the process:
1. KVM doesn't do compatibility checks before enabling hardware
virtualization on hotplugged CPUs. This may cause #GP if VMX isn't
supported or vmentry failure if some in-use VMX features are missing on
hotplugged CPUs. Both break running VMs.
2. Callbacks in CPU STARTING section cannot fail. So, even if KVM finds
some incompatible CPUs, its callback cannot block CPU hotplug.

This series improves KVM's interaction with CPU hotplug to avoid
incompatible CPUs breaking running VMs. Following changes are made:

1. move KVM's CPU hotplug callback to ONLINE section (suggested by Thomas)
2. do compatibility checks on hotplugged CPUs.
3. abort onlining incompatible CPUs

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9@redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (4):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  Partially revert "KVM: Pass kvm_init()'s opaque param to additional
    arch funcs"
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Do compatibility checks on hotplugged CPUs

Marc Zyngier (1):
  KVM: arm64: Simplify the CPUHP logic

Sean Christopherson (1):
  KVM: Provide more information in kernel log if hardware enabling fails

 arch/arm64/kvm/arch_timer.c        | 27 ++++-------
 arch/arm64/kvm/arm.c               |  6 ++-
 arch/arm64/kvm/vgic/vgic-init.c    | 19 +-------
 arch/mips/kvm/mips.c               |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 arch/riscv/kvm/main.c              |  2 +-
 arch/s390/kvm/kvm-s390.c           |  2 +-
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 +-
 arch/x86/kvm/svm/svm.c             |  4 +-
 arch/x86/kvm/vmx/evmcs.c           |  2 +-
 arch/x86/kvm/vmx/evmcs.h           |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 22 +++++----
 arch/x86/kvm/x86.c                 | 16 +++++--
 include/kvm/arm_arch_timer.h       |  4 ++
 include/kvm/arm_vgic.h             |  4 ++
 include/linux/cpuhotplug.h         |  5 +-
 include/linux/kvm_host.h           |  2 +-
 virt/kvm/kvm_main.c                | 73 +++++++++++++++++++-----------
 19 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD5AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AYRLRb6fXbhYvVmJgOqZ8fh96D9+ZviH/OiWKLqPRRk=; b=1FiQZfESDt3GZ0
	GRTLgSWRZmKM4v80wxR6Gxq+tRK5BCtronvgGf5SAbTVFJN0X0i3sI4BApz74O2f0wzCyn5lA6mpK
	lQZK+NmdwDtfAHSGDWD4pEQgWSfRG1B08bfDgSb1IyYssFxI0mykkxTumio8M/cpdi/BZ5ntVc6dT
	szjVqDhg2Te7Mj/pBq8CLrMt1uBSBFcG/ykrHlL4efhjAW06LScxZ8+Qotq07X40AxTNFMDbJRHkP
	2XU2uR91R8fw4L04SDVF5mEx7rNhkpCzCOMv3ugjNmDBfFZFCCRlENESisZcaM2t7obkcmkv/MYOs
	vuTiXWLTkO9vY5VrePdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1lC0-00GM5P-AO; Mon, 27 Dec 2021 08:17:16 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1lBx-00GM4x-Qh; Mon, 27 Dec 2021 08:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640593033; x=1672129033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tCJzGvAoR9V3Cf25Th6SaPQVLQdtAnnLPINob5E2Vys=;
 b=RXV3TFHXVyh2oG96Erac847w+s9TXkyX91FRqj7Tp+KUucvNPu9/NABs
 pyNxLdhJcYbp2cbkmzH+CLAon3MIGyhwxZhxCsIO1d0D/D8j2GXh0RSyz
 rzp1Z4s4f81gLgoR35Edj8R+aha9uHq4PLQdvqROTM8G9YDLHB3bcHHQW
 KZ/b+Jk3oABmAI1nCWCImIKg2R2+eSt1tU8b6GXSDUq6eeUj2hG981Sol
 SpWES6K8p+u8VN7RkC3LHsJb5ntKbx6NyZP+GFV9zMg4OcVqaNzKo6Awy
 1p2ctmy4nc8cpWnI+mvCcgxPvsHaH7uRToLiRdimWyN0WZ1+zQmO1teGz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="221848350"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="221848350"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:17:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="523207964"
Received: from unknown (HELO hyperv-sh4.sh.intel.com) ([10.239.48.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:16:56 -0800
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de
Cc: Chao Gao <chao.gao@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Guo Ren <guoren@linux.alibaba.com>,
 Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 James Morse <james.morse@arm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 John Garry <john.garry@huawei.com>, kvmarm@lists.cs.columbia.edu,
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Marc Zyngier <maz@kernel.org>, Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Richter <tmricht@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
Subject: [PATCH 0/6] Improve KVM's interaction with CPU hotplug
Date: Mon, 27 Dec 2021 16:15:06 +0800
Message-Id: <20211227081515.2088920-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_001713_962126_C5BA3974 
X-CRM114-Status: UNSURE (   7.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

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
3. abort onlining incompatible CPUs if there is a running VM.

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9@redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (6):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  KVM: x86: Use kvm_x86_ops in kvm_arch_check_processor_compat
  KVM: Remove opaque from kvm_arch_check_processor_compat
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: x86: Remove WARN_ON in kvm_arch_check_processor_compat
  KVM: Do compatibility checks on hotplugged CPUs

 arch/arm64/kvm/arm.c            |  2 +-
 arch/mips/kvm/mips.c            |  2 +-
 arch/powerpc/kvm/powerpc.c      |  2 +-
 arch/riscv/kvm/main.c           |  2 +-
 arch/s390/kvm/kvm-s390.c        |  2 +-
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          |  4 +-
 arch/x86/kvm/vmx/evmcs.c        |  2 +-
 arch/x86/kvm/vmx/evmcs.h        |  2 +-
 arch/x86/kvm/vmx/vmx.c          | 12 +++---
 arch/x86/kvm/x86.c              |  7 +---
 include/linux/cpuhotplug.h      |  2 +-
 include/linux/kvm_host.h        |  2 +-
 virt/kvm/kvm_main.c             | 74 ++++++++++++++++++++++++---------
 14 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

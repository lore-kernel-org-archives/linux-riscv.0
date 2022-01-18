Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E57C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 06:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tRmUh2sOiET92njyDLb/ZgzyLMs9SplaiRqum3SvRxM=; b=MTXLWiIHUYV1/u
	sxphEkp34OaBc6h35p8OjmNGAuOnaJ7UcM1laeN2fc2WlPf2svk5xaSZ0UxqRQSIcSHI7aaMoU+3y
	Lz3CErA5UQVPsDHP/twVJuk/aePbTm1qSkXrm10GvjxvyoNoFKLW81VZmYFVOy75GL+HKP18yO+9+
	4TjPNHqs3E11a241MzHH6EyKaBD2wQvr86AMl5T/2VVimdIMrhC8fsq3tQ5eXhpHAwgxQkN8eYjQn
	ThL7oS2IeZdL2/UTG42GxMblRKny0xQWFCtTfC/IeonwgBP6KtIN0S+o9oM9TK2doh5lrSh35Z4De
	RCCBGh7+7GBMDkNup/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9iJG-000UIc-2H; Tue, 18 Jan 2022 06:49:38 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9iJC-000UHG-Sg; Tue, 18 Jan 2022 06:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642488574; x=1674024574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qle7iYX0bWtMWgGrX9XT60FWnCJkJa+OHVP1jvUZDP4=;
 b=LnHhqdHImzGqa700vWv5AAciDSTHhwfu7f+NIPvSiCVDoBMKPXZ+YpPw
 DXjFkeH4tV9uO+UUypcuqjA3xSo6uU2NCH5q5jRyrhHWwIFdj28YSHX0e
 hWQx+GChLi9Iwp87X+LLLYODv2/wIZrEQWTBIsDAt2jQn5bUQTteuOI4O
 XPEGNNwvLI1YO+ABDp/TTkksvTiSIR6VD/A8TRah6PcDvFU3xFC8YOdpm
 AtDmXijIZGfWvc3WbI3h7glvPe9+e1W/cWKeinKi/8RgaVhK7hHFVkEzP
 0nMFhwtVK9SqGTFd7ok8rowjQjKjOG/XvKvayHzo+EydUm+XY7MAL4w3F w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331102341"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="331102341"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 22:49:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531648541"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 22:49:17 -0800
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
 kevin.tian@intel.com, tglx@linutronix.de
Cc: Chao Gao <chao.gao@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Hector Martin <marcan@marcan.st>,
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
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Richter <tmricht@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
Subject: [PATCH v2 0/4] Improve KVM's interaction with CPU hotplug
Date: Tue, 18 Jan 2022 14:44:23 +0800
Message-Id: <20220118064430.3882337-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_224934_994383_BBA9543B 
X-CRM114-Status: GOOD (  10.38  )
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

 arch/arm64/kvm/arm.c               |  2 +-
 arch/mips/kvm/mips.c               |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 arch/riscv/kvm/main.c              |  2 +-
 arch/s390/kvm/kvm-s390.c           |  2 +-
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 +-
 arch/x86/kvm/svm/svm.c             |  4 +-
 arch/x86/kvm/vmx/evmcs.c           |  2 +-
 arch/x86/kvm/vmx/evmcs.h           |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 12 +++---
 arch/x86/kvm/x86.c                 | 16 +++++---
 include/linux/cpuhotplug.h         |  2 +-
 include/linux/kvm_host.h           |  2 +-
 virt/kvm/kvm_main.c                | 62 ++++++++++++++++++++----------
 15 files changed, 71 insertions(+), 44 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

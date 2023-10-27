Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34478C25B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhVypdgNehkoqiCMC3udjaIXdyBBsUttLqezcsrvB+o=; b=jsjQ46DUPpI19K
	lvIGfPHbhl9Tiwp/lBRG5kmxZkpL3NLNLGLbhOTmGFUgP2LwYL4Vk2VtxoE38hKczqXDJTnRiRLVM
	fvfg/Pl2fuFFzoo8LwJhWDqOFUabBbrRlsBNBBN0hbjIoZ493imsznfD/DzJXJKIJk8vLX/YG0pLe
	NIXoU2HxUjKP/Ik+p/PFrNJVya61sVaanPqzIbdApJZPrQ8Xjj1XKIAzx6EIb+pJjdmhU/3qWCgYG
	8jtZMH5VOENeaKA6Edv1lbTtV0PG+UcgoVwnsd1o29IETr0IjYQiHp7ZSoRXerMU9MfUMF2MSPjNL
	9XJtXIEdChCHtFKzjUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSYg-00H66e-2n;
	Fri, 27 Oct 2023 19:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUS-00Gxdm-11
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vy9wKTn0fkDEcqGdy+Uw8qnM4ToO/Gfdy3c1eQgyq4E=; b=YZ2JCcD6q9HIVWQ/q80K8p/ews
	MNKZlyXs2LVaJ9lEW+lU5jQHsCkXECfFWq/l4PojZhEEEWrGp4eLrlzKHSNPJHYi+oUVf928gyfi/
	8aZsDC8XvS+JWH5Id0Tm+yXloMuerIvmm8XvRXJg95tVaPM78XR1TKyLEztlUGso0quHKLNpP2YdR
	bZTfv2WFOwPF6Zyp2v4rRPSFCrDYSyKoYupFPriyJeQ+sdDmIul2OthbYWh/O+oDKklvfqYf6W4us
	Un3g9tLyPfN2m/ZS8CtrCq+BbgY39oqpNqeHcdYYQU7ua6ZQ4SleRpMeumM12mg013J4CfSJOj+TL
	yZ6J6FBw==;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUH-000ukM-1q
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:20 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c9b774f193so19401005ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430991; x=1699035791; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vy9wKTn0fkDEcqGdy+Uw8qnM4ToO/Gfdy3c1eQgyq4E=;
        b=YNV2GoxeVjAeSVMDUyObZtSLy0GE8bUSOWViGun9LR+o9w3lZCGGLvmxMwQQgxb1Hu
         e05xDr3Gbh5ZpRJYaYHlmdA+SUcNgypMMXqDU+efG+trb+qumtiWxXkDHkAUySUR+hwF
         oWAHLQBXgmvJ3q4QTpopTnNBz3KNtAg1vzT4alyPTvGADGYjmKqVh+WebqAH1IW5/st5
         dW8eVyaDdfPQPVZsOKPomI5lhbBJUB+sPpXWoyuznoZUEpNUTDKvHJf3yJsZhaAeMMiG
         SKB7R5Q7o2fniUdnWTyFaZa0q+tfzBXIUzrUTPdiM9gD9qFyNZ5hTySGnk6Q5pazBuQ5
         uvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430991; x=1699035791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vy9wKTn0fkDEcqGdy+Uw8qnM4ToO/Gfdy3c1eQgyq4E=;
        b=o+xvUFWvhifYkSy8kHmkahcujObj3m71qV4jQBGbVJSFkERWxaXHCkbdeq9oIZXu5d
         CXM0r3hiUGitAzPXMoBAdMtP/Z8VTXBb5FTSxAkBifH9DeKmmsYbG9sHq7qVk7b2H2CM
         1vB2TQuOvfT0zyKvq3yRzHv4JwrfrA3CB2mxqdtzmyftzZlZLHgV2iuNP/0ODxU/4igQ
         oQwdFBSbxP1nww6wEctFAc8MfGtzpZfacrU1LAaAC9EyfjY8KmWUhui5/oRwCaEvAv4b
         pEf8PRd13UVs8sxmto7BkvPbiT6TJF+dUHpy5+vziJQy9/8Xtv+BuqqNozbuumEj85/Z
         AUVA==
X-Gm-Message-State: AOJu0Yx5iwogSqBINmQwri9/rC/2aVQCmzY3lqZu3moXwZCtzCB3tdvS
	7qCtpIDVK7bjyiL0nQjXvTA3T5RNljY=
X-Google-Smtp-Source: AGHT+IHJ99M17cdlIrIz+y3E5dgMN6oBoPPflGRQ0snggMyySInUDtQaTlwdekdlvCWpXPVtetZE0SP3KDw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4cc:b0:1cc:1900:28d7 with SMTP id
 o12-20020a170902d4cc00b001cc190028d7mr82411plg.12.1698430991116; Fri, 27 Oct
 2023 11:23:11 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:05 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-24-seanjc@google.com>
Subject: [PATCH v13 23/35] KVM: x86: Add support for "protected VMs" that can
 utilize private memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192313_764518_A8D3BF18 
X-CRM114-Status: GOOD (  22.81  )
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

Add a new x86 VM type, KVM_X86_SW_PROTECTED_VM, to serve as a development
and testing vehicle for Confidential (CoCo) VMs, and potentially to even
become a "real" product in the distant future, e.g. a la pKVM.

The private memory support in KVM x86 is aimed at AMD's SEV-SNP and
Intel's TDX, but those technologies are extremely complex (understatement),
difficult to debug, don't support running as nested guests, and require
hardware that's isn't universally accessible.  I.e. relying SEV-SNP or TDX
for maintaining guest private memory isn't a realistic option.

At the very least, KVM_X86_SW_PROTECTED_VM will enable a variety of
selftests for guest_memfd and private memory support without requiring
unique hardware.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst  | 32 ++++++++++++++++++++++++++++++++
 arch/x86/include/asm/kvm_host.h | 15 +++++++++------
 arch/x86/include/uapi/asm/kvm.h |  3 +++
 arch/x86/kvm/Kconfig            | 12 ++++++++++++
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 arch/x86/kvm/x86.c              | 16 +++++++++++++++-
 include/uapi/linux/kvm.h        |  1 +
 virt/kvm/Kconfig                |  5 +++++
 8 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 38dc1fda4f45..00029436ac5b 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -147,10 +147,29 @@ described as 'basic' will be available.
 The new VM has no virtual cpus and no memory.
 You probably want to use 0 as machine type.
 
+X86:
+^^^^
+
+Supported X86 VM types can be queried via KVM_CAP_VM_TYPES.
+
+S390:
+^^^^^
+
 In order to create user controlled virtual machines on S390, check
 KVM_CAP_S390_UCONTROL and use the flag KVM_VM_S390_UCONTROL as
 privileged user (CAP_SYS_ADMIN).
 
+MIPS:
+^^^^^
+
+To use hardware assisted virtualization on MIPS (VZ ASE) rather than
+the default trap & emulate implementation (which changes the virtual
+memory layout to fit in user mode), check KVM_CAP_MIPS_VZ and use the
+flag KVM_VM_MIPS_VZ.
+
+ARM64:
+^^^^^^
+
 On arm64, the physical address size for a VM (IPA Size limit) is limited
 to 40bits by default. The limit can be configured if the host supports the
 extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
@@ -8650,6 +8669,19 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
 64-bit bitmap (each bit describing a block size). The default value is
 0, to disable the eager page splitting.
 
+8.41 KVM_CAP_VM_TYPES
+---------------------
+
+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
+:Architectures: x86
+:Type: system ioctl
+
+This capability returns a bitmap of support VM types.  The 1-setting of bit @n
+means the VM type with value @n is supported.  Possible values of @n are::
+
+  #define KVM_X86_DEFAULT_VM	0
+  #define KVM_X86_SW_PROTECTED_VM	1
+
 9. Known KVM API problems
 =========================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f9e8d5642069..dff10051e9b6 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1244,6 +1244,7 @@ enum kvm_apicv_inhibit {
 };
 
 struct kvm_arch {
+	unsigned long vm_type;
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
 	unsigned long n_max_mmu_pages;
@@ -2077,6 +2078,12 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t new_pgd);
 void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.vm_type != KVM_X86_DEFAULT_VM)
+#else
+#define kvm_arch_has_private_mem(kvm) false
+#endif
+
 static inline u16 kvm_read_ldt(void)
 {
 	u16 ldt;
@@ -2125,14 +2132,10 @@ enum {
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
 # define KVM_MAX_NR_ADDRESS_SPACES	2
+/* SMM is currently unsupported for guests with private memory. */
+# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) ? 1 : 2)
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
-
-static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
-{
-	return KVM_MAX_NR_ADDRESS_SPACES;
-}
-
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 1a6a1f987949..a448d0964fc0 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -562,4 +562,7 @@ struct kvm_pmu_event_filter {
 /* x86-specific KVM_EXIT_HYPERCALL flags. */
 #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
 
+#define KVM_X86_DEFAULT_VM	0
+#define KVM_X86_SW_PROTECTED_VM	1
+
 #endif /* _ASM_X86_KVM_H */
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 091b74599c22..8452ed0228cb 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -77,6 +77,18 @@ config KVM_WERROR
 
 	  If in doubt, say "N".
 
+config KVM_SW_PROTECTED_VM
+	bool "Enable support for KVM software-protected VMs"
+	depends on EXPERT
+	depends on X86_64
+	select KVM_GENERIC_PRIVATE_MEM
+	help
+	  Enable support for KVM software-protected VMs.  Currently "protected"
+	  means the VM can be backed with memory provided by
+	  KVM_CREATE_GUEST_MEMFD.
+
+	  If unsure, say "N".
+
 config KVM_INTEL
 	tristate "KVM for Intel (and compatible) processors support"
 	depends on KVM && IA32_FEAT_CTL
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 86c7cb692786..b66a7d47e0e4 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -297,6 +297,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.max_level = KVM_MAX_HUGEPAGE_LEVEL,
 		.req_level = PG_LEVEL_4K,
 		.goal_level = PG_LEVEL_4K,
+		.is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
 	};
 	int r;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c4d17727b199..e3eb608b6692 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4441,6 +4441,13 @@ static int kvm_ioctl_get_supported_hv_cpuid(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static bool kvm_is_vm_type_supported(unsigned long type)
+{
+	return type == KVM_X86_DEFAULT_VM ||
+	       (type == KVM_X86_SW_PROTECTED_VM &&
+		IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_enabled);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r = 0;
@@ -4632,6 +4639,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_X86_NOTIFY_VMEXIT:
 		r = kvm_caps.has_notify_vmexit;
 		break;
+	case KVM_CAP_VM_TYPES:
+		r = BIT(KVM_X86_DEFAULT_VM);
+		if (kvm_is_vm_type_supported(KVM_X86_SW_PROTECTED_VM))
+			r |= BIT(KVM_X86_SW_PROTECTED_VM);
+		break;
 	default:
 		break;
 	}
@@ -12314,9 +12326,11 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	int ret;
 	unsigned long flags;
 
-	if (type)
+	if (!kvm_is_vm_type_supported(type))
 		return -EINVAL;
 
+	kvm->arch.vm_type = type;
+
 	ret = kvm_page_track_init(kvm);
 	if (ret)
 		goto out;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 29e9eb51dec9..5b5820d19e71 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1218,6 +1218,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_MEMORY_FAULT_INFO 231
 #define KVM_CAP_MEMORY_ATTRIBUTES 232
 #define KVM_CAP_GUEST_MEMFD 233
+#define KVM_CAP_VM_TYPES 234
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 08afef022db9..2c964586aa14 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -104,3 +104,8 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
 config KVM_PRIVATE_MEM
        select XARRAY_MULTI
        bool
+
+config KVM_GENERIC_PRIVATE_MEM
+       select KVM_GENERIC_MEMORY_ATTRIBUTES
+       select KVM_PRIVATE_MEM
+       bool
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

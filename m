Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEEC25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHaHtNE9nQzoPL9o6lV9Ky6O9JbTu8tT2fpfFHKfAJ8=; b=GCa65OzACFUeSX
	mTYMxX4PTntinbeaiDNDhnZ6mmhVapaQ3/qqzq2fl3HeVqxEUWDwPFOST7/VIfHpFzRadPz1Hlq4H
	iIE5ltfjPXPHPigjKKFzfR+C2A/rHjftkBaUoCQRpJpv33xZXsbt+R30lgLujmwspjoJZffj7K7w7
	L4LOXXQtSJiS/A6kuY2GhFPoJHJ5ewoFI4XFcLCQuQgjc3Urrs2X0GQF5tgverm9QzDI8jzjWzk1h
	dokjJSUggTxLyxtnaYQC0gXt5GmqF+5O6KffyYBH78mFhpWgrckMuumSJfLILomK8qgxgZAkoEJJu
	IGiw9KUCXXryJNH5TtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUp-00Gy1y-3B;
	Fri, 27 Oct 2023 18:23:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU1-00Gx9t-1p
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dSzaJ5MjV13E6q0DS9u4ZW54i690mbtysQRlTl8m4E8=; b=FX3MinelLjGCyeHxp6TgjGUxE8
	ZEx4/UuiuHndv8GYnLWrfx8EZr3epnEZq5uhG662oHn7ynjc5ZWSHy9+DgLja+e/OwRtD+o1PkV5I
	aJa9PyZuJIwMYlSljLxPp26Q5cbdtYQpfEbEvE4tA2jMFEjI5aRtL+B90dfx0KkC0qXGRFA645tVt
	CqnUviaaM9FnLvGSX9zUkvj8pPTmDtXvleoewz2S96/SC4nbxeKHD9Ad/XmaNUnB4W8v5HkCwaRyb
	kJv4RlbYRr918Ubte0ZBIEngOm/9x2fU5Krz/7U83tZ+DIFZlK4JiuVNprey9fGMxBt7qdGafBWXH
	3jZa/FDw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTv-000uW9-39
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9a5a3f2d4fso1710494276.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430963; x=1699035763; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dSzaJ5MjV13E6q0DS9u4ZW54i690mbtysQRlTl8m4E8=;
        b=SijTkct0qKmLEzzD7aV2lHKb8L9rE5rZ7QWGij8zNLCXylP+a7l4Qh0ICxUzEEz3Ky
         mWdiXagCIM/ZqitdjX97PXEZX/ob8jK9LNsL2Bv7TguGLfp6YWoga3eWgsFa736Q0X8Y
         Fuxh03T3ybRbAYUGdm5t/Z1FIGQdr2jCSMYI6AS2tJlJJjFVIgjjtd5Ux3drQG7mJ9AL
         Zz2mFlN4fi3ZbrAOtE2LI1G8gQ0yiYjhNPkCj9uypEYvnlvmgynr+e/fes8I08p7bkYD
         HScwVT+5kIJZcjR15BxNyUxLUd6siLmuDeODPXJLB3laj4cjt0RBUnezMtPZLasprAID
         Vmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430963; x=1699035763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSzaJ5MjV13E6q0DS9u4ZW54i690mbtysQRlTl8m4E8=;
        b=us+73EETTnwd0v/caQkyzuXJYeg38fevnPEFH4w/ton/MYBcGw/+ykv9P7tShvwnrM
         fV4QqQOj71B9Kf8Y3ps2GaMM1NXbE++ekX5SFHGjuTyFHYR7/AfRUSRTVJK5KsNtlifs
         9vA2ayCG3c7JrCfjTrhnWjUC5/+B9KP3fqKGq1tpHYh4oaBn6tSNRSfdFhztq2z7HxXe
         PL87eM4wnQdnMp/gPWFXnWq+oPrKo4RfUs80Oka97v8f8Ue/qolOnsTrGS0h9T72EMJ5
         MwEo6xI+g5x1OWFLbHd4tYvQLl4I3adEv08KJlbO+2UF0nfNbfNifxa1Vz9ZPiNy70XT
         MUMw==
X-Gm-Message-State: AOJu0YzGYxIp5XzW/9Jgrh57sybzc87kupMYdsq1Y1Q7KcBmnGZquugk
	09w7KvhKzq1WgbzQiDtRWDMWxbWG8ug=
X-Google-Smtp-Source: AGHT+IE2yfyx6OwAXQ6PbUozSNKQr4HAB6CvBECxReNk+TNP1aa3zG1osU5Glk09o10tbDLcLiI8MNAMXYU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1746:b0:d9a:59cb:8bed with SMTP id
 bz6-20020a056902174600b00d9a59cb8bedmr61033ybb.5.1698430963421; Fri, 27 Oct
 2023 11:22:43 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:51 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-10-seanjc@google.com>
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
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
X-CRM114-CacheID: sfid-20231027_192253_671986_0CDD512A 
X-CRM114-Status: GOOD (  20.72  )
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

From: Chao Peng <chao.p.peng@linux.intel.com>

Add a new KVM exit type to allow userspace to handle memory faults that
KVM cannot resolve, but that userspace *may* be able to handle (without
terminating the guest).

KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
conversions between private and shared memory.  With guest private memory,
there will be two kind of memory conversions:

  - explicit conversion: happens when the guest explicitly calls into KVM
    to map a range (as private or shared)

  - implicit conversion: happens when the guest attempts to access a gfn
    that is configured in the "wrong" state (private vs. shared)

On x86 (first architecture to support guest private memory), explicit
conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
as there is (obviously) no hypercall, and there is no guarantee that the
guest actually intends to convert between private and shared, i.e. what
KVM thinks is an implicit conversion "request" could actually be the
result of a guest code bug.

KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
be implicit conversions.

Note!  To allow for future possibilities where KVM reports
KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
perspective), not '0'!  Due to historical baggage within KVM, exiting to
userspace with '0' from deep callstacks, e.g. in emulation paths, is
infeasible as doing so would require a near-complete overhaul of KVM,
whereas KVM already propagates -errno return codes to userspace even when
the -errno originated in a low level helper.

Report the gpa+size instead of a single gfn even though the initial usage
is expected to always report single pages.  It's entirely possible, likely
even, that KVM will someday support sub-page granularity faults, e.g.
Intel's sub-page protection feature allows for additional protections at
128-byte granularity.

Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH@google.com
Cc: Anish Moorthy <amoorthy@google.com>
Cc: David Matlack <dmatlack@google.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
 arch/x86/kvm/x86.c             |  1 +
 include/linux/kvm_host.h       | 11 +++++++++
 include/uapi/linux/kvm.h       |  8 +++++++
 4 files changed, 61 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index ace984acc125..860216536810 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
+
+KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
+could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
+guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
+describes properties of the faulting access that are likely pertinent.
+Currently, no flags are defined.
+
+Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
+accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
+or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
+kvm_run.exit_reason is stale/undefined for all other error numbers.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
@@ -7757,6 +7777,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
 cause CPU stuck (due to event windows don't open up) and make the CPU
 unavailable to host or other VMs.
 
+7.34 KVM_CAP_MEMORY_FAULT_INFO
+------------------------------
+
+:Architectures: x86
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_RUN will fill
+kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
+there is a valid memslot but no backing VMA for the corresponding host virtual
+address.
+
+The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
+an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
+to KVM_EXIT_MEMORY_FAULT.
+
+Note: Userspaces which attempt to resolve memory faults so that they can retry
+KVM_RUN are encouraged to guard against repeatedly receiving the same
+error/annotated fault.
+
+See KVM_EXIT_MEMORY_FAULT for more information.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 6409914428ca..ee3cd8c3c0ef 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4518,6 +4518,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ENABLE_CAP:
 	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
 	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_MEMORY_FAULT_INFO:
 		r = 1;
 		break;
 	case KVM_CAP_EXIT_HYPERCALL:
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4e741ff27af3..96aa930536b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	vcpu->run->memory_fault.gpa = gpa;
+	vcpu->run->memory_fault.size = size;
+
+	/* Flags are not (yet) defined or communicated to userspace. */
+	vcpu->run->memory_fault.flags = 0;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index bd1abe067f28..7ae9987b48dd 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -274,6 +274,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_MEMORY_FAULT     38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -520,6 +521,12 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -1203,6 +1210,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_USER_MEMORY2 230
+#define KVM_CAP_MEMORY_FAULT_INFO 231
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

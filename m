Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C912EE021A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BhtMyezZ42dhJhWBZuDmJcUev2pO/Uny+DE/8/wdic=; b=Bzy0Tq7BBP/gbv
	YEOJAzTRHKWJu4bqqJTEnyWLCxzP1NFpGbEdjX0w8UHwW7eBu4sjZ7aYcjEMTd2zpFqHWkOReasw1
	YOij33gsFaHOfDBCMnHom/VKepXC76o0qZBfeWz3jA/iGKVuiHmvEC8/inT6Og4wSPHcPXXdHtr7Z
	Q76NkK0hZSarMbqHGepj8HYWu2SFiuI6RcmM4KL1mKWz63ujj4cjfeYnKQ+aZ+IRbGuvWP7jgWkHt
	PCnUU+Yf5fyuVQJI+ex3m5BXdtF2YaxOwZdAFSym8o39aGqdA8gr+SgLXHTAQMQg56egwDpMTlkWe
	keGP+JoCjl1DnfItoYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbbD-00741U-0z;
	Thu, 14 Sep 2023 01:56:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaB-0072rn-2a
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:55:58 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bf681d3d04so3894495ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656550; x=1695261350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ncWp87Xrx57ugLKytKkEWMncW9euHhZSqjHZ5fZmU=;
        b=RGC/4Ty/rDfzaIN5w3hspDbZJvKsGGRSel7nkRFR3pExkXgbIeonn7yyAtH/yy3kEr
         MPcLCz6oo1oqYJU8XOVdMNJ3+iVoRsFbYUTbUYE9BM5Zhbycu1kpvJxAZt+4We/C4Ur7
         qQClcsOviHfOaxfKvJz8DZSI1lwh+yHQphpaf6l4IICWpX9b5JXg3XOhjzivLqrV19/u
         NELtBu8lo7tQ/3V1XJNb0OkFr5iqhgqJvvRDJ4X7nOXRdZxZjC24kFDJuSuebBoAhXTd
         Pfcs6mqHCmNuO4MeI1p1cY3j3VRFLHMW7NZNGcASAFcPyd6fU5JoQ3/6bB0b6mb+b8NX
         ZSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656550; x=1695261350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3ncWp87Xrx57ugLKytKkEWMncW9euHhZSqjHZ5fZmU=;
        b=PE6J4JhrjMEFs56j+ac/wQGfx94EYLBtxEKuraGJ2+lMe8r3GM53YSfwOhxBhybhGV
         vzmW1NHiBuL4xvKBWqsqkED5TWXE02xndzVCd6QGp0Uwq/LlWfneOOPjLWqeQsdKQrzi
         TdnxOp3P3IRjfh1kMixP37fyBW22nGG1j4WQgzpnLF6ysoK2CJqF1VcDNID3+aFsuYvw
         Npa3UwjSk1tVGzXtGNEqSxjw939yfwy2Gtmwh5RvxXhNrKCtbwJiO6txKfxgJ6ELANFE
         DUtM0ZIqpxX5/g9Vpj5mrukzhzh5jCqoFSLWLG7AGJInGAzzLzz8bXFZR/1HrnN9v5Mg
         XUwQ==
X-Gm-Message-State: AOJu0YxiPyWhEgDLgDrFVqEqtdabAWF2Oun6WgyYMweaEH0HjBKoiSwb
	GC0+KkwMfwu1orvDea2ALt9STi1nNt4=
X-Google-Smtp-Source: AGHT+IGMCwYjc3KV33cqzPB4diNP6tSuJVwUoEl1ZPejd5zU17fdiva4810hnuR1hhtSq7kLalb8uulnWEI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:6bca:b0:1b8:80c9:a98e with SMTP id
 m10-20020a1709026bca00b001b880c9a98emr149786plt.13.1694656550053; Wed, 13 Sep
 2023 18:55:50 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:05 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-8-seanjc@google.com>
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_185551_853051_D7AC877A 
X-CRM114-Status: GOOD (  22.35  )
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
there will be  two kind of memory conversions:

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

Place "struct memory_fault" in a second anonymous union so that filling
memory_fault doesn't clobber state from other yet-to-be-fulfilled exits,
and to provide additional information if KVM does NOT ultimately exit to
userspace with KVM_EXIT_MEMORY_FAULT, e.g. if KVM suppresses (or worse,
loses) the exit, as KVM often suppresses exits for memory failures that
occur when accessing paravirt data structures.  The initial usage for
private memory will be all-or-nothing, but other features such as the
proposed "userfault on missing mappings" support will use
KVM_EXIT_MEMORY_FAULT for potentially _all_ guest memory accesses, i.e.
will run afoul of KVM's various quirks.

Use bit 3 for flagging private memory so that KVM can use bits 0-2 for
capturing RWX behavior if/when userspace needs such information.

Note!  To allow for future possibilities where KVM reports
KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
perspective), not '0'!  Due to historical baggage within KVM, exiting to
userspace with '0' from deep callstacks, e.g. in emulation paths, is
infeasible as doing so would require a near-complete overhaul of KVM,
whereas KVM already propagates -errno return codes to userspace even when
the -errno originated in a low level helper.

Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
Cc: Anish Moorthy <amoorthy@google.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 24 ++++++++++++++++++++++++
 include/linux/kvm_host.h       | 15 +++++++++++++++
 include/uapi/linux/kvm.h       | 24 ++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 21a7578142a1..e28a13439a95 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6702,6 +6702,30 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
+
+KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
+could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
+guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
+describes properties of the faulting access that are likely pertinent:
+
+ - KVM_MEMORY_EXIT_FLAG_PRIVATE - When set, indicates the memory fault occurred
+   on a private memory access.  When clear, indicates the fault occurred on a
+   shared access.
+
+Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
+accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
+or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
+kvm_run.exit_reason is stale/undefined for all other error numbers.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4e741ff27af3..d8c6ce6c8211 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2327,4 +2327,19 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size,
+						 bool is_write, bool is_exec,
+						 bool is_private)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	vcpu->run->memory_fault.gpa = gpa;
+	vcpu->run->memory_fault.size = size;
+
+	/* RWX flags are not (yet) defined or communicated to userspace. */
+	vcpu->run->memory_fault.flags = 0;
+	if (is_private)
+		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index bd1abe067f28..d2d913acf0df 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -274,6 +274,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_MEMORY_FAULT     38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -541,6 +542,29 @@ struct kvm_run {
 		struct kvm_sync_regs regs;
 		char padding[SYNC_REGS_SIZE_BYTES];
 	} s;
+
+	/*
+	 * This second exit union holds structs for exit types which may be
+	 * triggered after KVM has already initiated a different exit, or which
+	 * may be ultimately dropped by KVM.
+	 *
+	 * For example, because of limitations in KVM's uAPI, KVM x86 can
+	 * generate a memory fault exit an MMIO exit is initiated (exit_reason
+	 * and kvm_run.mmio are filled).  And conversely, KVM often disables
+	 * paravirt features if a memory fault occurs when accessing paravirt
+	 * data instead of reporting the error to userspace.
+	 */
+	union {
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
+		/* Fix the size of the union. */
+		char padding2[256];
+	};
 };
 
 /* for KVM_REGISTER_COALESCED_MMIO / KVM_UNREGISTER_COALESCED_MMIO */
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F2C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tHdkjdP0BNL39sca9JjPyEp6ntaRs+mJIA1XX0w99g=; b=AiIxVRrO89jytv
	gCS3uAcR5j9HqOPZhR/EAFRALNK4gSzFNelNXFLPZkXI4LMm0R8Kkg5Lk0dpjt3TYdH+z5kaiEsu+
	ZdmEoik/UpBXiO7GHfPiQQXkJJEpM+dRKVTZ7YrfNYrTZb4A5hYR214VjhYY87+uphV116aFFObR8
	SKQQAffvDkjdlc6sAUJ0Q7aweoJLNxD4RJE6U6Cg35Gg3OXQqg73jLvenfEZofyZFU7O8jNMZiZ7C
	GozW6bQXZLRKPunwSByJzbTxAV9S3G9voAua8ZeKZgto6UEhiV1tHbnGAQLyogsGkTlAH8yJH/yDZ
	Z7KN8y0RVNhK1VXhBiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzdz-005FnE-1C;
	Wed, 19 Jul 2023 05:22:36 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzc3-005Dg5-0b
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YutdMElGbp9P5hSkuCpmC8VJ7V3PNb+s/AjU6M3aOE8=; b=NtFduibDCBKfidCQaLkAvQir78
	gsMwOMCLymBBxAiiYqNmxiUbf1N0zQT3osNGQfBM+B0mmqtgxxrvppbuQaYsvhIHvR+bkwTTZDUPp
	mge1OAwOJpaPvze+Qa51eBvstYEByLT7JGklnjv3XSxJ8zvEIAqXB4na90OqROPnGgEt57qk8nA9U
	xkj5jRMEuZnOk8tV0Oup0sVIboa2jQ5HEzUoNUb79Sjt+3wWpxVQYK3+Cso7MB89iGPa1dHCgFWzB
	fp2p0fFQqlCA8RUZEXjIwRp+K9Qd+7/dUHvCHj8WYfEBt48hcbOk5O5K76HlcpJ6BifKPL/S4njx2
	T75hZVwQ==;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuRy-005QdJ-V6
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:49:54 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-bd69bb4507eso6077887276.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724125; x=1692316125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YutdMElGbp9P5hSkuCpmC8VJ7V3PNb+s/AjU6M3aOE8=;
        b=fv5PAifQ+IqLg5YCZqVv/8UfhbcgYKQcYF3VY0+jp+9AW0GEauEM9c/l2th/BfOtRm
         CQiXDrdFVD2W7gdnkrgGNuk1FWqnXZCui5KNHEJZNKFbYGE3o6y6cS/CRv3k2n8pR5iS
         sMPjf4zdwa9albkzvFhGKioR2FBoJS58rCVLaVO5jIXG18PShPMZQfFotlM0oiS44ak5
         wH72KK42j+tXvl9XbOo8Q688HudYyAAS7uwccxs/g6IQguY5eI+gDO5TZMYBuh3X4bOG
         jik8MJDjJL4Dv3zLF48fb1grV3qG4y91bzqSazr3bySPVvnzIDpkEov2LrTDdj61DR8b
         pWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724125; x=1692316125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YutdMElGbp9P5hSkuCpmC8VJ7V3PNb+s/AjU6M3aOE8=;
        b=Ty3EtMgzm/rmWBLWy2t/+F6of+7LNVe30EEXEgVdKFXP/dKpneSIsWYKNn1xbG6alM
         QeZfAdIkB3iQYZ0Szu0bwj2rXcCDOcpg3Tp1PLGcxxqXZzwMjxifwm1JGWDbv7uPGDYw
         YWEYQguBnpML/JpDBKQu9RXbRrOcHhGqireQblvMPZPUmlAqJaRscsZN1/ngGjE92lEO
         Gr0Cd+2s5I8VZDqDq3moRebUWcaRXWLh9q87Wg25iAxdp4RM6myPE5EM4DnZOU8+sgvr
         ISybVq39nT3FSEWRPsKVWTioE/0zu95vEO5ZaMbjVe3hI569K+KZk3IX4l+4IusibsXI
         78rg==
X-Gm-Message-State: ABy/qLaCXllLfbgLCNQKClWFOlHhmWZmhSxBfOPYJ4ZcNMa6J589wvFb
	b/oBwj4v5ReWVWNXJz5E6betl3Mm3eM=
X-Google-Smtp-Source: APBJJlEBqRkJLxPhHZfq9dzn/bDkdLKPNX43lLfClkxec0b9fruWECEDkqvu4RpyrQH11Geekj2aMuiEVrw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab04:0:b0:bfe:ea69:91b4 with SMTP id
 u4-20020a25ab04000000b00bfeea6991b4mr11891ybi.4.1689724125035; Tue, 18 Jul
 2023 16:48:45 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:50 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-8-seanjc@google.com>
Subject: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
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
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004951_035542_D63F39C6 
X-CRM114-Status: GOOD (  14.99  )
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

This new KVM exit allows userspace to handle memory-related errors. It
indicates an error happens in KVM at guest memory range [gpa, gpa+size).
The flags includes additional information for userspace to handle the
error. Currently bit 0 is defined as 'private memory' where '1'
indicates error happens due to private memory access and '0' indicates
error happens due to shared memory access.

When private memory is enabled, this new exit will be used for KVM to
exit to userspace for shared <-> private memory conversion in memory
encryption usage. In such usage, typically there are two kind of memory
conversions:
  - explicit conversion: happens when guest explicitly calls into KVM
    to map a range (as private or shared), KVM then exits to userspace
    to perform the map/unmap operations.
  - implicit conversion: happens in KVM page fault handler where KVM
    exits to userspace for an implicit conversion when the page is in a
    different state than requested (private or shared).

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
 include/uapi/linux/kvm.h       |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..34d4ce66e0c8 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6700,6 +6700,28 @@ array field represents return values. The userspace should update the return
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
+If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the VCPU has
+encountered a memory error which is not handled by KVM kernel module and
+userspace may choose to handle it. The 'flags' field indicates the memory
+properties of the exit.
+
+ - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
+   private memory access when the bit is set. Otherwise the memory error is
+   caused by shared memory access when the bit is clear.
+
+'gpa' and 'size' indicate the memory range the error occurs at. The userspace
+may handle the error and return to KVM to retry the previous memory access.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 4d4b3de8ac55..6c6ed214b6ac 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -274,6 +274,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_MEMORY_FAULT     38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -520,6 +521,13 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

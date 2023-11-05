Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E88C4167D
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaZpCDT/H+kLoGWRsY6dVzgV3n9SrfC/q0JBVZaimWs=; b=lBRrV94DrJcH/8
	tLCMTGJzKA4wm92lFCcJoWFPfkPauoeVLHk+1KEjt3PVTLOqJtJFITqEQaywKw4cimtw6JPjjde5j
	/MFljpvI0gb//wB37puhI1H50XyFfnUfvm+dr7hjCuIfxlIpiREWjDc2v57ik6cZneWB7cbKf+yfQ
	iaennMftb6N4EiJ6gpJfc70tvVGophgSTciSAqV7poc2CuuuCd3Tni9AAV/N8nh8M6C9PjN6qrv2f
	TZj+AHX4KGm+JsdgOxIhhcqT1+Xhc8YDWHFqm+DecovOKreeBUuAlC01ZlIPHkXGilBc8Nm+3BNPM
	p6AB2BUJZ+5UoN6go79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzg31-00FCKY-2b;
	Sun, 05 Nov 2023 16:32:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzg2v-00FCE5-3A
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 16:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HA/0qlddwB/Ianc+C+SgAnxyAa2CPM4kBi/D5Rz4zbg=;
	b=XvfHsb/M6jXaW27xVKUpM4X1kUTdZC3Dg/XCMZHPYGopIRtY8I8/lBqkCAiJkJSYwlT6rZ
	2GR7LuQStIZJNfVbs1O7FEr2LxO/d52uhkUjRTz1fPJcXRNASsL+vUN7BSFUQglFroFa2r
	DP6XB4KLz9yVBzds61LIFZtMC0ECN4E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-72kpnCeGOiu5-RIGXt4MOA-1; Sun,
 05 Nov 2023 11:32:17 -0500
X-MC-Unique: 72kpnCeGOiu5-RIGXt4MOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 948A638117F2;
	Sun,  5 Nov 2023 16:32:15 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC2962166B26;
	Sun,  5 Nov 2023 16:32:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	David Matlack <dmatlack@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>,
	Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 11/34] KVM: Drop .on_unlock() mmu_notifier hook
Date: Sun,  5 Nov 2023 17:30:14 +0100
Message-ID: <20231105163040.14904-12-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_083222_109803_0CB7BF33 
X-CRM114-Status: GOOD (  11.75  )
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

From: Sean Christopherson <seanjc@google.com>

Drop the .on_unlock() mmu_notifer hook now that it's no longer used for
notifying arch code that memory has been reclaimed.  Adding .on_unlock()
and invoking it *after* dropping mmu_lock was a terrible idea, as doing so
resulted in .on_lock() and .on_unlock() having divergent and asymmetric
behavior, and set future developers up for failure, i.e. all but asked for
bugs where KVM relied on using .on_unlock() to try to run a callback while
holding mmu_lock.

Opportunistically add a lockdep assertion in kvm_mmu_invalidate_end() to
guard against future bugs of this nature.

Reported-by: Isaku Yamahata <isaku.yamahata@intel.com>
Link: https://lore.kernel.org/all/20230802203119.GB2021422@ls.amr.corp.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Message-Id: <20231027182217.3615211-12-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e18a7f152c0b..7f3291dec7a6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -544,7 +544,6 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
 typedef void (*on_lock_fn_t)(struct kvm *kvm);
-typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
 struct kvm_mmu_notifier_range {
 	/*
@@ -556,7 +555,6 @@ struct kvm_mmu_notifier_range {
 	union kvm_mmu_notifier_arg arg;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
-	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
 	bool may_block;
 };
@@ -663,11 +661,8 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (r.found_memslot) {
+	if (r.found_memslot)
 		KVM_MMU_UNLOCK(kvm);
-		if (!IS_KVM_NULL_FN(range->on_unlock))
-			range->on_unlock(kvm);
-	}
 
 	srcu_read_unlock(&kvm->srcu, idx);
 
@@ -687,7 +682,6 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.arg		= arg,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
 	};
@@ -706,7 +700,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.end		= end,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
 	};
@@ -813,7 +806,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -891,7 +883,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
-- 
2.39.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

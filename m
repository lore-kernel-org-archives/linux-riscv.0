Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I8pkXkYdo5JSapN3ijWB6tfHnBXeCjlPWK+SOWhH5Q=; b=ysJEc3DXgzMmid
	Pbl1j4AkUTkHx691B5LZOJWkyFfWGvcIGET2Soat4Yh0owsYckzfPR2N4eLzIMb6Kp6+8T6supKkJ
	/KC+Ij/g5ZBOLf0IPBI1KKFcdjYqN0tKzLX1hngf8IPKqu5XDmGHg/fe/62MTiyIxJnWqiBP+bcjn
	F+oUXChUgt2p0FZWXwiTAzo1T/4jQa4tQvHGdo5IQl7Y6XtmXU9Dp/JcOWduwRSQCG4EqUZo/Lb2U
	wXEtKb1YI03KpJFDGFsbR6OFyKzw+Uf8G1V88T+5lUuosspZySx85oDzgCI/XWdF1VMR6+zeqeszL
	rp/JGYueVt+Cnx7VqtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzg1q-00FBA2-2Z;
	Sun, 05 Nov 2023 16:31:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzg1n-00FB6m-1y
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 16:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l34ekIngaKcFhf0rhv3qmzlwWTTBwpnOE8ik/JX6oMg=;
	b=CobIxbsRfhC/1B0bYmEXoabaEW2P+6a/TQiElN4vpSriW3V/IogK5+IfmIhZg4CG/W55Qr
	4Ohb9mll+GC1gKrkhGf/H935N+JXmsvZVdU3bwdaNFzjuI2xXAIgjFqI5/n4cAGQRtsgOa
	6FbgX+o6xaC30bcnGlwc3FHDNZr9dZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ILi5kzQvOwag3AnT1pmDQg-1; Sun, 05 Nov 2023 11:31:06 -0500
X-MC-Unique: ILi5kzQvOwag3AnT1pmDQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93FA9810FC0;
	Sun,  5 Nov 2023 16:31:04 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE452166B26;
	Sun,  5 Nov 2023 16:30:57 +0000 (UTC)
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
Subject: [PATCH 02/34] KVM: Assert that mmu_invalidate_in_progress *never* goes negative
Date: Sun,  5 Nov 2023 17:30:05 +0100
Message-ID: <20231105163040.14904-3-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_083111_717951_324A6202 
X-CRM114-Status: GOOD (  12.08  )
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

Move the assertion on the in-progress invalidation count from the primary
MMU's notifier path to KVM's common notification path, i.e. assert that
the count doesn't go negative even when the invalidation is coming from
KVM itself.

Opportunistically convert the assertion to a KVM_BUG_ON(), i.e. kill only
the affected VM, not the entire kernel.  A corrupted count is fatal to the
VM, e.g. the non-zero (negative) count will cause mmu_invalidate_retry()
to block any and all attempts to install new mappings.  But it's far from
guaranteed that an end() without a start() is fatal or even problematic to
anything other than the target VM, e.g. the underlying bug could simply be
a duplicate call to end().  And it's much more likely that a missed
invalidation, i.e. a potential use-after-free, would manifest as no
notification whatsoever, not an end() without a start().

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Message-Id: <20231027182217.3615211-3-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0524933856d4..5a97e6c7d9c2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -833,6 +833,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
 	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
 	 */
 	kvm->mmu_invalidate_in_progress--;
+	KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
 }
 
 static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
@@ -863,8 +864,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	 */
 	if (wake)
 		rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
-
-	BUG_ON(kvm->mmu_invalidate_in_progress < 0);
 }
 
 static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
-- 
2.39.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

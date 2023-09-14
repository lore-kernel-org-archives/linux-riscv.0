Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81725EE0203
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50DDTdVf9gK7JG24wiQCnPGYUSlyNoLTivZGwzxtbZY=; b=DU6ZkEGeK4/gXR
	y2ITHmt9r9FSriuLOEX9MYvknRGRBRiDWiwVxfnI6Mm/3QnGlLByHsn4sG8qAxvMZ4g9A76gz610K
	i2j5/1GhsQNrONWlkG/XIS/JBv6tAct6Ld0a3WnUYXFskE8b3KrxMK5Wmf+20OAONFj3KacaFCgL3
	H1sYLuhL+bjsZnFTq9O1/JreNNCEXUSqVJJh3U18IhYpdIndaOB/kLqm8xQjXnLi+wHUFGxfAMsj1
	jkifdQSoyuSrPFDX4XosucTJEmKZCo9L28WWVrdY2smUeexMVK69L79XWLrja4xs1syB7nvh+w982
	woCfPc65QVEJgggNnfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbbO-0074CF-27;
	Thu, 14 Sep 2023 01:57:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaL-00734D-2Y
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=snuesVO7Pgb0vyCed2d5Ea1z3YHTBEL1EKVJI8LHRYQ=; b=oiqQ1/+F57VXL4p7R+5wCQ+4O1
	ikmcr/CvmHRCO3YjQhx9Jj0HlODlSZNhexQ3Dmi7bOiqBGwy8mGm0lr3f5dh4bzXucMKfy+U3Sjbg
	06vleA+gWVA8OuczN0KgepIzrmZcdbCiRhvdXBUSJSqGBDAJJIzUVYdDKMstWJnc6jEjNllqpVPzV
	rXw1ZJ3GCiEGCeSdgjRJmf5I7lECd+M7ATd642T2HPVb6N4Hi0NH99iCWuPcQN9wH3cl70LplvCZV
	YHU+PU3hIlbVXZE5x5BM0rvkGznBM5RR5vpxwkU3GSBituchaM83YTkbynn27MSxpeE4IqQSVziUE
	REISVk3Q==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaG-007TUx-1H
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:00 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bf681d3d04so3894835ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656554; x=1695261354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=snuesVO7Pgb0vyCed2d5Ea1z3YHTBEL1EKVJI8LHRYQ=;
        b=BBeL6Cqy6u+n7GSFSszaKQgM7gOaUDEMANuVeJF41Em4Zp0hrm4rnqjiAXkaJrPGxB
         WUq28Ve2/EJeAEO7a+gr3qCCzZI5kIk3P4m6qjKDANWC2+TS5pouZgQqdPR4hn6+fnwa
         0/xQm4qVXN6pa6E1qo+HAtkjykv4YD+7Ou364Yj6M6BuPEzu2JzN2sAKbiPw77DzAZCz
         GdZ9egbeaL0oepZ2y/c2XN06wBUoGvG2BoQX11KTIv8iH0SGzq6FUFyLx4wZhEOBsXIX
         qVeH07HGFbujYIhAjAida9xrniBuFd/k/Ix/Mke25/yczKscaSjM2oP7hFKTsePLMG2Z
         PbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656554; x=1695261354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snuesVO7Pgb0vyCed2d5Ea1z3YHTBEL1EKVJI8LHRYQ=;
        b=sQMTn/IgZzk7IOl46pVbiEnc0I9ZP2u6WFYKRMS3UZ25JrW9er39D1bSa1zf1z2G5b
         ehWWi+WViT7bDD1Q5rTjCOkKVM90ZImmGvZmPD4UCC5ZOPQvpxI2NotQxMIg3fkKZXLW
         gXvxfajojXm3OXGRDJnRYZS0fJZ1wCHZKodRwUj6UrlpmAuIifMtwHMtJuoi8iXXmJkN
         yiqu6cSCZ8tD7ikiQM9a1mrOqtTERU2XXhxZBA4chjtNPojoDVQcXB2tdYbZIrv2WNN1
         iFwoAg5VymxjmB8VX6+z6q3YlnIt188SrkFXOlVGnuNUEWjuKPeKnTlwORMwVqTkWoQl
         5OXA==
X-Gm-Message-State: AOJu0YxujUwdasxbIgh3s5cTGmJn4IvWgsmxKA9umlG2QTRvmJ5xA/c4
	9IfS+e+ksXRyk0njxx04VXKB/b/JQ9o=
X-Google-Smtp-Source: AGHT+IGilm0IehJXdYbDJdwfV4Q368JwTuC1tx+vxoEF5ebf3gbFa0uVyGZgeqLtkzJroDu6r4LDVxWZ5mo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:6bca:b0:1b8:80c9:a98e with SMTP id
 m10-20020a1709026bca00b001b880c9a98emr149790plt.13.1694656554156; Wed, 13 Sep
 2023 18:55:54 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:07 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-10-seanjc@google.com>
Subject: [RFC PATCH v12 09/33] KVM: Drop .on_unlock() mmu_notifier hook
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
X-CRM114-CacheID: sfid-20230914_025557_977129_09E50002 
X-CRM114-Status: GOOD (  13.51  )
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

Drop the .on_unlock() mmu_notifer hook now that it's no longer used for
notifying arch code that memory has been reclaimed.  Adding .on_unlock()
and invoking it *after* dropping mmu_lock was a terrible idea, as doing so
resulted in .on_lock() and .on_unlock() having divergent and asymmetric
behavior, and set future developers up for failure, i.e. all but asked for
bugs where KVM relied using .on_unlock() to try to run a callback while
holding mmu_lock.

Opportunistically add a lockdep assertion in kvm_mmu_invalidate_end() to
guard against future bugs of this nature.

Reported-by: Isaku Yamahata <isaku.yamahata@intel.com>
Link: https://lore.kernel.org/all/20230802203119.GB2021422@ls.amr.corp.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 76d01de7838f..174de2789657 100644
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
@@ -811,7 +804,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -856,6 +848,8 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 
 void kvm_mmu_invalidate_end(struct kvm *kvm)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * This sequence increase will notify the kvm page fault that
 	 * the page that is going to be mapped in the spte could have
@@ -887,7 +881,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

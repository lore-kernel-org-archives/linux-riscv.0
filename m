Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6E3C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAaJx6YU21j6Z2d20WHbuhYgGiddEiUYDzIx+blXmYQ=; b=S7rZRHZo+CI3/o
	Lt9SaV5sYCxIErwA/+tOFr2IkswBmUA8w5dAFXIVfdaxA7tb7oHPerA602i9ihfPEJZGC0wsi6KJZ
	8ywKbVry8RgGHsOeXEQdw8WMsHQGYFQolsbjzdSFyMLtdJ5O23fk8KXnWtXLNawhIS/4JsY2Q4G4N
	sDQDuau9zdYHxhXPtBrwL+Zu7s6DqXeNcIVW6a8x5ZdEAQ78UBkGyg2upgpQcw2rd1XtZqPzbXtQu
	GLwt/tTL+1t040WZV2ShZO1TJvjRsK9z5uFJUKoP5dqXPTefFsxT1V1jp7jnUF6pjdhBxRavfMyvU
	Axhuj+87BOavuVxNPGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUo-00Gy0R-0N;
	Fri, 27 Oct 2023 18:23:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTy-00Gx6f-2P
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fLrd3AGy66HdihfPmI58EyyG3FCGELBv0TZMEZAIG4Y=; b=LIso/o9/XtSiSVhNsxOR/G++8c
	x5TfLIZIC9F48GjrL8hj+Tm/9kmYqdx6Pv04s+Q66M+o6FfmsvapkF0ksIrGkN6N0+kgclDueCEBj
	LL1z6XwFMaTRgzNofUgrDULHwlq4J+nA89q6csvdNeaW/jB9jnBc8VcxU3s64AKYTcjWsQD9Qiefu
	yTpTVmIwREySmz0M4VRkhuJ5cNpZgHharOTRuh/Y0RyepVdN+U+q/XnIRphrRtQKM8xvWRcHCbDil
	aNDwx8B53bkym9Rv4QfFwiBNyS/dcdj1gab6ulcJfmwXYuR1FS5JsALv1FniB50niQxSUayueQl7h
	8T0hPirw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwRTv-004swG-12
	for linux-riscv@lists.infradead.org; Fri, 27 Oct 2023 18:22:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc1ddb34ccso9088515ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430967; x=1699035767; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fLrd3AGy66HdihfPmI58EyyG3FCGELBv0TZMEZAIG4Y=;
        b=WiVaRT5kWzgQjaZEyavXyvQughlfYzNLFbT9w2FGTDGIyNKzpoKiJwVmzgPJkGnVht
         K5t6crbFESbZcnlrJFyRfLZalp3fdEy0ZCiPcorQBfGBAYTRxmoJVFdANzA/1AktU/4p
         Db3dhQOVmvxTpDklMCwnbTrXM7XVRpBdjs1I63nq+eZ1uJMRWHUCOIaHChMp3Gt1trcK
         AONx6aGpgMt7XS/swaK5GmtKbQaWID/KIYLkV8apeJ9U/OmbB1oS3A+5mLaZ4+4Vkpjm
         zhU5JGe0b92EnNiji3bca6xW/Spj5xaLyokNQW9rQS2wDULUvgHundVqKEQXLjHgFoMi
         ercw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430967; x=1699035767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLrd3AGy66HdihfPmI58EyyG3FCGELBv0TZMEZAIG4Y=;
        b=N97OsmJXjEGYN1rd5S2D5sxc4fcjseSNQewDJBNpWXGjexndZc8P/QJPLySjS504Zq
         FhiMjkbWeXjP6FlQMWF9b74O3S15CGpCggU9+woqBvvCGzQR59Gj6dhngfkvxDRASfTn
         iOBL0B+Q4UIfxlaNtI0LEQ/iCg4w6F3qb2D7nKHDFR0CSmVf40Iyd3m1vCALOYG4bIrD
         0EBdqDxiffJZLtEsUoQbTdck0z2ebV6wT118naHau2dqSwUFlADPbffMl0Qk0ccKxkgQ
         z78k5mWKIsSClxEIx+oyghUoicRXomcWW4UAaNxhFmyIAU/8hcNR+WQjLmO7Cx7V1QuB
         djfQ==
X-Gm-Message-State: AOJu0YxYLa+D12djcP9eA0vicICMqX5DZVtO9f3JYIQ1rbCKVa84IyIn
	VC2YXu81xFGt+5OHzfcpYcko28Wb1Vw=
X-Google-Smtp-Source: AGHT+IFw7CMiVxkdfLmPKgztX5f1RnQlL4BTlZlVKLxMz6aRVtHUrQY578kvMdkjnRTl6BBw2VS25sQYIRo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ee14:b0:1ca:b952:f5fa with SMTP id
 z20-20020a170902ee1400b001cab952f5famr63161plb.5.1698430967325; Fri, 27 Oct
 2023 11:22:47 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:53 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-12-seanjc@google.com>
Subject: [PATCH v13 11/35] KVM: Drop .on_unlock() mmu_notifier hook
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
X-CRM114-CacheID: sfid-20231027_192251_077697_64B612F5 
X-CRM114-Status: GOOD (  11.69  )
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
bugs where KVM relied on using .on_unlock() to try to run a callback while
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
index 2bc04c8ae1f4..cb9376833c18 100644
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
@@ -858,6 +850,8 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 
 void kvm_mmu_invalidate_end(struct kvm *kvm)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * This sequence increase will notify the kvm page fault that
 	 * the page that is going to be mapped in the spte could have
@@ -889,7 +883,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

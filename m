Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C9EC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jsGEV1XfDPdeicCK81W9LHRIDm3N6vWke10+rjBDDY=; b=R7CKNHmKeIxqU4
	j5+VDxBhj6Q7zmcYEuYFJSThw505LcX6ILsFHhLRqBW2z8RYLsXwHxEXlLY4f8yRsUDqyggPDCDDN
	jgA6g+FVRcqVz9cqMsL2KLRHioBuASwEoKMrscjnnwxZiF+7YAo7vjssYt/btxJRcFuRNNWVN2jJL
	GMhulJvfl0uuEEcPNpoOZqq9An55unMU4d+GzFSEjKILTzsUMAqRsAfXxNCoAaYmU79h2b+AN/gH4
	Fq5tppwCYaJ3FuPekk43p1gst6V5zK6nBHK8MiNOoBDB3exJvBghmzOmuM6VasvFLGdq6d+ZuBhY9
	3WRB9JnwLs+oKzjfibIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVLR-00000005jPH-44j7;
	Sat, 27 Jul 2024 00:31:33 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmJ-00000005RIV-3eEw
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:19 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b2af9de57so405448276.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038114; x=1722642914; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zSysp7FPh6wn+DolRHFxx8ZAZJRhLuISfWWp3RFo0OA=;
        b=bFBdxJbz8zF+GJFvTDYh9eVPDUVSda/GfCCST9csdNxQQxzBdwbva5JYAKcVSrTMnI
         ufZ73/DYJreWAXng3swmgSIOH5v1Uw6NTrn+5w64UzAFXTZZCQjA+QlNrNMj4odse/A4
         oNPWXr1IUvQls2f3EGd1ZBBwMSuPzp3s47ID9xcb0rRzaQpgIVQvJBlZ/de8qVdJ63hx
         cJk1ExiybQiRFQByG/v0vzSfiEg5lnPw34EcKWFkkcKL+ws77ZYzxAfM8cPm1RkzYLt8
         iQHu3fcAVmw6Ksv+NS/ShB2qxN4AN0sCEIaP7e0Sq39MTefp24nF0RyvPlkGM5eEYDfW
         u10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038114; x=1722642914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSysp7FPh6wn+DolRHFxx8ZAZJRhLuISfWWp3RFo0OA=;
        b=QtK84+iIdmw1sLKoPoMnWwa9eaPZ1jRaU0wAgPh7JhzIG1x+iYCOgIkACk6L/EYlHW
         hKHWBOR+E5UedTteLkAgie18NoU+x1URSJSFaC7h6lMs2TANsAK01NxJVWn+Jv9ru9P3
         i/qS9dNl2pg4f2tsNuKVfDm+kqekkBnvvVxn55QyiUzOo/73BwtgEJJmBbgdIR4B/prq
         R+Lg/pzyhzBHIvXmHMjRwFKUrSq2eZdxfUilH9bfSoiXGD7sHUYa9uM6TIg+IppsZG2x
         415emz7vXlTHaBO1drXA5GHmLKyBzBNXqrdtOkdFJfABYU4PJmePTMARkGOX8I5sYjsf
         AkXA==
X-Forwarded-Encrypted: i=1; AJvYcCX2UZBSN8omYbuYzejG+Nl1f/eYPNU3o4Q3zicBxi4LxpLTE4kK4yYEsbmcZG4y5jJ0dv+/JmXzB8NrmeiciBPyugzQyWlHzABfA8F/zR8T
X-Gm-Message-State: AOJu0YyO/C0FGuzrAFUnOmS5tLugD8Z9t3HGnBbioG9AKdEgpMX63reX
	loW+RjYHBb+sJ1zCj1HJcfNtCFroF580WBm8Gnf0LmU1z/BtzwvhxSztCcwm0r2XSEILsleWHwk
	zpQ==
X-Google-Smtp-Source: AGHT+IHtdYLzf8VxCow9ze9t5PB7b90MwNFbCURT1XZzWgwcWEIftZd8Pqph9MK+hSFYPsX4JKQKNB1AEe8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1889:b0:dfb:1147:cbaa with SMTP id
 3f1490d57ef6-e0b5459b0b9mr34694276.10.1722038113838; Fri, 26 Jul 2024
 16:55:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:24 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-76-seanjc@google.com>
Subject: [PATCH v12 75/84] KVM: Add support for read-only usage of gfn_to_page()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165516_004759_B1DC9C01 
X-CRM114-Status: GOOD (  14.41  )
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

Rework gfn_to_page() to support read-only accesses so that it can be used
by arm64 to get MTE tags out of guest memory.

Opportunistically rewrite the comment to be even more stern about using
gfn_to_page(), as there are very few scenarios where requiring a struct
page is actually the right thing to do (though there are such scenarios).
Add a FIXME to call out that KVM probably should be pinning pages, not
just getting pages.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  7 ++++++-
 virt/kvm/kvm_main.c      | 15 ++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 91341cdc6562..f2d3c3c436cc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1198,7 +1198,12 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
 
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write);
+static inline struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+{
+	return __gfn_to_page(kvm, gfn, true);
+}
+
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d0f55a6ecb31..16bc3ac3ff84 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3174,25 +3174,26 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
 
 /*
- * Do not use this helper unless you are absolutely certain the gfn _must_ be
- * backed by 'struct page'.  A valid example is if the backing memslot is
- * controlled by KVM.  Note, if the returned page is valid, it's refcount has
- * been elevated by gfn_to_pfn().
+ * Don't use this API unless you are absolutely, positively certain that KVM
+ * needs to get a struct page, e.g. to pin the page for firmware DMA.
+ *
+ * FIXME: Users of this API likely need to FOLL_PIN the page, not just elevate
+ *	  its refcount.
  */
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write)
 {
 	struct page *refcounted_page = NULL;
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = write ? FOLL_WRITE : 0,
 		.refcounted_page = &refcounted_page,
 	};
 
 	(void)kvm_follow_pfn(&kfp);
 	return refcounted_page;
 }
-EXPORT_SYMBOL_GPL(gfn_to_page);
+EXPORT_SYMBOL_GPL(__gfn_to_page);
 
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 		   bool writable)
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

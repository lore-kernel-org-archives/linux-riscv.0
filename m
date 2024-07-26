Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23816C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EgRM656VuqrlQ/3vdH0xez3GE48BEZXR9hFIVENJFk=; b=jAD7W0isGyFYKa
	lFkmB6hJVc5MxDLi5nCL4TJE/rxJgyQbkbk7k7bVSKgEMJssn+MO2byEw3J8a/tL2iHg5gDYFNaH6
	90XT3QhozVo7sEkoxeuZ4Rp6xwNJ+acnJOq33/65jtbQeqmE2HZP6puJE3sxah8VzN9NqUAMIrMQ9
	Q4kAOTH8JhITMt9cZO73avl0l/rBYM99zMoVZJmX6W7LBx9BqL+6SQVHQ4cKzT8toee/PY+hN2MhR
	q+k1CpwHeJgrgQAvPzgiKZ7C8lZRM51n4YZn5tROb0Mjg7kF67pD/aJxry3+CdhJv8tJVtSkxVD5E
	f/i7hZDaww5dtcM1eXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVBc-00000005eY4-13MC;
	Sat, 27 Jul 2024 00:21:24 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlY-00000005Qc1-0Xar
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:32 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d1a9bad5dso1374483b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038067; x=1722642867; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zSr/S7cQW+jg6+5Yur5d69GSxQ0D+3E/XB18qDPP3eA=;
        b=Yn2ggu6BQKcMFB9DloD1NFvFA9WT1o9AlWGknyXfGwG66zrtNAvRhYE2xZMC0UhBNd
         Hfdz0YWI9rVcQXoycJxQmWwG8+QUP5MvwQTECGM0HuaAYE2ZWQ3cfgjV+iKj4NSwp4gc
         ng2LYUanNE8VfqgI3cJkwp14zLswAmvuRvpupZkkZO463l8z5Fg0unzetH1RzAOe02rQ
         H8rYQl9WExMEn+zdhXxOQTnIfBnpRBgm3HXmXSMNs7IECkK5jHNRv0hHamL+4SXPlYlc
         AdV4NxIUVIpTd4NF5g+jOmVmzA8JYHkUWPQgQR/3GqZI6soPGtrozOd0sMWpRgvGm+6D
         Ydlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038067; x=1722642867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSr/S7cQW+jg6+5Yur5d69GSxQ0D+3E/XB18qDPP3eA=;
        b=KnbFC2Dul7C4ai2uiCS3B9Tbld8afXfkYqcF1k2FvST1TdJ5bEWa+7CGAOW6iTEbKU
         wkte37NbYkRrkpYUMNMkLC8uLrrytjBjzmnHibignix6Uk3pmdIg4GWEewh3VvMN/bRJ
         gUfZCHhzPuIf1SAtNM1p6UgcO99hhajjNikHu3+9yApAOpEyWc9NZU7TXVdQajMopZmG
         5PPY1ys7Aa1IcKu0SZMDjSTb92VUnPavRGCkgkFmxcA7YaTixE6tHMO6LInx9rb01S0w
         nDH3lKi2kNFm1wd8/P6KPIzJ3zsWEfnP2IL8JIRAGQDnHcaZbMW0eTxX7STGj2VH6mQp
         wdhg==
X-Forwarded-Encrypted: i=1; AJvYcCUoBgQBu/ZPzC+fsuNv+5tx2QJu9lo4VzP7zplL+n/PZdgH9OCvOOsQWWW+uBUzgW+5v3sgQT1n9M7IO+gqhlvCBhX0HP/AmUZbkuQCtL7g
X-Gm-Message-State: AOJu0YyAwXhWDH7Jw8xUZV0yiUc2hff3nh2aOu5qJNfSZi8Dt/OZ1p2F
	qsa6X3o8htfIWt9w1zL3JlQdgNlIXN0g9evW7oDmV5EKNDPT/TfKJvqrcRFYulm/ZjvS1jhUR+o
	fjA==
X-Google-Smtp-Source: AGHT+IEvvOLEi17q5BnKGFU80vyNCkxL+K4ME2VW/zA0UgmW3Jn60esm+Gg/1wQhRB2++SmF9ZjJ4yJ/TXU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:238d:b0:70e:98e2:fdae with SMTP id
 d2e1a72fcca58-70ecee6db73mr19809b3a.0.1722038066705; Fri, 26 Jul 2024
 16:54:26 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:02 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-54-seanjc@google.com>
Subject: [PATCH v12 53/84] KVM: PPC: e500: Use __kvm_faultin_pfn() to handle
 page faults
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
X-CRM114-CacheID: sfid-20240726_165428_309118_7A9E6ACC 
X-CRM114-Status: GOOD (  12.06  )
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

Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
and continue the inexorable march towards the demise of
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 334dd96f8081..e5a145b578a4 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -322,6 +322,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 {
 	struct kvm_memory_slot *slot;
 	unsigned long pfn = 0; /* silence GCC warning */
+	struct page *page = NULL;
 	unsigned long hva;
 	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
@@ -443,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -488,8 +489,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-	if (writable)
-		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
@@ -498,8 +497,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	/* Drop refcount on page, so that mmu notifiers can clear it */
-	kvm_release_pfn_clean(pfn);
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

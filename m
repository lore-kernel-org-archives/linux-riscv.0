Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CB1D24454
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLzJht7NpGvV8rI508iLgvyDdSmfvsn8YAHHxH84ie8=; b=UpbNQPgiGf3cyV
	6LpVZN5lojL4IcX+zvsRC2GShJuQeGwnrA0qasTMA+OwSkYuM8/Md2f3KiNzMXz+dqh9KJXYauOhL
	CP+xoHzq1JAT6HTJbmcEZOTdiBNzmNtDZVvw8YjNW4Y2Zu6Dltxlbearsll2lhrHIpeuS0fYtJyww
	aCXZE0Glm9gpYOwEde1otjMQjRWrDRzuF8FIusZvderABsGYb7zhLNlWu13KmJWZZZQfSs/GCmYSx
	U9WXy+b/oBuZzS9vwHkp6UVty5yHJAjzzPvy2hHT9V4Z835Lo9BLm6oPc5611YEURwLaoakqJGj2j
	RaqgJq3g+0EAU+/no3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0zQ-0000000ESXY-0OmA;
	Thu, 10 Oct 2024 21:46:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsN-0000000DrKM-1oYQ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:05 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290b8b69f8so2139789276.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584822; x=1729189622; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=AFXrQf91aXR1KTzaINYKc11bKcpAL/FBJRU5jqINr+Nhzi0EHvlki0oC9dCnjEGnWx
         0zVm9mSBj2AcgW4LR34T//6/HY2HcASslxa2iNw7wwXCbTgZ8oxdMI635Z5mVbucf5i8
         v2DE+6sqEAB9v5KGBcqRVR6xzDXFBq5pkHblKYkHjr3+BtsbZCDKCmyrCZD1LW0IdcUM
         1pD9rayn4EnfsTjku1tz91kdoDjX74SAWAwF9d2bm028TG3RB/P064MIKeodw8ez2JK+
         zBjIC/kVsK1IkoUFRaArozf068vnlLw74GKO4rSiTlL8f/D9lFwS307IYBCFbQOTHiVU
         JxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584822; x=1729189622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=SV4ar1Q+0LKmeEJh6wt8jAcJzGi+toaxdKpGhcmL9zouJocc+jOryZ9JzzNIHRiJze
         t58WQrszkdbRjwOinFsdmgwUplDZ03WagUXCGLi5xn1sW4fbtRMkqIAJukLoVazgJLkU
         cuiCQG1q2UZNKskhGMGIOzEauSsWiCSgFlraNt+lkpjn1sozRK+ABnIOsiL52n5LwAUO
         qTKm7G4x1vbLVWWLPleaJQ1x+32K2EIgwpcrnKgZ65fz5D1JaGYjefp8VK+W8kpQ43El
         mkfHxUXthZrqyd0P3PZKHiU2uiMBvbaTdWrS1aVzfKOUS178ZdRGja9WPtTF9GDchlP4
         X+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWfiNZP/GznYR2nU20QNE1HKkaY1iJupVXWNByF8T2Yu+Gm/CBfRe1d2uZangtpBTREHB8iQbVLtGRbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX/826cEwC0PKcyAlMIykeQBaw9jCoY1zjiEPvU3+SeMJ/NHzK
	Yb/7haPXDdCJrDFUCdAIUH0R+EYnxlNC+p3caGXq+wojAddkObc/6id7A+rbGHQQOaovyge9w3b
	hlA==
X-Google-Smtp-Source: AGHT+IFyzgxXPfejJoY0SZCQ3T+Vo8hzb1HJlB5l94FFDfZID39IeT9MHN/ZgR4beqIvxQ/gO8qC3c4Qafk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4ac:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e28fe4426b8mr4979276.9.1728584821558; Thu, 10 Oct 2024 11:27:01
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:03 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-62-seanjc@google.com>
Subject: [PATCH v13 61/85] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s Radix
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112703_564754_90B32420 
X-CRM114-Status: GOOD (  12.96  )
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

Replace Book3s Radix's homebrewed (read: copy+pasted) fault-in logic with
__kvm_faultin_pfn(), which functionally does pretty much the exact same
thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 29 +++++---------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 8304b6f8fe45..14891d0a3b73 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -829,40 +829,21 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	unsigned long mmu_seq;
 	unsigned long hva, gfn = gpa >> PAGE_SHIFT;
 	bool upgrade_write = false;
-	bool *upgrade_p = &upgrade_write;
 	pte_t pte, *ptep;
 	unsigned int shift, level;
 	int ret;
 	bool large_enable;
+	kvm_pfn_t pfn;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
 	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		upgrade_write = true;
-	} else {
-		unsigned long pfn;
-
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
-	}
+	pfn = __kvm_faultin_pfn(memslot, gfn, writing ? FOLL_WRITE : 0,
+				&upgrade_write, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

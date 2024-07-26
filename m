Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6027C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLyb2GJzIdg1pcVFMefjTkPt9hxYfUVUmSxLtAGlHAc=; b=oe6DQaX/JXp+Qz
	yyAuFg6EAMegIw2QzXgNW/UJ5r9gqv5j5G/puaPNqAfi5NBUle7qicwqTvD1F1g1qf/XF++Uxn4Xi
	YqqbCHUHxyYmR1rJc1GoU7uiZCd7tI0DOEd1PWjNjC0H4nNFQLnMmvTCGdZTHQXCUhsxAlv4isogX
	67rTiCHxrHH4RCF1zU2G1szAgARHgC3Z4b2etBugc1ikVy1iGQ8GuzXWCz0qdyBojs7x/JrDpO9Y+
	5Rm0PJ3vpw5cvuE1ByLMYV4ybIB9F9d3wFyIjtPnYgrJnqojDT2oJlmsNPIL6iZNAeO0bB0rf2W+9
	XNJ0RDhWyiqAk/ZdTBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVEj-00000005gCH-3ZUQ;
	Sat, 27 Jul 2024 00:24:37 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlo-00000005Qp3-413D
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso434384276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038083; x=1722642883; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6xYXr8Us14FXXKODtWRB0Ht9lxWZb28t4tAXkZ5fXOk=;
        b=WzmDaC20mfV/JEaz5zEA97NXbkZnXiX9MHnJ2J1GXX2Pur0iJha5Tc7/fNVKvGzQ/7
         QZpSn4v38PEJUZWLeiQVyAhgWA9kNpJWfCkcVmZ+Tx5+YpsIxpF9zdCMkV+jlNFwQep9
         zDHQ3t5ebywROlZ3waUBUzh/uj2ORPajdyRb75AL5u+i3y5mg4eYqHclXwMMV6Mv120g
         BoRWbn55aN0MxsAT/bhup79INbZGvCvkNm2zfAYgMB5tkXU0/tgSzPZJuEYY9wrNGpHF
         UgvknPaOG9vPznhJBS+OfQIzD7tMWE2hwV2HZ6kEMVomGHrDwaYdXg25iPdRCF0j/ric
         kfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038083; x=1722642883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xYXr8Us14FXXKODtWRB0Ht9lxWZb28t4tAXkZ5fXOk=;
        b=WNlv2bLzXhU2zaQ7zz/rC2yivUXLnR3rgA7ndU86Y+YB3RgrlZsZ3m4HFZErQvDNnb
         RkLJJz2XhlxegmZKUUqPFn4B7KvGTLavUUZqqtlbtBoL7gO32GYxzzj8fzU33WmGrjwH
         OK48jAXXjYGJMcSVNCQ1Ja25116Ca9Emhfk6WCuqfydGcPLlNfg6UBAOuaJFhkT7iQYp
         POj6j/FePvjoJ9c/OuevyUMVgIcspLRwfMjbW8mmfIqEWEmaxzBzKHzDIMfyncpsNJp0
         wZVrA2KEGPBFq+eHHCeQVhJkNIn1N0s4hQ1nkYd4iT5YH3DuD5DtbqvcqBLebMSsdhPF
         5FoA==
X-Forwarded-Encrypted: i=1; AJvYcCU9evcpvvMOx9XL0AvRMF/IU2xCYyNLMoNNduL1le4QRBW0Xu3Hk7fPC4sylQ4V2IcJkdIlLDbmHtaAdFkfl6iqm3VjYM/BSwWfGj9wU4SQ
X-Gm-Message-State: AOJu0YwLj+lY54nhGLos06sxiNYCwRsS1DmsrK/hy1zLD+gjGL9sNrFR
	d0l8HOTjpqdRezr1NDmV4G+4sv5vR4fVpGtIRIFcDrfxrpUT06V3M/zqJHeogjvxMZ4HzeZ1+U9
	Ruw==
X-Google-Smtp-Source: AGHT+IE8wacjAGm1xSlUK/1K8X0GxeW+L1fXTQ/Y1AQI/5HhDGzzQTYAcJk3V2f1As7zQmLQNuyAyAYHMio=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:8c02:0:b0:e05:f1ad:a139 with SMTP id
 3f1490d57ef6-e0b545c6203mr2068276.11.1722038082801; Fri, 26 Jul 2024 16:54:42
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:09 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-61-seanjc@google.com>
Subject: [PATCH v12 60/84] KVM: PPC: Use __kvm_faultin_pfn() to handle page
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165445_092247_F5478BC5 
X-CRM114-Status: GOOD (  13.25  )
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
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

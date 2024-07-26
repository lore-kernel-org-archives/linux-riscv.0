Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36FC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIGnydocciEt0HrFHiWwBV7sTXa0g/i/WZvRYg5psxk=; b=pTx/8s5+Gkbtbu
	pX4hu8o4dbuakMoXHkgOJwf5FU/vZ0JDMWMMNq5sqxB4Gh4rbT10IwzBRFiWoU3bX3OTjOrVF7khi
	6HdqWQEROI1B3lTgQeKIz8fiNiFWibGM0O6z2Lig7+hcI/tTdPrvGdAZHSDApqLHek8Bm/D75Q3ld
	whow7WnUU5UDHPd39LAoFdNUvY8P1DW8IbLjP2yhgThAWxS6TX6LjIEClgjibjmqK4bg50rGQt4db
	DpE1dZpzwLuB5oEmhk2ryKxXx0U1aeVQuS0lqoaIy3Nom4N7e79sda369RveL41zR9bR0vOT1hySd
	QqRglVrXSKDF8L9WuDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUqC-00000005TTz-1Mza;
	Fri, 26 Jul 2024 23:59:16 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkH-00000005PUo-2vXy
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:12 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7a134fd9261so1530377a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037988; x=1722642788; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XEii1g2QxUcfpOdmeEwY4J2sYQAHz7s0WQ4Z9lEf4mM=;
        b=Vw4SOUvRPhx9UHeT2LuztaHfmzfGs7YO8zyT6KABD4iQAWZH0+tOnItfSNk+0u5MK9
         pNrLAgAIvTgF3DftiER021PIWNkBUJ7sc6ZPZTBGg4F4kGddgSEM7OaqEtqfdE1Oc7oO
         l5Bylu3pbAqu8wOclEXEhyARtmq9XyuVRaGS263+KiWUF/ooU3sJpO+eqn8n+9qzi7ww
         UwmNM9B3aekqQQ6289TRwSdOgtN8GzHR1OjoG53rZRHwr2qiADGBsmpTlh3Ala+iDiXS
         SqY5L/3BUWa+jgvt0s+WHnaqLVJjOQNd17nhjl/Ci0Z+Vkz2uU2qX0Pa4h5sdhYF3RRY
         XG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037988; x=1722642788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEii1g2QxUcfpOdmeEwY4J2sYQAHz7s0WQ4Z9lEf4mM=;
        b=GizNv/VLJW6przX6LlifCbfmFmg+54IF7TnZ5i+XRTijy4L8szFkCFIYayp9iYBa11
         aJVZiDQO5EXTnTGJoDw3jusgHS450eHFYnXcXL+uElp6m1XKEAqSiTE/ZJy7lo6YiZIF
         oAjEv2Jcgh8xQsPy0z0TK5M0ossjEsQo4I+bI/9FZUp8qFkGqvbzFpB5Slkr0EFQHSbC
         YwNHeZvcBxABIPsiI/IVb2GryvpARGtC+6393/truTfqqzqiE+FcDjpsN73hcT6HXlZ7
         aOmgfTgMWcyls2Q3Tv7gi+73CAP13puFVNhkLnlmpC6uthzjUpU88pPfTKWcNsnFeOJo
         huRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnUyCPAzobi9CXKQQmxuQode4TaTsIapSL3Bxdh9pusP/2Ai/5bq5NYa5hWMmAm8dEH+1ctpqNN7KmiCsi4rVG/hiB9XSA9HkdQg1Q7Qr1
X-Gm-Message-State: AOJu0Yw2xISgmUMjbUJtLiovAK+8TinkF+RrM2Y6eBXxOfpqQrjPIQyI
	ghWMPVGvZIKAnGTmfcNkIoS6Q/XHKBriaaY1WWn25kd+HQsh1zAm1+RLQYjDNWg91YXUO2NbOhj
	TTw==
X-Google-Smtp-Source: AGHT+IHOguM9TV1Wqy8YwTb6CBUJl4Q4k/lDzAhV2epo/9u56TnU3ou5KRwZKpMCKdXGcBYB5FJy1Mcb3zg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6556:0:b0:710:cc3c:3916 with SMTP id
 41be03b00d2f7-7ac8e0b6796mr2159a12.3.1722037987987; Fri, 26 Jul 2024 16:53:07
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:24 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-16-seanjc@google.com>
Subject: [PATCH v12 15/84] KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't
 track intermediate hva
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
X-CRM114-CacheID: sfid-20240726_165309_909225_46377CE6 
X-CRM114-Status: GOOD (  11.86  )
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

Remove kvm_page_fault.hva as it is never read, only written.  This will
allow removing the @hva param from __gfn_to_pfn_memslot().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 5 ++---
 arch/x86/kvm/mmu/mmu_internal.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index eb9ad0283fd5..e0bfbf95646c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3248,7 +3248,6 @@ static int kvm_handle_noslot_fault(struct kvm_vcpu *vcpu,
 	fault->slot = NULL;
 	fault->pfn = KVM_PFN_NOSLOT;
 	fault->map_writable = false;
-	fault->hva = KVM_HVA_ERR_BAD;
 
 	/*
 	 * If MMIO caching is disabled, emulate immediately without
@@ -4333,7 +4332,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4362,7 +4361,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 */
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
 	return RET_PF_CONTINUE;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 1721d97743e9..f67396c435df 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,7 +238,6 @@ struct kvm_page_fault {
 	/* Outputs of kvm_faultin_pfn.  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
-	hva_t hva;
 	bool map_writable;
 
 	/*
@@ -310,7 +309,6 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.is_private = err & PFERR_PRIVATE_ACCESS,
 
 		.pfn = KVM_PFN_ERR_FAULT,
-		.hva = KVM_HVA_ERR_BAD,
 	};
 	int r;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

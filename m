Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE69C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlP2EHagFEZtn91Gktj0cViVogYTmaGP6cHLtUtOaM4=; b=PzsGCitirU91e0
	+Ph71pJQ6XkrDNWEqy2CfZhkfaIaN3H9ushJRVY/6+cQxAWMwBXl2WCxYdJSlQz4PcRq6T/Twyg9e
	VJAG7+AxZ0lyuLX30BpgQ4jjI0mN4c5tU9lf2g8xjBq9vH7huQWh/E75b73rWacDg021p2NMYMGZz
	qvqM8iFESDUY8kzuSX9bk32rmKxX6GaSvOhyjN3ML2YWy30Flbh1tjq3OdW/W/i4pWisT57UbpZZN
	dvUx8cbGVFCPtO5e1qqfDqScn6w/C2XoG5rSO+P/JsLrhY2CNUE4rFj7DAJgz3UfG3f4X3EKGXY4E
	cm7z7vVwfpx1UC916Dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVIe-00000005i2H-3NPW;
	Sat, 27 Jul 2024 00:28:40 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUm7-00000005R5b-0Xjo
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc691f1f83aso140424276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038102; x=1722642902; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=c2EmoLdn6qWUnwkOI6Es5Bckdmi+xotmqTg2HTzLZNNNX8PcxIrfx3F3x3Gg2ZMiMg
         mhj5TJzavZrgCw7PYLzcxEl83nISxS5/HJfs9HRJck6YuxX2YgvNczqNrU1gLvQbGEHh
         HQHxrzXAfGeo84l/fs0VIAl4E+qbKlrHHj3s6vnooQ+9m/TKG7aieSPgRSsP5m4ZLdtI
         fD04ZHLyN8HK8R3tu9EYmBj+mIgxQ5dmpnQ+jAALXe96+m9nNUfD1+zgyx91K5BQd0pU
         z2ZrtNQP7fxu8DWnlG4RvMXgBtgMN0xzUn9bkjJW9/079rCv1BT4EP5tZArWL+Mbwhf+
         GcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038102; x=1722642902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPTfQtMbnGzpFXQRYDpT9MKKQAxP5DVy80mpAp/3DnI=;
        b=r8KVSHeOfdgULwF8DVkfRlyr1/h05VaX3kIivSRDi3DCzimcKicCvgXTPRBgAfR9UJ
         +xwWzHcI7Sct6DU+xOY69khbjI7I0RyoA3k3pbdErcvqchrDJxs+NL7eKMUpImvF8Bb/
         lo8XSUAT2esNeZ/VCt6xoTg07IT+F6azufflCNKxwuC9WvXEuh1HIrvKdBSTYtNQOoCM
         BlU39RRAGVOVHwYD2Tt69QFfBFHq91r+zFd1gQ5Dt9OPsix93grxNvkAGcJkuWZtx5+h
         rceCtVVqNqjIBhphVLQR4olzRmMc8vidPxB9iiO4T+qjDgf6daDCKb0S5+4WycPkvbHG
         PWVg==
X-Forwarded-Encrypted: i=1; AJvYcCWtZnCjZY5QOuUU7lzhV6dwYtB3h4YrAtoydb6mclQJ1odQEQ7jZlbWvwWC8Vj2FP8XEkH7eEHr27GcwTw4U1lG1r7df5vVvjWfePuvSjkx
X-Gm-Message-State: AOJu0YyjWVdcUW8p3UttGrvPx5y9UNawxhZGCRUsx1HuTXkVFT1G1KRb
	/oxGl8JtxyBad1CRDPFNhk7PmC8rEeM4WCb3YMJAmfjzofRMiNkTAv0mU8/qsCMFgdViv0vuxjV
	1Cw==
X-Google-Smtp-Source: AGHT+IEEWasWSJ9byHCocPT0rn5wdP9A8yl8cF0t65kc5fqEIfuaFnuVC5T09t/hlGHF+EVf0JUp5RZPIP4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c0a:b0:e05:a890:5aaa with SMTP id
 3f1490d57ef6-e0b555474d7mr20378276.1.1722038101719; Fri, 26 Jul 2024 16:55:01
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:18 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-70-seanjc@google.com>
Subject: [PATCH v12 69/84] KVM: MIPS: Mark "struct page" pfns accessed only in
 "slow" page fault path
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
X-CRM114-CacheID: sfid-20240726_165503_536385_264D81D6 
X-CRM114-Status: GOOD (  12.43  )
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

Mark pages accessed only in the slow page fault path in order to remove
an unnecessary user of kvm_pfn_to_refcounted_page().  Marking pages
accessed in the primary MMU during KVM page fault handling isn't harmful,
but it's largely pointless and likely a waste of a cycles since the
primary MMU will call into KVM via mmu_notifiers when aging pages.  I.e.
KVM participates in a "pull" model, so there's no need to also "push"
updates.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 4da9ce4eb54d..f1e4b618ec6d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -484,8 +484,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	struct kvm *kvm = vcpu->kvm;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	pte_t *ptep;
-	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
-	bool pfn_valid = false;
 	int ret = 0;
 
 	spin_lock(&kvm->mmu_lock);
@@ -498,12 +496,9 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	}
 
 	/* Track access to pages marked old */
-	if (!pte_young(*ptep)) {
+	if (!pte_young(*ptep))
 		set_pte(ptep, pte_mkyoung(*ptep));
-		pfn = pte_pfn(*ptep);
-		pfn_valid = true;
-		/* call kvm_set_pfn_accessed() after unlock */
-	}
+
 	if (write_fault && !pte_dirty(*ptep)) {
 		if (!pte_write(*ptep)) {
 			ret = -EFAULT;
@@ -512,7 +507,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 		/* Track dirtying of writeable pages */
 		set_pte(ptep, pte_mkdirty(*ptep));
-		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
 	}
 
@@ -523,8 +517,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 out:
 	spin_unlock(&kvm->mmu_lock);
-	if (pfn_valid)
-		kvm_set_pfn_accessed(pfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
